<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Vaga</li>
        <li class="breadcrumb-item">
            <a href="VagaWS">Listar</a>
        </li>

    </ol>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-9">
                <div class="card">
                    <div class="card-header">

                        <form action="VagaWS" method="get" class="form-horizontal">
                            <div class="row">
                                <div class="col-md-12">
                                    <h1>Vagas</h1>
                                    
                                </div> 
                            </div>
                            

                        </form>
                    </div>
                    <div class="row col-lg-12">
                        <a href="add.jsp" class="btn btn-pill btn-primary"style="margin: 20px 0px 0px 20px"> 
                            <i class="fa fa-plus"> Adicionar</i>
                        </a>
                    </div>
                    <div class="card-body">
                        <table class="table table-responsive-sm">
                            <thead>
                                <tr>

                                    <th>Numero da vaga</th>
                                    <th>Ocupada?</th>
                                    <th>Coberta?</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${lista}" var="obj">
                                    <tr>

                                        <td>${obj.numVaga}</td>
                                        <c:if test="${obj.ocupada == true}">
                                            <td>Sim</td>
                                        </c:if>
                                        <c:if test="${obj.ocupada == false}">
                                            <td>Não</td>
                                        </c:if>
                                        <c:if test="${obj.coberta == true}">
                                            <td>Sim</td>
                                        </c:if>
                                        <c:if test="${obj.coberta == false}">
                                            <td>Não</td>
                                        </c:if>
                                        <td>
                                            <a href="VagaWS?acao=edit&id=${obj.id}" class="btn btn-pill btn-success btn-sm" title="alterar"> 
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
