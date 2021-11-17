<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
<title>Multiusuarios PHP MySQL: Niveles de Usuarios</title>
		
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="js/jquery-1.12.4-jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
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
<?php

require_once "DBconect.php";

if(isset($_REQUEST['btn_register'])) //compruebe el nombre del botón "btn_register" y configúrelo
{
	$user	= $_REQUEST['txt_user'];	//input nombre "txt_user"
	$pass	= $_REQUEST['txt_pass'];	//input nombre "txt_pass"
	$rol		= $_REQUEST['txt_rol'];	//seleccion nombre "txt_rol"
		
	if(empty($user)){
		$errorMsg[]="Ingrese nombre de usuario";	//Compruebe input nombre de usuario no vacío
	}
	else if(empty($pass)){
		$errorMsg[]="Ingrese pass";	//Revisar pass vacio o nulo
	}
	else if(strlen($pass) < 6){
		$errorMsg[] = "Password minimo 6 caracteres";	//Revisar pass 6 caracteres
	}
	else if(empty($rol)){
		$errorMsg[]="Seleccione rol";	//Revisar etiqueta select vacio
	}
	else
	{	
		try
		{	
			$select_stmt=$db->prepare("SELECT user, pass FROM log 
										WHERE user=:uname OR pass=:upass"); // consulta sql
			$select_stmt->bindParam(":uname",$user);   
			$select_stmt->bindParam(":upass",$pass);      //parámetros de enlace
			$select_stmt->execute();
			$row=$select_stmt->fetch(PDO::FETCH_ASSOC);	
			if($row["user"]==$user){
				$errorMsg[]="Usuario ya existe";	//Verificar usuario existente
			}
			else if($row["pass"]==$pass){
				$errorMsg[]="Password ya existe";	//Verificar email existente
			}
			
			else if(!isset($errorMsg))
			{
				$insert_stmt=$db->prepare("INSERT INTO log(user,pass,rol) VALUES(:uname,:upass,:urol)"); //Consulta sql de insertar			
				$insert_stmt->bindParam(":uname",$user);	
				$insert_stmt->bindParam(":upass",$pass);
				$insert_stmt->bindParam(":urol",$rol);
				
				if($insert_stmt->execute())
				{
					$registerMsg="Registro exitoso: Esperar página de inicio de sesión"; //Ejecuta consultas 
					header("refresh:2;index.php"); //Actualizar despues de 2 segundo a la portada
				}
			}
		}
		catch(PDOException $e)
		{
			echo $e->getMessage();
		}
	}
}
?>
	<div class="wrapper">
	
	<div class="container">
			
		<div class="col-lg-12">
		
		<?php
		if(isset($errorMsg))
		{
			foreach($errorMsg as $error)
			{
			?>
				<div class="alert alert-danger">
					<strong>INCORRECTO ! <?php echo $error; ?></strong>
				</div>
            <?php
			}
		}
		if(isset($registerMsg))
		{
		?>
			<div class="alert alert-success">
				<strong>EXITO ! <?php echo $registerMsg; ?></strong>
			</div>
        <?php
		}
		?> 
<div class="login-form">  
<center><h2>Registrar</h2></center>
<form method="post" class="form-horizontal">
    
<div class="form-group">
<label class="col-sm-9 text-left">Nombre</label>
<div class="col-sm-12">
<input type="text" name="txt_user" class="form-control" placeholder="Ingrese Nombre" />
</div>
</div>

  
<div class="form-group">
<label class="col-sm-9 text-left">Apellido</label>
<div class="col-sm-12">
<input type="password" name="txt_pass" class="form-control" placeholder="Ingrese Apellido" />
</div>
</div>
    

<div class="form-group">
<div class="col-sm-12">
<input type="submit" name="btn_register" class="btn btn-primary btn-block" value="Registro">
<!--<a href="index.php" class="btn btn-danger">Cancel</a>-->
</div>
</div>

<div class="form-group">
<div class="col-sm-12">
¿Tienes una cuenta? <a href="index.php"><p class="text-info">Inicio de sesión</p></a>		
</div>
</div>
    
</form>
</div><!--Cierra div login-->
		</div>
		
	</div>
			
	</div>
										
	</body>
</html>