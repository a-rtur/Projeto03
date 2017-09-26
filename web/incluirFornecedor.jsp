<%@page import="Classes.fornecedor"%>
<%@page import="Classes.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Popper Js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <!-- Bootstrap Js -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="assets/css/style.css"/>
        <title>Cadastro de Fornecedores</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <%
            try {
                
                if(request.getParameter("add") != null) {
                    String razao = request.getParameter("razao");
                    String nomef = request.getParameter("nome");
                    String cnpj = request.getParameter("cnpj");
                    String endereco = request.getParameter("endereco");
                    String telefone = request.getParameter("telefone");
                    String email = request.getParameter("email");
                    //Aletrar classe
                   // if (fornecedor.verificarCnpj(cnpj) == true) {                        
        %>
        
                        <script>
                            alert("CNPJ já cadastrado.");
                        </script>
        <%           
                    }
                    else {
                           // Alterar
                        //fornecedor.cadastrarFornecedor(razao,nomef, cnpj, endereco, telefone, email);
        %>
                        <script>
                            alert("Cadastro efetuado com sucesso.");
                        </script>
        <%
                    }
                } 
            }
            catch (Exception ex){
        %>
                <script>
                    alert("Erro inesperado.");
                </script>
        <%
            }
        %>
        <div id="conteudo">
            <fieldset>
                <div id="titulo"><h3>Cadastro de Clientes</h3></div>
                <form>
                    Nome:<br/>
                    <input type="text" name="nome" required maxlength="50"/><br/><br/>
                    CPF:<br/>
                    <input type="text" name="cpf" required maxlength="11"/><br/><br/>
                    RG:<br/>
                    <input type="text" name="rg" required maxlength="13"/><br/><br/>
                    Endereço:<br/>
                    <input type="text" name="endereco" required maxlength="50"/><br/><br/>
                    Telefone:<br/>
                    <input type="text" name="telefone" required maxlength="15"/><br/><br/>
                    Email:<br/>
                    <input type="text" name="email" required maxlength="35"/><br/><br/>
                    <center><input type="submit" name="add" class="btn btn-dark" value="Adicionar"/></center>
                </form>
            </fieldset>
        </div>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
