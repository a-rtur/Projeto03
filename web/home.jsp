<%-- 
    Document   : home
    Created on : 24/09/2017, 19:27:33
    Author     : Gabi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Projeto Supervisionado</title>
    </head>
    <body>
        
        <%@include file="WEB-INF/jspf/menu.jspf" %>
                
        <h1 font align="center">Apresentação do Projeto</font></h1>
        
        <div class="container" id="explicacao">
            
            <p align="center"><font size="5"> Este projeto foi criado para realizar o cadastro de Clientes e Fornecedores.</font></p>

            <p align="center"><font size="5">Em cada um deles além do cadastro você também poderá alterar e/ou excluir se desejar.</font></p>
        </div>
        
        <h1 font align="center">Apresentação da Equipe</font></h1>
        
        <div id ="equipe" class="recipiente-fluido"
  
            <div class="marcadores de posição de linha col-md-offset-2">              
                <img src="imagens/Artur.jpg" width="200" height="200" class="img-circle" alt="miniatura do marcador de posição genérico"/>
                <h2>Artur Xavier</h2>
                
                <img src="imagens/Gabriela.jpg" width="200" height="200" class="img-circle" alt="miniatura do marcador de posição genérico"/>
                <h2>Gabriela Duarte</h2>
                 
                <img src="imagens/Gustavo.jpg" width="200" height="200" class="img-circle" alt="miniatura do marcador de posição genérico"/>
                <h2>Gustavo Cavalcante</h2>
            </div>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
