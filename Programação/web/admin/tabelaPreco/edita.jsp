<%@include file="../cabecalhoInicial.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Tabela de pre�os</li>
        <li class="breadcrumb-item">
            <a href="TabelaPrecoWS">Listar</a>
        </li>

    </ol>
    <div class="container-fluid">
        <div class="row">
           <div class="row">
              <div class="col-lg-auto">
                <div class="card">
                  <div class="card-header">
                    Altera��o
                  </div>
                  <div class="card-body">
                      <form action="TabelaPrecoWS" method="post">
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
                            <span class="input-group-text">Op��o</span>
                          </div>
                          <input type="text" value="${obj.opcoes}" name="txtOpcoes" required class="form-control">
                         
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Valor</span>
                          </div>
                          <input type="text" value="${obj.valor}" name="txtValor" required class="form-control">
                          
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
