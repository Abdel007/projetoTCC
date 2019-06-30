<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Lavagem</li>
        <li class="breadcrumb-item">
            <a href="LavagemWS">Listar</a>
        </li>

    </ol>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">

                        <form action="LavagemWS" method="get" class="form-horizontal">
                            <div class="row">
                                <div class="col-md-12">
                                    <h1>Lavagem</h1>
                                    <div class="input-group">
                                        <span class="input-group-prepend">
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fa fa-search"></i> &nbsp;</button>
                                        </span>
                                        <input type="text" name="txtFiltro" id="input1-group2" class="form-control" placeholder="Pesquise pelo nome do cliente">
                                        <!--Indica pro servlet que a ação é um filtro -->
                                        <input type="hidden" name="acao" value="filter"/>
                                    </div>

                                    

                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="row col-lg-12">
                        <a href="add.jsp" class="btn btn-pill btn-primary"style="margin: 20px 0px 0px 20px"> 
                            <i class="fa fa-plus"></i>
                        </a>
                        </a>
                    </div>
                    <div class="card-body">
                        <table class="table table-responsive-sm">
                            <thead>
                                <tr>

                                    <th>Nome</th>
                                    <th>Placa</th>
                                    <th>Tipo de lavagem</th>
                                    <th>Preço da lavagem</th>
                                    <th>Hora entrega</th>

                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${lista}" var="obj">
                                    <tr>

                                        <td>${obj.nome}</td>
                                        <td>${obj.placa}</td>
                                        <td>${obj.tipoLavagem}</td>
                                        <td>${obj.precoLavagem} R$</td>
                                        <td><fmt:formatDate pattern="HH:mm'h'" value="${obj.horaEntrega}"></fmt:formatDate></td> 

                                            <td>
                                                <a href="LavagemWS?acao=edit&id=${obj.id}" class="btn btn-pill btn-success btn-sm" title="alterar"> 
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            <a href="LavagemWS?acao=del&id=${obj.id}" class="btn btn-pill btn-danger btn-sm" title="excluir"> 
                                                <i class="fa fa-remove"></i>
                                            </a>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>

                        </table>


                    </div>
                </div>
            </div>
            <!--/.col-->


        </div>

        <!--/.row-->
    </div>

</main>



<%@include file="../rodape.jsp" %>
