<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <meta name="description" content="CoreUI - Open Source Bootstrap Admin Template">
    <meta name="author" content="">
    <meta name="keyword" content="Bootstrap,Admin,Template,Open,Source,jQuery,CSS,HTML,RWD,Dashboard">
    <title>Administrativo</title>
    <!-- Icons-->
    <link href="../../node_modules/flag-icon-css/css/flag-icon.min.css" rel="stylesheet">
    <link href="../../node_modules/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../node_modules/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
    <!-- Main styles for this application-->
    <link href="../../css/style.css" rel="stylesheet">
    <link href="../../vendors/css/pace.min.css" rel="stylesheet">
  </head>
  <body class="app header-fixed sidebar-fixed aside-menu-fixed sidebar-lg-show">
    <header class="app-header navbar">
      <button class="navbar-toggler sidebar-toggler d-lg-none mr-auto" type="button" data-toggle="sidebar-show">
        <span class="navbar-toggler-icon"></span>
      </button>
      <a class="navbar-brand" href="../tabelaPreco/TabelaPrecoWS">
        <img class="navbar-brand-full" src="../../img/logo.png" width="89" height="70" alt="">
        <img class="navbar-brand-minimized" src="../img/brand/sygnet.svg" width="30" height="30" alt="">
      </a>
      <button class="navbar-toggler sidebar-toggler d-md-down-none" type="button" data-toggle="sidebar-lg-show">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <ul class="nav navbar-nav ml-auto">
          <li>
             <a class="dropdown-item" href="../admin/AdminWS?acao=sair">
              <i class="fa fa-lock"></i> Sair</a>
          
        </li>
      </ul>
     
    </header>
    <div class="app-body">
      <div class="sidebar">
        <nav class="sidebar-nav">
          <ul class="nav">
            
            
            <li class="nav-item ">
              <a class="nav-link" href="../tabelaPreco/TabelaPrecoWS">
                <i class="nav-icon icon-cursor"></i> Inicial
              </a>
              
            </li>
              
            <li class="nav-item ">
              <a class="nav-link" href="../vaga/VagaWS?acao=grafico">
                <i class="nav-icon icon-cursor"></i> Ocupação do pátio
              </a>
              
            </li>
            
            <li class="nav-item ">
              <a class="nav-link" href="../mensalista/MensalistaWS">
                <i class="nav-icon icon-cursor"></i> Administrativo
              </a>
              
            </li>
            
            <li class="nav-item ">
              <a class="nav-link" href="../pagamento/PagamentoWS?acao=levarPagamentos">
                <i class="nav-icon icon-cursor"></i> Controle do caixa
              </a>
              
            </li>
            
          </ul>
        </nav>
        <button class="sidebar-minimizer brand-minimizer" type="button"></button>
      </div>