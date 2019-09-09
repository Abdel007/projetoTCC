


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
  <head>
    <base href="./">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <meta name="description" content="CoreUI - Open Source Bootstrap Admin Template">
    <meta name="author" content="?ukasz Holeczek">
    <meta name="keyword" content="Bootstrap,Admin,Template,Open,Source,jQuery,CSS,HTML,RWD,Dashboard">
    <title>Login Sistema</title>
    <!-- Icons-->
    <link href="../../node_modules/@coreui/icons/css/coreui-icons.min.css" rel="stylesheet">
    <link href="../../node_modules/flag-icon-css/css/flag-icon.min.css" rel="stylesheet">
    <link href="../../node_modules/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../node_modules/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
    <!-- Main styles for this application-->
    <link href="../../css/style.css" rel="stylesheet">
    <link href="../../vendors/pace-progress/css/pace.min.css" rel="stylesheet">
    <style>
        body{
            background-color: #A9F5F2;
        }
    </style>
    <!-- Global site tag (gtag.js) - Google Analytics-->
    <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-118965717-3"></script>
    <script>
      window.dataLayer = window.dataLayer || [];

      function gtag() {
        dataLayer.push(arguments);
      }
      gtag('js', new Date());
      // Shared ID
      gtag('config', 'UA-118965717-3');
      // Bootstrap ID
      gtag('config', 'UA-118965717-5');
    </script>
  </head>
  <body class="app flex-row align-items-center">
      
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-md-8">
          <div class="card-group">
            <div class="card p-4">
              <div class="card-body">
                <h1>Entrar</h1>
                <p class="text-muted">Acesse o sistema</p>
                <form action="../login/LoginWS" method="POST">
                    
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="icon-user"></i>
                    </span>
                  </div>
                  <input class="form-control" type="text" name="txtNome" required placeholder="Nome">
                </div>
                <div class="input-group mb-4">
                  <div class="input-group-prepend">
                    <span class="input-group-text">
                      <i class="icon-lock"></i>
                    </span>
                  </div>
                  <input class="form-control" type="password" name="txtSenha" required placeholder="Senha">
                </div>
                <div class="row">
                  <div class="col-6">
                    <button class="btn btn-primary px-4" type="submit">Entrar</button>
                  </div>
                  
                </div>
                    </form>
                    
                
                <c:if test="${not empty msg}">
                    <div class="alert alert-primary alert-dismissible fade show" role="alert">
                        <strong>Obs:</strong> ${msg}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <i class="tim-icons icon-simple-remove"></i>
                        </button>
                    </div>
                </c:if>
                
                
              </div>
            </div>
            <div class="card text-white bg-primary py-5 d-md-down-none" style="width:44%">
              <div class="card-body text-center">
                <div>
                  <h2>ESTACIONAMENTO</h2>
                  <p>Sistemas administrativos TIRULA. O melhor para você e seu pequeno negócio.</p>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- CoreUI and necessary plugins-->
    <script src="node_modules/jquery/dist/jquery.min.js"></script>
    <script src="node_modules/popper.js/dist/umd/popper.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="node_modules/pace-progress/pace.min.js"></script>
    <script src="node_modules/perfect-scrollbar/dist/perfect-scrollbar.min.js"></script>
    <script src="node_modules/@coreui/coreui/dist/js/coreui.min.js"></script>
  </body>
</html>
