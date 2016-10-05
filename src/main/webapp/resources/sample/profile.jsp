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
<body ng-controller="profileCtrl">

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
					<li><a href="#">Profile</a></li>
					<li><a href="/webapp/myplans">Plan Center</a></li>
					<li><a ng-click="Logout()">Logout</a></li>
				</ul>
				<a href="#" class="close">Close</a>
			</div>
		</nav>

		<!-- Wrapper -->
		<section id="wrapper">
			<header>
				<div class="inner">
					<h2>{{welcome}} {{user.displayName}}</h2>
					<p>Your next plan is {{nextPlan}}</p>
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
								<h2 class="major">My Profile</h2>
								<ul class="actions">
									<li><a class="special" ng-click="ModifyClick()">modify</a></li>
								</ul>

								<div ng-init="isModified=false" ng-switch="isModified">

									<div ng-switch-when="false">
										<ul class="actions">
											<li><label>username: {{user.username}}</label></li><br/>
											<li><label>nickname: {{user.nickname}}</label></li><br/>
											<li><label>first name: {{user.firstname}}</label></li>
											<li><label>last name: {{user.lastname}}</label></li><br/>
											<li><label>email: {{user.email}}</label></li>
										</ul>
									</div>

									<div ng-switch-when="true">
										<form id="myplanform">
											<div class="row uniform">
												<div class="12u$">
													<label for="username">username: </label>
													<input type="text" name="useranme" id="useranme" ng-model="user.username" disabled />
												</div>
												<div class="12u$">
													<label for="myPlanName">nickname: </label>
													<input type="text" name="nickname" id="nickname" ng-model="user.nickname" />
												</div>
												<div class="6u 12u$(xsmall)">
													<label for="myPlanSportType">first name: </label>
													<input type="text" name="firstname" id="firstname" ng-model="user.firstname" />
												</div>
												<div class="6u 12u$(xsmall)">
													<label for="myPlanSportType">last name: </label>
													<input type="text" name="lastname" id="lastname" ng-model="user.lastname"/>
												</div>
												<div class="12u$">
													<label for="myPlanName">email: </label>
													<input type="email" name="email" id="email" ng-model="user.email"/>
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



					<!-- Two -->
					<section id="two" class="wrapper alt spotlight style2">
						<div class="inner">
							<!--
								<a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a>
							-->
							<div class="content">
								<h2 class="major">my plans</h2>
								<ul class="actions">
									
									<li><a class="special" ng-click="AddClick()">new plan</a></li>
									<li><a href="/webapp/myplans" class="special">plan center</a></li>
								</ul>

								<div ng-init="isAddedNew=false" ng-switch="isAddedNew">

									<div ng-switch-when="false">
										Plan information.
									</div>

									<div ng-switch-when="true">
										<form id="myplanform">
											<div class="row uniform">
												<div class="12u$">
													<label for="myPlanName">name: </label>
													<input type="text" name="myPlanName" id="myPlanName" ng-model="newPlan.myPlanName" required />
												</div>
												<div class="4u 12u$(xsmall)">
													<label for="myPlanSportType">sport type: </label>
													<div class="select-wrapper">
														<select ng-model="newPlan.myPlanSportType">
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
													
													<input type="radio" id="notexpire" name="notexpire" ng-model="newPlan.isExpired" value="false">
													<label for="notexpire">Not Expired</label>
													
												</div>
												<div class="4u$(xsmall)" style="float: left;">
													
													<input type="radio" id="expire" name="expire" ng-model="newPlan.isExpired" value="true">
													<label for="expire"">Expired</label>
												</div>

												<div class="4u$(xsmall)" style="float: right;">
													<div class="row">
													<label for="myPlanExpiredDate">select expired Date: </label>
													<div ng-cloak="" class="datepickerdemoBasicUsage">
													      <div flex-gt-xs="">
													        <md-datepicker ng-model="newPlan.myPlanExpiredDate" md-placeholder="Enter date" md-min-date="newPlan.minDate" style="float: right;"></md-datepicker>
													      </div>
													</div>
													</div>
												</div>
												<div class="12u$">
													<label for="myPlanDescription">description: </label>
													<textarea name="myPlanDescription" id="myPlanDescription" rows="6" ng-model="newPlan.myPlanDescription"></textarea>
												</div>

												<ul class="actions">
													<li><input type="submit" value="add new plan" ng-disabled="MyPlanFormValidatoin()" ng-click="AddMyPlan()"/></li>
													<li><input type="reset" value="cancel" ng-click="CancelAdd()"/></li>
												</ul>
											</div>
										</form>
									</div>
								</div>

								<p>This show plan conclusions</p>
							</div>
						</div>
					</section>

					<!-- Three -->
					<section id="three" class="wrapper spotlight style3">
						<div class="inner">
							<a href="#" class="image"><img src="images/pic02.jpg" alt="" /></a>
							<div class="content">
								<h2 class="major">plans for others</h2>
								<p>Feature will be available soon.</p>
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
								<p>Feature will be available soon.</p>
								<a href="#" class="special">Learn more</a>
							</div>
						</div>
					</section>

				</section>

				<!-- Four -->
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
			<script>
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
						$scope.newPlan = {};
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
			</script>
		</body>
		</html>