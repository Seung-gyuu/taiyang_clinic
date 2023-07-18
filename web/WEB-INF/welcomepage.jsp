<%-- 
    Document   : welcomepage
    Created on : Jun 30, 2023, 6:13:19 PM
    Author     : Hussein
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tai Yang Clinic</title>
<link
      href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap"
      rel="stylesheet"
    />
    <style>
      :focus {
        outline: 0;
        border-color: #2260ff;
        box-shadow: 0 0 0 4px #b5c9fc;
      }

      body {
        /* background: #f6f6f6; */
        background-image: url('../src/img/welcombg2.jpg');
        background-size: cover;
        /* background-position: top; */
      }

      body::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: linear-gradient(
            180deg,
            rgba(255, 255, 255, 0.2) 0%,
            rgba(255, 255, 255, 0.5) 100%
          ),
          linear-gradient(180deg, rgba(255, 255, 255, 0.2) 0%, transparent 100%);
        z-index: 2;
      }

      .welcomeContainer {
        position: relative;
        max-width: 700px;
        margin: 80px auto;
        background: rgba(255, 255, 255, 0.7);
        padding: 40px 80px;
        border: gray;
        border-radius: 30px 60px 30px 60px;
        z-index: 3;
      }

      .welcomTop {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
      }

      .welcomeContainer img {
        width: 180px;
        object-fit: contain;
      }

      h1 {
        font-family: Cinzel;
        text-align: center;
        margin: 10px 0 0 0;
      }

      .titleKR {
        font-size: 24px;
      }

      form {
        margin-top: 80px;
      }

      h2 {
        margin: 10px 0 0 0;
        font-weight: 400;
      }

      .subKR {
        font-size: 16px;
      }

      .mydict {
        margin-top: 0.7rem;
        justify-content: center;
      }

      .mydict input[type='radio'] {
        clip: rect(0 0 0 0);
        clip-path: inset(100%);
        height: 1px;
        overflow: hidden;
        position: absolute;
        white-space: nowrap;
        width: 1px;
      }

      .mydict input[type='radio']:checked + span {
        box-shadow: 0 0 0 0.0625em #0043ed;
        background-color: #dee7ff;
        z-index: 1;
        color: #0043ed;
      }

      label span {
        display: block;
        cursor: pointer;
        background-color: #fff;
        padding: 0.375em 0.75em;
        position: relative;
        margin-left: 0.0625em;
        box-shadow: 0 0 0 0.0625em #b5bfd9;
        letter-spacing: 0.05em;
        color: #3e4963;
        text-align: center;
        transition: background-color 0.5s ease;
      }

      /* label:first-child span {
        border-radius: 0.375em 0.375em 0.375em 0.375em;
      } */

      .mydict label span {
        border-radius: 0.375em 0.375em 0.375em 0.375em;
      }

      .saveBtn {
        margin-top: 20px;
        border: none;
        padding: 10px 20px;
        border-radius: 10px;
        cursor: pointer;
        background: #2B89BE;
        color: #fff;
        /* border: 1px solid #b5bfd9;
        background: #fff; */
      }

      .saveBtn:hover {
        background: #30586d;
        color: #fff;
      }
    </style>
  </head>
  <body>
    <div class="welcomeContainer">
      <div class="welcomTop">
        <img src="../src/img/ClinicLogo.png" alt="logo" />
        <h1>Welcome to Tai Yang Clinic</h1>
        <h1 class="titleKR">태양 한의원에 오신 것을 환영합니다</h1>
      </div>
      <form method="post" action="welcome">
        <h2>Choose Your Language</h2>
        <h2 class="subKR">당신의 언어를 선택해주세요</h2>
        <div class="mydict">
          <label>
            <input type="radio" name="lan" value="en" />
            <span>English</span>
          </label>
          <label>
            <input type="radio" name="lan" value="kr" />
            <span>한국어</span>
          </label>
          <input class="saveBtn" type="submit" value="Save / 저장" />
        </div>
      </form>
    </div>
  </body>
</html>