<%
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String dbHost = System.getenv("DATABASE_HOST");
    String dbUser = System.getenv("DATABASE_USER");
    String dbPassword = System.getenv("DATABASE_PASSWORD");
    String dbName = System.getenv("DATABASE_NAME");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Asegúrate de que este es el controlador correcto para tu versión de MySQL
        Connection con = DriverManager.getConnection("jdbc:mysql://" + dbHost + ":3306/" + dbName, dbUser, dbPassword);
        String query = "INSERT INTO USER (first_name, last_name, email, username, password, regdate) VALUES (?, ?, ?, ?, ?, NOW())";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, firstName);
        pstmt.setString(2, lastName);
        pstmt.setString(3, email);
        pstmt.setString(4, userName);
        pstmt.setString(5, password);

        int i = pstmt.executeUpdate();
        if (i > 0) {
            response.sendRedirect("welcome.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace(); // Esto ayudará a depurar si hay un error
        response.sendRedirect("index.jsp");
    }
%>
