<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Lavagens</li>
        <li class="breadcrumb-item">
            <a href="LavagemWS">Listar</a>
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
            <a href="LavagemWS" class="btn btn-sm btn-primary">Listar tabela</a>
        </div>
</main>



<%@include file="../rodape.jsp" %>
