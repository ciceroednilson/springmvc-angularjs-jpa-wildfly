var editarRegistroControllerApp = angular.module("editarRegistroControllerApp",[]);

editarRegistroControllerApp.controller("editarRegistroController",function($scope, $window, $http){
	
	/*DEFININDO O MODELO PARA O NOSSO FORMULÁRIO*/
	$scope.codigo = null;
	$scope.nome   = null;
	$scope.login  = null;
	$scope.senha  = null;
	$scope.ativo  = null;
	
	
	$scope.alterarUsuario = function(){
		
		/*DEFINI O OBJETO QUE VAI SER ENVIADO VIA AJAX PELO ANGULARJS*/
		var usuarioModel =  new Object();
		usuarioModel.codigo = $scope.codigo;
		usuarioModel.nome   = $scope.nome,
		usuarioModel.login  = $scope.login,
		usuarioModel.senha  = $scope.senha		
		usuarioModel.ativo  = $scope.ativo;	
		
		/*EXECUTA O POST PARA ALTERAR O REGISTRO*/
		var response = $http.post("../alterar", usuarioModel);
		
		response.success(function(data, status, headers, config) {
	
		 /*MOSTRA O RESULTADO QUE RETORNOU DO SPRING*/
		 if(data.codigo == 1){
			 
			 /*MENSAGEM DE SUCESSO*/
			 $window.alert(data.mensagem);
			 
			 /*REDIRECIONA APÓS ALTERARMOS O REGISTRO*/
			 window.location.href = "../consultarRegistros.html";
			 
		 }
		 else{
			 
			 /*MOSTRA O ERRO TRATO PELO SPRING (OBJETO ResultadoModel)*/
			 $window.alert(data.mensagem);
			 
		 }
	 });
		
	 response.error(function(data, status, headers, config) {
		 /*SE OCORRER ERRO NÃO TRATADO IREMOS MOSTRA EM MENSAGEM*/
		 $window.alert(data);
		
	 });		
				
		
	};
	
});