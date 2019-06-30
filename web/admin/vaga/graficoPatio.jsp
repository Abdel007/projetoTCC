<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../cabecalhoInicial.jsp" %>

<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Ocupação</li>
        <li class="breadcrumb-item">
            <a href="#"></a>
        </li>
    </ol>

    <div class="product-new-list-area">
        <div class="container-fluid">
                    <h4>Vagas sem cobertura</h4>
                    </br>
                    <div class="row">
                        <c:forEach items="${vaga}" var="obj"> 
                            <c:if test="${obj.coberta==false}">
                                <div class="col-sm-6 col-md-2">
                                    <div class="card text-white
                                         <c:if test="${obj.ocupada==true}">bg-danger</c:if>
                                         <c:if test="${obj.ocupada==false}">bg-success</c:if>">
                                             <div class="card-body">
                                                 <div class="text-value">Vaga: ${obj.numVaga}</div> 
                                             <c:if test="${obj.ocupada==true}"><small class="text-muted text-uppercase font-weight-bold">Ocupada</small></c:if>
                                             <c:if test="${obj.ocupada==false}"><small class="text-muted text-uppercase font-weight-bold">Livre</small></c:if>
                                             </div>
                                         </div>
                                    </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <h4>Vagas cobertas </h4>
                    </br>
                <div class="row">
                    <c:forEach items="${vaga}" var="obj">
                        <c:if test="${obj.coberta==true}">
                            <div class="col-sm-6 col-md-2">
                                <div class="card text-white
                                     <c:if test="${obj.ocupada==true}">bg-danger</c:if>
                                     <c:if test="${obj.ocupada==false}">bg-success</c:if>">
                                         <div class="card-body">
                                             <div class="text-value">Vaga: ${obj.numVaga}</div> 
                                         <c:if test="${obj.ocupada==true}"><small class="text-muted text-uppercase font-weight-bold">Ocupada</small></c:if>
                                         <c:if test="${obj.ocupada==false}"><small class="text-muted text-uppercase font-weight-bold">Livre</small></c:if>
                                         </div>
                                     </div>
                                </div>
                        </c:if>
                    </c:forEach>
                </div>
        </div>
        </div>
</main>

<%@include file="../rodape.jsp" %>


