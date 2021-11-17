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
require_once 'DBconect.php';
session_start();
if(isset($_SESSION["admin_login"]))	//Condicion admin
{
	header("location: admin/admin_portada.php");	
}
if(isset($_SESSION["it_login"]))	//Condicion personal
{
	header("location: it/it_portada.php"); 
}
if(isset($_SESSION["rrhh_login"]))	//Condicion Usuarios
{
	header("location: rrhh/rrhh_portada.php");
}

if(isset($_REQUEST['btn_login']))	
{
	$user		=$_REQUEST["txt_user"];	//textbox nombre "txt_user"
	$pass	=$_REQUEST["txt_pass"];	//textbox nombre "txt_pass"
	$rol		=$_REQUEST["txt_rol"];		//select opcion nombre "txt_rol"
		
	if(empty($user)){						
		$errorMsg[]="Por favor ingrese user";	//Revisar user
	}
	else if(empty($pass)){
		$errorMsg[]="Por favor ingrese pass";	//Revisar pass vacio
	}
	else if(empty($rol)){
		$errorMsg[]="Por favor seleccione rol ";	//Revisar rol vacio
	}
	else if($user AND $pass AND $rol)
	{
		try
		{
			$select_stmt=$db->prepare("SELECT user,pass,rol FROM log
										WHERE
										user=:uuser AND pass=:upass AND rol=:urol"); 
			$select_stmt->bindParam(":uuser",$user);
			$select_stmt->bindParam(":upass",$pass);
			$select_stmt->bindParam(":urol",$rol);
			$select_stmt->execute();	//execute query
					
			while($row=$select_stmt->fetch(PDO::FETCH_ASSOC))	
			{
				$dbuser	=$row["user"];
				$dbpass	=$row["pass"];
				$dbrol		=$row["rol"];
			}
			if($user!=null AND $pass!=null AND $rol!=null)	
			{
				if($select_stmt->rowCount()>0)
				{
					if($user==$dbuser and $pass==$dbpass and $rol==$dbrol)
					{
						switch($dbrol)		//inicio de sesión de usuario base de rols
						{
							case "Admin":
								$_SESSION["admin_login"]=$user;			
								$loginMsg="Admin: Inicio sesión con éxito";	
								header("refresh:3;admin/admin_portada.php");	
								break;
								
							case "it";
								$_SESSION["it_login"]=$user;				
								$loginMsg="It: Inicio sesión con éxito";		
								header("refresh:3;it/it_portada.php");	
								break;
								
							case "rrhh":
								$_SESSION["usuarios_login"]=$user;				
								$loginMsg="RRHH: Inicio sesión con éxito";	
								header("refresh:3;rrhh/rrhh_portada.php");		
								break;
								
							default:
								$errorMsg[]="correo electrónico o contraseña o rol incorrectos";
						}
					}
					else
					{
						$errorMsg[]="correo electrónico o contraseña o rol incorrectos";
					}
				}
				else
				{
					$errorMsg[]="correo electrónico o contraseña o rol incorrectos";
				}
			}
			else
			{
				$errorMsg[]="correo electrónico o contraseña o rol incorrectos";
			}
		}
		catch(PDOException $e)
		{
			$e->getMessage();
		}		
	}
	else
	{
		$errorMsg[]="correo electrónico o contraseña o rol incorrectos";
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
					<strong><?php echo $error; ?></strong>
				</div>
            <?php
			}
		}
		if(isset($loginMsg))
		{
		?>
			<div class="alert alert-success">
				<strong>ÉXITO ! <?php echo $loginMsg; ?></strong>
			</div>
        <?php
		}
		?> 


<div class="login-form">
<center><h2>Iniciar sesión</h2></center>
<form method="post" class="form-horizontal">
  <div class="form-group">
  <label class="col-sm-6 text-left">User</label>
  <div class="col-sm-12">
  <input type="text" name="txt_user" class="form-control" placeholder="Ingrese email" />
  </div>
  </div>
      
  <div class="form-group">
  <label class="col-sm-6 text-left">Password</label>
  <div class="col-sm-12">
  <input type="password" name="txt_pass" class="form-control" placeholder="Ingrese passowrd" />
  </div>
  </div>
      
  <div class="form-group">
      <label class="col-sm-6 text-left">Seleccionar rol</label>
      <div class="col-sm-12">
      <select class="form-control" name="txt_rol">
          <option value="" selected="selected"> - selecccionar rol - </option>
          <option value="Admin">Admin</option>
          <option value="it">it</option>
          <option value="rrhh">Recursos Humanos</option>
          <option value="Atencion al Cliente">Atencion al Cliente</option>
      </select>
      </div>
  </div>
  
  <div class="form-group">
  <div class="col-sm-12">
  <input type="submit" name="btn_login" class="btn btn-success btn-block" value="Iniciar Sesion">
  </div>
  </div>
  
  <div class="form-group">
  <div class="col-sm-12">
  ¿No tienes una cuenta? <a href="registro.php"><p class="text-info">Registrar Cuenta</p></a>		
  </div>
  </div>
      
</form>
</div>
<!--Cierra div login-->
		</div>
		
	</div>
			
	</div>
										
	</body>
</html>