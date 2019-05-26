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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bind to the Merchant</title>
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
        <form class="form-signin" action="/bonusPointsExchange/BindShopServlet" method="post" onsubmit="return checkForm();">
            <h2 class="form-signin-heading">Bind to the Merchant</h2>
            <label for="ShopName" class="sr-only">ShopName</label>
            <input name="ShopName" type="text" id="ShopName" class="form-control" value="<%=shopName %>" placeholder="Shop Name" readonly>
            <label for="userName" class="sr-only">userName</label>
            <input name="userName" type="text" id="userName" class="form-control" placeholder="User Name" required autofocus>     
            <label for="password" class="sr-only">password</label>
            <input name="password" type="password" id="password" class="form-control" placeholder="Password" required>
            <button name="submit" class="btn btn-lg btn-primary btn-block" type="submit" id="submit">Bind</button>
        </form>
    </div>

    <%@ include file="footer.jsp" %>
</body>


<script type="text/javascript">
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