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

        recognition.onend = function() {
            recognizing = false;
            if (ignore_onend) {
                return;
            }
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
                var job_id = '${S_EMPLOYEE.job_id}';
                if (final_transcript.indexOf('보이스') !== -1) {
                    if (final_transcript.indexOf('이동') !== -1 || final_transcript.indexOf('보여 줘') !== -1 || final_transcript.indexOf('가 줘') !== -1) {
                        if (final_transcript.indexOf('메인 화면') !== -1 || final_transcript.indexOf('메인화면') !== -1 || final_transcript.indexOf('메인') !== -1) {
                            location.href = "${cp}/main";
                        } else if (final_transcript.indexOf('결제') !== -1 || final_transcript.indexOf('결재') !== -1) {
                            if (final_transcript.indexOf('작성') !== -1) {
                                location.href = "${cp}/approval/approvalPage";
                            } else if (final_transcript.indexOf('송신 함') !== -1 || final_transcript.indexOf('송신함') !== -1 || final_transcript.indexOf('보낸') !== -1) {
                                location.href = "${cp}/approval/send/applList";
                            } else if (final_transcript.indexOf('송신완료') !== -1 || final_transcript.indexOf('송신 완료') !== -1 ||
                                        final_transcript.indexOf('송신 완료함') !== -1 || final_transcript.indexOf('송신 완료 함') !== -1) {
                                location.href = "${cp}/approval/send/applCompleList";
                            } else if (final_transcript.indexOf('송신 반려') !== -1 || final_transcript.indexOf('송신반려') !== -1) {
                                location.href = "${cp}/approval/send/applReferList";
                            } else if (job_id !== null && job_id !== 'job0004') {
                                if (final_transcript.indexOf('수신함') !== -1 || final_transcript.indexOf('수신 함') !== -1) {
                                    location.href = "${cp}/approval/confirm/applList";
                                } else if (final_transcript.indexOf('수신완료') !== -1 || final_transcript.indexOf('수신 완료') !== -1 ||
                                    final_transcript.indexOf('수신 완료 함') !== -1 || final_transcript.indexOf('수신 완료함') !== -1) {
                                    location.href = "${cp}/approval/confirm/applCompleList";
                                } else if (final_transcript.indexOf('수신 반려') !== -1 || final_transcript.indexOf('수신 반려 함') !== -1 || final_transcript.indexOf('수신 반려함') !== -1) {
                                    location.href = "${cp}/approval/confirm/referCompleList";
                                }
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
                        if ('speechSynthesis' in window) {
                            if (final_transcript.indexOf('오늘 일정') !== -1 || final_transcript.indexOf('오늘일정') !== -1) {
                                $.ajax({
                                    url : "${cp}/getMainTask",
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
                            } else if (final_transcript.indexOf('오늘 날씨') !== -1 || final_transcript.indexOf('오늘날씨') !== -1) {
                                var whether;
                                if (condition === 'Clear') whether = '맑음';
                                else if (condition === 'Cloud') whether = '흐림';
                                else if (condition === 'Rainy') whether = '비';
                                var msg = new SpeechSynthesisUtterance('오늘 기온은 ' + temp + '도 이고 날씨는 ' + whether + '입니다');
                                window.speechSynthesis.speak(msg);
                            }
                        }
                    }
                }
                startButton(event);
                console.log(location, temp, condition);
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
        // }
        final_transcript = '';
        // recognition.lang = select_dialect.value;
        recognition.lang = ['ko-KR'];
        if (!recognizing) {
            recognition.start();
        }
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