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
	<link rel="stylesheet" href="../assets/css/main.css" />
	<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body ng-controller="profileCtrl">

	<!-- Page Wrapper -->
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<h1><a href="/webapp">Sporthub</a></h1>
			<form id="logoutForm">
				<div class="logElement">
					<p>Hi {{userName}}!</p> 
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
					<li><a href="">Timeline</a></li>
					<li><a ng-click="Logout()">Logout</a></li>
				</ul>
				<a href="#" class="close">Close</a>
			</div>
		</nav>

		<!-- Wrapper -->
		<section id="wrapper">
			<header>
				<div class="inner">
					<h2>{{planName}}</h2>
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
									<li><a class="special">delete</a></li>
								</ul>

								<div ng-init="isModified=false" ng-switch="isModified">

									<div ng-switch-when="false">
										<ul class="actions">
											<li><label>Name: {{planName}}</label></li><br/>
											<li><label>Sport Type: {{sportType}}</label></li><br/>
											<li><label>Frequency: {{frequency}}</label></li>
											<li><label>Amount: {{amount}}</label></li><br/>
											<li><label>Created Date: {{createDate | date:'MM/dd/yyyy'}}</label></li>
											<li><label>Expired Date: {{expireDate | date:'MM/dd/yyyy'}}</label></li><br/>
											<li><label>Description: {{description}}</label></li>
										</ul>
									</div>

									<div ng-switch-when="true">
										<form id="myplanform">
											<div class="row uniform">
												<div class="12u$">
													<label for="myPlanName">name: </label>
													<input type="text" name="myPlanName" id="myPlanName" ng-model="myPlanName" ng-value="planName" required />
												</div>
												<div class="4u 12u$(xsmall)">
													<label for="myPlanSportType">sport type: </label>
													<div class="select-wrapper">
														<select>
															<option ng-repeat="sportType in sportList | orderBy:'name'">{{sportType.name}}</option>
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
												<div class="6u$(xsmall)">
													<input type="radio" id="demo-priority-low" name="demo-priority">
													<label for="demo-priority-low">Expired</label>
												</div>
												<div class="6u$(xsmall)">
													<input type="radio" id="demo-priority-normal" name="demo-priority" checked>
													<label for="demo-priority-normal">Not Expired</label>
												</div>
												<div class="12u$">
													<label for="myPlanExpiredDate">expired Date: </label>
													<input type="text" name="myPlanExpiredDate" id="myPlanExpiredDate" ng-model="myPlanExpiredDate" />
												</div>
												<div class="12u$">
													<label for="myPlanDescription">description: </label>
													<textarea name="myPlanDescription" id="myPlanDescription" rows="6" ng-value="planName" ng-model="myPlanDescription"></textarea>
												</div>
												<ul class="actions">
													<li><input type="submit" value="update" ng-disabled="MyPlanFormValidatoin()" ng-click="ChangePlan()"/></li>
													<li><input type="reset" value="cancel" ng-click="ModifyClick()"/></li>
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
								<h2 class="major">timeline</h2>
								<p>This is timeline graph</p>
							</div>
						</div>
					</section>

					<!-- Three -->
					<section id="three" class="wrapper spotlight style3">
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
			<script>
				var app = angular.module('App', []);
				app.controller('profileCtrl', function($scope, $http, $filter, $window){
					var errorMsg;
					var profile;
					var plan;

					$scope.Logout = function(){
						$http.get("/webapp/webservice/common/logout").then(
							function success(data, status, headers, config){
								$window.location.href = "/webapp";
							}, function error(data, status, headers, config){
								alert(data);
							});
					}

					$scope.MyPlanFormValidatoin = function(){
						return ($scope.myPlanName == null || $scope.myPlanSportType == null) ? true : false;
					}

					$scope.ModifyClick = function(){
						$scope.isModified = !$scope.isModified;
						$http.get("/webapp/webservice/sport/getalltypes").then(function(response){
							$scope.sportList = response.data;
						});
					}

					$scope.AddMyPlan = function(){
						var config = {
							headers : {
								'Content-Type': 'application/json',
								'Accept': 'application/json'
							}
						}
						$http({
							method: 'POST',
							url: '/webapp/webservice/plan/createmyplan',
							data: {'name': $scope.myPlanName, 'description': $scope.myPlanDescription,'sport': $scope.myPlanSportType, 'expireDate': $scope.myPlanExpiredDate},
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
							$scope.hello = data;
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
							initPlan();
						});
					}

					var initPlan = function(){
						$scope.planName = plan.name;
						$scope.sportType = plan.sport;
						$scope.createDate = plan.createDate;
						$scope.expireDate = plan.expireDate;
						$scope.description = plan.description;
					}

					var initWelcomeUsername = function(){
						if (profile.nickanme) {
							$scope.userName = profile.nickanme;
						}else if(profile.username){
							$scope.userName = profile.username;
						}
					}

					var initPage = function(){
						//initWelcomeTime();
						getUserProfile();
					}


					initPage();
				});
			</script>
		</body>
		</html>