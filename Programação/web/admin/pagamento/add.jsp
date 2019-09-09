<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Pagamentos</li>
        <li class="breadcrumb-item">
            <a href="PagamentoWS">Listar</a>
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
                      <form action="PagamentoWS" method="post">
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Mensalista</span>
                          </div>
                          <select name="txtMensalista">
                        
                              <c:forEach items="${mensalista}" var="obj">
                                <option required value="${obj.id}">${obj.nome}</option>
                            </c:forEach>
                        </select><br><br>
                          
                        </div>
                      </div>
                            
                      <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Período Estadia</span>
                          </div>
                          <input placeholder="ex: 15 fev - 15 mar" type="text"  name="txtMesAno" required class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Data Pagamento</span>
                          </div>
                          <input type="date"  name="txtDataPagamento" required class="form-control">
                         
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
