<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--这是top-->
<div class="navbar navbar-defalut navbar-fixed-top" sytle="background-color: blue">
    <div class="container">
      <div class="navbar-header">
        <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <img style="position: center;" src="images/scut6.png" width="185px" height="42px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
      </div>
      <div class="navbar-collapse collapse" role="navigation">
        <ul class="nav navbar-nav navbar-right">
          <li><a class="navbar-brand hidden-sm" href="index.jsp" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'navbar-首页'])">Homepage</a></li>
          <li><a href="reference.jsp" target="_blank" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'v3doc'])">Reference price</a></li>
          <li><a href="/bonusPointsExchange/QueryLatestOrder" target="_blank" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'v4doc'])">Newly released</a></li>
          <li><a href="/bonusPointsExchange/actionServlet?actionCode=bindShop&methodCode=find_bindedShops" target="_blank" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'less'])">Initiate transaction</a></li>
          <!--
          <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
              <ul style="position: static; display: block; margin-bottom: 20px;">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li role="separator" class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>-->
          <!--##test-->
          <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Account<span class="caret"></span></a>
              <ul class="dropdown-menu">
          <%
          String isUserLogin = (String)session.getAttribute("userName"); 
          String isShopLogin = (String)session.getAttribute("shopName"); 
          if(isUserLogin == null && isShopLogin == null) {
          %>
                <li>
                    <a href="login.jsp" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'about'])">login</a>
                </li>
            <% } else if(isUserLogin != null && isShopLogin == null){%>
                <li>
                <a href="/bonusPointsExchange/actionServlet?actionCode=user&methodCode=query_user_info" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'about'])"><%=session.getAttribute("userName") %></a><a href="/bonusPointsExchange/actionServlet?actionCode=log&methodCode=logout&logType=user">|Logout</a></li>	
            <% } else if(isShopLogin != null && isUserLogin == null){%>
                <li>
                <a href="/bonusPointsExchange/QueryShopInfoServlet" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'about'])"><%=session.getAttribute("shopName") %></a><a href="/bonusPointsExchange/actionServlet?actionCode=log&methodCode=logout&logType=shop">Logout</a></li>
            <% }%>
             </ul>
            </li>
          </ul>
      </div>
    </div>
  </div>