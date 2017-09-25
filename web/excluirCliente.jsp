<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Classes.Cliente"%>
<%@page import="Classes.Banco"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css"/>
        <title>Excluir Cadastro do Cliente</title>
    </head>
    <body>
        <h2 align="center">Excluir Cadastro do Cliente</h2><br/>
        <div align="center">
            <form>
                Digite o qualquer dado sobre o cliente:<br/><br/>
                <input type="text" name="pesquisa" required maxlength="50"/>
                <input type="submit" name="pesquisar" value="Pesquisar"/>
                <br/>
                <br/>
                <br/>
                <br/>
            </form>
        <%
            try {
                if (request.getParameter("pesquisar") != null) {
                    String pesquisa = request.getParameter("pesquisa");
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
                <th>Deletar</th>
            </tr>
        <%
                        for (int i = 0; i<Banco.getCliente().size(); i++) {
                            if (Cliente.pesquisarBanco(i, pesquisa) != -1) {  
                                Cliente c = Banco.getCliente().get(i);
        %>
            <tr>
                <td><%=c.getNome()%></td>
                <td><%=c.getCpf()%></td>
                <td><%=c.getRg()%></td>
                <td><%=c.getEndereco()%></td>
                <td><%=c.getTelefone()%></td>
                <td><%=c.getEmail()%></td>
                <td>
                    <form>
                        <input type="hidden" name="i" value="<%=i%>"/>
                        <input type="submit" name="excluir" value="Excluir"/> 
                    </form>
                </td>
            </tr>
        <%
                    }
                }
        %>
            </table>
        <%     
                    }
                    else {
        %>
        <h3 style="text-align: center">Cliente não encontrado.<h3>
        <%    
                    }
                }
                else if (request.getParameter("excluir") != null) {
                    int index = Integer.parseInt(request.getParameter("i"));
                    Banco.getCliente().remove(index);
                    String pesquisa = request.getParameter("pesquisa");
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
                <th>Deletar</th>
            </tr>
        <%
                        for (int i = 0; i<Banco.getCliente().size(); i++) {
                            if (Cliente.pesquisarBanco(i, pesquisa) != -1) {  
                                Cliente c = Banco.getCliente().get(i);
        %>
            <tr>
                <td><%=c.getNome()%></td>
                <td><%=c.getCpf()%></td>
                <td><%=c.getRg()%></td>
                <td><%=c.getEndereco()%></td>
                <td><%=c.getTelefone()%></td>
                <td><%=c.getEmail()%></td>
                <td>
                    <form>
                        <input type="hidden" name="i" value="<%=i%>"/>
                        <input type="submit" name="excluir" value="Excluir"/> 
                    </form>
                </td>
            </tr>
        <%
                    }
                }
        %>
        </table>
        <%     
                    }
                    else {
        %>
        <h3 style="text-align: center">Não há clientes cadastrados.<h3>
        <%    
                    }
                }
            }
            catch (Exception ex) {
                
            }
        %>
        </div>
    </body>
</html>
