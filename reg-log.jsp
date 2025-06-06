
<%@page isELIgnored="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>


 <!-- Index -->
<!DOCTYPE html>
<html lang=”en” dir=”ltr”>
  <head>
    <meta charset=”UTF-8”>
    <title>Register/Log-in</title>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel=”stylesheet” href=”style.css”>
    <link rel="icon" href="/stockcompsys/images/SYMBOL.jpg" type="image/x-icon">

    <meta name=”viewport” content="width=device-width" initial-scale="1.0">

    
   </head><style>
   
/* Google Font Link */
@import url(‘https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap’);

•	{
  Margin: 0;
  Padding: 0;
  Box-sizing: border-box;
  Font-family: “Poppins”, sans-serif;
}

Body {
  Min-height: 100vh;
  /* Display: flex; */
  Align-items: center;
  Justify-content: center;
  /* Background: #7d2ae8; */
  Padding: 30px;
}

.container {
  /* Position: relative; */
  Max-width: 850px;
  Width: 100%;
  margin-left: 130px;
  margin-top: 50px;
  Background: #fff;
  Padding: 40px 30px;
  Box-shadow: 0 5px 10px rgb(0, 0, 0, 0.2);
  Perspective: 2700px;
}

.container .cover {
  Position: absolute;
  Top: 0;
  Left: 50%;
  Height: 100%;
  Width: 50%;
  z-index: 98;
  transition: all 1s ease;
  transform-origin: left;
  transform-style: preserve-3d;
  backface-visibility: hidden;
}

.container #flip:checked ~ .cover {
  Transform: rotateY(-180deg);
}

.container #flip:checked ~ .forms .login-form {
  Pointer-events: none;
}

.container .cover .front,
.container .cover .back {
  Position: absolute;
  Top: 0;
  Left: 0;
  Height: 100%;
  Width: 100%;
  background-image:url("/stockcompsys/images/logobg3.PNG");
}

.cover .back {
  Transform: rotateY(180deg);
}

.container .cover img {
  Position: absolute;
  Height: 100%;
  Width: 100%;
  Object-fit: cover;
  z-index: 10;
}

.container .cover .text {
  Position: absolute;
  z-index: 10;
  height: 100%;
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.container .cover .text::before {
  Content: ‘’;
  Position: absolute;
  Height: 100%;
  Width: 100%;
  Opacity: 0.5;
  Background: rgb(53,39,117);
}

.cover .text .text-1,
.cover .text .text-2 {
  z-index: 20;
  font-size: 26px;
  font-weight: 600;
  color: #fff;
  text-align: center;
}

.cover .text .text-2 {
  Font-size: 15px;
  Font-weight: 500;
}

.container .forms {
  Height: 100%;
  Width: 100%;
  Background: #fff;
}

.container .form-content {
  Display: flex;
  Align-items: center;
  Justify-content: space-between;
}

.form-content .login-form,
.form-content .signup-form {
  Width: calc(100% / 2 – 25px);
}

.forms .form-content .title {
  /* Position: relative; */
  Font-size: 24px;
  Font-weight: 500;
  Color: #333;
}

.forms .form-content .title:before {
  Content: ‘’;
  Position: absolute;
  Left: 0;
  Bottom: 0;
  Height: 3px;
  Width: 25px;
  Background: rgb(53,39,117);
}

.forms .signup-form .title:before {
  Width: 20px;
}

.forms .form-content .input-boxes {
  Margin-top: 30px;
}

.forms .form-content .input-box {
  Display: flex;
  Align-items: center;
  Height: 50px;
  Width: 100%;
  Margin: 10px 0;
  Position: relative;
}

.form-content .input-box input {
  Height: 100%;
  Width: 100%;
  Outline: none;
  Border: none;
  Padding: 0 30px;
  Font-size: 16px;
  Font-weight: 500;
  Border-bottom: 2px solid rgba(0, 0, 0, 0.2);
  Transition: all 0.3s ease;
}

.form-content .input-box input:focus,
.form-content .input-box input:valid {
  Border-color: rgb(53,39,117);
}

.form-content .input-box I {
  Position: absolute;
  Color: rgb(53,39,117);
  Font-size: 17px;
}

.forms .form-content .text {
  Font-size: 14px;
  Font-weight: 500;
  Color: #333;
}

.forms .form-content .text a {
  Text-decoration: none;
}

.forms .form-content .text a:hover {
  Text-decoration: underline;
}

.forms .form-content .button {
  Color: #fff;
  Margin-top: 40px;
}

.forms .form-content .button input {
  Color: #fff;
  Background: rgb(53,39,117);
  Border-radius: 6px;
  Padding: 0;
  Cursor: pointer;
  Transition: all 0.4s ease;
}

.forms .form-content .button input:hover {
  Background: rgb(53,39,117);
}

.forms .form-content label {
  Color: #5b13b9;
  Cursor: pointer;
}

.forms .form-content label:hover {
  Text-decoration: underline;
}

.forms .form-content .login-text,
.forms .form-content .sign-up-text {
  Text-align: center;
  Margin-top: 25px;
}

.container #flip {
  Display: none;
}

