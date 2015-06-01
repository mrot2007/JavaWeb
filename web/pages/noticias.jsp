<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="br.ufjf.model.Categoria"%>
<%@page import="java.util.List"%>
<%
    List<Categoria> listaC = (List<Categoria>) request.getAttribute("listaCat");
    
%>
        
        <fieldset>
    <legend>Pesquisa</legend>
    <form method="GET" action="control?action=pesqNoticias">
        Nome: <input type="text" name="PesqNome" /><br />
        Categoria: <select name="PesqCategoria" />
        
        <%
        for (Categoria c: listaC){
        out.print("<option value=\"" + c.getIdCategoria() + "\" >"+
                c.getDescricao()+ "</ option>");
        
        }
        %>
        </select>
        <br />
        
        Autor: <select name="PesqAutor" >
            <c:forEach  var="s" items="${listaUser}">
            <option value="${s.iduser}"> ${s.nome} </option>
            
        </c:forEach> 
        </select><br />
        <br />
        <input type="submit" name="btn" value="pesquisar" />
        <input type="submit" name="btn" value="Nova Noticia" />
    </form>
    
</fieldset>

<table style="width: 100%;">
    <tr style="background-color: graytext; font-weight: bolder;
        color: white">
        <td>Noticia</td>
        <td>Autor</td>
        <td>Categoria</td>
        <td>Ação</td>
    </tr>
    <c:if test="${listaNot.size()==0}">
        <tr><td colspan="4">Não há noticias</td></tr>
    </c:if>
    
    <c:if test="${listaNot.size()!=0}">
        <c:forEach items="${listaNot}" var="n">
            <tr>
                <td>${n.titulo}</td>
                <td>${n.usuario.nome}</td>
                <td>${n.categoria.descricao}</td>
                <td>A X</td>
            </tr>    
            
            
        </c:forEach>
    </c:if>
    
    
    
    
    
    
        
</table>