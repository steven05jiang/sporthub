				var app = angular.module('App', ['ngMaterial', 'ngMessages', 'material.svgAssetsCache']);

				app.controller('profileCtrl', function($scope, $http, $filter, $window){
					var errorMsg;
					var profile;
					//$scope.myDate = new Date();
					//$scope.minDate = $scope.myDate;


					$scope.Logout = function(){
						$http.get("/webapp/webservice/common/logout").then(
							function success(data, status, headers, config){
								$window.location.href = "/webapp";
							}, function error(data, status, headers, config){
								alert(data);
							});
					}

					$scope.MyProfileFormValidation = function(){
						return ($scope.user.email == null ||  $scope.user.email.$valid ===false) ? true : false;
					}

					$scope.UpdateProfile = function(){
						var config = {
							headers : {
								'Content-Type': 'application/json',
								'Accept': 'application/json'
							}
						}
						$http({
							method: 'POST',
							url: '/webapp/webservice/profile/update',
							data: {'username':$scope.user.username, 'nickname': $scope.user.nickname, 'firstname': $scope.user.firstname,'lastname': $scope.user.lastname, 'email': $scope.user.email},
							headers: config.headers
						})
						.success(function (data, status, headers, config) {
							getUserProfile();
							$scope.ModifyClick();
						})
						.error(function (data, status, headers, config) {
							errorMsg = errorMsg+"Data: " + data +
							"<hr />status: " + status +
							"<hr />headers: " + headers +
							"<hr />config: " + config;
						});
					}

					$scope.ModifyClick = function(){
						$scope.isModified = !$scope.isModified;
					}

					$scope.MyPlanFormValidatoin = function(){
						return ($scope.newPlan.myPlanName == null || $scope.newPlan.myPlanSportType == null) ? true : false;
					}

					$scope.AddClick = function(){
						$scope.newPlan.myPlanExpiredDate = new Date();
						$scope.newPlan.minDate = $scope.newPlan.myPlanExpiredDate;
						$scope.newPlan.isExpired = 'false';
						$scope.isAddedNew = !$scope.isAddedNew;
						if($scope.sportList == null){
							$http.get("/webapp/webservice/sport/getalltypes").then(function(response){
								$scope.sportList = response.data;
							});
						}
					}

					$scope.CancelAdd = function(){
						$scope.isAddedNew = false;
						$scope.newPlan = {};
						$window.location.href="#two";
					}

					$scope.AddMyPlan = function(){
						if ($scope.newPlan.isExpired == false) {
							$scope.newPlan.myPlanExpiredDate = null;
						}

						var config = {
							headers : {
								'Content-Type': 'application/json',
								'Accept': 'application/json'
							}
						}
						$http({
							method: 'POST',
							url: '/webapp/webservice/plan/createmyplan',
							data: {'name': $scope.newPlan.myPlanName, 'description': $scope.newPlan.myPlanDescription,'sport': $scope.newPlan.myPlanSportType, 'expireDate': $scope.newPlan.myPlanExpiredDate},
							headers: config.headers
						})
						.success(function (data, status, headers, config) {
							$window.location.href = "/webapp/myplans";
						})
						.error(function (data, status, headers, config) {
							errorMsg = errorMsg+"Data: " + data +
							"<hr />status: " + status +
							"<hr />headers: " + headers +
							"<hr />config: " + config;
						});
					}

					var getUserProfile = function(){
						var config = {
							headers : {
								'Content-Type': 'application/json',
								'Accept': 'application/json'
							}
						}
						$http({
							method: 'GET',
							url: '/webapp/webservice/profile',
							headers: config.headers
						})
						.success(function (data, status, headers, config) {
							profile = data;
							$scope.user = {};
							initWelcomeUsername();
							initProfileInfo();
						})
						.error(function (data, status, headers, config) {
							$window.location.href = "/webapp";
						});
					}
					var initWelcomeTime = function(){
						var hr = $filter('date')(new Date(), 'HH');
						if(hr >= 0 && hr < 12){
							$scope.welcome = 'Good Morning';
						}else if(hr >12 && hr < 18){
							$scope.welcome = 'Good Afternoon';
						}else{
							$scope.welcome = 'Good Evening';
						}
					}

					var initWelcomeUsername = function(){
						if (profile.nickname) {
							$scope.user.displayName = profile.nickname;
						}else if(profile.username){
							$scope.user.displayName = profile.username;
						}
					}

					var initProfileInfo = function(){
						$scope.user.username = profile.username;
						$scope.user.nickname = profile.nickname;
						$scope.user.firstname = profile.firstname;
						$scope.user.lastname = profile.lastname;
						$scope.user.email = profile.email;
					}

					var initPage = function(){
						initWelcomeTime();
						getUserProfile();
					}


					initPage();
				});