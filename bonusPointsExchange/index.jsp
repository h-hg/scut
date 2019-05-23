<!-- <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%	String LaunchTranscationRes = (String)request.getAttribute("LaunchTranscationRes"); 
 	 if(LaunchTranscationRes=="unBindShop"){
 %>
<script type="text/javascript" language="javascript">
  alert("You haven't already bound the merchant, please bind the merchant first.");                            
</script>
<%	} %> -->
<!doctype html>
<html>

<head>
  <meta charset="utf-8">
  <title>Welcome to BonusExchange platform Home page</title>
<!--   <link rel="stylesheet" type="text/css" href="css/main.css">
  <link href="css/footer.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" type="text/css" href="css/index.css"> -->
<%@ include file="link.jsp" %>
  <style type="text/css">
    /*
     * Base structure
     */
    /* Move down content because we have a fixed navbar that is 50px tall */
    body {
        padding-top: 50px;
    }
    /*
     * Global add-ons
    */
    .sub-header {
        padding-bottom: 10px;
        border-bottom: 1px solid #eee;
    }
    /*
    * Top navigation
    * Hide default border to remove 1px line.
    */
    .navbar-fixed-top {
        border: 0;
    }
    /*
    * Sidebar
    */
    /* Hide for mobile, show later */
    .sidebar {
        display: none;
    }
    @media (min-width: 768px) {
        .sidebar {
            position: fixed;
            top: 51px;
            bottom: 0;
            left: 0;
            z-index: 1000;
            display: block;
            padding: 20px;
            overflow-x: hidden;
            overflow-y: auto;
            /* Scrollable contents if viewport is shorter than content. */
            background-color: #f5f5f5;
            border-right: 1px solid #eee;
        }
    }
    /* Sidebar navigation */
    .nav-sidebar {
        margin-right: -21px;
        /* 20px padding + 1px border */
        margin-bottom: 20px;
        margin-left: -20px;
    }
    .nav-sidebar>li>a {
        padding-right: 20px;
        padding-left: 20px;
    }
    .nav-sidebar>.active>a,
    .nav-sidebar>.active>a:hover,
    .nav-sidebar>.active>a:focus {
        color: #fff;
        background-color: #428bca;
    }
    /*
    * Main content
    */
    .main {
        padding: 20px;
    }
    @media (min-width: 768px) {
        .main {
            padding-right: 40px;
            padding-left: 40px;
        }
    }
    .main .page-header {
        margin-top: 0;
    }
    /*
    * Placeholder dashboard ideas
    */
    .placeholders {
        margin-bottom: 30px;
        text-align: center;
    }
    .placeholders h4 {
        margin-bottom: 0;
    }
    .placeholder {
        margin-bottom: 20px;
    }
    .placeholder img {
        display: inline-block;
        border-radius: 50%;
    }
</style>
</head>

