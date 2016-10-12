var app = angular.module('App',[]);
				app.controller('indexCtrl', function($scope, $http, $window){
					var usernameAvailable;
					var errorMsg;
					var profile;
					$scope.CheckUsername = function(){
						var data = $scope.username;
						var config = {
			                headers : {
			                    //'Content-Type': 'application/json',
			                    //'Accept': 'application/json'
			                    'Content-Type': 'application/x-www-form-urlencoded'
			               	}
		                }
					   	$http({
						    method: 'GET',
						    url: '/webapp/webservice/createuser/usernamecheck',
						    params: {'username': $scope.username},
						    headers: config.headers
						})
			            .success(function (data, status, headers, config) {
			                usernameAvailable = data.available;
			            })
			            .error(function (data, status, headers, config) {
			                errorMsg = errorMsg + "Data: " + data +
			                    "<hr />status: " + status +
			                    "<hr />headers: " + headers +
			                    "<hr />config: " + config;
			            });
					}
					$scope.Signup = function(){
						//$scope.CheckEmail;
						//if($scope.FormValidatoin) return;
						var config = {
			                headers : {
			                    'Content-Type': 'application/json',
			                    'Accept': 'application/json'
			               	}
		                }
					   	$http({
						    method: 'POST',
						    url: '/webapp/webservice/createuser',
						    data: {'email': $scope.email, 'password': $scope.password, 'username': $scope.username},
						    headers: config.headers
						})
			            .success(function (data, status, headers, config) {
			            	//$scope.hello = data;
			            	//$window.location.href = "profile.html"
			            	$http.get('/webapp/webservice/profile').then(function(response){
			            		//$scope.hello = response.data;
			            		$window.location.href = "/webapp/profile";
			            	});
			            })
			            .error(function (data, status, headers, config) {
			                errorMsg = errorMsg+"Data: " + data +
			                    "<hr />status: " + status +
			                    "<hr />headers: " + headers +
			                    "<hr />config: " + config;
			            });
					}
					$scope.FormValidatoin = function(){
						return ($scope.username == null || $scope.email == null || $scope.password == null || $scope.confpass == null || $scope.password !== $scope.confpass || $scope.email.$valid ===false || !usernameAvailable) ? true : false;
					}

					$scope.Logout = function(){
						$http.get("/webapp/webservice/common/logout").then(
								function success(data, status, headers, config){
									$window.location.href = "/webapp";
								}, function error(data, status, headers, config){
									alert(data);
								});
					}

					$scope.Login = function(){
						var config = {
			                headers : {
			                    'Content-Type': 'application/json',
			                    'Accept': 'application/json'
			               	}
		                }
					   	$http({
						    method: 'POST',
						    url: '/webapp/webservice/common/login',
						    params: {'username': $scope.loginusername, 'password': $scope.loginpassword},
						    headers: config.headers
						})
			            .success(function (data, status, headers, config) {
			            	CheckLoginStatus();
			            })
			            .error(function (data, status, headers, config) {
			                errorMsg = "Data: " + data +
			                    "<hr />status: " + status +
			                    "<hr />headers: " + headers +
			                    "<hr />config: " + config;
			            });
					}

					var initWelcomeUsername = function(){
						if (profile.nickname) {
							$scope.user.displayName = profile.nickname;
						}else if(profile.username){
							$scope.user.displayName  = profile.username;
						}
					}

					var CheckLoginStatus = function(){
						$http.get('/webapp/webservice/common/islogin').then(function(response){
								if(response.data.isLogin == true){
									$scope.isLogin = true;
									$http.get('/webapp/webservice/profile').then(function(response){
										profile = response.data;
										$scope.user = {};
										initWelcomeUsername();
			            	});
								}else{
									$scope.isLogin = false;
								}
			            	}, function(response){
			            			$scope.isLogin = false;
			            	});
					}

					CheckLoginStatus();
				});