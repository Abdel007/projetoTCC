<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../cabecalhoInicial.jsp" %>

<main class="main">
    <fmt:setLocale value="pt-BR"/>
    <!-- Breadcrumb-->
    <br>
    <div class="container-fluid">
        <div class="row">

            <div>

                <div class="col-lg-4">
                    <div class="card" style="width: 375%;">

                        <div class="card-header">
                            Filtrar entre as datas: <FONT COLOR="#20a8d8"> 1 e 2</FONT>
                        </div>
                        <div class="card-body">

                            <form action="CaixaWS" method="post">

                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Data 1 </span>
                                        </div>
                                        <input type="date"  name="txtData1" required class="form-control">

                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Data 2 </span>
                                        </div>
                                        <input type="date"  name="txtData2" required class="form-control">
                                    </div>
                                </div>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <input class="radio-form" type="radio" value="todos" checked name="txtTipo">
                                        <span class="input-group-text"> Filtrar entre tudo</span><br
                                    </div>

                                </div>
                        </div>

                        <div class="input-group">
                            <div class="input-group-prepend">
                                <input class="radio-form" type="radio" value="lavagem" name="txtTipo">
                                <span class="input-group-text">Filtrar só lavagens</span><br
                            </div>
                        </div>
                    </div>

                    <div class="input-group">
                        <div class="input-group-prepend">
                            <input class="radio-form" type="radio" value="locacaotempo" name="txtTipo">
                            <span class="input-group-text">Locações por tempo</span><br
                        </div>
                    </div>
                </div>

                <div class="form-inline">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <input class="radio-form" type="radio" value="pagamento" name="txtTipo">
                            <span class="input-group-text">Pag. dos mensalistas</span><br
                        </div>

                    </div>
                </div>
            </div>

            <br>

            <div class="col-6 col-sm-4 col-md-2 col-xl mb-3 mb-xl-0">
                <button  type="submit" class="btn btn-pill btn-block btn-primary">Gerar tabela</button>
            </div>

            </form>

        </div>
    </div>
</div>

<div class="card">
    <div class="card-header"> 
        <c:if test="${obj == 'todos'}"> Ganhos entre:<FONT COLOR="#20a8d8"> <b> TUDO </b></FONT> </c:if>
        <c:if test="${obj == 'locacaotempo'}"> Ganho total nas<FONT COLOR="#20a8d8"> <b> LOCAÇÕES POR TEMPO </b></FONT> </c:if>
        <c:if test="${obj == 'pagamento'}"> Ganho total nos<FONT COLOR="#20a8d8"> <b> MENSALISTAS </b></FONT> </c:if>
        <c:if test="${obj == 'lavagem'}"> Ganho total nas<FONT COLOR="#20a8d8"> <b> LAVAGENS </b></FONT> </c:if>
        <c:if test="${obj == null}"> Ganho total no<FONT COLOR="#20a8d8"> <b> MÊS ATUAL </b></FONT> </c:if>   
        </div>
        <div class="card-body">
            
        <div>
            <h2> <fmt:formatNumber value="${valor}" minFractionDigits="2" type="currency"/></h2>
        </div>
            
        </div>
    </div>

</div>

<!-- /.col-->
<div style="display: flex;
     justify-content: end;
     align-items: end;
     width:50%">
    <div class="col-lg-6">
        <div class="card" style="width: 215%;">
            <div class="card-header">
            <c:if test="${obj == 'todos'}"> Tabela de valores de:<FONT COLOR="#20a8d8"> <b> MENSALISTAS, LAVAGENS, e LOCAÇÕES </b></FONT> </c:if>
            <c:if test="${obj == 'locacaotempo'}"> Tabela de valores das<FONT COLOR="#20a8d8"> <b> LOCAÇÕES POR TEMPO </b></FONT> </c:if>
            <c:if test="${obj == 'pagamento'}"> Tabela de valores dos<FONT COLOR="#20a8d8"> <b> MENSALISTAS </b></FONT> </c:if>
            <c:if test="${obj == 'lavagem'}"> Tabela de valores das<FONT COLOR="#20a8d8"> <b> LAVAGENS </b></FONT> </c:if>
            <c:if test="${obj == null}"> Tabela de valores do<FONT COLOR="#20a8d8"> <b> MÊS ATUAL </b></FONT> </c:if>
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
                    <c:forEach items="${lista}" var="obj1">
                        <tr>
                            <td><fmt:formatDate pattern="dd/MM/yyyy" value="${obj1.datasaida}"></fmt:formatDate></td>
                            
                            <td><fmt:formatNumber value="${obj1.valor}" minFractionDigits="2" type="currency"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</div>
</div>


</div>
</div>
</main>

<%@include file="../rodape.jsp" %>

