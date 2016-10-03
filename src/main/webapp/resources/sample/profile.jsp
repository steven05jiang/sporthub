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
	<link rel="stylesheet" href="assets/css/main.css" />
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
					<h2>{{welcome}} {{username}}</h2>
					<p>Your next plan is {{nextPlan}}</p>
				</div>
			</header>

			<!-- Content -->
			<section id="one" class="wrapper spotlight style1">
				<div class="inner">
							<!--
								<a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a>
							-->
							<div class="content">
								<h2 class="major">My Profile</h2>
								<ul class="actions">
									<li><a class="special" ng-click="ModifyClick()">modify</a></li>
									<li><a class="special" ng-click="ChangePassword()">change password</a></li>
								</ul>

								<div ng-init="isModified=false" ng-switch="isModified">

									<div ng-switch-when="false">
										<ul class="actions">
											<li><label>username: {{username}}</label></li><br/>
											<li><label>nickname: {{nickname}}</label></li><br/>
											<li><label>first name: {{firstname}}</label></li>
											<li><label>last name: {{lastname}}</label></li><br/>
											<li><label>email: {{email}}</label></li>
										</ul>
									</div>

									<div ng-switch-when="true">
										<form id="myplanform">
											<div class="row uniform">
												<div class="12u$">
													<label for="username">username: </label>
													<input type="text" name="myPlanName" id="myPlanName" ng-model="useranme" ng-value="username" disabled />
												</div>
												<div class="12u$">
													<label for="myPlanName">nickname: </label>
													<input type="text" name="myPlanName" id="myPlanName" ng-model="nickname" ng-value="nickname" />
												</div>
												<div class="6u 12u$(xsmall)">
													<label for="myPlanSportType">first name: </label>
													<input type="text" name="myPlanName" id="myPlanName" ng-model="firstname" ng-value="firstname" />
												</div>
												<div class="6u 12u$(xsmall)">
													<label for="myPlanSportType">last name: </label>
													<input type="text" name="myPlanName" id="myPlanName" ng-model="lastname" ng-value="lastname" />
												</div>
												<div class="12u$">
													<label for="myPlanName">email: </label>
													<input type="email" name="myPlanName" id="myPlanName" ng-model="email" ng-value="email"/>
												</div>
												<ul class="actions">
													<li><input type="submit" value="update" ng-disabled="MyProfileFormValidation()" ng-click="UpdateProfile()"/></li>
													<li><input type="reset" value="cancel" ng-click="ModifyClick()"/></li>
												</ul>
											</div>
										</form>
									</div>
									<p>Tips: You cannot change your username.</p>
								</div>
							</div>
						</div>
					</section>



					<!-- One -->
					<section id="two" class="wrapper alt spotlight style2">
						<div class="inner">
							<!--
								<a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a>
							-->
							<div class="content">
								<h2 class="major">my plans</h2>
								<a href="#" class="special">Add new plan</a>
								<a href="/webapp/myplans" class="special">View My Plans</a>
								<form id="myplanform">
									<div class="field">
										<label for="myPlanName">plan name</label>
										<input type="text" name="myPlanName" id="myPlanName" ng-model="myPlanName" required />
									</div>
									<div class="field">
										<label for="myPlanDescription">description</label>
										<input type="text" name="myPlanDescription" id="myPlanDescription" ng-model="myPlanDescription" />
									</div>
									<div class="field">
										<label for="myPlanExpiredDate">expired Date</label>
										<input type="text" name="myPlanExpiredDate" id="myPlanExpiredDate" ng-model="myPlanExpiredDate" />
									</div>
									<div class="field">
										<label for="myPlanSportType">sport type</label>
										<input type="text" name="myPlanSportType" id="myPlanSportType" ng-model="myPlanSportType" required />
									</div>
									<ul class="actions">
										<li><input type="submit" value="add new plan" ng-disabled="MyPlanFormValidatoin()" ng-click="AddMyPlan()"/></li>
									</ul>
								</form>
								<p>This show plan conclusions</p>
							</div>
						</div>
					</section>

					<!-- Two -->
					<section id="three" class="wrapper spotlight style3">
						<div class="inner">
							<a href="#" class="image"><img src="images/pic02.jpg" alt="" /></a>
							<div class="content">
								<h2 class="major">plans for others</h2>
								<p>This is description</p>
								<a href="#" class="special">Add new plan</a>
							</div>
						</div>
					</section>

					<!-- Three -->
					<section id="four" class="wrapper alt spotlight style4">
						<div class="inner">
							<a href="#" class="image"><img src="images/pic03.jpg" alt="" /></a>
							<div class="content">
								<h2 class="major">Achievements</h2>
								<p>This is description</p>
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
				<script>
					var app = angular.module('App', []);
					app.controller('profileCtrl', function($scope, $http, $filter, $window){
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

						$scope.MyProfileFormValidation = function(){
							return ($scope.email == null ||  $scope.email.$valid ===false) ? true : false;
						}

						$scope.UpdateProfile = function(){
							$http({
								method: 'POST',
								url: '/webapp/webservice/profile/update',
								data: {'username':$scope.username, 'nickname': $scope.nickname, 'firstname': $scope.firstname,'sport': $scope.lastname, 'email': $scope.email},
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

						$scope.MyPlanFormValidatoin = function(){
							return ($scope.myPlanName == null || $scope.myPlanSportType == null) ? true : false;
						}

						$scope.ModifyClick = function(){
							$scope.isModified = !$scope.isModified;
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
							if (profile.nickanme) {
								$scope.username = profile.nickanme;
							}else if(profile.username){
								$scope.username = profile.username;
							}
						}

						var initProfileInfo = function(){
							$scope.username = profile.username;
							$scope.nickanme = profile.nickanme;
							$scope.firstname = profile.firstname;
							$scope.lastname = profile.lastname;
							$scope.email = profile.email;
						}

						var initPage = function(){
							initWelcomeTime();
							getUserProfile();
						}


						initPage();
					});
				</script>
			</body>
			</html>