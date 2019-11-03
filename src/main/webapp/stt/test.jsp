<%--
  Created by IntelliJ IDEA.
  User: bshn1
  Date: 2019-11-03
  Time: 오후 5:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Web Speech API Demo</title>
<style>
    * {
        font-family: Verdana, Arial, sans-serif;
    }
    a:link {
        color:#000;
        text-decoration: none;
    }
    a:visited {
        color:#000;
    }
    a:hover {
        color:#33F;
    }
    .button {
        background: -webkit-linear-gradient(top,#008dfd 0,#0370ea 100%);
        border: 1px solid #076bd2;
        border-radius: 3px;
        color: #fff;
        display: none;
        font-size: 13px;
        font-weight: bold;
        line-height: 1.3;
        padding: 8px 25px;
        text-align: center;
        text-shadow: 1px 1px 1px #076bd2;
        letter-spacing: normal;
    }
    .center {
        padding: 10px;
        text-align: center;
    }
    .final {
        color: black;
        padding-right: 3px;
    }
    .interim {
        color: gray;
    }
    .info {
        font-size: 14px;
        text-align: center;
        color: #777;
        display: none;
    }
    .right {
        float: right;
    }
    .sidebyside {
        display: inline-block;
        width: 45%;
        min-height: 40px;
        text-align: left;
        vertical-align: top;
    }
    #headline {
        font-size: 40px;
        font-weight: 300;
    }
    #info {
        font-size: 20px;
        text-align: center;
        color: #777;
        visibility: hidden;
    }
    #results {
        font-size: 14px;
        font-weight: bold;
        border: 1px solid #ddd;
        padding: 15px;
        text-align: left;
        min-height: 150px;
    }
    #start_button {
        border: 0;
        background-color:transparent;
        padding: 0;
    }
</style>
<!-- http://localhost:8081/stt/testStt.html -->
<!--<h1 class="center" id="headline">
<a href="http://dvcs.w3.org/hg/speech-api/raw-file/tip/speechapi.html">
Web Speech API</a> Demonstration</h1>
<div id="info">
<p id="info_start">Click on the microphone icon and begin speaking.</p>
<p id="info_speak_now">Speak now.</p>
<p id="info_no_speech">No speech was detected. You may need to adjust your
<a href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">
microphone settings</a>.</p>
<p id="info_no_microphone" style="display:none">
No microphone was found. Ensure that a microphone is installed and that
<a href="//support.google.com/chrome/bin/answer.py?hl=en&amp;answer=1407892">
microphone settings</a> are configured correctly.</p>
<p id="info_allow">Click the "Allow" button above to enable your microphone.</p>
<p id="info_denied">Permission to use microphone was denied.</p>
<p id="info_blocked">Permission to use microphone is blocked. To change,
go to chrome://settings/contentExceptions#media-stream</p>
<p id="info_upgrade">Web Speech API is not supported by this browser.
Upgrade to <a href="//www.google.com/chrome">Chrome</a>
version 25 or later.</p>
</div>-->
<%--<div class="right">--%>
<%--    <button id="start_button" onclick="startButton(event)">--%>
<%--        <img id="start_img" src="mic.gif" alt="Start"></button>--%>
<%--</div>--%>
<div id="results" style="display: none">
    <span id="final_span" class="final"></span>
    <span id="interim_span" class="interim"></span>
    <p>
</div>

<script>

    document.addEventListener('DOMContentLoaded', function (evt) {
        startButton(event);
    }, false);

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
                if (final_transcript.indexOf('보이스웨어') !== -1) {
                    if (final_transcript.indexOf('이동') !== -1 || final_transcript.indexOf('보여 줘') !== -1 || final_transcript.indexOf('가 줘') !== -1) {
                        if (final_transcript.indexOf('메인 페이지') !== -1 || final_transcript.indexOf('메인페이지') !== -1) {
                            location.href = "http://localhost:8081/main";
                        } else if (final_transcript.indexOf('전자결재 페이지') !== -1 || final_transcript.indexOf('전자결재페이지') !== -1
                            || final_transcript.indexOf('전자 결재 페이지') !== -1 || final_transcript.indexOf('전자 결제 페이지') !== -1) {
                            location.href = "http://localhost:8081/approval/approvalPage";
                        } else if(final_transcript.indexOf('캘린더') !== -1) {
                            location.href = "http://localhost:8081/calendar";
                        } else if (final_transcript.indexOf('프로젝트') !== -1) {
                            location.href = "http://localhost:8081/pms";
                        } else if (final_transcript.indexOf('마이페이지') !== -1 || final_transcript.indexOf('마이 페이지') !== -1) {
                            location.href = "http://localhost:8081/mypage";
                        }
                    } else if (final_transcript.indexOf('알려 줘') !== -1 ) {

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


</script>
