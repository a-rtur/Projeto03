<%@page import="java.util.Scanner"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Classes.Cliente"%>
<%@page import="Classes.Banco"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <title>Alterar Cadastro do Cliente</title>
    </head>
    <body>
        <h2 align="center">Alterar Cadastro do Cliente</h2><br/>
        <div align="center">
            <form>
                Digite o CPF:<br/><br/>
                <input type="text" name="textCpf" required maxlength="11" placeholder="Apenas números..."/>
                <input type="submit" name="pesquisar" value="Pesquisar"/>
                <br/>
                <br/>
                <br/>
                <br/>
            </form>
        </div>
        <%
            int existente = 0;
            try {
                if(request.getParameter("pesquisar") != null) {
                    String pCpf = request.getParameter("textCpf");
                    for(int i = 0; i < Banco.getCliente().size(); i++) {
                        if(Banco.getCliente().get(i).getCpf().equals(pCpf)) {
        %>
                            <fieldset style="width:175px; margin:0px auto;">
                                <legend>Editar Cliente</legend>
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
                                    <input type="submit" name="editar" value="Editar"/>
                                </form>
                            </fieldset>
        <%
                            String texto = Integer.toString(i);
                            File file = new File(System.getProperty("user.home") + "/AppData/Local/Temp/variavel.txt");
                            if (!file.exists()) {
                                file.createNewFile();
                            }
                            FileWriter fw = new FileWriter(file.getAbsoluteFile());
                            BufferedWriter bw = new BufferedWriter(fw);
                            bw.write(texto);
                            bw.close();
                            i = 1 + Banco.getCliente().size();
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
                        Scanner in = new Scanner(new File(System.getProperty("user.home") + "/AppData/Local/Temp/variavel.txt"));
                        String varTxt;
                        varTxt = in.nextLine();
                        File file = new File(System.getProperty("user.home") + "/AppData/Local/Temp/variavel.txt");
                        file.delete();
                        Banco.getCliente().get(Integer.parseInt(varTxt)).setCpf("reset");
                        Banco.getCliente().get(Integer.parseInt(varTxt)).setRg("reset");
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
                            Banco.getCliente().get(Integer.parseInt(varTxt)).setNome(nome);
                            Banco.getCliente().get(Integer.parseInt(varTxt)).setCpf(cpf);
                            Banco.getCliente().get(Integer.parseInt(varTxt)).setRg(rg);
                            Banco.getCliente().get(Integer.parseInt(varTxt)).setEmail(email);
                            Banco.getCliente().get(Integer.parseInt(varTxt)).setEndereco(endereco);
                            Banco.getCliente().get(Integer.parseInt(varTxt)).setTelefone(telefone);
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
    </body>
</html>
