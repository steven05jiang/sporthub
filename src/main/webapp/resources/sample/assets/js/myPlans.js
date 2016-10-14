		var app = angular.module('App', ['moment-picker']);
		app.controller('myPlanCtrl', function($scope, $http, $filter, $window){
			var errorMsg;
			var profile;

			$scope.Logout = function(){
				$http.get("/webapp/webservice/common/logout").then(
					function success(data, status, headers, config){
						$window.location.href = "/webapp";
					}, function error(data, status, headers, config){
						alert(data);
					});
			}

			$scope.AddMyPlanClick = function(){
				$scope.myNewPlan.minDate = new Date();
				$scope.myNewPlan.myPlanExpiredDate = $scope.myNewPlan.minDate;
				$scope.myNewPlan.isExpired = 'false';
				$scope.myNewPlan.isAddMyPlan = !$scope.myNewPlan.isAddMyPlan;
				if($scope.sportList == null){
					$http.get("/webapp/webservice/sport/getalltypes").then(function(response){
						$scope.sportList = response.data;
					});
				}
			}

			$scope.CancelMyPlanAdd = function(){
				$scope.myNewPlan.isAddMyPlan = false;
				$scope.myNewPlan = {};
				$window.location.href = "#one";
			}

			$scope.AddMyPlan = function(){
						if ($scope.myNewPlan.isExpired == 'false') {
							$scope.myNewPlan.myPlanExpiredDate = null;
						}else{
							$scope.myNewPlan.myPlanExpiredDate = new Date($scope.myNewPlan.myPlanExpiredDate);
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
					data: {'name': $scope.myNewPlan.myPlanName, 'description': $scope.myNewPlan.myPlanDescription,'sport': $scope.myNewPlan.myPlanSportType, 'expireDate': $scope.myNewPlan.myPlanExpiredDate},
					headers: config.headers
				})
				.success(function (data, status, headers, config) {
			            	//$scope.hello = data;
			            	//$window.location.href = "profile.html"
			            	getMyPlan();
			            	$scope.myNewPlan.isAddMyPlan = false;
							$window.location.href = "#one";
			            })
				.error(function (data, status, headers, config) {
					errorMsg = errorMsg+"Data: " + data +
					"<hr />status: " + status +
					"<hr />headers: " + headers +
					"<hr />config: " + config;
				});
			}

			$scope.CompleteStatus = function(complete){
				if(complete == 1){
					return "Completed";
				}else{
					return "Umcompleted";
				}
			}

			$scope.RemovePlan = function(id, name){
				var r = $window.confirm('Do you want to delete the plan: '+name+'?');
				if(r == true){
					$http.delete('/webapp/webservice/plan/deletemyplan/'+id).then(function(response){
						getMyPlan();
					}, function(response){
						alert("Error in removing this plan.");
						console.log(response.data);
					});
				}
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
				})
				.error(function (data, status, headers, config) {
					errorMsg = errorMsg+"Data: " + data +
					"<hr />status: " + status +
					"<hr />headers: " + headers +
					"<hr />config: " + config;
				});
			}

			var initWelcomeUsername = function(){
				if (profile.nickname) {
					$scope.user.displayName = profile.nickname;
				}else if(profile.username){
					$scope.user.displayName = profile.username;
				}
			}

			var getMyPlan = function(){
				var config = {
					headers : {
						'Content-Type': 'application/json',
						'Accept': 'application/json'
					}
				}
				$http({
					method: 'GET',
					url: '/webapp/webservice/plan/getmyplans',
					headers: config.headers
				})
				.success(function (data, status, headers, config) {
			            	//alert("data: "+data+", status: "+status+", headers: "+headers+", config: "+config);
			            	$scope.myPlans = data;
			            	$scope.myNewPlan = {};
			            	//$scope.plans = data[0];
			            })
				.error(function (data, status, headers, config) {
					console.log(data);
				});
			}

			var initPage = function(){
						//initWelcomeTime();
						getUserProfile();
						getMyPlan();
					}


					initPage();
				});