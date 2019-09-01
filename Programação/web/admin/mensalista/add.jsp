<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../cabecalho.jsp" %>
<main class="main">
    <!-- Breadcrumb-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Mensalista</li>
        <li class="breadcrumb-item">
            <a href="MensalistaWS">Listar</a>
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
                          <input type="hidden" name="urldestino" value="MensalistaWS">
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
                            <span class="input-group-text">CPF</span>
                          </div>
                          <input type="text"  name="txtCpf" required class="form-control">
                         
                        </div>
                      </div>
                          
                      <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Telefone</span>
                          </div>
                          <input type="text"  name="txtTelefone" required class="form-control">
                          
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Foto</span>
                          </div>
                          <input type="file"  name="txtFoto" required class="form-control">
                          
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Valor mensal</span>
                          </div>
                          <input type="number"  name="txtValorMensal" required class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Ativo?</span>
                          </div>
                            <input type="checkbox" name="txtAtivo"><br
                      </div>
                          
                          
                      </div>
                    
                    <br>
                          
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
                            <span class="input-group-text">Observações</span>
                          </div>
                          <input type="text"  name="txtObservacoes" required class="form-control">
                          </div>
                              </div>
                    
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Modelo Carro</span>
                          </div>
                          <input type="text"  name="txtModeloCarro" required class="form-control">
                         
                        </div>
                      </div>
                          
                          <div class="form-group">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">Cor carro</span>
                          </div>
                          <input type="text"  name="txtCorCarro" required class="form-control">
                         
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
                    
                    <div class="form-group form-actions">
                        <button type="submit" class="btn btn-sm btn-primary">Enviar</button>
                      </div>
                         
                        </form>
                      </div>
                      
                      
                    
                  </div>
                </div>
              </div>
              

            </div>

        <!--/.row-->
    </div>
</main>



<%@include file="../rodape.jsp" %>
