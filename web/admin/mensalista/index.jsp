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
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">

                        <form action="MensalistaWS" method="get" class="form-horizontal">
                            <div class="row">
                                <div class="col-md-12">

                                    <h1>Cadastrar mensalista</h1>


                                    <div class="input-group">

                                        <span class="input-group-prepend">
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fa fa-search"></i> &nbsp;</button>
                                        </span>
                                        <input type="text" name="txtFiltro" id="input1-group2" class="form-control" placeholder="Pesquise pelo nome">
                                        <!--Indica pro servlet que a ação é um filtro -->
                                        <input type="hidden" name="acao" value="filter"/>
                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>
                    </br>
                    <div class="row col-lg-12">
                        <a href="MensalistaWS?acao=add" class="btn btn-pill btn-primary" style="margin-left: 20px"> 
                            <i class="fa fa-plus"></i>
                        </a>
                    </div>
                    <div class="card-body">
                        <table class="table table-responsive-sm">
                            <thead>
                                <tr>

                                    <th>Nome</th>
                                    <th>CPF</th>
                                    <th>Telefone</th>

                                    <th>Valor Mensal</th>
                                    <th>Ativo?</th>
                                    <th>Vaga</th>
                                    <th>Pagamentos</th>
                                    <th>Foto</th>
                                    <th>Observações</th>
                                    <th>Modelo carro</th>
                                    <th>Cor carro</th>
                                    <th>Placa carro</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${lista}" var="obj">
                                    <tr>

                                        <td>${obj.nome}</td>
                                        <td>${obj.cpf}</td>
                                        <td>${obj.telefone}</td>

                                        <td>${obj.valorMensal} R$</td>
                                        <c:if test="${obj.ativo == true}">
                                            <td>Sim</td>
                                        </c:if>
                                        <c:if test="${obj.ativo == false}">
                                            <td>Não</td>
                                        </c:if>
                                        <td>${obj.vaga.numVaga}</td>
                                        <th><a href="MensalistaWS?acao=pagamentos&id=${obj.id}">Pagamentos</a></th>
                                        <td><img src="../../arquivos/${obj.foto}" height="42" width="42"></td>
                                        <td>${obj.observacoes}</td>
                                        <td>${obj.modeloCarro}</td>
                                        <td>${obj.corCarro}</td>
                                        <td>${obj.placaCarro}</td>
                                        <td>
                                            <a href="MensalistaWS?acao=edit&id=${obj.id}" class="btn btn-pill btn-success btn-sm" title="alterar"> 
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            

                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>

                        </table>



                    </div>
                </div>
            </div>
            <!--/.col-->


        </div>

        <!--/.row-->
    </div>

</main>



<%@include file="../rodape.jsp" %>
