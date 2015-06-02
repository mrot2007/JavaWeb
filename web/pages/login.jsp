<br><h2>Acesso Restrito!</h2>
<div class="login">
    <center>
    <form method="post" action="?">
        <input type="hidden" name="action" value="logar" />
        Login: 
        <br />
        <input type="text" name="cpLogin" value="ze" />
        <br />
        Senha
        <br />
        <input type="password" name="cpSenha" value="ze" />
        <br />
        <br />
        <input type="submit" name="btnLogar" value="Logar" /> 
        <%
        if (request.getAttribute("msg") != null){
            out.print("<br /><span style=\"text-align:center;color:red;"
                    + "font-size:10px;\">"+
                    request.getAttribute("msg")+"</span>");
        }        
        %>
    </form></center>
</div>
    <br><br><br><br><br><br><br><br><br><br><br>
