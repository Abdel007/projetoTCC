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
                            Alteração
                        </div>
                        <div class="card-body">
                            <form action="UploadWS" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="urldestino" value="MensalistaWS">
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
                                        <input type="text" value="${obj.nome}" required name="txtNome" class="form-control">

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">CPF</span>
                                        </div>
                                        <input type="text" value="${obj.cpf}" name="txtCpf" required class="form-control">

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Telefone</span>
                                        </div>
                                        <input type="text" value="${obj.telefone}" name="txtTelefone" required class="form-control">

                                    </div>
                                </div>

                                <div class="form-group-file">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Foto</span>
                                        </div>
                                        <input type="file" value="${obj.foto}" name="txtFoto" required class="form-control form-control-file">

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Valor Mensal</span>
                                        </div>
                                        <input type="text" value="${obj.valorMensal}" name="txtValorMensal" required class="form-control">

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Ativo?</span>
                                        </div>
                                        <input type="checkbox" name="txtAtivo" ${obj.ativo.equals(true)?'checked':''} class="form-control">

                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Vaga</span>
                                        </div>


                                        <select name="txtVaga">
                                            <option value="${obj.vaga.id}" selected>${obj.vaga.numVaga}</option>
                                            <c:forEach items="${vaga}" var="objVaga">
                                                <option required value="${objVaga.id}"> ${objVaga.numVaga}</option>
                                            </c:forEach>
                                        </select><br><br>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Observações</span>
                                        </div>
                                        <input type="text" value="${obj.observacoes}" name="txtObservacoes" required class="form-control">

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Modelo Carro</span>
                                        </div>
                                        <input type="text" value="${obj.modeloCarro}" name="txtModeloCarro" required class="form-control">

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Cor Carro</span>
                                        </div>
                                        <input type="text" value="${obj.corCarro}" required name="txtCorCarro" class="form-control">

                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Placa Carro</span>
                                        </div>
                                        <input type="text" value="${obj.placaCarro}" required name="txtPlacaCarro" class="form-control">

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
