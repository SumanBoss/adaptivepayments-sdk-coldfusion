<cfif isDefined('url.seeit')>
	
	<cfinvoke component="adaptivepayments" method="payRequest" returnvariable="response">
		<cfinvokeargument name="returnURL" value="#request.serverURL##GetDirectoryFromPath(SCRIPT_NAME)#WebflowReturnPage.cfm">
		<cfinvokeargument name="cancelURL" value="#request.serverURL##GetDirectoryFromPath(SCRIPT_NAME)#SimplePay.cfm">
		<cfinvokeargument name="senderEmail" value="platfo_1255077030_biz@gmail.com">
		<cfinvokeargument name="receiverAmount" value="1.00,19.00">
		<cfinvokeargument name="receiverEmail" value="platfo_1255612361_per@gmail.com,max_1317246900_per@x.com">
		<cfinvokeargument name="receiverPaymentType" value="SERVICE,SERVICE">
		<cfinvokeargument name="actionType" value="PAY">
		<cfinvokeargument name="currencyCode" value="USD">
	</cfinvoke>
	
</cfif>

<!DOCTYPE html>

<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en"> <!--<![endif]-->
<head>
	<meta charset="utf-8" />

	<!-- Set the viewport width to device width for mobile -->
	<meta name="viewport" content="width=device-width" />

	<title>PayPal Adaptive Payments SDK for ColdFusion</title>
  
	<!-- Included CSS Files -->
	<link rel="stylesheet" href="assets/stylesheets/foundation.css">
	<link rel="stylesheet" href="assets/stylesheets/app.css">

	<!--[if lt IE 9]>
		<link rel="stylesheet" href="stylesheets/ie.css">
	<![endif]-->


	<!-- IE Fix for HTML5 Tags -->
	<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	

<script type="text/javascript" src="Common/sdk_functions.js"></script>
<script src="assets/javascripts/jquery-1.7.1.min.js"></script>

</head>
<body>

