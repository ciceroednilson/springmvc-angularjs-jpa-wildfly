<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE>
<html ng-app="editarRegistroControllerApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Registro</title>

<style type="text/css">

	label{
	    display: inline-block;
	    width: 90px;
	}
	
</style>
<script type="text/javascript" src="<spring:url value="/resources/javascript/angular.min.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/javascript/editarRegistroController.js"/>"></script>

</head>
<body>

<form ng-controller="editarRegistroController">

	<h2>Editar Cadastro de Usuário</h2>
	<br/>

	<label for="input-codigo" >Código:</label>
	<input type="text" id="input-codigo" style="width:80px;" ng-model="codigo" readonly="readonly"  ng-init="codigo='${usuarioModel.codigo}'"/>
	
	<br/><br/>
		
	<label for="input-nome" >Nome:</label>
	<input type="text" id="input-nome" style="width:220px;" ng-model="nome"  ng-init="nome='${usuarioModel.nome}'"/>
	
	<br/><br/>

	<label for="input-login">Login:</label>
	<input type="text" id="input-login" style="width:120px;" ng-model="login" ng-init="login='${usuarioModel.login}'"/>
	
	<br/><br/>
	
	<label for="input-senha">Senha:</label>
	<input type="password" id="input-senha" style="width:120px;" ng-model="senha" ng-init="senha='${usuarioModel.senha}'"/>
	
	<br/><br/>
		
	<label for="input-registroAtivo">Ativo:</label>
	<input type="checkbox" id="input-registroAtivo" ng-model="ativo" ng-init='${usuarioModel.ativo ? "ativo=true" : ""}' ng-true-value="true" ng-false-value="" /> 
	
	<br/><br/>
	
	<p>
		<a href= "../consultarRegistros.html">Voltar</a>
		
		<input type="button" value="Salvar" ng-click="alterarUsuario()"/>
				
	</p>
	
</form>




</body>
</html>