<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String loginRes = (String)request.getAttribute("loginRes");  //获取用户登陆是否成功
	if(loginRes == "N") {
%>
	<script type="text/javascript" language="javascript">
		alert("登录失败！请重新登录！您输入的账号或密码错误！");  
		location.href="/bonusPointsExchange/login.jsp";                          
	</script>	
<% } %>

<%
	String registRes = (String)request.getAttribute("registRes");  //获取用户注册是否成功
	if(registRes == "Y") {
%>
	<script type="text/javascript" language="javascript">
		alert("注册成功！请登录！");                            
	</script>	
<% } %>

<%
	String userChangePasswd = (String)request.getAttribute("userChangePasswd");  //获取修改用户密码是否成功
	if(userChangePasswd == "Y") {
%>
	<script type="text/javascript" language="javascript">
		alert("修改密码成功！请重新登录！");                                    
	</script>	
<% } %>
<%
	String resetPasswdMeg =  (String)request.getAttribute("resetPasswdMeg");//忘记密码重置密码
	if(resetPasswdMeg == "success") {
%>
	<script type="text/javascript" language="javascript">
		alert("重置密码成功，请重新登录");                            
	</script>	
<% } %>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main.css">
<link href="<%=basePath%>css/footer.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/login.css">
<link rel="stylesheet" type="text/css" href="dist/css/bootstrap.css">
<script src="dist/jquery-3.4.1.min.js"></script>
<script src="dist/bootstrap.min.js"></script>
<script type="text/javascript">

//表单验证
function checkForm() {
	// alert("ada");
	var userName = document.getElementById("userName").value;
	if (userName == "") {
		alert("Sorry,Username cannot be empty.");
		return false;
	}
	
	var password = document.getElementById("password").value;
	if (password == "") {
		alert("Sorry,Password cannot be empty.");
		return false;
	}
}
</script>
</head>
<body>
<!--这是top-->
  <%@ include file="header.jsp" %>
  <br/>
  <br/>

  <div class="login-frame">
    <div>
      <p class="title">&nbsp;&nbsp;Login as User&nbsp;&nbsp;<span class="title1">USER LOGIN</span><span class="title1 right"><a href="login_shop.jsp">Login as Merchant</a>&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
    </div>
    <div class="span3">
      <div class="ad"> <img src="images/ad3.jpg" alt="Advertisement"/> </div>
    </div>
    <div class="span4">
      <form name="form_login" class="form-signin normal-font" action="/bonusPointsExchange/actionServlet" method="post" onsubmit="return checkForm();">
        <h2 class="form-signin-heading">Please sign in</h2><br/><br/>
        <label for="userName" class="sr-only">Username</label>
        <input name="userName" type="text" id="userName" maxlength="20" class="form-control" placeholder="User Name" required autofocus>
        <br/>
        <br/>
        <label for="password" class="sr-only">Password</label>
        <input name="passwd" type="password" id="password" maxlength="20" class="form-control" placeholder="Password" required>
        <br/>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        <br/>
        <br/>
        <table cellspacing="2">
            <tr>
                <td class="mid"><input name="submit" type="submit" class="submitBtn" id="submit" value="Submit"></td>
                <td class="mid"><input name="reset" type="reset" class="submitBtn" id="reset" value="Reset"></td>
            </tr>
        </table>
       <div class="mes" >
         <a href="regist.jsp">Free registration&nbsp;&nbsp; </a>
         <a href="/bonusPointsExchange/retrievePassword_1.jsp?method=forgetPasswd_user">Forgot password?</a></div>
       <input type="hidden" name="actionCode" value="log"/>
       <input type="hidden" name="methodCode" value="login"/>
      </form>
    </div>
  </div>
  
<!--这是bottom-->
	<%@ include file="footer.jsp" %>
</body>
</html>
