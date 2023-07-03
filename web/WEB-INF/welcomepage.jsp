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
        <style>
            
:focus {
  outline: 0;
  border-color: #2260ff;
  box-shadow: 0 0 0 4px #b5c9fc;
}

.mydict div {
  display: flex;
  flex-wrap: wrap;
  margin-top: 0.5rem;
  justify-content: center;
}

.mydict input[type="radio"] {
  clip: rect(0 0 0 0);
  clip-path: inset(100%);
  height: 1px;
  overflow: hidden;
  position: absolute;
  white-space: nowrap;
  width: 1px;
}

.mydict input[type="radio"]:checked + span {
  box-shadow: 0 0 0 0.0625em #0043ed;
  background-color: #dee7ff;
  z-index: 1;
  color: #0043ed;
}

label span {
  display: block;
  cursor: pointer;
  background-color: #fff;
  padding: 0.375em .75em;
  position: relative;
  margin-left: .0625em;
  box-shadow: 0 0 0 0.0625em #b5bfd9;
  letter-spacing: .05em;
  color: #3e4963;
  text-align: center;
  transition: background-color .5s ease;
}

label:first-child span {
  border-radius: .375em 0 0 .375em;
}

label:last-child span {
  border-radius: 0 .375em .375em 0;
}
            </style>
    </head>
    <body>
        <h1>Welcome to Tai Yang Clinic</h1>
        <h1>태양 한의원에 오신 것을 환영합니다</h1>
        <form method="post" action="welcome">
            <div class='mydict'>
           <label>
                 <input  type='radio' name='lan' value='en'>
                 <span>English</span>
            </label>
            <label>
                 <input  type='radio' name='lan' value='kr'>
                 <span>한국인</span>
            </label>
            <input type="submit" value="Save / 구하다">
            </div>
        </form>
        <h2> You can change this at any time</h2>
        <h2> 언제든지 변경할 수 있습니다 </h2>
    </body>
</html>
