<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html ng-app="consultarRegistrosControllerApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Registros</title>


<script type="text/javascript" src="../resources/javascript/angular.min.js"></script>
<script type="text/javascript" src="../resources/javascript/consultarRegistrosController.js"></script>

</head>
<body>

	<table ng-controller="consultarRegistrosController"  data-ng-init="init()">
     <thead>
       <tr>
         <th>Código</th>
         <th>Nome</th>
         <th>Login</th>
         <th>Senha</th>
         <th>Ativo</th>
         <th></th>
         <th></th>
       </tr>
     </thead>
     <tbody>
       <tr ng-repeat="usuario in usuarios">
                
         <td>{{ usuario.codigo }}</td>
         <td>{{ usuario.nome }}</td>
         <td>{{ usuario.login }}</td>
         <td>{{ usuario.senha }}</td>
         <td>{{ usuario.ativo ? "Sim" : "Não" }}</td>
         <td><a  ng-href="editarRegistro.html/{{usuario.codigo}}" >Editar</a></td>
         <td><a href="#" ng-click="excluirRegistro(usuario.codigo)">Excluir</a></td>         
       </tr>
     </tbody>
   </table>
   
   <a href= "../">Voltar</a>
   	
   
</body>
</html>