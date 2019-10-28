<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Locações por tempo</li>
        <li class="breadcrumb-item">
            <a href="LocacaoTempoWS">Listar</a>
        </li>


    </ol>
    <div class="container-fluid">
        <div class="row">
            <div class="row">
                <div class="col-lg-auto">
                    <div class="card">
                        <div class="card-header">
                            Alteração
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
            <a href="LocacaoTempoWS" class="btn btn-sm btn-primary">Listar tabela</a>
        </div>
</main>



<%@include file="../rodape.jsp" %>
