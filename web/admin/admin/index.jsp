<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div class="col-lg-12">
                
                <div class="card">
                    <div class="card-header"><h1>ADM</h1>
                        
                        

                        <form action="AdminWS" method="get" class="form-horizontal">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="input-group">
                                        
                                        
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="row col-lg-12">
                            <a href="add.jsp" class="btn btn-pill btn-primary" style="margin: 20px 0px 0px 20px"> 
                                <i class="fa fa-plus"></i>
                            </a>
                        </div>
                    <div class="card-body">
                        
                        <table class="table table-responsive-sm">
                            <thead>
                                <tr>
                                    
                                    <th>Nome</th>
                                    <th>Email</th>
                                    <th>Foto</th>
                                    <th>Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${lista}" var="obj">
                                <tr>
                                    
                                    <td>${obj.nome}</td>
                                    <td>${obj.email}</td>
                                    <td><img src="../../arquivos/${obj.endFoto}" height="42" width="42"></td>
                                    <td>
                                        <a href="AdminWS?acao=edit&id=${obj.id}" class="btn btn-pill btn-success btn-sm" title="alterar"> 
                                            <i class="fa fa-edit"></i>
                                        </a>
                                        <a href="AdminWS?acao=del&id=${obj.id}" class="btn btn-pill btn-danger btn-sm" title="excluir"> 
                                            <i class="fa fa-remove"></i>
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
