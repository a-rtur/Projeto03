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
        <div align="center">
            <form>
                Pesquisa avançada:<br/><br/>
                <input type="text" name="pesquisa" required maxlength="50"/>
                <input type="submit" name="pesquisar" value="Pesquisar"/>
                <br/>
                <br/>
                <br/>
                <br/>
            </form>
        <%
            int gerarIndice = 1;
            try {
                if (request.getParameter("pesquisar") != null) {
                    String pesquisa = request.getParameter("pesquisa");
                    if (Banco.getCliente().size() != 0) {
                        for (int i = 0; i<Banco.getCliente().size(); i++) {
                            if (Cliente.pesquisarBanco(i, pesquisa) != -1) {
                                Cliente c = Banco.getCliente().get(i);
                                if (gerarIndice == 1) {
                                    gerarIndice = 0;
        %>
        <table>
            <tr>
                <th>Nome</th>
                <th>CPF</th>
                <th>RG</th>
                <th>Endereço</th>
                <th>Telefone</th>
                <th>Email</th>
            </tr>
        <%
                                }
                                    
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
                            else if ((i == Banco.getCliente().size() - 1) && gerarIndice == 1) {
        %>
                                <h3 style="text-align: center">Cliente não encontrado.</h3>
        <%
                            }
                        }
        %>
        </table>
        <%
                    }
                }
                else {
                    if (Banco.getCliente().size() != 0) {
        %>
        <table>
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
        </div>
    </body>
</html>
