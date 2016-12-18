
<%@ page import="com.counter_value.Counter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'counter.label', default: 'Counter')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-counter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-counter" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list counter">
			
				<g:if test="${counterInstance?.value}">
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="counter.value.label" default="Value" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${counterInstance}" field="value"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${counterInstance?.namePK}">
				<li class="fieldcontain">
					<span id="namePK-label" class="property-label"><g:message code="counter.namePK.label" default="Name PK" /></span>
					
						<span class="property-value" aria-labelledby="namePK-label"><g:fieldValue bean="${counterInstance}" field="namePK"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:counterInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${counterInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
