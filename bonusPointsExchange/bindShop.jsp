<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
    String shopName = request.getParameter("shopName"); 
    if(null != shopName) 
   		shopName = new String(shopName.getBytes("ISO-8859-1"),"utf-8"); 
   	else 
   		shopName = (String)request.getAttribute("shopName");	
%>



<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Bind to the merchant</title>
<!--
<link rel="stylesheet" type="text/css" href="css/main.css">
<link href="css/footer.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/personal.css">-->
<link href="css/footer.css" rel="stylesheet" type="text/css">
<%@ include file="link.jsp" %>
</head>

<body>
<!--这是top-->
  <%@ include file="header.jsp" %>
  <div></div>
<!--这是main_page-->
<div class="login-frame">
  <div class="bind-form">
    <p class="title">bind to the merchant&nbsp;&nbsp;<span class="title1">BIND SHOP</span></p>
      <div class="span4">
				<form name="form_login" class="form-signin normal-font" action="/bonusPointsExchange/BindShopServlet" method="post" onsubmit="return checkForm();">
          <h2 class="form-signin-heading">merchant's name</h2>
          <input name="ShopName" type="text" id="ShopName" class="no-border" value="<%=shopName %>" maxlength="20" readonly >
          <br/>
					<label for="userName" class="sr-only">username: </label>
					<input input name="userName" type="text" id="userName" maxlength="20" class="form-control" placeholder="User Name" required autofocus>
					<label for="password" class="sr-only">Password: </label>
					<input input name="password" type="password" id="password" maxlength="20" class="form-control" placeholder="Password" required>
					<br/>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
					<button class="btn btn-lg btn-primary btn-block" type="reset" id="reset" value="Reset">Reset</button>
					<br/>
					<br/>
      </form>
    </div>
    <!--
      <table cellspacing="2">
        <tr>
          <td>merchant's name</td>
          <td><input name="ShopName" type="text" id="ShopName" class="no-border" value="<%=shopName %>" maxlength="20" readonly ></td>
        </tr>
        <tr>
          <td>username:</td>
          <td><input name="userName" type="text" id="userName" maxlength="20"></td>
        </tr>
        <tr>
          <td>Password:</td>
          <td><input name="password" type="password" id="password" maxlength="20"></td>
        </tr>
        <tr>
          <td class="mid"><input name="submit" type="submit" class="submitBtn" id="submit" value="Submit"></td>
          <td class="mid"><input name="reset" type="reset" class="submitBtn" id="reset" value="Reset"></td>
        </tr>
      </table>
    -->
  </div>
</div>
<!--这是bottom-->
	<%@ include file="footer.jsp" %>
</body>


<script type="text/javascript">
//h-hg 避免账号名和密码为空
function checkForm() {
	// alert("ada");
	var userName = document.getElementById("userName").value;
	if (userName == "") {
		alert("Sorry,&nbsp;Username cannot be empty.");
		return false;
	}
	
	var password = document.getElementById("password").value;
	if (password == "") {
		alert("Sorry,&nbsp;Password cannot be empty");
		return false;
	}
}	
</script>
</html>


