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
</head>

<body>
    <!--这是top-->
    <%@ include file="header.jsp" %>
    <!--这是main_page-->
    <div class="container">
        <form class="form-signin" action="/bonusPointsExchange/ShopLoginServlet" method="post"
            onsubmit="return checkForm();">
            <h2 class="form-signin-heading">Login as Merchant</h2>
            <p>
                <span style="float:right">
                    <a href="login.jsp">Login as User</a>
                </span>
            </p>
            <label for="userName" class="sr-only">Merchant Name</label>
            <input name="userName" type="text" id="userName" class="form-control" placeholder="Merchant Name" required
                autofocus>
            <label for="password" class="sr-only">Password</label>
            <input name="password" type="password" id="password" class="form-control" placeholder="Password" required>
            <button id="submit" name="submit" class="btn btn-lg btn-primary btn-block" type="submit">Log in</button>
            </br>
            <p>
                <span style="float:left">
                    <a href="regist_shop.jsp">Free Registration</a>
                </span>
                <span style="float:right">
                    <a href="/bonusPointsExchange/retrievePassword_1.jsp?method=forgetPasswd_shop">Forgot Password</a>
                </span>
            </p>
        </form>
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