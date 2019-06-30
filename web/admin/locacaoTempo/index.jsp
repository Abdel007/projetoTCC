<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Locar Por tempo</li>
        <li class="breadcrumb-item">
            <a href="LocacaoTempoWS">Listar</a>
        </li>

    </ol>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">

                        <form action="LocacaoTempoWS" method="get" class="form-horizontal">
                            <div class="row">
                                <div class="col-md-12">
                                    <h1>Locar por tempo</h1>
                                    <div class="input-group">
                                        <span class="input-group-prepend">
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fa fa-search"></i> &nbsp;</button>
                                        </span>
                                        <input type="text" name="txtFiltro" id="input1-group2" class="form-control" placeholder="Pesquise pela placa do carro">
                                        <!--Indica pro servlet que a ação é um filtro -->
                                        <input type="hidden" name="acao" value="filter"/>
                                    </div>
                                    

                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="row col-lg-12">
                        <a href="LocacaoTempoWS?acao=add" class="btn btn-pill btn-primary"style="margin: 20px 0px 0px 20px"> 
                            <i class="fa fa-plus"></i>
                        </a>
                    </div>
                    <div class="card-body">
                        <table class="table table-responsive-sm">
                            <thead>
                                <tr>
                                    <th>Nome</th>
                                    <th>Placa carro</th>
                                    <th>Dia inicio</th>
                                    <th>Hora inicio</th>
                                    <th>Dia termino</th>
                                    <th>Hora termino</th>
                                    <th>Vaga</th>
                                    <th>Valor</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${lista}" var="obj">
                                    <tr>
                                        <td>${obj.nome}</td>
                                        <td>${obj.placaCarro}</td>
                                        <td><fmt:formatDate pattern="dd-MM-yyyy" value="${obj.diaInicio}"></fmt:formatDate></td>
                                        <td><fmt:formatDate pattern="HH:mm'h'" value="${obj.horaInicio}"></fmt:formatDate></td>
                                        <td><fmt:formatDate pattern="dd-MM-yyyy" value="${obj.diaTermino}"></fmt:formatDate></td>
                                        <td><fmt:formatDate pattern="HH:mm'h'" value="${obj.horaTermino}"></fmt:formatDate></td>
                                        <td>${obj.vaga.numVaga}</td>
                                        <td>${obj.valor} R$</td>
                                        <td>
                                            <a href="LocacaoTempoWS?acao=edit&id=${obj.id}" class="btn btn-pill btn-success btn-sm" title="alterar"> 
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            <a href="LocacaoTempoWS?acao=del&id=${obj.id}" class="btn btn-pill btn-danger btn-sm" title="excluir"> 
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
