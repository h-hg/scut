<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Merchant registration</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link href="css/regist.css" rel="stylesheet" type="text/css">
<%@ include file="link.jsp" %>
</head>

<body>
	<%@ include file="header.jsp" %>
<!--header -->
<div class="container">
		<form onsubmit="return checkForm();" method="post" action="/bonusPointsExchange/RegistShopServlet"
				style="max-width:330px;padding:15px;margin:0 auto;">

				<h2 class="form-signin-heading" sytle="margin-bottom:10px;">Merchant Registration</h2>
				</br>
				<p>
						<span style="float:left">
								<a href="regist.jsp">User Registration</a>
						</span>
						<span style="float:right">
								<a href="login_shop.jsp">Log in Now</a>
						</span>
				</p>

				<label for="shopName" class="sr-only">Merchant name</label>
				<input name="shopName" type="text" id="shopName" class="form-control" placeholder="User Name" required
						autofocus>
				</br>
				<label for="password" class="sr-only">password</label>
				<input name="password" type="password" id="password" class="form-control" placeholder="Password" required>
				</br>
				<label for="repassword" class="sr-only">Repassword</label>
				<input name="repassword" type="password" id="repassword" class="form-control" placeholder="Repassword"
						required>
				</br>
				<label for="email" class="sr-only">Email address</label>
				<input name="email" type="text" id="email" class="form-control" placeholder="Email address" required>
				</br>
				<label for="number" class="sr-only">Merchant record number</label>
				<input name="number" type="text" id="number" class="form-control" placeholder="Merchant Record Number"
						required>
				</br>
				<!-- 下面还没有改好 -->
				<button class="btn btn-lg btn-primary btn-block" type="submit" id="submit">Submit</button>
		</form>
</div>

<!--footer -->
	<%@ include file="footer.jsp" %>

<!--js代码====================================================-->
<script type="text/javascript">

//邮箱格式校验
function checkEmail(email) {
	var str = email;
	var expression = /^[a-zA-Z0-9_-]+(\.([a-zA-Z0-9_-])+)*@[a-zA-Z0-9_-]+[.][a-zA-Z0-9_-]+([.][a-zA-Z0-9_-]+)*$/;
	var objExp = new RegExp(expression);
	if(objExp.test(str)) {
		return true;
	}
	else {
		return false;
	}
}

//表单验证
function checkForm() {
	// alert("ada");
	var shopName = document.getElementById("shopName").value;
	if (shopName == "") {
		alert("Merchant name cannot be empty");
		return false;
	}
	
	var password = document.getElementById("password").value;
	if (password == "") {
		alert("Password cannot be empty");
		return false;
	}
	
	//密码需在6位以上，只能为数字和字母的组合
	var Reg=/^[0-9A-Za-z]{6,}$/;
  	if(password!=""&&!Reg.test(password)){
     alert("The password can only be letters or numbers, length 6 and above!");
     return false;
	}
	
	var repassword = document.getElementById("repassword").value;
	if (repassword == "") {
		alert("Confirm password cannot be empty");
		return false;
	}

	if (password != repassword) {
		alert("The passwords are inconsistent twice!");
		return false;
	}
	
	var email = document.getElementById("email").value;
	if(!checkEmail(email)) {
		alert("E-mail format is incorrect!");
		return false;
	}
	//备案号问题待解决
	var number = document.getElementById("number").value;
	if (number == "") {
		alert("The record number cannot be empty!");
		return false;
	}
	return true;
}


var xmlHttp;
function createXmlHttp() {
	 //alert("dasdasd");//调试代码
	if (window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	} else {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
}
function checkShopName() {
	createXmlHttp();
	var shopName;
	shopName = document.getElementById("shopName").value;
	//alert(shopName);//调试代码
	// 发送请求，设置属性，请求返回时交给回调函数处理
	//alert(userName);
	xmlHttp.open("post","/bonusPointsExchange/CheckShopName?shopName="+encodeURI(encodeURI(shopName)));
	//alert(userName);
	xmlHttp.onreadystatechange = checkShopNameBack;
	xmlHttp.send(null);
	
} 
function checkShopNameBack() {
	// 具体处理
	// 数据返回完毕
	if(xmlHttp.readyState == 4) {
		//alert(xmlHttp.status);
		// HTTP操作正常
		if(xmlHttp.status == 200) {
			//alert("Normal");
			var text = xmlHttp.responseText;
			if(text == "Y") {
				document.getElementById("hint").innerHTML = "";	
				document.getElementById("submit").disabled = "";
			}
			if(text == "N") {
				document.getElementById("hint").innerHTML = "Account already exists";	
				document.getElementById("submit").disabled = "disabled";
			}
		}
		
	}
}
</script>
</body>
</html>