<body>

  <!--这是top-->
  <%@ include file="header.jsp" %>
  <!--这是main_page-->
  <div class="content-fluid">
    <div class="row">
    <div class="col-sm-3 col-md-2 sidebar">
      <ul class="nav nav-sidebar">
          <li><a href="#">Bank</a></li>
          <li><a href="#">Airline</a></li>
          <li><a href="#">Supermarket</a></li>
          <li><a href="#">MegaMalls</a></li>
        <li style="border:none"><a href="#">Other</a></li>
      </ul>
    </div>
    <!--<div class="index2">-->
      <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                <h1 class="page-header">Merchant</h1>
                <div class="row placeholders">
                    <div class="col-xs-6 col-sm-3 placeholder">
                        <img src="images/shopLogo/microsoft.png"
                            width="100" height="100" class="img-responsive" alt="Generic placeholder thumbnail">
                        <h4>Microsoft</h4>
                        <span class="text-muted">Something else</span>
                    </div>
                    <div class="col-xs-6 col-sm-3 placeholder">
                        <img src="images/shopLogo/google.png"
                            width="100" height="100" class="img-responsive" alt="Generic placeholder thumbnail">
                        <h4>Google</h4>
                        <span class="text-muted">Something else</span>
                    </div>
                    <div class="col-xs-6 col-sm-3 placeholder">
                        <img src="images/shopLogo/apple.png"
                            width="100" height="100" class="img-responsive" alt="Generic placeholder thumbnail">
                        <h4>Apple</h4>
                        <span class="text-muted">Something else</span>
                    </div>
                    <div class="col-xs-6 col-sm-3 placeholder">
                        <img src="images/shopLogo/xiaomi.png"
                            width="100" height="100" class="img-responsive" alt="Generic placeholder thumbnail">
                        <h4>XiaoMi</h4>
                        <span class="text-muted">Something else</span>
                    </div>
                    <div class="col-xs-6 col-sm-3 placeholder">
                        <img src="images/shopLogo/sina.png"
                            width="100" height="100" class="img-responsive" alt="Generic placeholder thumbnail">
                        <h4>Sina</h4>
                        <span class="text-muted">Something else</span>
                    </div>
                    <div class="col-xs-6 col-sm-3 placeholder">
                        <img src="images/shopLogo/ChainMobile.png"
                            width="100" height="100" class="img-responsive" alt="Generic placeholder thumbnail">
                        <h4>ChainMobile</h4>
                        <span class="text-muted">Something else</span>
                    </div>
                    <div class="col-xs-6 col-sm-3 placeholder">
                        <img src="images/shopLogo/IBM.png"
                            width="100" height="100" class="img-responsive" alt="Generic placeholder thumbnail">
                        <h4>IBM</h4>
                        <span class="text-muted">Something else</span>
                    </div>
                    <div class="col-xs-6 col-sm-3 placeholder">
                        <img src="images/shopLogo/Samsung.png"
                            width="100" height="100" class="img-responsive" alt="Generic placeholder thumbnail">
                        <h4>Samsung</h4>
                        <span class="text-muted">Something else</span>
                    </div>
                    <div class="col-xs-6 col-sm-3 placeholder">
                        <img src="images/shopLogo/Sony.png"
                            width="100" height="100" class="img-responsive" alt="Generic placeholder thumbnail">
                        <h4>Sony</h4>
                        <span class="text-muted">Something else</span>
                    </div>
                    <div class="col-xs-6 col-sm-3 placeholder">
                        <img src="images/shopLogo/SK-Hynix.png"
                            width="100" height="100" class="img-responsive" alt="Generic placeholder thumbnail">
                        <h4>SK-Hynix</h4>
                        <span class="text-muted">Something else</span>
                    </div>
                </div>
      </div>
      <div>
        <p class="sub-header">Newly released<span class="more title1"><a href="#">More</a></span></p>
      </div>
      <div class="table-responsive">
      <!--<div id="order-list" class="clearfix">-->
        <!---- 事例1------>
        <div class="order-info clearfix">
          <ul>
            <li class="shop-logo"><img src="images/shopLogo/dongfanghangkong.jpg" /></li>
            <li class="info">
              <table class="table table-striped">
                <tr>
                  <td>Merchant:AncAirlines</td>
                  <td>Target merchant:636Airlines</td>
                </tr>
                <tr>
                  <td>Number of bonus:100</td>
                  <td>Number of Target bonus:120</td>
                </tr>
                <tr>
                  <td>Deadline:2016-11-20</td>
                  <td></td>
                </tr>
              </table>
            </li>
            <li class="operate">
              <form action="/bonusPointsExchange/ReferencePriceServlet" method="post">
                <input name="exchange" type="button" class="submitBtn" id="exchange" value="Exchange">
              </form>
            </li>
          </ul>
        </div>
        <!-----事例2------>
        <div class="order-info clearfix ">
          <ul>
            <li class="shop-logo"><img src="images/shopLogo/changanhangkong.jpg" /></li>
            <li class="info">
              <table class="table table-striped">
                <tr>
                  <td>Merchant:AncAirlines</td>
                  <td>Target merchant:636Airlines</td>
                </tr>
                <tr>
                  <td>Number of bonus:100</td>
                  <td>Number of Target bonus:120</td>
                </tr>
                <tr>
                  <td>Deadline:2016-11-20</td>
                  <td></td>
                </tr>
              </table>
            </li>
            <li class="operate">
              <input name="exchange" type="button" class="submitBtn" id="exchange" value="Exchange">
            </li>
          </ul>
        </div>
        <!------事例3------->
        <div class="order-info clearfix ">
          <ul>
            <li class="shop-logo"><img src="images/shopLogo/changchenghangkong.jpg" /></li>
            <li class="info">
              <table class="table table-striped">
                <tr>
                  <td>Merchant:AncAirlines</td>
                  <td>Target merchant:636Airlines</td>
                </tr>
                <tr>
                  <td>Number of bonus:100</td>
                  <td>Number of target bonus:120</td>
                </tr>
                <tr>
                  <td>Deadline:2016-11-20</td>
                  <td></td>
                </tr>
              </table>
            </li>
            <li class="operate">
              <input name="exchange" type="button" class="submitBtn" id="exchange" value="Exchange">
            </li>
          </ul>
        </div>
        <!------事例4------->
        <div class="order-info clearfix ">
          <ul>
            <li class="shop-logo"><img src="images/shopLogo/dongfanghangkong.jpg" /></li>
            <li class="info">
              <table class="table table-striped">
                <tr>
                  <td>Merchant:AncAirlines</td>
                  <td>Target merchant:636Airlines</td>
                </tr>
                <tr>
                  <td>Number of bonus100</td>
                  <td>Number of Target bonus120</td>
                </tr>
                <tr>
                  <td>Deadline:2016-11-20</td>
                  <td></td>
                </tr>
              </table>
            </li>
            <li class="operate">
              <input name="exchange" type="button" class="submitBtn" id="exchange" value="Exchange">
            </li>
          </ul>
        </div>
        <!------事例5------->
        <div class="order-info clearfix ">
          <ul>
            <li class="shop-logo"><img src="images/shopLogo/shanghaihangkong.jpg" /></li>
            <li class="info">
              <table class="table table-striped">
                <tr>
                  <td>Merchant:AncAirlines</td>
                  <td>TargetAirlines:636Airlines</td>
                </tr>
                <tr>
                  <td>Number of bonus:100</td>
                  <td>Number of target bonus:120</td>
                </tr>
                <tr>
                  <td>Deadline:2016-11-20</td>
                  <td></td>
                </tr>
              </table>
            </li>
            <li class="operate">
              <input name="exchange" type="button" class="submitBtn" id="exchange" value="Exchange">
            </li>
          </ul>
        </div>
      </div>
      <!--</div>-->
    </div>
    </div>
  <!--这是bottom-->
  <%@ include file="footer.jsp" %>
</body>

</html>