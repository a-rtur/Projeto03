<%@page import="Classes.Cliente"%>
<%@page import="Classes.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css"/>
        <title>Listar Cadastro de Cliente</title>
    </head>
    <body>
        <h2 align="center">Clientes Cadastrados</h2><br/>
        <%
            if (Banco.getCliente().size() != 0) {
        %>
        <table align="center">
            <tr>
                <th>Nome</th>
                <th>CPF</th>
                <th>RG</th>
                <th>Endereço</th>
                <th>Telefone</th>
                <th>Email</th>
            </tr>
            <%
                for (int i = 0; i<Banco.getCliente().size(); i++) {
                    Cliente c = Banco.getCliente().get(i);
            %>
            <tr>
                <td><%=c.getNome()%></td>
                <td><%=c.getCpf()%></td>
                <td><%=c.getRg()%></td>
                <td><%=c.getEndereco()%></td>
                <td><%=c.getTelefone()%></td>
                <td><%=c.getEmail()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }
            else {
        %>
        <h3 style="text-align: center">Não há clientes cadastrados<h3>
        <%
            }
        %>
    </body>
</html>
