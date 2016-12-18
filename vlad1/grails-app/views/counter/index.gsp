
<%@ page import="com.counter_value.Counter" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'counter.label', default: 'Counter')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-counter" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-counter" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="value" title="${message(code: 'counter.value.label', default: 'Value')}" />
					
						<g:sortableColumn property="namePK" title="${message(code: 'counter.namePK.label', default: 'Name PK')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${counterInstanceList}" status="i" var="counterInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${counterInstance.id}">${fieldValue(bean: counterInstance, field: "value")}</g:link></td>
					
						<td>${fieldValue(bean: counterInstance, field: "namePK")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${counterInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
