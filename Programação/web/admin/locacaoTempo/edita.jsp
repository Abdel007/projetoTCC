<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Locar por tempo</li>
        <li class="breadcrumb-item">
            <a href="LocacaoTempoWS">Listar</a>
        </li>

    </ol>
    <div class="container-fluid">
        <div class="row">
           <div class="row">
              <div class="col-lg-auto">
                <div class="card">
                  <div class="card-header">
                    Alteração
                  </div>
                  <div class="card-body">
                      <form action="LocacaoTempoWS" method="post">
                       <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Id</span>
                          </div>
                          <input type="text" value="${obj.id}" name="txtId" readonly="readonly" class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Nome</span>
                          </div>
                          <input type="text" required value="${obj.nome}" name="txtNome" class="form-control">
                         
                        </div>
                      </div>
                          
                      <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Placa Carro</span>
                          </div>
                          <input type="text" required value="${obj.placaCarro}" name="txtPlacaCarro" class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Dia Início</span>
                          </div>
                          <input type="date" required value='<fmt:formatDate pattern="yyyy-MM-dd" value="${obj.diaInicio}"></fmt:formatDate>' name="txtDiaInicio" class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Hora Início</span>
                          </div>
                          <input type="time" required value='<fmt:formatDate pattern="HH:mm" value="${obj.horaInicio}"></fmt:formatDate>' name="txtHoraInicio" class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Dia Termino</span>
                          </div>
                          <input type="date" required value='<fmt:formatDate pattern="yyyy-MM-dd" value="${obj.diaTermino}"></fmt:formatDate>' name="txtDiaTermino" class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Hora Termino</span>
                          </div>
                          <input type="time" required value='<fmt:formatDate pattern="HH:mm" value="${obj.horaTermino}"></fmt:formatDate>' name="txtHoraTermino" class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Vaga</span>
                          </div>
                          
                            <select name="txtVaga">
                        
                                <c:forEach items="${vaga}" var="objVaga">
                                <option required value="${objVaga.id}" ${obj.vaga.equals(objVaga)?'selected':''}> ${objVaga.numVaga}</option>
                            </c:forEach>
                        </select><br><br>
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Valor</span>
                          </div>
                          <input type="text" required value="${obj.valor}" name="txtValor" class="form-control">
                         
                        </div>
                      </div>

                      
                      
                      <div class="form-group form-actions">
                        <button type="submit" class="btn btn-sm btn-primary">Enviar</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              

            </div>

        <!--/.row-->
    </div>
</main>



<%@include file="../rodape.jsp" %>
