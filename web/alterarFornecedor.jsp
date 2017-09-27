<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Classes.Fornecedor"%>
<%@page import="Classes.Banco"%>
<%@page import="Classes.Global"%>
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
        <title>Alterar Cadastro do Fornecedor</title>
    </head>
    <body class='wow fadeIn' data-wow-duration='1s'>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div id="conteudo">
            <h2 id="titulo">Alterar Cadastro do Fornecedor</h2><br/>
            <form align="center">
                <input type="text" name="textCnpj" required maxlength="14" placeholder="Digite o CNPJ, apenas números..."/>
                <input type="submit" name="pesquisar" class="btn btn-dark" value="Pesquisar"/>
                <br/>
                <br/>
                <br/>
                <br/>
            </form>
        <%
            int existente = 0;
            try {
                String tCnpj = request.getParameter("textCnpj");
                if(request.getParameter("pesquisar") != null && Banco.getFornecedor().size() != 0 && Global.isNumeric(tCnpj) == true) {
                    for(int i = 0; i < Banco.getFornecedor().size(); i++) {
                        if(Banco.getFornecedor().get(i).getCnpj().equals(tCnpj)) {
    %>
                            <fieldset class='wow bounceInDown'>
                                <div id="titulo"><h3>Alterar Cadastro</h3></div>
                                <form>
                                    Razão social:<br/>
                                    <input type="text" name="razao" required maxlength="50" value="<%=Banco.getFornecedor().get(i).getRazao()%>"/><br/><br/>
                                    Nome Fantasia:<br/>
                                    <input type="text" name="nome" required maxlength="50" value="<%=Banco.getFornecedor().get(i).getNome()%>"/><br/><br/>
                                    CNPJ:<br/>
                                    <input type="text" name="cnpj" required maxlength="14" value="<%=Banco.getFornecedor().get(i).getCnpj()%>"/><br/><br/>
                                    Email:<br/>
                                    <input type="text" name="email" required maxlength="30" value="<%=Banco.getFornecedor().get(i).getEmail()%>"/><br/><br/>
                                    Telefone:<br/>
                                    <input type="text" name="telefone" required maxlength="15" value="<%=Banco.getFornecedor().get(i).getTelefone()%>"/><br/><br/>
                                    Endereço:<br/>
                                    <input type="text" name="endereco" required maxlength="50" value="<%=Banco.getFornecedor().get(i).getEndereco()%>"/><br/><br/>
                                    <center><input type="submit" name="editar" value="Alterar" class="btn btn-dark"/></center>
                                </form>
                            </fieldset>
    <%
                            Banco.setIndex(i);
                            existente = 1;
                        }
                        else if((i == Banco.getFornecedor().size() -1) && existente == 0) {
    %>
                            <script>
                                alert("CNPJ não encontrado.");
                            </script>
    <%
                        }
                    }   
                }
                else if(Banco.getFornecedor().size() == 0 && request.getParameter("pesquisar") != null) {
        %>
                            <script>
                                alert("Não há fornecedores cadastrados.");
                            </script>
        <%
                }
                else if(Global.isNumeric(tCnpj) == false && request.getParameter("pesquisar") != null) {
        %>
                    <script>
                        alert("Digite apenas números.");
                    </script>
        <%
                }
                else if(request.getParameter("editar") != null) {
                    try {
                        String razao = request.getParameter("razao");
                        String nome = request.getParameter("nome");
                        String cnpj = request.getParameter("cnpj");
                        String email = request.getParameter("email");
                        String telefone = request.getParameter("telefone");
                        String endereco = request.getParameter("endereco");
                        String cnpjAntigo = Banco.getFornecedor().get(Banco.getIndex()).getCnpj();
                        Banco.getFornecedor().get(Banco.getIndex()).setCnpj("reset");
                        if (Global.isNumeric(cnpj) == false){
                            Banco.getFornecedor().get(Banco.getIndex()).setCnpj(cnpjAntigo);
        %>
                            <script>
                                alert("Digite apenas números no campo 'CNPJ'.");
                            </script>
        <%
                        }
                        else if (Global.isNumeric(telefone) == false){
                            Banco.getFornecedor().get(Banco.getIndex()).setCnpj(cnpjAntigo);
        %>
                            <script>
                                alert("Digite apenas números no campo 'Telefone'.");
                            </script>
        <%
                        }
                        else if (Fornecedor.verificarCnpj(cnpj) == true) {
                            Banco.getFornecedor().get(Banco.getIndex()).setCnpj(cnpjAntigo);
        %>
                            <script>
                                alert("CNPJ já cadastrado.");
                            </script>
        <%           
                        }
                        else {
                            Banco.getFornecedor().get(Banco.getIndex()).setRazao(razao);
                            Banco.getFornecedor().get(Banco.getIndex()).setNome(nome);
                            Banco.getFornecedor().get(Banco.getIndex()).setCnpj(cnpj);
                            Banco.getFornecedor().get(Banco.getIndex()).setEmail(email);
                            Banco.getFornecedor().get(Banco.getIndex()).setTelefone(telefone);
                            Banco.getFornecedor().get(Banco.getIndex()).setEndereco(endereco);
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
                    alert("Erro desconhecido.");
                </script>
        <%
            }
        %>
        </div>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
