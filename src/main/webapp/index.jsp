<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
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
            width: 90%;
            max-width: 800px;
            display: flex;
            flex-direction: column;
            text-align: center;
            margin-bottom: 20px;
        }
        .container .left, .container .right {
            width: 100%;
        }
        .container .left {
            background: #1a3d7c;
            color: white;
            padding: 20px;
            border-radius: 10px 0 0 10px;
            text-align: left;
        }
        .container .right {
            text-align: left;
            padding: 20px;
        }
        .container img {
            max-width: 100px;
            margin-bottom: 20px;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        h1 {
            margin-bottom: 20px;
            font-size: 28px;
            color: white;
            text-align: center;
        }
        .project-title {
            font-size: 20px;
            margin-bottom: 10px;
            color: white;
            text-align: center;
        }
        .team-members {
            margin-bottom: 20px;
            font-size: 16px;
            color: white;
            text-align: left;
            margin-left: 20px;
        }
        .center-text {
            text-align: center;
            margin-top: 20px;
            color: white;
        }
        .form-group {
            margin-bottom: 15px;
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
            background: #1a3d7c;
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
            background: #112b56;
        }
        .register-link {
            margin-top: 20px;
        }
        .tools {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 0px;
            width: 100%;
        }
        .tools img {
            width: 80px;
            margin: 10px;
            filter: invert(80%);
        }
        .powered-by {
            font-size: 14px;
            color: white;
            text-align: center;
            margin: 10px 0;
        }
        .footer {
            background: #535353;
            width: 100%;
            padding: 0px 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: auto;
        }
        .footer .tools {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            max-width: 800px;
        }
        .footer .tools .row {
            width: 100%;
            display: flex;
            justify-content: center;
        }
        @media (min-width: 768px) {
            .container {
                flex-direction: row;
            }
            .container .left, .container .right {
                width: 50%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left">
            <img src="images/unir_logo.png" alt="UNIR Logo">
            <h1>UNIR</h1>
            <div class="project-title">Automatización del Ciclo de Vida DevOps para una aplicación Web con Jenkins, Maven, Ansible, Kubernetes y Monitoreo Continuo en AWS</div>
            <div class="team-members">Integrantes:<br>
                <ul style="list-style-type: disc; margin-left: 20px;">
                    <li>Falcon Rosario Freddy Vinicio</li>
                    <li>Gómez Sangoluisa Edison Javier</li>
                    <li>Morales Taipe Verónica Cristina</li>
                </ul>
            </div>
            <div class="center-text">Julio 2024</div>
        </div>
        <div class="right">
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
    </div>
    <div class="footer">
        <div class="powered-by">
            <p>POWERED BY:</p>
        </div>
        <div class="tools">
            <div class="row">
                <img src="images/ansible.png" alt="Ansible">
                <img src="images/aws.png" alt="Aws">
                <img src="images/docker.png" alt="Docker Hub">
                <img src="images/elasticserach.png" alt="Elasticserach">
                <img src="images/git.png" alt="Git">
            </div>
            <div class="row">
                <img src="images/grafana.png" alt="Grafana">
                <img src="images/jenkins.png" alt="Jenkins">
                <img src="images/kubernetes.png" alt="Kubernetes">
                <img src="images/maven.png" alt="Maven">
                <img src="images/mysql.png" alt="Mysql">
                <img src="images/pingdom.png" alt="Pingdom">
            </div>
        </div>
    </div>
</body>
</html>
