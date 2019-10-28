<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Admin</li>
        <li class="breadcrumb-item">
            <a href="AdminWS">Listar</a>
        </li>
        <li class="breadcrumb-item">
            <a href="add.jsp">Cadastrar</a>
        </li>

    </ol>
    <div class="container-fluid">
        <div class="row">
            <div class="row">
                <div class="col-lg-auto">
                    <div class="card">
                        <div class="card-header">
                            Cadastro
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
            <a href="AdminWS" class="btn btn-sm btn-primary">Listar tabela</a>
            <a href="add.jsp" class="btn btn-sm btn-primary">Cadastrar</a>
        </div>
</main>



<%@include file="../rodape.jsp" %>
