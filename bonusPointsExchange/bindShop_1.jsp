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
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/personal.css">
<link href="css/footer.css" rel="stylesheet" type="text/css">
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
  <div class="bind-form">
    <p class="title">bind to the merchant&nbsp;&nbsp;<span class="title1">BIND SHOP</span></p>
    <form action="/bonusPointsExchange/BindShopServlet" method="post" onsubmit="return checkForm();">
      <label for="ShopName" class="sr-only">ShopName</label>
      <input name="ShopName" type="text" id="ShopName" value="<%=shopName %>" placeholder="ShopName" class="form-control" readonly>
      
      <label for="userName" class="sr-only">userName</label>
      <input name="userName" type="text" id="userName" class="form-control" placeholder="userName" required autofocus>
      
      <label for="password" class="sr-only">password</label>
      <input name="password" type="password" id="password" class="form-control" placeholder="Password" required>

      <button class="btn btn-lg btn-primary btn-block" type="submit" id="submit">Submit</button>
      <button class="btn btn-lg btn-primary btn-block" type="reset" id="submit">Reset</button>
      <!-- 下面原来页面的两个按钮 -->
      <table cellspacing="2">
        <tr>
          <td class="mid"><input name="submit" type="submit" class="submitBtn" id="submit" value="Submit"></td>
          <td class="mid"><input name="reset" type="reset" class="submitBtn" id="reset" value="Reset"></td>
        </tr>
      </table>
    </form>
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


