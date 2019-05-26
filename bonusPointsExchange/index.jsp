<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<%	} %>
<!DOCTYPE html>

<head>
  <meta charset="utf-8">
  <title>Welcome to BonusExchange platform Home page</title>
  <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.css">
  <!-- Custom styles for this template -->
  <link href="dist/css/custom_sytle/dashboard.css" rel="stylesheet">
  <script src="dist/jquery-3.4.1.min.js"></script>
  <script src="dist/bootstrap.min.js"></script>
</head>

<body>

  <!--这是top-->
  <%@ include file="header.jsp" %>
  <!--这是main_page-->
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-3 col-md-2 sidebar">
        <ul class="nav nav-sidebar">
          <li><a href="#">Bank</a></li>
          <li><a href="#">Airline</a></li>
          <li><a href="#">Supermarket</a></li>
          <li><a href="#">MegaMalls</a></li>
        </ul>
      </div>
      <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <h1 class="page-header">Merchant</h1>
        <div class="row placeholders">
          <div class="col-xs-6 col-sm-3 placeholder">
            <img src="images/shopLogo/microsoft.png" width="100" height="100" class="img-responsive"
              alt="Generic placeholder thumbnail">
            <h4>Microsoft</h4>
            <span class="text-muted">Something else</span>
          </div>
          <div class="col-xs-6 col-sm-3 placeholder">
            <img src="images/shopLogo/google.png" width="100" height="100" class="img-responsive"
              alt="Generic placeholder thumbnail">
            <h4>Google</h4>
            <span class="text-muted">Something else</span>
          </div>
          <div class="col-xs-6 col-sm-3 placeholder">
            <img src="images/shopLogo/apple.png" width="100" height="100" class="img-responsive"
              alt="Generic placeholder thumbnail">
            <h4>Apple</h4>
            <span class="text-muted">Something else</span>
          </div>
          <div class="col-xs-6 col-sm-3 placeholder">
            <img src="images/shopLogo/xiaomi.png" width="100" height="100" class="img-responsive"
              alt="Generic placeholder thumbnail">
            <h4>XiaoMi</h4>
            <span class="text-muted">Something else</span>
          </div>
          <div class="col-xs-6 col-sm-3 placeholder">
            <img src="images/shopLogo/sina.png" width="100" height="100" class="img-responsive"
              alt="Generic placeholder thumbnail">
            <h4>Sina</h4>
            <span class="text-muted">Something else</span>
          </div>
          <div class="col-xs-6 col-sm-3 placeholder">
            <img src="images/shopLogo/ChainMobile.png" width="100" height="100" class="img-responsive"
              alt="Generic placeholder thumbnail">
            <h4>ChainMobile</h4>
            <span class="text-muted">Something else</span>
          </div>
          <div class="col-xs-6 col-sm-3 placeholder">
            <img src="images/shopLogo/IBM.png" width="100" height="100" class="img-responsive"
              alt="Generic placeholder thumbnail">
            <h4>IBM</h4>
            <span class="text-muted">Something else</span>
          </div>
          <div class="col-xs-6 col-sm-3 placeholder">
            <img src="images/shopLogo/Samsung.png" width="100" height="100" class="img-responsive"
              alt="Generic placeholder thumbnail">
            <h4>Samsung</h4>
            <span class="text-muted">Something else</span>
          </div>
          <div class="col-xs-6 col-sm-3 placeholder">
            <img src="images/shopLogo/Sony.png" width="100" height="100" class="img-responsive"
              alt="Generic placeholder thumbnail">
            <h4>Sony</h4>
            <span class="text-muted">Something else</span>
          </div>
          <div class="col-xs-6 col-sm-3 placeholder">
            <img src="images/shopLogo/SK-Hynix.png" width="100" height="100" class="img-responsive"
              alt="Generic placeholder thumbnail">
            <h4>SK-Hynix</h4>
            <span class="text-muted">Something else</span>
          </div>
        </div>

        <h2 class="sub-header">Newly Released</h2>
        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>Source Merchant</th>
                <th>Number of Source Bonus</th>
                <th>Deadline</th>
                <th>Target Merchant</th>
                <th>Number of Target Bonus</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1,001</td>
                <td>Lorem</td>
                <td>ipsum</td>
                <td>dolor</td>
                <td>sit</td>
              </tr>
              <tr>
                <td>1,002</td>
                <td>amet</td>
                <td>consectetur</td>
                <td>adipiscing</td>
                <td>elit</td>
              </tr>
              <tr>
                <td>1,003</td>
                <td>Integer</td>
                <td>nec</td>
                <td>odio</td>
                <td>Praesent</td>
              </tr>
              <tr>
                <td>1,003</td>
                <td>libero</td>
                <td>Sed</td>
                <td>cursus</td>
                <td>ante</td>
              </tr>
              <tr>
                <td>1,004</td>
                <td>dapibus</td>
                <td>diam</td>
                <td>Sed</td>
                <td>nisi</td>
              </tr>
              <tr>
                <td>1,005</td>
                <td>Nulla</td>
                <td>quis</td>
                <td>sem</td>
                <td>at</td>
              </tr>
              <tr>
                <td>1,006</td>
                <td>nibh</td>
                <td>elementum</td>
                <td>imperdiet</td>
                <td>Duis</td>
              </tr>
              <tr>
                <td>1,007</td>
                <td>sagittis</td>
                <td>ipsum</td>
                <td>Praesent</td>
                <td>mauris</td>
              </tr>
              <tr>
                <td>1,008</td>
                <td>Fusce</td>
                <td>nec</td>
                <td>tellus</td>
                <td>sed</td>
              </tr>
              <tr>
                <td>1,009</td>
                <td>augue</td>
                <td>semper</td>
                <td>porta</td>
                <td>Mauris</td>
              </tr>
              <tr>
                <td>1,010</td>
                <td>massa</td>
                <td>Vestibulum</td>
                <td>lacinia</td>
                <td>arcu</td>
              </tr>
              <tr>
                <td>1,011</td>
                <td>eget</td>
                <td>nulla</td>
                <td>Class</td>
                <td>aptent</td>
              </tr>
              <tr>
                <td>1,012</td>
                <td>taciti</td>
                <td>sociosqu</td>
                <td>ad</td>
                <td>litora</td>
              </tr>
              <tr>
                <td>1,013</td>
                <td>torquent</td>
                <td>per</td>
                <td>conubia</td>
                <td>nostra</td>
              </tr>
              <tr>
                <td>1,014</td>
                <td>per</td>
                <td>inceptos</td>
                <td>himenaeos</td>
                <td>Curabitur</td>
              </tr>
              <tr>
                <td>1,015</td>
                <td>sodales</td>
                <td>ligula</td>
                <td>in</td>
                <td>libero</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <!--这是bottom-->
  <%@ include file="footer.jsp" %>
</body>

</html>