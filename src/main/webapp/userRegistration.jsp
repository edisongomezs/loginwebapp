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
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://" + dbHost + ":3306/" + dbName, dbUser, dbPassword);
    Statement st = con.createStatement(); 
    int i = st.executeUpdate("insert into USER(first_name, last_name, email, username, password, regdate) values ('" + firstName + "','" + lastName + "','" + email + "','" + userName + "','" + password + "', NOW())");
    if (i > 0) { 
        response.sendRedirect("welcome.jsp"); 
    } 
    else { 
        response.sendRedirect("index.jsp"); 
    } 
%>
