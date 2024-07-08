<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>TFM Automatización del Ciclo de Vida DevOps</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 400px;
        }
        h1 {
            margin-bottom: 20px;
            font-size: 28px;
            color: #333;
        }
        .project-title {
            font-size: 20px;
            margin-bottom: 10px;
            color: #555;
        }
        .team-members {
            margin-bottom: 20px;
            font-size: 16px;
            color: #777;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            background: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
            font-size: 16px;
        }
        .btn:hover {
            background: #0056b3;
        }
        .register-link {
            margin-top: 20px;
        }
        .tools {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }
        .tools img {
            width: 50px;
            margin: 0 10px;
            opacity: 0.7;
        }
        .powered-by {
            font-size: 14px;
            color: #aaa;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>TFM Automatización del Ciclo de Vida DevOps</h1>
        <div class="project-info">
            <div class="project-title">Proyecto: TFM Automatización del Ciclo de Vida DevOps para una aplicación Web con Jenkins, Maven, Ansible, Kubernetes y Monitoreo Continuo en AWS</div>
            <div class="team-members">Integrantes: Edison Gomez, Freddy Falcon, Veronica Morales</div>
        </div>
        <form method="post" action="login.jsp">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="userName" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <input type="submit" value="Login" class="btn">
            <input type="reset" value="Reset" class="btn">
        </form>
        <% if (request.getParameter("error") != null) { %>
            <p class="error-message">Login fallido. Inténtalo de nuevo.</p>
        <% } %>
        <div class="register-link">
            <p>New User <a href="register.jsp">Register Here</a></p>
        </div>
    </div>
    <div class="tools">
        <img src="images/java.png" alt="Java">
        <img src="images/mysql.png" alt="MySQL">
        <img src="images/docker.png" alt="Docker">
        <img src="images/kubernetes.png" alt="Kubernetes">
        <img src="images/jenkins.png" alt="Jenkins">
        <img src="images/ansible.png" alt="Ansible">
    </div>
    <div class="powered-by">
        <p>POWERED BY:</p>
    </div>
</body>
</html>