<div class="container">
	
	<div class="row">
		<div class="twelve columns">
			<h2>Adaptive Payments SDK - ColdFusion</h2>
			
			<cfinclude template="menu.cfm" >
			
			<h4>Parallel Payment</h4>
			<dl class="tabs  contained">
				<dd><a href="#overview" class="active">Overview</a></dd>
				<dd><a href="#seeit">See It</a></dd>
				<dd><a href="#source">Source Code</a></dd>
				<dd><a href="#config">Configuration</a></dd>
		
			</dl>

			<ul class="tabs-content contained">
				<li class="active" id="overviewTab">
					<h3>Overview</h3>
					
					<p>
					A parallel payment is a payment from a sender that is split directly among 2-6 receivers. Technically, a parallel payment is a set of multiple payments made in a single Pay request.
					</p>
					<p>
					Parallel payments are useful in cases when a buyer intends to make a single payment for items from multiple sellers. Examples include the following scenarios:
					</p>
					<ul>
					<li>a single payment for multiple items from different merchants, such as a combination of items in your inventory and items that partners drop ship for you.</li>
					<li>purchases of items related to an event, such as a trip that requires airfare, car rental, and a hotel booking.</li>
					</ul>
					<p>
					In these cases, the sender knows the receivers and the amount paid to each one. The following example shows a sender paying 3 receivers in a single parallel payment:
					</p>
					
					<img src="assets/paypal-images/KindsAdapPymnt_B.gif">	
					
					<p>
					NOTE:This scenario is an example only and does not take PayPal fees into account.
					</p>
				
				</li>
			
				<li  id="seeitTab">
					<h3>See It</h3>
				
					<p>
						We've built a simple interface for our SDK.  You create an instance of the adaptivepayment.cfc.  Then 
						 call the <em>PayRequest</em> method and pass the arguments listed below.  Click the <em>SEE IT</em> button below 
						 to make an API call and see the JSON request and response from our APIs.  The JSON response is deserialized into a  object.
						 The object contains getter methods you can call to retrieve data.  You also have 
						 the option to convert the data in your object to a structure by calling the getStruct() method.
					</p>
						<table>
							<thead>
								<tr>
									<th>Name</th>
									<th>Value</th>
								</tr>
							</thead>
							<tbody>
								<cfoutput>
								<tr>
									<td><label>returnURL</label></td>
									<td>#request.serverURL##GetDirectoryFromPath(SCRIPT_NAME)#WebflowReturnPage.cfm</td>
								</tr>
								<tr>
									<td><label>cancelURL</label></td>
									<td>#request.serverURL##GetDirectoryFromPath(SCRIPT_NAME)#ParallelPay.cfm</td>
								</tr>
								</cfoutput>
								<tr>
									<td><label>senderEmail</label></td>
									<td>platfo_1255077030_biz@gmail.com</td>
								</tr>
								<tr>
									<td>receiverEmail</td>
									<td>platfo_1255612361_per@gmail.com, max_1317246900_per@x.com</td>
								</tr>
								<tr>
									<td>receiverAmount</td>
									<td>1.00, 19.00</td>
								</tr>
                <tr>
									<td>paymentType</td>
									<td>SERVICE,SERVICE</td>
								</tr>
								<tr>
									<td>actionType</td>
									<td>PAY</td>
								</tr>
								<tr>
									<td>currencyCode</td>
									<td>USD</td>
								</tr>
							
							</tbody>
						</table>
					
					<cfif NOT isDefined('url.seeit')>
						<p><a href="ParallelPay.cfm?seeit=true#seeit" class="nice radius blue button large" name="seeit"  id="seeit">See It</a></p>
					</cfif>

					<cfif isDefined('url.seeit')>
						<hr>
						<h4>JSON Request</h4>
						<script src="https://gist.github.com/4388056.js"></script>
				
						<h4>JSON Response</h4>
						<script src="https://gist.github.com/1678152.js?file=gistfile1.json"></script>
						
						
						<h4>Response Methods </h4>
						<cfoutput>
						<table>
							<thead>
								<tr>
									<th>Name</th>
									<th>Value</th>
								</tr>
							</thead>
							<tbody>
							
								<tr>
									<td><label>response.getPayKey()</label></td>
									<td>#response.getPayKey()#</td>
								</tr>
								<tr>
									<td><label>response.getPaymentExecStatus()</label></td>
									<td>#response.getPaymentExecStatus()#</td>
								</tr>
								<tr>
									<td><label>response.getResponseEnvelope().getAck().getAckCode()</label></td>
									<td>#response.getResponseEnvelope().getAck().getAckCode()#</td>
								</tr>
								<tr>
									<td><label>response.getResponseEnvelope().getBuild()</label></td>
									<td>#response.getResponseEnvelope().getBuild()#</td>
								</tr>
								<tr>
									<td><label>response.getResponseEnvelope().getCorrelationId()</label></td>
									<td>#response.getResponseEnvelope().getCorrelationId()#</td>
								</tr>
								<tr>
									<td><label>response.getResponseEnvelope().getTimestamp()</label></td>
									<td>#response.getResponseEnvelope().getTimestamp()#</td>
								</tr>
								
								
							</tbody>
						</table>
						
						
						<h4>How to build your redirect URL</h4>
						
						<table>
							<thead>
								<tr>
									<th>code</th>
									<th>request.paypalStruct['PAYPAL-REDIRECT-URL'] & '_ap-payment&paykey= ' & response.getPayKey()</th>
								</tr>
							</thead>
							<tbody>
							
								<tr>
									<td>output</td>
									<td>#request.paypalStruct['PAYPAL-REDIRECT-URL']#_ap-payment&paykey=#response.getPayKey()#</td>
								</tr>
								</tbody>
						</table>
						</cfoutput>
						<p>
						<cfoutput>
							<cfset payPalURL = request.paypalStruct['PAYPAL-REDIRECT-URL'] & '_ap-payment&paykey=#response.getPayKey()#'>
							Test out the <a href="#payPalURL#"  class="nice radius blue button" target="_blank"><b>Redirect To PayPal </b></a><br>
						</cfoutput>
						</p>
						
						
						<h4>getStruct() Method</h4>
						
						<table>
							<thead>
								<tr>
									<th>response.getStruct()</th>
									<td><p><cfdump var="#response.getStruct()#"></p></td>
								</tr>
							</thead>
						</table>
						
						
					</cfif>
				</li>
				<li id="sourceTab">
					
					<h4>ColdFusion Request code</h4>
					<script src="https://gist.github.com/4388073.js"></script>
					
					<h4>ColdFusion Response code</h4>
					<script src="https://gist.github.com/1677711.js?file=gistfile1.cfm"></script>
	
				</li>
				<li id="configTab">
				
					<cfinclude template="config.cfm" >

				</li>
			
			</ul>
			
		</div>
	</div>
			
</div>

<!-- Included JS Files -->
<script src="assets/javascripts/foundation.js"></script>
<script src="assets/javascripts/app.js"></script>
	

</body>
</html>
