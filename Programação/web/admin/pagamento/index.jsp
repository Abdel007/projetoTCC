<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <form action="PagamentoWS" method="get" class="form-horizontal">
            <div class="row">
                <div class="col-md-12">
                    <div class="input-group">
                        <span class="input-group-prepend">
                            <button type="submit" class="btn btn-primary">
                                <i class="fa fa-search"></i> &nbsp;</button>
                        </span>
                        <input type="text" name="txtFiltro" id="input1-group2" class="form-control" placeholder="Pesquise pelo mensalista">
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
                        <h1>Pagamentos <FONT SIZE=-1>dos mensalistas</FONT></h1>
                    </div>
                    <div class="row col-lg-12">
                        <a href="PagamentoWS?acao=add" class="btn btn-pill btn-primary"style="margin: 20px 0px 0px 20px"> 
                            <i class="fa fa-plus"> Adicionar</i>
                        </a>
                    </div>
                    <div class="card-body">
                        <table class="table table-responsive-sm">
                            <thead>
                                <tr>

                                    <th>Mensalista</th>
                                    <th>Período Estadia</th>
                                    <th>Data Pagamento</th>
                                    <th>Valor</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${lista}" var="obj">
                                    <tr>

                                        <td>${obj.mensalista.nome}</td>
                                        <td>${obj.mesAno}</td>
                                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${obj.dataPagamento}"></fmt:formatDate></td>
                                        <fmt:setLocale value="pt-BR"/>
                                        <td><fmt:formatNumber value="${obj.valor}" minFractionDigits="2" type="currency"/></td>
                                        <td>
                                            <a href="PagamentoWS?acao=edit&id=${obj.id}" class="btn btn-pill btn-success btn-sm" title="alterar"> 
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            <a href="PagamentoWS?acao=del&id=${obj.id}" class="btn btn-pill btn-danger btn-sm" title="excluir"> 
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
