<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Vagas</li>
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
                    Cadastro
                  </div>
                  <div class="card-body">
                      <form action="VagaWS" method="post">
                      <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Número Vaga</span>
                          </div>
                          <input type="number"  name="txtNumVaga" required class="form-control">
                         
                        </div>
                          
                          
                      </div>
                      <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Ocupada?</span>
                          </div>
                            <input type="checkbox" value="ocupada" name="txtOcupada"><br
                      </div>
                          
                          
                      </div>
                    
                    <br>
                    
                    <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Coberta?</span>
                          </div>
                            <input type="checkbox" value="coberta" name="txtCoberta"><br
                            
                            
                       
                        </div>
                      </div> 
                    
                    <br>
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
