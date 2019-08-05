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

                        <form action="#" method="get" class="form-horizontal">
                            <div class="row">
                                <div class="col-md-12">

                                    <h3>Seus Pagamentos</h3>

                                </div>
                            </div>
                        </form>
                    </div>

                    <div>
                        </br>
                        <h5> <div style="margin: 0px 0px 0px 20px"> Mensalista selecionado:  ${mensalista.nome} </div></h5 >
                        

                    </div>

                    <div class="card-body">
                        <table class="table table-responsive-sm">
                            <thead>
                                <tr>

                                    
                                    <th>Dia/Mês pago</th>
                                    <th>Data Pagamento</th>
                                    <th>Valor</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${msg}" var="obj">
                                    <tr>

                                        
                                        <td>${obj.mesAno}</td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.dataPagamento}"></fmt:formatDate></td>
                                        <td>${obj.valor} R$</td>
                                <td>

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
