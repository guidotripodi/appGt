<!DOCTYPE html> 
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
<title>Multiusuarios PHP MySQL: Niveles de Usuarios</title>
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
			<?php 
$enlace = mysqli_connect("localhost", "root", "", "sialarapp");
				// Pasamos el id por $_GET desde la url. 
$id = @$_GET["id"]; 
// Seleccionamos la id y pasamos la variable id. 
$ssql = "SELECT * FROM log WHERE id=" . $id; 
// Liberamos los datos. 
$rs_libros = mysqli_query($enlace,$ssql); 
// Pasamos los datos de la query a un array con un bucle while. 
while(@$fila = mysqli_fetch_array($rs_libros)) { 
// Sacamos todas las filas de la base con el array. 
echo "id: "; 
echo $fila["id"] . " | "; 
echo "User: "; 
$user = $fila["user"]; 
echo $fila["user"] . " | "; 
echo "Password: "; 
echo $fila["pass"] . " | ";
echo "Rol: "; 
echo $fila["rol"] . " | "; 
echo "<br />"; 
// Pasmos el dni seleccionado a una sesión y las demás filas = campos. 
$_SESSION["id"]=$id; 

} 
 ?>


			</center>
			<a href="admin_portada.php"><button class="btn btn-active text-left"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Atras</button></a>
			<a href="../cerrar_sesion.php"><button class="btn btn-danger text-left"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Cerrar Sesion</button></a>
            <hr>
		</div>
<?php

$db_host="localhost"; //localhost server 
$db_user="root";	//database username
$db_password="";	//database password   
$db_name="sialarapp";	//database name

try
{
	$db=new PDO("mysql:host={$db_host};dbname={$db_name}",$db_user,$db_password);
	$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOEXCEPTION $e)
{
	$e->getMessage();
}
if(isset($_REQUEST['btn_register'])) //compruebe el nombre del botón "btn_register" y configúrelo
{
	$pass	= $_REQUEST['txt_pass'];	//input nombre "txt_pass"
	$rol	= $_REQUEST['txt_rol'];	//seleccion nombre "txt_rol"


	if(mysqli_query($enlace,"
	UPDATE  log  SET  id ='$id', user ='$user', pass ='$pass', rol ='$rol' WHERE  id ='$id'"))
				{
					$registerMsg="Registro exitoso: Esperar página de inicio de sesión"; //Ejecuta consultas 
					header("refresh:2;admin_portada.php"); //Actualizar despues de 2 segundo a la portada
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
<center><h2>Modificar</h2></center>
<form method="post" class="form-horizontal">
    
  
<div class="form-group">
<label class="col-sm-9 text-left">Password</label>
<div class="col-sm-12">
<input type="password" name="txt_pass" class="form-control" placeholder="Ingrese password" />
</div>
</div>
    
<div class="form-group">
    <label class="col-sm-9 text-left">Seleccione tipo</label>
    <div class="col-sm-12">
    <select class="form-control" name="txt_rol">

    	<?php
$query="SELECT rol FROM rol";
    $result=mysqli_query($enlace, $query);

          while ($row=mysqli_fetch_array($result))
    {?><option value='<?php echo $row["rol"]?>'><?php echo $row["rol"];}?></option>


    	<?php
    mysqli_free_result($result)
    	?>
    </select>
    </div>
</div>

<div class="form-group">
<div class="col-sm-12">
<input type="submit" name="btn_register" class="btn btn-primary btn-block" value="Modificar">
<!--<a href="index.php" class="btn btn-danger">Cancel</a>-->
</div>
</div>

   
</form>
</div><!--Cierra div login-->
		</div>
		
	</div>
			
	</div>
										
	</body>
</html>