<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Lavagem</li>
        <li class="breadcrumb-item">
            <a href="LavagemWS">Listar</a>
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
                      <form action="LavagemWS" method="post">
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
                            <span class="input-group-text">Placa Carro</span>
                          </div>
                          <input type="text"  name="txtPlaca" required class="form-control">
                         
                        </div>
                      </div>
                          
                      <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Tipo Lavagem</span>
                          </div>
                          <input type="text" required name="txtTipoLavagem" class="form-control">
                         
                        </div>
                      </div>
                      
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Valor Lavagem</span>
                          </div>
                          <input type="text" required name="txtPrecoLavagem" class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Hora Entrega</span>
                          </div>
                          <input type="time" required name="txtHoraEntrega" class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Data Lavagem</span>
                          </div>
                          <input type="date"  name="txtDataLavagem" required class="form-control">
                         
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
