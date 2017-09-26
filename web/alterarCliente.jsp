<%@page import="java.util.Scanner"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Classes.Cliente"%>
<%@page import="Classes.Banco"%>
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
        <title>Alterar Cadastro do Cliente</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div id="conteudo">
            <h2 id="titulo">Alterar Cadastro do Cliente</h2><br/>
            <form align="center">
                <input type="text" name="textCpf" required maxlength="11" placeholder="Digite o CPF, apenas números..."/>
                <input type="submit" name="pesquisar" class="btn btn-dark" value="Pesquisar"/>
                <br/>
                <br/>
                <br/>
                <br/>
            </form>
        <%
            int existente = 0;
            try {
                if(request.getParameter("pesquisar") != null) {
                    String pCpf = request.getParameter("textCpf");
                    for(int i = 0; i < Banco.getCliente().size(); i++) {
                        if(Banco.getCliente().get(i).getCpf().equals(pCpf)) {
        %>
                            <fieldset>
                                <div id="titulo"><h3>Alterar Cadastro</h3></div>
                                <form>
                                    Nome:<br/>
                                    <input type="text" name="nome" required maxlength="50" value="<%=Banco.getCliente().get(i).getNome()%>"/><br/><br/>
                                    CPF:<br/>
                                    <input type="text" name="cpf" required maxlength="11" value="<%=Banco.getCliente().get(i).getCpf()%>"/><br/><br/>
                                    RG:<br/>
                                    <input type="text" name="rg" required maxlength="13" value="<%=Banco.getCliente().get(i).getRg()%>"/><br/><br/>
                                    Endereço:<br/>
                                    <input type="text" name="endereco" required maxlength="50" value="<%=Banco.getCliente().get(i).getEndereco()%>"/><br/><br/>
                                    Telefone:<br/>
                                    <input type="text" name="telefone" required maxlength="15" value="<%=Banco.getCliente().get(i).getTelefone()%>"/><br/><br/>
                                    Email:<br/>
                                    <input type="text" name="email" required maxlength="35" value="<%=Banco.getCliente().get(i).getEmail()%>"/><br/><br/>
                                    <center><input type="submit" name="editar" value="Alterar" class="btn btn-dark"/></center>
                                </form>
                            </fieldset>
        <%
                            Banco.setIndex(i);
                            existente = 1;
			}
                        else if ((i == Banco.getCliente().size() -1) && existente == 0) {
        %>
                            <script>
                                alert("CPF não encontrado.");
                            </script>
        <%
                        }
                    }
                }
                else if(request.getParameter("editar") != null) {
                    try {
                        String nome = request.getParameter("nome");
                        String email = request.getParameter("email");
                        String telefone = request.getParameter("telefone");
                        String cpf = request.getParameter("cpf");
                        String rg = request.getParameter("rg");
                        String endereco = request.getParameter("endereco");
                        String cpfAntigo = Banco.getCliente().get(Banco.getIndex()).getCpf();
                        String rgAntigo = Banco.getCliente().get(Banco.getIndex()).getRg();
                        Banco.getCliente().get(Banco.getIndex()).setCpf("reset");
                        Banco.getCliente().get(Banco.getIndex()).setRg("reset");
                        if (Cliente.verificarCpf(cpf) == true) {
                            Banco.getCliente().get(Banco.getIndex()).setCpf(cpfAntigo);
                            Banco.getCliente().get(Banco.getIndex()).setRg(rgAntigo);
        %>
                            <script>
                                alert("CPF já cadastrado.");
                            </script>
        <%
                        }
                        else if (Cliente.verificarRg(rg) == true) {
                            Banco.getCliente().get(Banco.getIndex()).setCpf(cpfAntigo);
                            Banco.getCliente().get(Banco.getIndex()).setRg(rgAntigo);
        %>
                            <script>
                                alert("RG já cadastrado.");
                            </script>
        <%           
                        }
                        else {
                            Banco.getCliente().get(Banco.getIndex()).setNome(nome);
                            Banco.getCliente().get(Banco.getIndex()).setCpf(cpf);
                            Banco.getCliente().get(Banco.getIndex()).setRg(rg);
                            Banco.getCliente().get(Banco.getIndex()).setEmail(email);
                            Banco.getCliente().get(Banco.getIndex()).setEndereco(endereco);
                            Banco.getCliente().get(Banco.getIndex()).setTelefone(telefone);
        %>
                            <script>
                                alert("Edição efetuada com sucesso.");
                            </script>
        <%
                        }
                    }
                    catch (Exception ex) {
        %>
                        <script>
                            alert("Erro desconhecido.");
                        </script>
        <%
                    }
                }
        %>
        <%   
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
