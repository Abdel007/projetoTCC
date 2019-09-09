<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Mensalista</li>
        <li class="breadcrumb-item">
            <a href="MensalistaWS">Listar</a>
        </li>

    </ol>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">

                        <form action="MensalistaWS" method="get" class="form-horizontal">
                            <div class="row">
                                <div class="col-md-12">

                                    <h4>Mais informações de <FONT COLOR="#20a8d8">${obj.nome}</FONT></h4>

                                    <div class="input-group">

                                    </div>

                                </div>
                            </div>
                        </form>

                    </div>

                    <div class="card-body">

                        <table class="table table-responsive-sm">
                            <thead>
                                <tr>
                                    <th>CPF</th>
                                    <th>Telefone</th>
                                    <th>Modelo Carro</th>
                                    <th>Cor Carro</th>
                                    <th>Valor Mensal</th>
                                    <th>Observações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!c:forEach items="${msg}" var="obj">
                            <tr>
                                <td>${obj.cpf}</td>
                                <td>${obj.telefone}</td>
                                <td>${obj.modeloCarro}</td>
                                <td>${obj.corCarro}</td>
                                <fmt:setLocale value="pt-BR"/>
                                <td><fmt:formatNumber value="${obj.valorMensal}" minFractionDigits="2" type="currency"/></td>
                                <td>${obj.observacoes}</td>
                                <td>

                                </td>
                            </tr>
                            </!c:forEach>
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
