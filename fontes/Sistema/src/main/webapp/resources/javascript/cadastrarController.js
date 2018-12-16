var cadastrarControllerApp = angular.module("cadastrarControllerApp",[]);

cadastrarControllerApp.controller("cadastrarController",function($scope, $window, $http){
	
	/*DEFININDO O MODELO PARA O NOSSO FORMULÁRIO*/
	$scope.nome  = null;
	$scope.login = null;
	$scope.senha = null;
	$scope.ativo = null;
	
	$scope.salvarUsuario = function(){
		
		/*DEFINI O OBJETO QUE VAI SER ENVIADO VIA AJAX PELO ANGULARJS*/
		var usuarioModel =  new Object();
		usuarioModel.nome  = $scope.nome,
		usuarioModel.login = $scope.login,
		usuarioModel.senha = $scope.senha		
		usuarioModel.ativo = $scope.ativo;	
		
		/*EXECUTA O POST PARA SALVAR O REGISTRO*/
		var response = $http.post("salvar", usuarioModel);
	 
		response.success(function(data, status, headers, config) {
	
		 /*MOSTRA O RESULTADO QUE RETORNOU DO SPRING*/
		 if(data.codigo == 1){
			 
			 /*MENSAGEM DE SUCESSO*/
			 $window.alert(data.mensagem);
			 
			 /*LIMPA OS CAMPOS APÓS SALVAR O REGISTRO COM SUCESSO*/
			 $scope.nome  = null;
			 $scope.login = null;
			 $scope.senha = null;
			 $scope.ativo = null;
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
