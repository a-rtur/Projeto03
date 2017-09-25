<%@page import="Classes.Cliente"%>
<%@page import="Classes.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css"/>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <title>Cadastro de Clientes</title>
    </head>
    <body>
        <h2 align="center">Cadastro de Clientes</h2><br/>
        <%
            try {
                if(request.getParameter("add") != null) {
                    String nome = request.getParameter("nome");
                    String email = request.getParameter("email");
                    String telefone = request.getParameter("telefone");
                    String cpf = request.getParameter("cpf");
                    String rg = request.getParameter("rg");
                    String endereco = request.getParameter("endereco");
                    if (Cliente.verificarCpf(cpf) == true) {                        
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
        <fieldset style="width:175px; margin:0px auto;">
            <legend>Novo Cliente</legend>
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
                <input type="submit" name="add" value="Adicionar"/>
            </form>
        </fieldset>
    </body>
</html>
