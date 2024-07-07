<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Logger logger = Logger.getLogger("MyAppLogger");

    String ipAddress = request.getRemoteAddr();
    String username = request.getParameter("username");
    String password = request.getParameter("password"); // No recomendado por seguridad
    boolean loginSuccess = false;

    if ("admin".equals(username) && "admin".equals(password)) {
        loginSuccess = true;
    }

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String currentTime = sdf.format(new Date());

    logger.info("Intento de login - Usuario: " + username + ", IP: " + ipAddress + ", Hora: " + currentTime + ", Resultado: " + (loginSuccess ? "Éxito" : "Fallo"));

    if (loginSuccess) {
        response.sendRedirect("welcome.jsp");
    } else {
        response.sendRedirect("login.jsp?error=true");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
    <form action="index.jsp" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username"><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password"><br>
        <input type="submit" value="Login">
    </form>
    <% if (request.getParameter("error") != null) { %>
        <p style="color:red;">Login fallido. Inténtalo de nuevo.</p>
    <% } %>
</body>
</html>