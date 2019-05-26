<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% String userName =request.getParameter("userName");
	userName= new String(userName.getBytes("ISO-8859-1"),"utf-8");

	%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Forgot Password</title>
    <!-- Bootstrap core CSS -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dist/css/custom_sytle/regist.css" rel="stylesheet">

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
            if (userName == "" || userName == null) {
                alert("UserName cannot be empty");
                return false;
            }

            var password = document.getElementById("password").value;
            if (password == "") {
                alert("Password cannnot be empty");
                return false;
            }

            var repassword = document.getElementById("repassword").value;
            if (repassword == "") {
                alert("Confirm password cannot be empty");
                return false;
            }
            if (password != repassword) {
                alert("The password input is inconsistent twice!");
                return false;
            }
        }
    </script>
</head>

<body>
    <!--header -->
    <%@ include file="header.jsp" %>
    <!--header -->
    <div class = "container">
        <form class="form-regist" action="/bonusPointsExchange/actionServlet" method="post" onsubmit="return checkForm();">
            <h2 class="form-regist-heading">Retrieve Pssword</h2>
            <p>
                <span style="float:right">
                        <a href="login.jsp">Login Now</a>
                </span>
            </p>
            <label for="userName" class="sr-only">Account Name</label>
            <input name="userName" type="text" id="userName" class="form-control" value="<%=userName %>">
            <label for="password" class="sr-only">New Password</label>
            <input name="newPassword" type="password" id="password" class="form-control" placeholder="New Password" required>
            <label for="rePassword" class="sr-only">Password Again</label>
            <input name="rePassword" type="password" id="repassword" class="form-control" placeholder="Password Again" required>
            </br>
            <!-- 下面还没有改好 -->
            <button name="submit" class="btn btn-lg btn-primary btn-block" type="submit" id="submit">Submit</button>
            <input type="hidden" name="actionCode" value="resetPasswd">
            <input type="hidden" name="methodCode" value=<%=request.getParameter("method") %>>
        </form>
    </div>
    </ <!--footer -->
    <%@ include file="footer.jsp" %>
</body>

</html>