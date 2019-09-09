<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <form action="MensalistaWS" method="get" class="form-horizontal">
            <div class="row">
                <div class="col-md-12">
                    <div class="input-group">

                        <span class="input-group-prepend">
                            <button type="submit" class="btn btn-primary">
                                <i class="fa fa-search"></i> &nbsp;</button>
                        </span>
                        <input type="text" name="txtFiltro" id="input1-group2" class="form-control" placeholder="Pesquise pelo nome">
                        <!--Indica pro servlet que a ação é um filtro -->
                        <input type="hidden" name="acao" value="filter"/>
                    </div>
                </div>
            </div>
        </form>

    </ol>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h1>Mensalistas</h1>
                    </div>
                    <br>
                    <div class="row col-lg-12">
                        <a href="MensalistaWS?acao=add" class="btn btn-pill btn-primary" style="margin-left: 20px"> 
                            <i class="fa fa-plus"> Adicionar</i>
                        </a>
                    </div>
                    <div class="card-body">
                        <table class="table table-responsive-sm">
                            <thead>
                                <tr>
                                    <th>Foto</th>
                                    <th>Nome</th>
                                    <th>Vaga</th>
                                    <th>Ativo?</th>
                                    <th>Placa Carro</th>
                                    <th>Pagamentos</th>
                                    <th>Informações</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${lista}" var="obj">
                                    <tr>
                                        <td><img src="../../arquivos/${obj.foto}" height="42" width="42"></td>
                                        <td>${obj.nome}</td>
                                        <td>${obj.vaga.numVaga}</td>
                                        <c:if test="${obj.ativo == true}"> <td>Sim</td> </c:if>
                                        <c:if test="${obj.ativo == false}"> <td>Não</td> </c:if>
                                        <td>${obj.placaCarro}</td>
                                        <th><a href="MensalistaWS?acao=pagamentos&id=${obj.id}">Pagamentos</a></th>
                                        <th><a href="MensalistaWS?acao=vermais&id=${obj.id}">Ver mais...</a></th>
                                        <td>
                                            <a href="MensalistaWS?acao=edit&id=${obj.id}" class="btn btn-pill btn-success btn-sm" title="alterar"> 
                                                <i class="fa fa-edit"></i>
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
