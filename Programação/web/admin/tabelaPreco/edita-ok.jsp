<%@include file="../cabecalhoInicial.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Tabela de Pre�os</li>
        <li class="breadcrumb-item">
            <a href="TabelaPrecoWS">Listar</a>
        </li>


    </ol>
    <div class="container-fluid">
        <div class="row">
            <div class="row">
                <div class="col-lg-auto">
                    <div class="card">
                        <div class="card-header">
                            Altera��o
                        </div>
                        <div class="card-body">
                            ${msg}
                        </div>
                    </div>
                </div>


            </div>

            <!--/.row-->
        </div>

        <div class="form-group form-actions">
            <a href="TabelaPrecoWS" class="btn btn-sm btn-primary">Listar tabela</a>
        </div>


</main>



<%@include file="../rodape.jsp" %>
