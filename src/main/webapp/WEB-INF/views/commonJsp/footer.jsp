<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="results" style="display: none">
    <span id="final_span" class="final"></span>
    <span id="interim_span" class="interim"></span>
    <p>
</div>

<script>

    document.addEventListener('DOMContentLoaded', function (evt) {
        startButton(event);
    }, false);

    $("body").click(function () {
        startButton(event);
    });

    var create_email = false;
    var final_transcript = '';
    var recognizing = false;
    var ignore_onend;
    var start_timestamp;
    if (!('webkitSpeechRecognition' in window)) {
        // upgrade();
    } else {
        // start_button.style.display = 'inline-block';
        var recognition = new webkitSpeechRecognition();
        recognition.continuous = true;
        recognition.interimResults = true;

        recognition.onstart = function() {
            recognizing = true;
            // showInfo('info_speak_now');
            // start_img.src = 'mic-animate.gif';
        };

        recognition.onerror = function(event) {

            recognition.abort();
            startButton(event);
        };


        recognition.onresult = function(event) {
            var interim_transcript = '';
            for (var i = event.resultIndex; i < event.results.length; ++i) {
                if (event.results[i].isFinal) {
                    final_transcript += event.results[i][0].transcript;
                } else {
                    interim_transcript += event.results[i][0].transcript;
                }
            }
            final_transcript = capitalize(final_transcript);
            final_span.innerHTML = linebreak(final_transcript);
            interim_span.innerHTML = linebreak(interim_transcript);
            // 쓸모없는 버튼 생성
            // if (final_transcript || interim_transcript) {
            //     showButtons('inline-block');
            // }
            if (final_transcript || !interim_transcript) {
                // start_img.src = 'mic.gif';
                // ignore_onend = true;
                // startButton();
                if (final_transcript.indexOf('보이스') !== -1) {
                    if (final_transcript.indexOf('이동') !== -1 || final_transcript.indexOf('보여 줘') !== -1 || final_transcript.indexOf('가 줘') !== -1) {
                        if (final_transcript.indexOf('메인') !== -1) {
                            location.href = "${cp}/main";
                        } else if (final_transcript.indexOf('결제') !== -1 || final_transcript.indexOf('결재') !== -1) {
                            if (final_transcript.indexOf('작성') !== -1) {
                                location.href = "${cp}/approval/approvalPage";
                            } else if (final_transcript.indexOf('송신 함') !== -1 || final_transcript.indexOf('송신함') !== -1 || final_transcript.indexOf('보낸') !== -1) {
                                location.href = "${cp}/approval/send/applList";
                            } else if (final_transcript.indexOf('송신 반려') !== -1 || final_transcript.indexOf('송신반려') !== -1
                                    || final_transcript.indexOf('반려') !== -1) {
                                location.href = "${cp}/approval/send/applReferList";
                            }
                        } else if(final_transcript.indexOf('공지사항') !== -1 || final_transcript.indexOf('공지 사항') !== -1) {
                            location.href = "${cp}/post?board_id=board0001&board_nm=공지사항";
                        } else if(final_transcript.indexOf('사내게시판') !== -1 || final_transcript.indexOf('사내 게시판') !== -1) {
                            location.href = "${cp}/post?board_id=board0002&board_nm=사내게시판";
                        } else if(final_transcript.indexOf('자료실') !== -1) {
                            location.href = "${cp}/post?board_id=board0003&board_nm=자료실";
                       } else if(final_transcript.indexOf('캘린더') !== -1) {
                            location.href = "${cp}/calendar";
                        } else if (final_transcript.indexOf('프로젝트') !== -1) {
                            location.href = "${cp}/pms";
                        } else if (final_transcript.indexOf('마이페이지') !== -1 || final_transcript.indexOf('마이 페이지') !== -1) {
                            location.href = "${cp}/mypage";
                        }
                    } else if (final_transcript.indexOf('알려 줘') !== -1 ) {
                        if (final_transcript.indexOf('오늘 일정') !== -1 || final_transcript.indexOf('오늘일정') !== -1) {
                            if ('speechSynthesis' in window) {
                                $.ajax({
                                    url : "${cp}/getTodayCalendar",
                                    contentType : "application/json",
                                    dataType : "json",
                                    method : "post",
                                    success : function(data) {
                                        var calendar = '';
                                        data.calList.forEach(function (cal, idx) {
                                            if (idx !== 0) {
                                                calendar += '와 ';
                                            }
                                            calendar += cal.cal_title;
                                        });

                                        console.log(calendar);
                                        var msg = new SpeechSynthesisUtterance('오늘 일정으로는' + calendar + '이 있습니다.');
                                        window.speechSynthesis.speak(msg);
                                    }
                                });
                            }
                        }
                    }
                }
                startButton(event);
                // startButton(event);
            }
        };
    }


    var two_line = /\n\n/g;
    var one_line = /\n/g;
    function linebreak(s) {
        return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
    }

    var first_char = /\S/;
    function capitalize(s) {
        return s.replace(first_char, function(m) { return m.toUpperCase(); });
    }


    function startButton(event) {
        // if (recognizing) {
        //     recognition.stop();
        //     return;
        // }
        final_transcript = '';
        // recognition.lang = select_dialect.value;
        recognition.lang = ['ko-KR'];
        recognition.start();
        ignore_onend = false;
        // recognition.continuous = true;
        final_span.innerHTML = '';
        interim_span.innerHTML = '';
        // start_img.src = 'mic-slash.gif';
        // showInfo('info_allow');
        // showButtons('none');
        start_timestamp = event.timeStamp;
    }

    function getTodayCalendar(){

    }


</script>