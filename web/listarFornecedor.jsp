<%@page import="Classes.Fornecedor"%>
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
        <title>Listar Cadastro de Fornecedor</title>
    </head>
    <body class='wow fadeIn' data-wow-duration='1s'>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div align="center" id="conteudo">
            <h2 id="titulo">Fornecedores Cadastrados</h2><br/>
            <form>
                <input type="text" name="pesquisa" required maxlength="50" placeholder="Digite algum dado sobre o cliente."/>
                <input type="submit" class="btn btn-dark" name="pesquisar" value="Pesquisar"/>
                <br/>
                <br/>
                <br/>
                <br/>
            </form>
        <%
            try {
                boolean gerarIndice = true;
                boolean achouValor = false;
                if (request.getParameter("pesquisar") != null && Banco.getFornecedor().size() != 0) {
                    String pesquisa = request.getParameter("pesquisa");
                    for (int i = 0; i<Banco.getFornecedor().size(); i++) {
                        if ((Fornecedor.pesquisarBanco(i, pesquisa) != -1) && gerarIndice == true) {
                            Fornecedor f = Banco.getFornecedor().get(i);
                            gerarIndice = false;
                            achouValor = true;
        %>
        <table>
            <tr>
                <th>Razão Social</th>
                <th>Nome Fantasia</th>
                <th>CNPJ</th>
                <th>Email</th>
                <th>Endereço</th>
                <th>Telefone</th>
                <th style="width: 5%">Deletar</th>
            </tr>
            <tr>
                <td><%=f.getRazao()%></td>
                <td><%=f.getNome()%></td>
                <td><%=f.getCnpj()%></td>
                <td><%=f.getEmail()%></td>
                <td><%=f.getEndereco()%></td>
                <td><%=f.getTelefone()%></td>
                <td>
                    <form>
                        <input type="submit" class="btn btn-dark" value="Excluir" name="excluir"/>
                        <input type="hidden" name="i" value="<%=i%>"/>
                    </form>
                </td>
            </tr>
        <%
                        }
                        else if ((Fornecedor.pesquisarBanco(i, pesquisa) != -1) && gerarIndice == false) {
                            Fornecedor f = Banco.getFornecedor().get(i);
        %>
             <tr>
                <td><%=f.getRazao()%></td>
                <td><%=f.getNome()%></td>
                <td><%=f.getCnpj()%></td>
                <td><%=f.getEmail()%></td>
                <td><%=f.getEndereco()%></td>
                <td><%=f.getTelefone()%></td>
                <td>
                    <form>
                        <input type="submit" class="btn btn-dark" value="Excluir" name="excluir"/>
                        <input type="hidden" name="i" value="<%=i%>"/>
                    </form>
                </td>
            </tr>                 
        <%
                        }
                        else if ((i == Banco.getFornecedor().size() - 1) && achouValor == false) {
        %>
        <script>
            alert("Fornecedor não encontrado.");
        </script>
        <%
                        }                     
                    }
        %>
        </table>
        <%
                }
                else if (request.getParameter("excluir") != null) {
                    int index = Integer.parseInt(request.getParameter("i"));
                    Banco.getFornecedor().remove(index);
                }
                else if (Banco.getFornecedor().size() == 0 && request.getParameter("pesquisar") != null) {
        %>
        <h3 style="text-align: center">Não há fornecedores cadastrados</h3>
        <script>
            alert("Fornecedor não encontrado.");
        </script>
        <%
                }
                else if (Banco.getFornecedor().size() == 0) {
        %>
        <h3 style="text-align: center">Não há fornecedores cadastrados</h3>
        <%
                }
                if (gerarIndice == true && Banco.getFornecedor().size() != 0) {
        %>
        <table>
            <tr>
                <th>Razão Social</th>
                <th>Nome Fantasia</th>
                <th>CNPJ</th>
                <th>Email</th>
                <th>Endereço</th>
                <th>Telefone</th>
                <th style="width: 5%">Deletar</th>
            </tr>
        <%
                            for (int i = 0; i<Banco.getFornecedor().size(); i++) {
                                Fornecedor f = Banco.getFornecedor().get(i);
        %>
            <tr>
                <td><%=f.getRazao()%></td>
                <td><%=f.getNome()%></td>
                <td><%=f.getCnpj()%></td>
                <td><%=f.getEmail()%></td>
                <td><%=f.getEndereco()%></td>
                <td><%=f.getTelefone()%></td>
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
                else if (request.getParameter("excluir") != null) {
        %>
        <h3 style="text-align: center">Não há fornecedores cadastrados</h3>
        <%
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
