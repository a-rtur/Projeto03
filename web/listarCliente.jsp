<%@page import="Classes.Cliente"%>
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
        <title>Listar Cadastro de Cliente</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div align="center" id="conteudo">
            <h2 id="titulo">Clientes Cadastrados</h2><br/>
            <form>
                <input type="text" name="pesquisa" required maxlength="50"/>
                <input type="submit" class="btn btn-dark" name="pesquisar" value="Pesquisar"/>
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
                <th style="width: 5%">Deletar</th>
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
                <td>
                    <form>
                        <input type="submit" class="btn btn-dark" value="Excluir" name="excluir"/>
                        <input type="hidden" name="i" value="<%=i%>"/>
                    </form>
                </td>
            </tr>
        <%
                            }
                            else if ((i == Banco.getCliente().size() - 1) && gerarIndice == 1) {
        %>
                                <script>
                                    alert("Cliente não encontrado.")
                                </script>
        <%
                            }
                        }
        %>
        </table>
        <%
                    }
                }
                else if (request.getParameter("excluir") != null) {
                    int index = Integer.parseInt(request.getParameter("i"));
                    Banco.getCliente().remove(index);
                    String pesquisa = request.getParameter("pesquisa");
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
                <th style="width: 5%">Deletar</th>
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
                        <input type="submit" class="btn btn-dark" value="Excluir" name="excluir"/>
                        <input type="hidden" name="i" value="<%=i%>"/>
                    </form>
                </td>
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
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
