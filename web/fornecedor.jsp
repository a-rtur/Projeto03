<%-- 
    Document   : home
    Created on : 24/09/2017, 19:27:33
    Author     : Gabi
--%>
<%@page import="Classes.Fornecedor"%>
<%@page import="Classes.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto Supervisionado</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1 font align="center">Cadastro de Fornecedores</font></h1>
    <%
            try {
               if(request.getParameter("add") != null) {
                   String nome = request.getParameter("nome");
                   String razao = request.getParameter("razao");
                   String cnpj = request.getParameter("cnpj");
                   String endereço = request.getParameter("endereço");
                   String telefone = request.getParameter("telefone");
                   String email = request.getParameter("email");
                   Fornecedor f = new Fornecedor();
                   f.setNome(nome);
                   f.setRazao(razao);
                   f.setCnpj(cnpj);
                   f.setEndereco(endereço);
                   f.setTelefone(telefone);
                   f.setEmail(email);
                   Banco.getFonecedor().add(f);
                 } 
                else if(request.getParameter("remove") != null) {
                    int i = Integer.parseInt(request.getParameter("i"));
                    Banco.getFonecedor().remove(i);
                }
            }
            catch(Exception ex) {
        %>
        
        <%
            }
        %>
        <fieldset style="width:175px; margin:0px auto;">
            <legend>Cadastro de Fornecedores</legend>
            <form>
                Nome:<br/>
                <input type="text" name="nome" required maxlength="50"/><br/><br/>
                Razão Social:<br/>
                <input type="text" name="razao" required maxlength="11"/><br/><br/>
                CNPJ:<br/>
                <input type="text" name="cnpj" required maxlength="13"/><br/><br/>
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
        <h2 align="center">Fornecedores Cadastrados</h2>
        <table border="1" align="center">
            <tr>
                <th>Nome</th>
                <th>Razão Social</th>
                <th>CNPJ</th>
                <th>Endereço</th>
                <th>Telefone</th>
                <th>Email</th>
                <th style="width:116px">Modificar</th>
            </tr>
            <%
               for (int i = 0; i<Banco.getFonecedor().size(); i++){
                   Fornecedor f = Banco.getFonecedor().get(i);
            %>
                       
            <tr>
                <td><%=f.getNome()%></td>
                <td><%=f.getRazao()%></td>
                <td><%=f.getCnpj()%></td>
                <td><%=f.getEndereco()%></td>
                <td><%=f.getTelefone()%></td>
                <td><%=f.getEmail()%></td>
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
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
