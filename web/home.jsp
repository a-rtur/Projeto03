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
        <title>Home</title>
    </head>
    <body class='wow fadeIn' data-wow-duration='1s'>
        <%@include file="WEB-INF/jspf/menu.jspf"%>    
        <section id='equipe'>
            <div data-spy='scroll' data-target='navbar' id='home-inner' class='container'>
            <div class='row'>
            <div class='col-md-12'>
            <h1 class='title' id="tituloh">Equipe</h1>
            </div>
            </div>
            
            <div class='row'>
            
            <div class='col-md-4 wow bounceInDown'>
            <div class='cards'>
            <center>
            <img class='img-fluid rounded-circle' src='assets/imagens/Artur.jpg' id='marginfoto' />
            <h3 id='corNomes'>Artur Fulgoni Xavier</h3>
            <h4>Desenvolvedor Front-End e Back-End</h4>
            <p>Responsável pelo desenvolvimento do CRUD do Cliente, além da estilização do site.</p>
            </center>
            </div>
            </div>

            <div class='col-md-4 wow bounceInDown' data-wow-delay='0.2s'>
            <div class='cards' id='fundoFoto'>
            <center>
            <img class='img-fluid rounded-circle' src='assets/imagens/Gabriela.jpg' id='marginfoto'/>
            <h3 id='corNomes'>Gabriela Duarte</h3>
            <h4>Desenvolvedora Back-End</h4>
            <p>Responsável pelo desenvolvimento do CRUD do Fornecedor.</p>
            </center>
            </div>
            </div>

            <div class='col-md-4 wow bounceInDown' data-wow-delay='0.4s'>
            <div class='cards'>
            <center>
            <img class='img-fluid rounded-circle' src='assets/imagens/Gustavo.jpg' id='marginfoto'/>
            <h3 id='corNomes'>Gustavo Cavalcanti</h3>
            <h4>Desenvolvedor Front-End</h4>
            <p>Responsável pelo desenvolvimento da Home do site.</p>
            </center>
            </div>
            </div>
            

            
            
            </div>
            </div>
            </section>
        <%@include file="WEB-INF/jspf/rodape.jspf"%>
    </body>
</html>
