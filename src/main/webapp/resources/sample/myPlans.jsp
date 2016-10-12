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
	<link rel="stylesheet" href="assets/css/main.css" />
	<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body ng-controller="myPlanCtrl">

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
					<li><a href="#">Plan Center</a></li>
					<li><a ng-click="Logout()">Logout</a></li>
				</ul>
				<a href="#" class="close">Close</a>
			</div>
		</nav>

		<!-- Wrapper -->
		<section id="wrapper">
			<header>
				<div class="inner">
					<h2>My plans</h2>
					<p>You have {{myPlans.length}} plans</p>
				</div>
			</header>

			<!-- Content -->
					<!-- One -->
					<section id="one" class="wrapper spotlight style1">
							<div class="inner">
							<div class="content">
						<h2 class="major">Table for my plans</h2>
						<div class="table-wrapper">
							<table>
								<thead>
									<tr>
										<th>Name</th>
										<th>Sport Type</th>
										<th>Created Date</th>
										<th>Expired Date</th>
										<th>Complete</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="x in myPlans | orderBy: '-createDate'">
										<td><a href="/webapp/plan/{{x.id}}">{{x.name}}</a></td>
										<td>{{x.sport}}</td>
										<td>{{x.createDate | date:'MM/dd/yyyy'}}</td>
										<td>{{x.expireDate | date:'MM/dd/yyyy'}}</td>
										<td>{{CompleteStatus(x.complete)}}</td>
										<td><a ng-click="RemovePlan(x.id, x.name)"><span class="glyphicon glyphicon-remove"></span></a></td>
									</tr>
								</tbody>
							</table>
							<ul class="actions">
								<li><a class="special" ng-click="AddMyPlanClick()">add new plan</a></li>
							</ul>
							</div>

							<div ng-if="myNewPlan.isAddMyPlan">
								<form id="myplanform">
									<div class="row uniform">
										<div class="12u$">
											<label for="myPlanName">name: </label>
											<input type="text" name="myPlanName" id="myPlanName" ng-model="myNewPlan.myPlanName" required />
										</div>
										<div class="4u 12u$(xsmall)">
											<label for="myPlanSportType">sport type: </label>
											<div class="select-wrapper">
												<select ng-model="myNewPlan.myPlanSportType">
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
										<div class="4u$(xsmall)" style="float: left;">

											<input type="radio" id="notexpire" name="notexpire" ng-model="myNewPlan.isExpired" value="false">
											<label for="notexpire">Not Expired</label>

										</div>
										<div class="4u$(xsmall)" style="float: left;">

											<input type="radio" id="expire" name="expire" ng-model="myNewPlan.isExpired" value="true">
											<label for="expire"">Expired</label>
										</div>

										<div class="4u$(xsmall)" style="float: right;">
											<div class="row">
												<label for="myPlanExpiredDate">select expired Date: </label>
												<div ng-cloak="" class="datepickerdemoBasicUsage">
													<div flex-gt-xs="">
														<md-datepicker ng-model="myNewPlan.myPlanExpiredDate" md-placeholder="Enter date" md-min-date="myNewPlan.minDate" style="float: right;"></md-datepicker>
													</div>
												</div>
											</div>
										</div>
										<div class="12u$">
											<label for="myPlanDescription">description: </label>
											<textarea name="myPlanDescription" id="myPlanDescription" rows="6" ng-model="myNewPlan.myPlanDescription"></textarea>
										</div>

										<ul class="actions">
											<li><input type="submit" value="add new plan" ng-disabled="MyPlanFormValidatoin()" ng-click="AddMyPlan()"/></li>
											<li><input type="reset" value="cancel" ng-click="CancelMyPlanAdd()"/></li>
										</ul>
									</div>
								</form>
								</div>
								</div>
						</div>
					</section>

					<!-- Two -->
					<section id="two" class="wrapper alt spotlight style2">
						<div class="inner">
							<div class="content">
								<h2 class="major">plans from coaches</h2>
								<p>this feature is coming soon.</p>
								<a href="#" class="special">Learn more</a>
							</div>
						</div>
					</section>

					<!-- Three -->
					<section id="three" class="wrapper spotlight style3">
						<div class="inner">
							<div class="content">
								<h2 class="major">plans for others</h2>
								<p>this feature is coming soon.</p>
								<a href="#" class="special">Learn more</a>
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
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-animate.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-route.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-aria.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>
	<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-114/svg-assets-cache.js"></script>
	<script src="https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.1/angular-material.js"></script>
	<script src="assets/js/myPlans.js"></script>
	<!--
	<script>
		var app = angular.module('App', ['ngMaterial', 'ngMessages', 'material.svgAssetsCache']);
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
			</script>
			-->
		</body>
		</html>