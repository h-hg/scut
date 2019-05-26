<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String errorMsg =  (String)request.getAttribute("errorMsg");//忘记密码
	if(errorMsg == "您输入的账号或邮箱不存在！") {
%>
	<script type="text/javascript" language="javascript">
		alert("您输入的账号或邮箱不存在！请重新输入");                            
	</script>	
<% } %>
<%
	String resetPasswdMeg =  (String)request.getAttribute("resetPasswdMeg");//忘记密码重置密码
	if(resetPasswdMeg == "fail") {
%>
	<script type="text/javascript" language="javascript">
		alert("重置密码失败，请重新操作");                            
	</script>	
<% } %>
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
                alert("Username cannot be empty");
                return false;
            }

            var email = document.getElementById("email").value;
            if (email == "") {
                alert("E-mail cannot be empty");
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
            <input name="userName" type="text" id="userName" class="form-control" placeholder="Account Name" required
                    autofocus>
            <label for="email" class="sr-only">Email address</label>
            <input name="email" type="text" id="email" class="form-control" placeholder="Email address" required>
            </br>
            <!-- 下面还没有改好 -->
            <button name="next" class="btn btn-lg btn-primary btn-block" type="submit" id="next">Submit</button>
            <input type="hidden" name="actionCode" value="forgetPasswd">
            <input type="hidden" name="methodCode" value=<%=request.getParameter("method") %>>
        </form>        
    </div>
    <!--footer -->
    <%@ include file="footer.jsp" %>
</body>

</html>