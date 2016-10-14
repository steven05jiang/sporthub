				var app = angular.module('App', ['moment-picker']);
				app.controller('AppCtrl', function($scope, $http, $filter, $window){
					var errorMsg;
					var profile;
					var plan;
					var actions;

					$scope.Logout = function(){
						$http.get("/webapp/webservice/common/logout").then(
							function success(data, status, headers, config){
								$window.location.href = "/webapp";
							}, function error(data, status, headers, config){
								alert(data);
							});
					}

					$scope.ModifyClick = function(){
						$scope.isModified = !$scope.isModified;
						$scope.plan.minDate = new Date();
						if($scope.plan.expireDate == null){
							$scope.plan.isExpired = 'false';
							$scope.plan.expireDate = $scope.plan.minDate;
						}else{
							$scope.plan.isExpired = 'true';
						//$scope.plan.expireDate = $scope.plan.minDate;
					}
					$scope.plan.expireDate = $filter('date')(new Date($scope.plan.expireDate), 'MM/dd/yyyy');

					if($scope.sportList == null){
						$http.get("/webapp/webservice/sport/getalltypes").then(function(response){
							$scope.sportList = response.data;
						});
					}
				}


				$scope.MyPlanFormValidatoin = function(){
					return ($scope.plan.planName == null || $scope.plan.sportType == null) ? true : false;
				}

				$scope.CancelModify = function(){
					$scope.isModified = false;
					initPlan();
					$window.location.href="#one";
				}

				$scope.ModifyMyPlan = function(){
					if ($scope.plan.isExpired == 'false') {
						$scope.plan.expireDate = null;
					}else{
						$scope.plan.expireDate = new Date($scope.plan.expireDate);
					}

					var config = {
						headers : {
							'Content-Type': 'application/json',
							'Accept': 'application/json'
						}
					}
					$http({
						method: 'POST',
						url: '/webapp/webservice/plan/updatemyplan',
						data: {'id': plan.id,'name': $scope.plan.planName, 'description': $scope.plan.description,'sport': $scope.plan.sportType, 'expireDate': $scope.plan.expireDate},
						headers: config.headers
					})
					.success(function (data, status, headers, config) {
						getPlan();
						$scope.isModified = false;
					})
					.error(function (data, status, headers, config) {
						alert(data);
					});
				}

				$scope.RemovePlan = function(id, name){
					var r = $window.confirm('Do you want to delete the plan: '+name+'?');
					if(r == true){
						$http.delete('/webapp/webservice/plan/deletemyplan/'+id).then(function(response){
							$window.location.href = "/webapp/myplans";
						}, function(response){
							alert("Error in removing this plan.");
							console.log(response.data);
						});
					}
				}

				$scope.RemoveAction = function(){
					
				}

				$scope.AddActionClick = function(){
					$scope.newAction.isAddAction = !$scope.newAction.isAddAction;
					$scope.newAction.minDate = new Date();
				}

				$scope.CancelAddAction = function(){
					$scope.newAction.isAddAction = false;
					$scope.newAction = {};
				}

				$scope.ActionFormValidatoin = function(){
					return ($scope.newAction.name == null || $scope.newAction.date == null) ? true : false;
				}

				$scope.CreateAction = function(){
					//$scope.newAction.repeat = ($scope.newAction.repeat == null) ? 0 : $scope.newAction.repeat;
					//$scope.newAction.quantity = ($scope.newAction.quantity == null) ? 0 : $scope.newAction.quantity;
					var config = {
						headers : {
							'Content-Type': 'application/json',
							'Accept': 'application/json'
						}
					}
					$http({
						method: 'POST',
						url: '/webapp/webservice/plan/createaction',
						data: {'planId': plan.id,'name': $scope.newAction.name, 'description': $scope.newAction.description,'time': $scope.newAction.date, 'repeat': $scope.newAction.repeat, 'quantity': $scope.newAction.quantity, 'unit':$scope.newAction.unit},
						headers: config.headers
					})
					.success(function (data, status, headers, config) {
						getActions();
						$scope.newAction.isAddAction = false;
					})
					.error(function (data, status, headers, config) {
						alert(data);
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
						getPlan();
					})
					.error(function (data, status, headers, config) {
						$window.location.href = "/webapp";
					});
				}

				var getPlan = function(){
					var pathArray = $window.location.pathname.split('/');
					var id = pathArray[pathArray.length-1];
					$http.get('/webapp/webservice/plan/getmyplan/'+id).then(function(response){
						plan = response.data;
						$scope.plan = {};
						initPlan();
						getActions();
					});
				}

				var getActions = function(){
					$scope.newAction = {};
					$http.get('/webapp/webservice/plan/getactionbyplanid/'+plan.id).then(function(response){
						$scope.actions = response.data;
					});
				}

				var initPlan = function(){
					$scope.plan.id = plan.id;
					$scope.plan.planName = plan.name;
					$scope.plan.sportType = plan.sport;
					$scope.plan.createDate = plan.createDate;
					$scope.plan.expireDate = plan.expireDate;
					$scope.plan.description = plan.description;
					$scope.plan.isExpired = (plan.expireDate == null) ? false : true;
				}

				var initWelcomeUsername = function(){
					if (profile.nickname) {
						$scope.user.displayName = profile.nickname;
					}else if(profile.username){
						$scope.user.displayName = profile.username;
					}
				}

				var initPage = function(){
					getUserProfile();
				}


				initPage();
			});