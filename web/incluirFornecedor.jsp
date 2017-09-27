<%@page import="Classes.Global"%>
<%@page import="Classes.Fornecedor"%>
<%@page import="Classes.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' href='assets/css/animate.css'>
        <script type='text/javascript' src='assets/js/wow.js'></script>
        <script>new WOW().init();</script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- Popper Js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <!-- Bootstrap Js -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="assets/css/style.css"/>
        <title>Cadastro de Fornecedores</title>
    </head>
    <body class='wow fadeIn' data-wow-duration='1s'>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <%
            try {
                if(request.getParameter("add") != null) {
                    String razao = request.getParameter("razao");
                    String nome = request.getParameter("nome");
                    String cnpj = request.getParameter("cnpj");
                    String endereco = request.getParameter("endereco");
                    String telefone = request.getParameter("telefone");
                    String email = request.getParameter("email");
                    if (Global.isNumeric(cnpj) == false) {                
        %>
                        <script>
                            alert("Digite apenas números no campo 'CNPJ'.");
                        </script>
        <%                      
                    }
                    else if (Global.isNumeric(telefone) == false) {
        %>
                        <script>
                            alert("Digite apenas números no campo 'Telefone'.");
                        </script>
        <%                      
                    }
                    else if (Fornecedor.verificarCnpj(cnpj) == true) {                        
        %>
                        <script>
                            alert("CNPJ já cadastrado.");
                        </script>
        <%          
                    }
                    else {
                        Fornecedor.cadastrarFornecedor(razao, nome, cnpj, email, endereco, telefone);
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
                <div id="titulo"><h3>Cadastro de Fornecedores</h3></div>
                <form>
                    Razão Social:<br/>
                    <input type="text" name="razao" required maxlength="50"/><br/><br/>
                    Nome Fantasia:<br/>
                    <input type="text" name="nome" required maxlength="50"/><br/><br/>
                    CNPJ:<br/>
                    <input type="text" name="cnpj" required maxlength="14"/><br/><br/>
                    Email:<br/>
                    <input type="text" name="email" required maxlength="35"/><br/><br/>
                    Endereço:<br/>
                    <input type="text" name="endereco" required maxlength="50"/><br/><br/>
                    Telefone:<br/>
                    <input type="text" name="telefone" required maxlength="15"/><br/><br/>
                    <center><input type="submit" name="add" class="btn btn-dark" value="Cadastrar"/></center>
                </form>
            </fieldset>
        </div>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
