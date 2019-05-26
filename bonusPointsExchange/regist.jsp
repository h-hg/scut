<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>User Regist</title>
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
            if (userName == "") {
                alert("Account name cannot be empty");
                return false;
            }

            var password = document.getElementById("password").value;
            if (password == "") {
                alert("Password cannot be empty.");
                return false;
            }

            //密码需在6位以上，只能为数字和字母的组合
            var Reg = /^[0-9A-Za-z]{6,}$/;
            if (password != "" && !Reg.test(password)) {
                alert("The password can only be letters or numbers, length 6 and above!");
                return false;
            }

            var repassword = document.getElementById("repassword").value;
            if (repassword == "") {
                alert("Confirm password cannot be empty.");
                return false;
            }
            if (password != repassword) {
                alert("Password entered twice inconsistently");
                return false;
            }

            var email = document.getElementById("email").value;
            if (email == "") {
                alert("E-mail cannot be empty");
                return false;
            }
            if (!checkEmail(email)) {
                alert("E-mail format is incorrect!");
                return false;
            }

            var fullName = document.getElementById("fullName").value;
            if (fullName == "") {
                alert("Full name cannot be empty");
                return false;
            }

            var phone = document.getElementById("phone").value;
            if (phone == "") {
                alert("Tel number cannot be empty");
                return false;
            }

        }
        //邮箱格式校验
        function checkEmail(email) {
            var str = email;
            var expression = /^[a-zA-Z0-9_-]+(\.([a-zA-Z0-9_-])+)*@[a-zA-Z0-9_-]+[.][a-zA-Z0-9_-]+([.][a-zA-Z0-9_-]+)*$/;
            var objExp = new RegExp(expression);
            if (objExp.test(str)) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>
</head>

<body>
    <%@ include file="header.jsp" %>
    <!--header -->
    <div class="container">
        <form class="form-regist" name="form_regist" action="/bonusPointsExchange/actionServlet" method="post"
        onsubmit="return checkForm();">
            <h2 class="form-regist-heading">User Registration</h2>
            <p>
                <span style="float:left">
                        <a href="regist.jsp">Merchant Registration</a>
                </span>
                <span style="float:right">
                        <a href="login_shop.jsp">Log in Now</a>
                </span>
            </p>
            <label for="userName" class="sr-only">User Name</label>
            <input name="userName" type="text" id="userName" class="form-control" placeholder="User Name" required
                    autofocus>
            <label for="password" class="sr-only">password</label>
            <input name="password" type="password" id="password" class="form-control" placeholder="Password" required>
            <label for="repassword" class="sr-only">Repassword</label>
            <input name="repassword" type="password" id="repassword" class="form-control" placeholder="Repassword"
                    required>
            <label for="email" class="sr-only">Email address</label>
            <input name="email" type="text" id="email" class="form-control" placeholder="Email address" required>
            <label for="fullName" class="sr-only">Full Name</label>
            <input name="fullName" type="text" id="fullName" class="form-control" placeholder="Full Name"
                    required>
            <label for="phone" class="sr-only">Phone</label>
            <input name="phone" type="text" id="phone" class="form-control" placeholder="Phone" required>
            </br>
            <!-- 下面还没有改好 -->
            <button name="submit" class="btn btn-lg btn-primary btn-block" type="submit" id="submit">Submit</button>
            <input type="hidden" name="actionCode" value="regist">
        </form>
    </div>

    <!--footer -->
    <%@ include file="footer.jsp" %>
</body>

</html>