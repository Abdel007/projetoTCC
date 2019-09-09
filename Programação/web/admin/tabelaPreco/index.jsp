<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../cabecalhoInicial.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        
        <h1> <div style="margin: 0px 0px 0px 350px"> <FONT COLOR="#20a8d8"> <b> BEM VINDO! </b></FONT> </div></h1>

    </ol>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header">

                        <form action="TabelaPrecoWS" method="get" class="form-horizontal">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="input-group">

                                        <h1>Tabela de pre�os</h1>
                                        
                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="row col-lg-18">
                        <a href="add.jsp" class="btn btn-pill btn-primary"style="margin: 20px 0px 0px 35px"> 
                            <i class="fa fa-plus"> Adicionar</i>
                        </a>
                    </div>
                    <div class="card-body">
                        <table class="table table-responsive-sm">
                            <thead>
                                <tr>

                                    <th>Op��o</th>
                                    <th>Valor</th>
                                    <th>A��es</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${lista}" var="obj">
                                    <tr>

                                        <td>${obj.opcoes}</td>
                                        <fmt:setLocale value="pt-BR"/>
                                        <td><fmt:formatNumber value="${obj.valor}" minFractionDigits="2" type="currency"/></td>
                                        <td>
                                            <a href="TabelaPrecoWS?acao=edit&id=${obj.id}" class="btn btn-pill btn-success btn-sm" title="alterar"> 
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            <a href="TabelaPrecoWS?acao=del&id=${obj.id}" class="btn btn-pill btn-danger btn-sm" title="excluir"> 
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
