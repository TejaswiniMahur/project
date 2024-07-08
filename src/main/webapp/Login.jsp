<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
  body {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: url(./pinku.jpg) no-repeat;
    background-size: cover;
    background-position: center;
  }
  .container {
    width: 420px;
    background: transparent;
    border: 2px solid rgba(255, 255, 255, .2);
    backdrop-filter: blur(9px);
    color: #fff;
    border-radius: 12px;
    padding: 30px 40px;
    text-align: center;
  }
  .container h1 {
    font-size: 36px;
    text-align: center;
  }
  .container .input-box {
    position: relative;
    width: 100%;
    height: 50px;
    margin: 30px 0;
  }
  .container .input-box input {
    width: 100%;
    height: 100%;
    background: transparent;
    border: none;
    outline: none;
    border: 2px solid rgba(255, 255, 255, .2);
    border-radius: 40px;
    font-size: 16px;
    color: #fff;
    padding: 20px 45px 20px 20px;
  }
  .container .input-box input::placeholder {
    color: #fff;
  }
  .container .input-box i {
    position: absolute;
    right: 20px;
    top: 30%;
    transform: translate(-50%);
    font-size: 20px;
  }
  .container .remember-forgot {
    display: flex;
    justify-content: space-between;
    font-size: 14.5px;
    margin: -15px 0 15px;
  }
  .container .remember-forgot label input {
    accent-color: #fff;
    margin-right: 3px;
  }
  .container .remember-forgot a {
    color: #fff;
    text-decoration: none;
  }
  .container .remember-forgot a:hover {
    text-decoration: underline;
  }
  .container .btn {
    width: 100%;
    height: 45px;
    background: #fff;
    border: none;
    outline: none;
    border-radius: 40px;
    box-shadow: 0 0 10px rgba(0, 0, 0, .1);
    cursor: pointer;
    font-size: 16px;
    color: #333;
    font-weight: 600;
  }
  .container .register-link {
    font-size: 14.5px;
    text-align: center;
    margin: 20px 0 15px;
  }
  .container .register-link p a {
    color: #fff;
    text-decoration: none;
    font-weight: 600;
  }
  .container .register-link p a:hover {
    text-decoration: underline;
  }
</style>
</head>
<body>
<div class="container">
    <h1>Login</h1>
    <form action="Login" method="post"> <!-- Ensure this action points to your servlet URL -->
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <button type="submit" class="btn">Login</button>
    </form>
    <%-- Display error message if login fails --%>
    <% String error = request.getParameter("error");
        if (error != null && error.equals("1")) { %>
            <p style="color: red;">Invalid email or password. Please try again.</p>
    <% } %>
</div>
</body>
</html>
