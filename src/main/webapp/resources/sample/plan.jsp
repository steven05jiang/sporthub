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
												<div class="12u$(xsmall)">

													<label for="expireDate">Expired Date: </label>
													<div class="input-group" start-view="day" moment-picker="plan.expireDate" format="L">

														<span class="input-group-addon">
															<i class="glyphicon glyphicon-calendar"></i>
														</span>
														<input type="text" placeholder="Select a date" ng-model="plan.expireDate" ng-model-options="{ updateOn: 'blur' }">

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
								</ul>


								<div>
									<div class="table-wrapper">
										<table>
											<thead>
												<tr>
													<th>Name</th>
													<th>Date</th>
													<th>Repeat</th>
													<th>details</th>
													<th>Edit</th>
													<th>delete</th>
												</tr>
											</thead>
											<tbody>
												<tr ng-repeat="action in actions | orderBy: '-time'">
													<td style="text-align: left;"><a href="/webapp/plan/{{x.id}}">{{action.name}}</a></td>
													<td style="text-align: left;">{{action.time | date:'MM/dd/yyyy'}}</td>
													<td style="text-align: left;">{{action.repeat}}</td>
													<td style="text-align: left;">details</td>
													<td style="text-align: left;">edit</td>
													<td style="text-align: left;"><a ng-click="RemoveAction(x.id, x.name)"><span class="glyphicon glyphicon-remove"></span></a></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>

								<div ng-if="newAction.isAddAction">
									<div>
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

												<div class="12u$(xsmall)">

													<label for="myPlanExpiredDate">Action Date: </label>
													<div class="input-group" start-view="day" moment-picker="newPlan.myPlanExpiredDate" format="YYYY-MM-DD">

														<span class="input-group-addon">
															<i class="glyphicon glyphicon-calendar"></i>
														</span>
														<input type="text" placeholder="Select a date" ng-model="newPlan.myPlanExpiredDate" ng-model-options="{ updateOn: 'blur' }">

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
			<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment-with-locales.js"></script>
			<script src="//cdn.rawgit.com/indrimuska/angular-moment-picker/master/dist/angular-moment-picker.min.js"></script>
			<script src="../assets/js/plan.js"></script>
		</body>
		</html>