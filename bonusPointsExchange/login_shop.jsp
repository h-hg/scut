<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	String shopChangePwdResult = (String)request.getAttribute("shopChangePwdResult");  //获取修改商家mima是否成功
	if(shopChangePwdResult == "Y") {
%>
	<script type="text/javascript" language="javascript">
		alert("Password is changed.Login again please!");   
	</script>	
<% } %>

<%
	String registRes = (String)request.getAttribute("registRes");  //获取商家注册是否成功
	if(registRes == "Y") {
%>
	<script type="text/javascript" language="javascript">
		alert("Registration succeeded.Log in please!");                            
	</script>	
<% } %>
<%
	String resetPasswdMeg =  (String)request.getAttribute("resetPasswdMeg");//忘记密码重置密码
	if(resetPasswdMeg == "success") {
%>
	<script type="text/javascript" language="javascript">
		alert("Resetting password succeeded.Log in again please!");                            
	</script>	
<% } %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link href="css/footer.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.css">
<script src="dist/jquery-3.4.1.min.js"></script>
<script src="dist/bootstrap.min.js"></script>

</head>
<body>
<!--这是top-->
	<%@ include file="header.jsp" %>
	<br/>
	<br/>
<!--这是main_page-->
  <div class="login-frame">
    <div>
      <p class="title">&nbsp;&nbsp;Merchant login&nbsp;&nbsp;<span class="title1">SHOP LOGIN</span><span class="title1 right"><a href="login.jsp">Login as a user</a>&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
		</div>
		<!--
    <div class="span3">
      <div class="ad"> <img src="images/ad3.jpg" alt="Advertisement"/> </div>
		</div>
	-->
    <div class="span4">
				<form name="form_login" class="form-signin normal-font" action="/bonusPointsExchange/actionServlet" method="post" onsubmit="return checkForm();">
					<h2 class="form-signin-heading">Please sign in</h2><br/>
					<label for="userName" class="sr-only">Account: </label>
					<input input name="userName" type="text" id="userName" maxlength="20" class="form-control" placeholder="User Name" required autofocus>
					<label for="password" class="sr-only">Password</label>
					<input input name="password" type="password" id="password" maxlength="20" class="form-control" placeholder="Password" required>
					<br/>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
					<button class="btn btn-lg btn-primary btn-block" type="reset" id="reset" value="Reset">Reset</button>
					<br/>
					<br/>
        <table cellspacing="2">
          <tr>
            <td class="mid"><input name="submit" type="submit" clafss="submitBtn" id="submit" value="Submit"></td>
            <td class="mid"><input name="reset" type="reset" class="submitBtn" id="reset" value="Reset"></td>
          </tr>
        </table>
        <div class="mes"><a href="regist_shop.jsp">Free registration&nbsp;&nbsp; </a><a href="/bonusPointsExchange/retrievePassword_1.jsp?method=forgetPasswd_shop">Forgot Password?</a></div>
      </form>
    </div>
  </div>

<!--这是bottom-->
	<%@ include file="footer.jsp" %>

<script type="text/javascript">

//表单验证
function checkForm() {
	// alert("ada");
	var userName = document.getElementById("userName").value;
	if (userName == "") {
		alert("Sorry,Username cannot be empty!");
		return false;
	}
	
	var password = document.getElementById("password").value;
	if (password == "") {
		alert("Sorry,Password cannot be empty.");
		return false;
	}
}
</script>
</body>
</html>



