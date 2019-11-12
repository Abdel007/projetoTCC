<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb rtp">
        <li class="breadcrumb-item rtp">Comprovante pagamento</li>
        <li class="breadcrumb-item rtp">
            <a href="PagamentoWS">Listar</a>
        </li>

    </ol>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header">

                        <form action="#" method="get" class="form-horizontal">
                            <div class="row">
                                <div class="col-md-12">

                                    <h3>Comprovante de pagamento <FONT SIZE=-1>do mensalista</FONT></h3>

                                </div>
                            </div>
                        </form>
                    </div>

                    <div>
                        </br>
                        <h5> <div style="margin: 0px 0px 0px 20px"> Mensalista:  <FONT COLOR="#20a8d8">${pagamento.mensalista.nome}</FONT> </div></h5 >
                        <h5> <div style="margin: 0px 0px 0px 20px"> Período da estadia:  <FONT COLOR="#20a8d8">${pagamento.mesAno}</FONT> </div></h5 >
                        

                    </div>

                    <div class="card-body">
                        <table class="table table-responsive-sm">
                            <thead>
                                <tr>
                                    
                                    <th>Data do pagamento</th>
                                    <th>Valor</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${msg}" var="obj">
                                    <tr>
                                        
                                        <fmt:setLocale value="pt-BR"/>
                                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${obj.dataPagamento}"></fmt:formatDate></td>
                                        <td><fmt:formatNumber value="${obj.valor}" minFractionDigits="2" type="currency"/></td>
                                        
                                    </tr>
                                </c:forEach>
                            </tbody>

                        </table>

                    </div>

                </div>
                <!--<div class="form-group form-actions">
                    <a href="MensalistaWS" class="btn btn-sm btn-primary">IMPRIMIR COMPROVANTE</a>
                </div>-->
                <div class="form-group form-actions rtp">
                <button onclick="window.print()" class="btn btn-block btn-primary">IMPRIMIR COMPROVANTE</button>
                </div>
                
                <div class="form-group form-actions rtp">
                    <a href="PagamentoWS" class="btn btn-sm btn-primary">Voltar</a>
                </div>
            </div>
            <!--/.col-->


        </div>

        <!--/.row-->
    </div>



</main>



<%@include file="../rodape.jsp" %>
