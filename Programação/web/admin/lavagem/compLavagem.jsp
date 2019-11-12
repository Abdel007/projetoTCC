<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb rtp">
        <li class="breadcrumb-item rtp">Lavagem</li>
        <li class="breadcrumb-item rtp">
            <a href="LavagemWS">Listar</a>
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

                                    <h3>Comprovante de lavagem</h3>

                                </div>
                            </div>
                        </form>
                    </div>

                    <div>
                        </br>
                        <h5> <div style="margin: 0px 0px 0px 20px"> Cliente:  <FONT COLOR="#20a8d8">${lavagem.nome}</FONT> </div></h5 >
                        <h5> <div style="margin: 0px 0px 0px 20px"> Placa do carro:  <FONT COLOR="#20a8d8">${lavagem.placa}</FONT> </div></h5 >
                        <h5> <div style="margin: 0px 0px 0px 20px"> Tipo de lavagem:  <FONT COLOR="#20a8d8">${lavagem.tipoLavagem}</FONT> </div></h5 >
                        

                    </div>

                    <div class="card-body">
                        <table class="table table-responsive-sm">
                            <thead>
                                <tr>
                                    
                                    <th>Data Lavagem</th>
                                    <th>Hora Entrega</th>
                                    <th>Preço Lavagem</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${msg}" var="obj">
                                    <tr>
                                        
                                        <fmt:setLocale value="pt-BR"/>
                                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${obj.dataLavagem}"></fmt:formatDate></td>
                                        <td><fmt:formatDate pattern="HH:mm'h'" value="${obj.horaEntrega}"></fmt:formatDate></td> 
                                        <td><fmt:formatNumber value="${obj.precoLavagem}" minFractionDigits="2" type="currency"/></td>
                                        
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
                    <a href="LavagemWS" class="btn btn-sm btn-primary">Voltar</a>
                </div>
            </div>
            <!--/.col-->


        </div>

        <!--/.row-->
    </div>



</main>



<%@include file="../rodape.jsp" %>
