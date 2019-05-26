<%@page import="com.bit.bonusPointsExchange.bean.ShowBindInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	String bindRes = (String)request.getAttribute("bindRes"); 
	if(bindRes == "Y") {
%>
	<script type="text/javascript" language="javascript">
		alert("Bind the business successfully!");                                    // 弹出错误信息
	</script>		
<% } else if(bindRes == "N") {%>
	<script type="text/javascript" language="javascript">
		alert("The binding merchant failed, you may not have registered with the merchant or you have already bound the merchant!");                                    // 弹出错误信息
	</script>
<% }else if(bindRes == "连接blockchain失败，请检查网络") {%>
	<script type="text/javascript" language="javascript">
		alert("连接blockchain失败，请检查网络");                                    // 弹出错误信息
	</script>		
<% }%>


<%
	String userChangeResult = (String)request.getAttribute("userChangeResult");  //获取修改用户信息是否成功
	if(userChangeResult == "Y") {
%>
	<script type="text/javascript" language="javascript">
		alert("The information was modified successfully!");                                    // 弹出错误信息
	</script>	
<% } else if(userChangeResult == "N") {%>
	<script type="text/javascript" language="javascript">
		alert("Information modification failed!");                                    
	</script>	
<% }%>

<%
	String pointTranRes = (String)request.getAttribute("pointTranRes"); 
	if(pointTranRes == "Y") {
%>
	<script type="text/javascript" language="javascript">
		alert("Points are transferred from the merchant to the platform successfully!You own"+<%=request.getAttribute("userPoints")%>+"bonus in platform,and you own"+<%=request.getAttribute("shopPoints")%>+"bonus in Merchant." );                                    // 弹出错误信息
	</script>	
<% } else if(pointTranRes == "N") {%>
	<script type="text/javascript" language="javascript">
		alert("Transfer failed!");                                    
	</script>	
<% }else if(pointTranRes == "连接blockchain失败，请检查网络") {%>
	<script type="text/javascript" language="javascript">
		alert("连接blockchain失败，请检查网络！");                                    
	</script>	
<% }%>


<%
	String pointToPshopRes = (String)request.getAttribute("pointToPshopRes"); 
	if(pointToPshopRes == "Y") {
%>
	<script type="text/javascript" language="javascript">
		alert("Points are transferred from the platform to the merchant successfully!You own"+<%=request.getAttribute("userPoints")%>+"bonus in platform,And you own"+<%=request.getAttribute("shopPoints")%>+"Bonus in Merchant." );                                    // 弹出错误信息
	</script>	
<% } else if(pointToPshopRes == "N") {%>
	<script type="text/javascript" language="javascript">
		alert("Transfer failed!");                                    
	</script>	
<% }%>

<%
	String userChangePasswd = (String)request.getAttribute("userChangePasswd");  //获取修改用户密码是否成功
	
	if(userChangePasswd == "N") {%>
	<script type="text/javascript" language="javascript">
		alert("Failed to change password! The old password you entered is incorrect");                                    
	</script>	
<% }else if(userChangePasswd == "errorPasswd"){%>
	<script type="text/javascript" language="javascript">
		alert("The old password you entered is incorrect. Please re-enter");
	</script>
<% } %>
<!-- 显示查询到的绑定信息 -->
<% 
	List<ShowBindInfo> list = (List<ShowBindInfo>)request.getAttribute("bindInfo");
%>
 
<!DOCTYPE html>
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
    <link href="dist/css/custom_sytle/personal.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
          <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>-->
</head>

