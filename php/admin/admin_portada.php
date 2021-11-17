<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
<title>Admin - Session</title>
		
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<script src="../js/jquery-1.12.4-jquery.min.js"></script>
<script src="../bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
	.login-form {
		width: 340px;
    	margin: 20px auto;
	}
    .login-form form {
    	margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .btn {        
        font-size: 15px;
        font-weight: bold;
    }
</style>
</head>
	<body>
	
	<div class="wrapper">
	
	<div class="container">
			
		<div class="col-lg-12">
		 
			<center>
				<h1>Pagina Administrativa</h1>
				
				<h3>
				<?php
				session_start();

				if(!isset($_SESSION['admin_login']))	
				{
					header("location: ../index.php");  
				}

				if(isset($_SESSION['personal_login']))	
				{
					header("location: ../personal/personal_portada.php");	
				}

				if(isset($_SESSION['usuarios_login']))	
				{
					header("location: ../usuarios/usuarios_portada.php");
				}
				
				if(isset($_SESSION['admin_login']))
				{
				?>
					Bienvenido,
				<?php
						echo $_SESSION['admin_login'];
				}
				?>
				</h3>
					
			</center>
			
			<a href="../cerrar_sesion.php"><button class="btn btn-danger text-left"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Cerrar Sesion</button></a>
			<hr>
			<center>
				
			

            <a href="panel_usuarios.php"><button class="btn btn-danger text-left"> Ver Usuarios</button></a> 
            <a href="panel_empleados.php"><button class="btn btn-danger text-left"> Ver Empleados</button></a>
		
		 <a href="panel_clientes.php"><button class="btn btn-danger text-left"> Ver Clientes</button></a> 
		 <a href="panel_roles.php"><button class="btn btn-danger text-left"> Ver Roles</button></a>  

<br><br>

		 <a href="registro_clientes.php"><button class="btn btn-danger text-left"> Registrar Clientes</button></a> 
		 <a href="registro_empleados.php"><button class="btn btn-danger text-left"> Registrar Empleados</button></a>  
		 <a href="registro_usuarios.php"><button class="btn btn-danger text-left"> Registrar Usuarios</button></a>  
		 <a href="registro_roles.php"><button class="btn btn-danger text-left"> Registrar Roles</button></a>  

<br><br>

		 <a href="panel_usuarios.php"><button class="btn btn-danger text-left"> Ver Tickets Clientes</button></a>  

		 <a href="panel_usuarios.php"><button class="btn btn-danger text-left"> Ver Tickets Empleados</button></a>  

			</center>

		</div>
		
				
	</div>
			
	</div>
										
	</body>
</html>