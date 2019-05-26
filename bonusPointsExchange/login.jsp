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
    location.href = "/bonusPointsExchange/login.jsp";                          
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Login</title>
    <!-- Bootstrap core CSS -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dist/css/custom_sytle/login.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
    <!--这是main_page-->
    <div class="container">
        <form class="form-signin" name="form_login" action="/bonusPointsExchange/actionServlet"
            method="post" onsubmit="return checkForm();">
            <h2 class="form-signin-heading">Login as User</h2>
            <p>
                <span style="float:right">
                        <a href="login_shop.jsp">Login as Merchant</a>
                </span>
            </p>
            <label for="userName" class="sr-only">User Name</label>
            <input name="userName" type="text" id="userName" class="form-control" placeholder="User Name" required autofocus>
            <label for="password" class="sr-only">Password</label>
            <input name="passwd" type="password" id="password" class="form-control" placeholder="Password" required>
            <button id="submit" name="submit" class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
            </br>
            <p>
                <span style="float:left">
                    <a href="regist.jsp">Free Registration</a>
                </span>
                <span style="float:right">
                    <a href="/bonusPointsExchange/retrievePassword_1.jsp?method=forgetPasswd_user">Forgot Password</a>
                </span>
            </p>
            <!-- 下面是原来网页有的，不知道是干什么的 -->
            <input type="hidden" name="actionCode" value="log"/>
            <input type="hidden" name="methodCode" value="login"/>
        </form>
    </div>
    <!--这是bottom-->
    <%@ include file="footer.jsp" %>
</body>

</html>