<body onload="showFirstDiv()">

    <%@ include file="header.jsp" %>

    <!-- 左边的框 -->
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <div id="div1">
                    <form class="form-left" action="/bonusPointsExchange/actionServlet" method="post">
                        <h2 class="form-left-heading">Personal Information</h2>
                        <label for="email">Email address</label>
                        <input name="email" type="text" id="email" class="form-control"
                            value=<%=request.getAttribute("email") %> readonly>
                        <label for="fullName"">Full Name</label>
                        <input style = " display:inline;" name="fullName" type="text" id="name" class="form-control"
                            value=<%=request.getAttribute("fullName") %>>
                            <label for="phone">Phone</label>
                            <input name="phone" type="text" id="phone" class="form-control"
                                value=<%=request.getAttribute("phone") %>>
                            </br>
                            <!-- 下面还没有改好 -->
                            <button name="submit" class="btn btn-lg btn-primary btn-block" type="submit"
                                id="submit">Submit</button>
                            <input type="hidden" name="actionCode" value="user">
                            <input type="hidden" name="methodCode" value="alter_user_info">
                    </form>
                </div>
                <div id="div2">
                    <form class="form-left" action="/bonusPointsExchange/actionServlet"
                        onsubmit="return checkInputPasswd();">
                        <h2 class="form-left-heading">Change Password</h2>
                        <label for="name">Account Name</label>
                        <input class="form-control" input name="name" readonly="readonly" type="text" id="name"
                            value="<%=session.getAttribute("userName")%>">
                        <label for="oldPassword">Old Password</label>
                        <input class="form-control" name="oldPassword" type="password" id="oldPassword">
                        <label for="newPassword">New password</label>
                        <input class="form-control" name="newPassword" type="password" id="newPassword">
                        <label for="reNewPassword">Repeat New password</label>
                        <input class="form-control" name="reNewPassword" type="password" id="reNewPassword"
                            onblur="checkInputPasswd()">
                        </br>
                        <button name="submit" class="btn btn-lg btn-primary btn-block" type="submit"
                            id="submit">Submit</button>
                        <input type="hidden" name="actionCode" value="user">
                        <input type="hidden" name="methodCode" value="alter_user_passwd">
                    </form>
                </div>
                <div id="div3">
                    <form class="form-left" action="/bonusPointsExchange/UserPointToplatformServlet" method="post"
                        onsubmit="return checkForm();">
                        <h2 class="form-left-heading">Transfer Bonus to the Platform</h2>
                        <label for="shop">Select the Platform</label>
                        <select class="form-left" name="shop" id="shop">
                            <option selected="selected"></option>
                            <% if(null != list) {
                                     System.out.println(list.size());
                                    for(int i = 0; i < list.size(); i++) {
                                    ShowBindInfo bindInfo = (ShowBindInfo)list.get(i);
                                   %>
                            <option><%=bindInfo.getShopName() %></option>
                            <%}
                                 }%>
                            <label for="userName">User Name Registered in the Merchant:</label>
                            <input class="form-control" name="userName" onblur="queryUserPoints()" type="text" value=""
                                id="userName">
                            <label for="points">Bonus in Merchant</label>
                            <input class="form-control" name="points" type="text" value="" readonly id="points">
                            <label for="transfer_points">Transfer Bonus</label>
                            <input class="form-control" name="transfer_points" type="number" value="0"
                                id="transfer_points">
                            </br>
                            <button name="submit" class="btn btn-lg btn-primary btn-block" type="submit"
                                id="submit">Submit</button>
                    </form>
                </div>
                <div id="div4">
                    <form class="form-left" action="/bonusPointsExchange/PlatformToUserServlet" method="post"
                        onsubmit="return checkForm();">
                        <h2 class="form-left-heading">Transfer Bonus to Merchant</h2>
                        <label for="shop2">Select Merchant</label>
                        <select class="form-left" onchange="queryPointsAtPlatform()" name="shop2" id="shop2">
                            <option selected="selected"></option>
                            <% if(null != list) {
                                      for(int i = 0; i < list.size(); i++) {
                                          ShowBindInfo bindInfo = (ShowBindInfo)list.get(i);
                                 %>
                            <option><%=bindInfo.getShopName() %></option>
                            <%}
                               }%>
                            <label for="userName2">User Name Registered in the Merchant</label>
                            <input class="form-control" name="userName2" type="text" value="" id="userName2">
                            <label for="platformPoints">Bonus in Platform</label>
                            <input class="form-control" name="platformPoints" type="text" value="" readonly
                                id="platformPoints">
                            <label for="transfer_points">Transfer Bonus</label>
                            <input class="form-control" name="transfer_points" type="number" value="0"
                                id="transfer_points">
                            </br>
                            <button name="submit" class="btn btn-lg btn-primary btn-block" type="submit"
                                id="submit">Submit</button>
                    </form>
                </div>
                <div id="div5">
                    <form class="form-left" action="/bonusPointsExchange/BindShopQueryInfoServlet" method="post"
                        onsubmit="return checkBindForm();">
                        <h2 class="form-left-heading">Merchant Binding</h2>
                        <div>
                            <label for="shop2">Merchant Name</label>
                            <input name="search" type="text" id="search" placeholder="Enter merchant name please">
                            &nbsp;&nbsp;&nbsp;
                            <input name="submit2" type="submit" class="submitBtn" id="submit2" value="Search">
                        </div>
                        <!------------table 中为查询结果--------每一行是一个商家---------------->
                        <%
                        String shopName1 = request.getParameter("search");
                        if(shopName1 != null) {%>
                        <table>
                            <tr><span id="hint" style="color:#FF0000"></span></tr>
                            <tr class="normal-font">
                                <td class="shop-logo"><img src="images/shopLogo/${imgURL }" alt="Merchant logo" />
                                    <p>${shopName}</p>
                                </td>
                                <td>${shopDec}</td>
                                <td class="bindBtn"><a href="bindShop.jsp?shopName=${shopName}"><input name="bind"
                                            type="button" id="bind" class="buttonStyle1" value="Bind"></a></td>
                            </tr>
                        </table>
                        <%} %>
                    </form>
                </div>
                <div id="div6">
                    <form class="form-left">
                        <h2 class="form-left-heading">View Merchant</h2>
                        <table>
                            <% 	if(null != list) {
                                for(int i = 0; i < list.size(); i++) {
                                    ShowBindInfo bindInfo = (ShowBindInfo)list.get(i);
                            %>
                            <tr>
                                <td class="shop-logo"><img src="images/shopLogo/<%=bindInfo.getImgURL() %>"
                                        alt="Merchant's logo" /></td>
                                <td><%=bindInfo.getShopName() %></td>
                                <td><input name="points" type="text" class="inputNum" id="points"
                                        value="<%=bindInfo.getPlatformPoints() %>" maxlength="20" readonly></td>
                            </tr>
                            <%}
                                }%>
                        </table>
                    </form>
                </div>
            </div>
            <!-- 右边的导航条 -->
            <div class="col-sm-3 col-sm-offset-1" id="Accordion1">
                <div class="sidebar-module">
                    <h4>Personal Information</h4>
                    <ol class="list-unstyled index">
                        <li><a href="javascript:showDiv(1)">Modify Information</a></li>
                        <li><a href="javascript:showDiv(2)">Modify Password</a></li>
                    </ol>
                </div>
                <div class="sidebar-module">
                    <h4>Bonus Transfer</h4>
                    <ol class="list-unstyled index">
                        <li><a href="javascript:showDiv(3)">Transfer Bonus to the Platform</a></li>
                        <li><a href="javascript:showDiv(4)">Transfer Bonus to the Merchant</a></li>
                    </ol>
                </div>
                <div class="sidebar-module">
                    <h4>Binding Merchant</h4>
                    <ol class="list-unstyled index">
                        <li><a href="javascript:showDiv(5)">Bind a New Merchant</a></li>
                        <li><a href="javascript:showDiv(6)">Show Bound Merchants</a></li>
                    </ol>
                </div>
            </div>

        </div>
    </div>
    <%@ include file="footer.jsp" %>
    <!-- 根据返回的index显示div -->
    <script type="text/javascript" language="javascript">
        function showFirstDiv(){
            var index = ${ index };
            alert("index = " + index);
            var show = parseInt(index);
            //alert(show);
            for (i = 1; i <= 6; i++) {
                document.getElementById('div' + i).style.display = "none";
            }
            document.getElementById('div' + index).style.display = "block";
        }
    </script>


    <script type="text/javascript">
        /****
        $(function() {
            $( "#Accordion1" ).accordion(); 
        });
        ****/
        var xmlHttp;
        // 对象的创建
        function createXMLHttp() {
            //alert("sasdad");//调试代码
            if (window.XMLHttpRequest) { // firefox
                xmlHttp = new XMLHttpRequest();
            } else { // ie
                xmlHttp = new ActiveXObject("microsoft.XMLHTTP");
            }
        }
        //=================================================//
        //查询用户在商家那里有多少积分
        function queryUserPoints() {
            //alert("sasdad");//调试代码
            var shopName = document.getElementById("shop").value;//此处应该是用户所属商家，后面可能要改代码
            var userName = document.getElementById("userName").value;//用户在商家注册的用户名
            //alert(userName);
            var url = "/bonusPointsExchange/QueryUserPoints?shop=" + encodeURI(encodeURI(shopName)) + "&userNameAtShop=" + encodeURI(encodeURI(userName));
            createXMLHttp();
            xmlHttp.onreadystatechange = queryUserPointsBack;
            xmlHttp.open("get", url, true);
            xmlHttp.send(null);
        }
        // 回调函数,处理服务器返回结果
        function queryUserPointsBack() {
            // alert(xmlHttp.readyState);
            // 响应已完成
            if (xmlHttp.readyState == 4) {
                // 服务器正常的响应
                // alert(xmlHttp.status);
                if (xmlHttp.status == 200) {
                    var returnMsg = xmlHttp.responseText; // 收取服务器端的响应信息(String)
                    //alert(returnMsg);
                    document.getElementById("points").value = returnMsg;
                }
            }
        }

        //=================================================//
        //查询用户在品台数据库有多少积分
        function queryPointsAtPlatform() {
            var shopName = document.getElementById("shop2").value;
            //alert(shopName);//调试代码
            var url = "/bonusPointsExchange/QueryPointsAtPlatform?shop=" + encodeURI(encodeURI(shopName));
            createXMLHttp();
            xmlHttp.onreadystatechange = queryPointsAtPlatformBack;
            xmlHttp.open("get", url, true);
            xmlHttp.send(null);
        }
        // 回调函数,处理服务器返回结果
        function queryPointsAtPlatformBack() {
            //alert("aaaaaa");
            // 响应已完成
            if (xmlHttp.readyState == 4) {
                // 服务器正常的响应
                // alert(xmlHttp.status);
                if (xmlHttp.status == 200) {
                    var returnMsg = xmlHttp.responseText; // 收取服务器端的响应信息(String)
                    //alert(returnMsg);
                    document.getElementById("platformPoints").value = returnMsg;
                }
            }
        }

        function showDiv(index) {
            var show = parseInt(index);
            for (i = 1; i <= 6; i++) {
                document.getElementById('div' + i).style.display = "none";
            }
            document.getElementById('div' + index).style.display = "block";
            if (show == 1) {
                //查询用户个人信息
                location.href = "/bonusPointsExchange/actionServlet?actionCode=user&methodCode=query_user_info&index=" + 1;
            }
            if (show == 3) {
                //查询用户绑定的商家的相关信息，显示在select中
                location.href = "/bonusPointsExchange/QueryBindedShopNameServlet?index=" + 3;
            }
            if (show == 4) {
                //查询用户绑定的商家的相关信息，显示在select中
                location.href = "/bonusPointsExchange/QueryBindedShopNameServlet?index=" + 4;
            }
            if (show == 5) {
                //location.href = "/bonusPointsExchange/QueryBindInfo";
            }
            if (show == 6) {
                location.href = "/bonusPointsExchange/QueryBindInfo";
            }
        }
        function checkInputPasswd() {
            var newPassword = document.getElementById("newPassword").value;
            var reNewPassword = document.getElementById("reNewPassword").value;
            if (newPassword != reNewPassword) {
                alert("The two new passwords you entered are inconsistent");
                return false;
            } else return true;

        }

        function checkForm() {

            var shop = document.getElementById("shop").value;
            var shop2 = document.getElementById("shop2").value;
            //alert(shopName);
            if (shop == "" && shop2 == "") {
                alert("Select the merchant please");
                return false;
            }

            //商家名不能空
            var userName = document.getElementById("userName").value;
            var userName2 = document.getElementById("userName2").value;
            //alert(shopName);
            if (userName == "" && userName2 == "") {
                alert("The name registered in the Merchant cannot be empty!");
                return false;
            }

            var transfer_points = document.getElementById("transfer_points").value;
            if (transfer_points == "") {
                alert("Transfer Bonus cannot be empty!");
                return false;
            }
        }

        function checkBindForm() {
            var shop2 = document.getElementById("search").value;
            //alert(shopName);
            if (shop2 == "") {
                alert("Enter the Merchant name please!");
                return false;
            }
        }
    </script>
</body>

</html>