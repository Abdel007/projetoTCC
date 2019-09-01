<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Admin</li>
        <li class="breadcrumb-item">
            <a href="AdminWS">Listar</a>
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
                      <form action="UploadWS" method="post" enctype="multipart/form-data">
                          <input type="hidden" name="urldestino" value="AdminWS">
                      <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Nome</span>
                          </div>
                          <input type="text" required name="txtNome" class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Email</span>
                          </div>
                          <input type="email" required  name="txtEmail" class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Senha</span>
                          </div>
                          <input type="password" required name="txtSenha" class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group-file">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text" for="file">Foto</span>
                          </div>
                          <input type="file" required name="txtFoto" class="form-control">
                         
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
