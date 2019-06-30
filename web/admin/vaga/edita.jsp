<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Vaga</li>
        <li class="breadcrumb-item">
            <a href="VagaWS">Listar</a>
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
                      <form action="VagaWS" method="post">
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
                            <span class="input-group-text">Numero vaga</span>
                          </div>
                          <input type="text" value="${obj.numVaga}" name="txtNumVaga" required class="form-control">
                         
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Ocupada?</span>
                          </div>
                          <input type="checkbox" name="txtOcupada" ${obj.ocupada.equals(true)?'checked':''} class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Coberta?</span>
                          </div>
                          <input type="checkbox" name="txtCoberta" ${obj.coberta.equals(true)?'checked':''} class="form-control">
                         
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
