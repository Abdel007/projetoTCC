<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    Cadastro
                  </div>
                  <div class="card-body">
                      <form action="LocacaoTempoWS" method="post">
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Nome</span>
                          </div>
                          <input type="text"  name="txtNome" required class="form-control">
                         
                        </div>
                      </div>
                      
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Placa carro</span>
                          </div>
                          <input type="text"  name="txtPlacaCarro" required class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Dia início</span>
                          </div>
                          <input type="date"  name="txtDiaInicio" required class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Hora início</span>
                          </div>
                          <input type="time"  name="txtHoraInicio" required class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Dia termino</span>
                          </div>
                          <input type="date"  name="txtDiaTermino" required class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Hora termino</span>
                          </div>
                          <input type="time"  name="txtHoraTermino" required class="form-control">
                         
                        </div>
                      </div>
                          
                           <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Vaga</span>
                          </div>
                          <select name="txtVaga">
                        
                              <c:forEach items="${vaga}" var="obj">
                                <option required value="${obj.id}">${obj.numVaga}</option>
                            </c:forEach>
                        </select><br><br>
                          
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Valor</span>
                          </div>
                          <input type="number"  name="txtValor" required class="form-control">
                         
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
