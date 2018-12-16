<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE>
<html ng-app="cadastrarControllerApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastrar</title>

<style type="text/css">

	label{
	    display: inline-block;
	    width: 90px;
	}
	
</style>
<script type="text/javascript" src="../resources/javascript/angular.min.js"></script>
<script type="text/javascript" src="../resources/javascript/cadastrarController.js"></script>


</head>
<body>

<form ng-controller="cadastrarController">

	<h2>Novo Cadastro de Usuário</h2>
	<br/>
	
	<label for="input-nome" >Nome:</label>
	<input type="text" id="input-nome" style="width:220px;" ng-model="nome"/>
	
	<br/><br/>

	<label for="input-login">Login:</label>
	<input type="text" id="input-login" style="width:120px;" ng-model="login"/>
	
	<br/><br/>
	
	<label for="input-senha">Senha:</label>
	<input type="password" id="input-senha" style="width:120px;" ng-model="senha"/>
	
	<br/><br/>
		
	<label for="input-registroAtivo">Ativo:</label>
	<input type="checkbox" id="input-registroAtivo" ng-model="ativo"/> 
	
	<br/><br/>
	
	
	<p>
		<a href= "../">Voltar</a>
		
		<input type="button" value="Salvar" ng-click="salvarUsuario()"/>
	 		
	</p>
	
	
</form>



</body>
</html>