<%@page import="Classes.Cliente"%>
<%@page import="Classes.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto Supervisionado</title>
    </head>
    <body>
        <h1 align="center">Cadastro de Clientes</h1>
        <%
            try {
               if(request.getParameter("add") != null) {
                   String nome = request.getParameter("nome");
                   String email = request.getParameter("email");
                   String telefone = request.getParameter("telefone");
                   String cpf = request.getParameter("cpf");
                   String rg = request.getParameter("rg");
                   String endereco = request.getParameter("endereco");
                   Cliente c = new Cliente();
                   c.setNome(nome);
                   c.setEmail(email);
                   c.setTelefone(telefone);
                   c.setCpf(cpf);
                   c.setRg(rg);
                   c.setEndereco(endereco);
                   Banco.getCliente().add(c);
                } 
                else if(request.getParameter("remove") != null) {
                    int i = Integer.parseInt(request.getParameter("i"));
                    Banco.getCliente().remove(i);
                }
            }
            catch(Exception ex) {
        %>
        
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
        <br/>
        <br/>
        <h2 align="center">Clientes Cadastrados</h2>
        <table border="1" align="center">
            <tr>
                <th>Nome</th>
                <th>CPF</th>
                <th>RG</th>
                <th>Endereço</th>
                <th>Telefone</th>
                <th>Email</th>
                <th style="width:116px">Modificar</th>
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
                <td>
                    <form>
                        <input type="hidden" name="i" value="<%=i%>"/>
                        <input type="submit" name="remove" value="Excluir"/>  
                        <input type="submit" name="alterar" value="Alterar"/>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </body>
</html>
