<%@page import="Classes.Cliente"%>
<%@page import="Classes.Banco"%>
<%@page import="Classes.Global"%>
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
        <title>Cadastro de Clientes</title>
    </head>
    <body class='wow fadeIn' data-wow-duration='1s'>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <%
            try {
                if(request.getParameter("add") != null) {
                    String nome = request.getParameter("nome");
                    String email = request.getParameter("email");
                    String telefone = request.getParameter("telefone");
                    String cpf = request.getParameter("cpf");
                    String rg = request.getParameter("rg");
                    String endereco = request.getParameter("endereco");
                    if (Global.isNumeric(cpf) == false) {
        %>
                        <script>
                            alert("Digite apenas números no campo 'CPF'.");
                        </script>
        <%                      
                    }
                    else if (Global.isNumeric(rg) == false) {
        %>
                        <script>
                            alert("Digite apenas números no campo 'RG'.");
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
                    else if (Cliente.verificarCpf(cpf) == true) {                        
        %>
                        <script>
                            alert("CPF já cadastrado.");
                        </script>
        <%
                    }
                    else if (Cliente.verificarRg(rg) == true) {
        %>
                        <script>
                            alert("RG já cadastrado.");
                        </script>
        <%           
                    }
                    else if (Global.isEmpty(nome) == true || Global.isEmpty(cpf) == true || Global.isEmpty(rg) == true || Global.isEmpty(email) == true || Global.isEmpty(endereco) == true || Global.isEmpty(telefone) == true) {
        %>
                        <script>
                            alert("Não deixe nenhum campo em branco.");
                        </script>
        <%           
                    }
                    else {
                        Cliente.cadastrarCliente(nome, cpf, rg, email, endereco, telefone);
        %>
                        <script>
                            alert("Cadastro efetuado com sucesso.");
                        </script>
        <%
                    }
                } 
            }
            catch(Exception ex) {
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
                    <input type="text" name="telefone" required maxlength="15" data-mask="(00) 0000-0000" data-mask-selectonfocus="true"/><br/><br/>
                    Email:<br/>
                    <input type="text" name="email" required maxlength="35"/><br/><br/>
                    <center><input type="submit" name="add" class="btn btn-dark" value="Cadastrar"/></center>
                </form>
            </fieldset>
        </div>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
