<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Solid State by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html ng-app="App">
<head>
	<title>Sporthub</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://material.angularjs.org/1.1.1/docs.css">
	<link rel="stylesheet" href="https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.1/angular-material.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,400italic">
	<link rel="stylesheet" href="../assets/css/main.css" />
	<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body ng-controller="AppCtrl">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<h1><a href="/webapp">Sporthub</a></h1>
			<form id="logoutForm">
				<div class="logElement">
					<p>Hi {{user.displayName}}!</p> 
				</div>
				<div class="logElement">
					<button type="submit"  ng-click="Logout()"><span class="glyphicon glyphicon-log-out"></span></button>
				</div>
			</form>
			<nav>
				<a href="#menu">Menu</a>
			</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<div class="inner">
				<h2>Menu</h2>
				<ul class="links">
					<li><a href="/webapp">Home</a></li>
					<li><a href="/webapp/profile">Profile</a></li>
					<li><a href="">Plan Center</a></li>
					<li><a ng-click="Logout()">Logout</a></li>
				</ul>
				<a href="#" class="close">Close</a>
			</div>
		</nav>

		<!-- Wrapper -->
		<section id="wrapper">
			<header>
				<div class="inner">
					<h2>{{plan.planName}}</h2>
					<p>Take your next action on {{planActionDate}}</p>
				</div>
			</header>

			<!-- Content -->
			<!-- One -->
			<section id="one" class="wrapper spotlight style1">
				<div class="inner">
							<!--
								<a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a>
							-->
							<div class="content">
								<h2 class="major">plan overview</h2>
								<ul class="actions">
									<li><a class="special" ng-click="ModifyClick()">modify</a></li>
									<li><a class="special" ng-click="RemovePlan(plan.id, plan.planName)">delete</a></li>
								</ul>
								<div ng-init="isModified=false" ng-switch="isModified">

									<div ng-switch-when="false">
										<ul class="actions">
											<li><label>Name: {{plan.planName}}</label></li><br/>
											<li><label>Sport Type: {{plan.sportType}}</label></li><br/>
											<li><label>Frequency: {{frequency}}</label></li>
											<li><label>Amount: {{amount}}</label></li><br/>
											<li><label>Created Date: {{plan.createDate | date:'MM/dd/yyyy'}}</label></li>
											<li><label>Expired Date: {{plan.expireDate | date:'MM/dd/yyyy'}}</label></li><br/>
											<li><label>Description: {{plan.description}}</label></li>
										</ul>
									</div>

									<div ng-switch-when="true">
										<form id="myplanform">
											<div class="row uniform">
												<div class="12u$">
													<label for="myPlanName">name: </label>
													<input type="text" name="myPlanName" id="myPlanName" ng-model="plan.planName" required />
												</div>
												<div class="4u 12u$(xsmall)">
													<label for="myPlanSportType">sport type: </label>
													<div class="select-wrapper">
														<select ng-model="plan.sportType">
															<option ng-repeat="sportType in sportList | orderBy:'name'" value="{{sportType.name}}">{{sportType.name}}</option>
														</select>
													</div>
												</div>
												<div class="4u 12u$(xsmall)">
													<label for="myPlanSportType">Frequency: </label>
													<div class="select-wrapper">
														<select name="demo-category" id="demo-category">
															<option value="">-</option>
															<option value="1">Manufacturing</option>
															<option value="1">Shipping</option>
															<option value="1">Administration</option>
															<option value="1">Human Resources</option>
														</select>
													</div>
												</div>
												<div class="4u 12u$(xsmall)">
													<label for="myPlanSportType">Amount: </label>
													<div class="select-wrapper">
														<select name="demo-category" id="demo-category">
															<option value="">-</option>
															<option value="1">Manufacturing</option>
															<option value="1">Shipping</option>
															<option value="1">Administration</option>
															<option value="1">Human Resources</option>
														</select>
													</div>
												</div>
												<div class="4u$(xsmall)">
													
													<input type="radio" id="notexpire" name="notexpire" ng-model="plan.isExpired" value="false">
													<label for="notexpire">Not Expired</label>
													
												</div>
												<div class="4u$(xsmall)">
													
													<input type="radio" id="expire" name="expire" ng-model="plan.isExpired" value="true">
													<label for="expire"">Expired</label>
												</div>
												<div class="4u$(xsmall)" style="float: right;">
													<div class="row">
														<label for="expireDate" style="float: left;">Expired Date: </label>
														<div ng-cloak="" class="datepickerdemoBasicUsage">
															<div flex-gt-xs="">
																<md-datepicker ng-model="plan.expireDate" md-placeholder="Enter date" md-min-date="plan.minDate" style="float: right;"></md-datepicker>
															</div>
														</div>
													</div>
												</div>

												<div class="12u$">
													<label for="myPlanDescription">description: </label>
													<textarea name="planDescription" id="planDescription" rows="6" ng-model="plan.description"></textarea>
												</div>

												<ul class="actions">
													<li><input type="submit" value="update plan" ng-disabled="MyPlanFormValidatoin()" ng-click="ModifyMyPlan()"/></li>
													<li><input type="reset" value="cancel" ng-click="CancelModify()"/></li>
												</ul>
											</div>
										</form>
									</div>
								</div>
								<p>This show plan conclusions</p>
							</div>
						</div>

					</section>

					<!-- Two -->
					<section id="two" class="wrapper alt spotlight style2">
						<div class="inner">
							<div class="content">
								<h2 class="major">Actions</h2>
								<ul class="actions">
									
									<li><a class="special" ng-click="AddActionClick()">add action</a></li>
									<li><a href="/webapp/myplans" class="special">plan center</a></li>
								</ul>

								<div ng-init="newAction.isAddAction=false" ng-switch="newAction.isAddAction">

									<div ng-switch-when="false">
										Plan information.
									</div>

									<div ng-switch-when="true">
										<form id="addactionform">
											<div class="row uniform">
												<div class="12u$">
													<label for="newActionName">name: </label>
													<input type="text" ng-model="newAction.name" required />
												</div>
												<div class="4u 12u$(xsmall)">
													<label for="myPlanSportType">Repeat: </label>
													<div class="select-wrapper">
														<select ng-model="newAction.repeat">
															<option ng-repeat="timeGap in repeatList | orderBy:'name'" value="{{timeGap.name}}">{{timeGap.name}}</option>
														</select>
													</div>
												</div>
												<div class="4u 12u$(xsmall)">
													<label for="newActionAmount">Amount: </label>
													<input type="text" ng-model="newAction.amount" />
												</div>
												<div class="4u 12u$(xsmall)">
													<label for="newActionUnit">Unit: </label>
													<input type="text" ng-model="newAction.unit" />
												</div>

												<div class="4u$(xsmall)" style="float: right;">
													<div class="row">
														<label for="myPlanExpiredDate">Action Date: </label>
														<div ng-cloak="" class="datepickerdemoBasicUsage">
															<div flex-gt-xs="">
																<md-datepicker ng-model="newAction.date" md-placeholder="Enter date" md-min-date="newAction.minDate" style="float: right;"></md-datepicker>
															</div>
														</div>
													</div>
												</div>
												<div class="12u$">
													<label for="newActionDescription">description: </label>
													<textarea name="newActionDescription" id="newActionDescription" rows="6" ng-model="newAction.description"></textarea>
												</div>

												<ul class="actions">
													<li><input type="submit" value="add new action" ng-disabled="ActionFormValidatoin()" ng-click="CreateAction()"/></li>
													<li><input type="reset" value="cancel" ng-click="CancelAddAction()"/></li>
												</ul>
											</div>
										</form>
									</div>
								</div>

								<p>This is timeline graph</p>
							</div>
						</div>
					</section>

					<!-- Two -->
					<section id="three" class="wrapper spotlight style3">
						<div class="inner">
							<div class="content">
								<h2 class="major">timeline</h2>
								<p>This is timeline graph</p>
							</div>
						</div>
					</section>

					<!-- Three -->
					<section id="four" class="wrapper alt spotlight style4">
						<div class="inner">
							<div class="content">
								<h2 class="major">action amount</h2>
								<p>This is amount graph based on time</p>
							</div>
						</div>
					</section>
				</section>

				<!-- Footer -->
				<section id="footer">
					<div class="inner">
						<h2 class="major">Get in touch</h2>
						<p>Cras mattis ante fermentum, malesuada neque vitae, eleifend erat. Phasellus non pulvinar erat. Fusce tincidunt, nisl eget mattis egestas, purus ipsum consequat orci, sit amet lobortis lorem lacus in tellus. Sed ac elementum arcu. Quisque placerat auctor laoreet.</p>
						<ul class="copyright">
							<li>&copy; Sporthub All rights reserved.</li>
						</ul>
					</div>
				</section>

			</div>

			<!-- Scripts -->
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.scrollex.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="../assets/js/main.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-animate.min.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-route.min.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-aria.min.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>
			<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-114/svg-assets-cache.js"></script>
			<script src="https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.1/angular-material.js"></script>
			<script>
				var app = angular.module('App', ['ngMaterial', 'ngMessages', 'material.svgAssetsCache']);
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
					$scope.plan.expireDate = new Date($scope.plan.expireDate);
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
		</script>
	</body>
	</html>