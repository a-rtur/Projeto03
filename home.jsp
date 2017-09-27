<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/style.css" />
        <title>Projeto Supervisionado</title>
    </head>
    <body>
        
        <%@include file="WEB-INF/jspf/menu.jspf" %>
                
        <h1 font align="center">Apresentação do Projeto</font></h1>
        
        <div class="container" id="explicacao">
            
            <p align="center"><font size="5"> Este projeto foi criado para realizar o cadastro de Clientes e Fornecedores.</font></p>

            <p align="center"><font size="5">Permintindo: Criar, alterar e/ou excluir se desejar um registro.</font></p>
            
           
        </div>
        
        <h1 font align="center">Membros da Equipe</font></h1>
                
        <table id="tabelaDeFotos" >  
         <tr >
       
             <td class="nomeFoto" >
                <img src="assets/imagens/Artur.jpg" width="100" height="100" class="img-circle" alt="miniatura do marcador de posição genérico"/>
                <h2>Artur Xavier</h2>
             </td>
             <td class="nomeFoto">
                <img src="assets/imagens/Gabriela.jpg" width="100" height="100" class="img-circle"/>
                <h2>Gabriela Duarte</h2>
             </td>    
             <td class="nomeFoto" >
                <img src="assets/imagens/Gustavo.jpg" width="100" height="100"  id="fotoGustavo" class="img-circle"/>
                <h2>Gustavo Cavalcanti</h2>
             </td>             
      

     </tr>
     </table>
        <tr/>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
