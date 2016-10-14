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
	<link href="//cdn.rawgit.com/indrimuska/angular-moment-picker/master/dist/angular-moment-picker.min.css" rel="stylesheet">
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
												<div class="4u$(xsmall)" >
													
													<input type="radio" id="notexpire" name="notexpire" ng-model="newPlan.isExpired" value="false">
													<label for="notexpire">Not Expired</label>
													
												</div>
												<div class="4u$(xsmall)" >
													
													<input type="radio" id="expire" name="expire" ng-model="newPlan.isExpired" value="true">
													<label for="expire"">Expired</label>
												</div>

												<div class="12u$(xsmall)">
														<label for="myPlanExpiredDate">select expired Date: </label>
														
														<div class="input-group" start-view="day" moment-picker="newPlan.myPlanExpiredDate" format="L">
														
														<span class="input-group-addon">
															<i class="glyphicon glyphicon-calendar"></i>
														</span>
														<input type="text" placeholder="Select a date" ng-model="newPlan.myPlanExpiredDate" ng-model-options="{ updateOn: 'blur' }">
														
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
		<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment-with-locales.js"></script>
		<script src="//cdn.rawgit.com/indrimuska/angular-moment-picker/master/dist/angular-moment-picker.min.js"></script>
		<script src="assets/js/profile.js"></script>
	</body>
	</html>