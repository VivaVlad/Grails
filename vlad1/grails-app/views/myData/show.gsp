
<%@ page import="com.datastore.MyData" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myData.label', default: 'MyData')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-myData" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-myData" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list myData">
			
				<g:if test="${myDataInstance?.data}">
				<li class="fieldcontain">
					<span id="data-label" class="property-label"><g:message code="myData.data.label" default="Data" /></span>
					
						<span class="property-value" aria-labelledby="data-label"><g:fieldValue bean="${myDataInstance}" field="data"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${myDataInstance?.recordCreatedDate}">
				<li class="fieldcontain">
					<span id="recordCreatedDate-label" class="property-label"><g:message code="myData.recordCreatedDate.label" default="Record Created Date" /></span>
					
						<span class="property-value" aria-labelledby="recordCreatedDate-label"><g:formatDate date="${myDataInstance?.recordCreatedDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:myDataInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${myDataInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>