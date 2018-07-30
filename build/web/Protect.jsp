<%@page import="Entity.User"%>
<%
    
    Object o = session.getAttribute("user");
    if(o == null){
        response.sendRedirect("Login.jsp");
    }
    User u = (User)o;
%>