@media (max-width: 730px) {
  .container .cover {
    Display: none;
  }

  .form-content .login-form,
  .form-content .signup-form {
    Width: 100%;
  }

  .form-content .signup-form {
    Display: none;
  }

  .container #flip:checked ~ .forms .signup-form {
    Display: block;
  }

  .container #flip:checked ~ .forms .login-form {
    Display: none;
  }
}

.top{
    display: flex;
    /* grid-template-columns: 1fr 3 fr; */
    height: 50px;
    /* background-color: blue; */
  
  }
  .symbol{
      height: 70px;
      /* display: inline; */
      width: 100px;
      padding-right: 50px;
      /* top: 0;
      left: 0;
      z-index: 1; */
  
      /* background-image: url("./symbol.jpg"); */
  }
  
  .head{
      margin-left: 0px;
      background-color: rgb(90,167,230);
      /* border-radius: 9px; */
      width: 75%;
      padding-right: 50px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
      color: white;
      text-align: center;
      height: 70px;
  }
  
  .cont1{
      margin-left: 55%;
      margin-top: 130px;
      margin-right: 10px;
      margin-bottom: 190px;
      box-shadow: black;
      width:50px;
      background-color: antiquewhite;
  }
  .button{
    background-color:  rgb(90, 167, 230);
    border-radius: 9px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    text-align: center;
    height: 70px;
    
    color: white;
    width: 140px;
    margin-right: 100px;
}


</style>

<body>
  <input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
  <div class="container">
    <input type="checkbox" id="flip">
    <div class="cover">
      <div class="front">
        
        <div class="text">
    
        </div>
      </div>
      
      <div class="back">
        
        <div class="text">
          
        </div>
      </div>
     
    </div>
    <div class="forms">
        <div class="form-content">
          <div class="login-form">
            <div class="title">Login</div>
          <form action="login" method="post">
            <div class="input-boxes">
              <div class="input-box">
                <I class="fas fa-envelope"></I>
                <input type="text"placeholder="Enter your name" name="logname" required>
              </div>
              <div class="input-box">
                <I class="fas fa-lock"></I>
                <input type="password" placeholder="Enter your password" name="logpwd" required>
              </div>
              <div class="text"><a href="#">Forgot password?</a></div>
              <div class="button input-box">
                <input type="submit" value="Log-in">
              </div>
              <div class="text sign-up-text">Don’t have an account? <label for="flip">Sigup now</label></div>
            </div>
        </form>
      </div>
        <div class="signup-form">
          <div class="title">Signup</div>
        <form action="register" method="post">
            <div class="input-boxes">
              <div class="input-box">
                <I class="fas fa-user"></I>
                <input type="text" placeholder="Enter your Name" name="uname" required>
              </div>
              <div class="input-box">
                <I class="fas fa-envelope"></I>
                <input type="email" placeholder="Enter your Email" name="email" required>
              </div>
              <div class="input-box">
                <I class="fas fa-lock"></I>
                <input type="password" placeholder="Enter your password" name="pwd" required>
              </div>
              <div class="button input-box">
                <input type="submit" value="Register">
              </div>
              <div class="text sign-up-text" >Already have an account? <label for="flip" >Login now</label></div>
            </div>
      </form>
      <script>
      var successMessage = document.querySelector("#status").value;
      if (successMessage === "success") {
          swal("Success!", "Your form has been submitted successfully!", "success");
      }

       
        </script>
    </div>
    </div>
    </div>
  </div>
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="js/main.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	

  
</body>
</html>





 <!-- Script  -->



 