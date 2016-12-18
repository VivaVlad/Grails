
<%@ page import="com.datastore.MyData" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myData.label', default: 'MyData')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-myData" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-myData" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="data" title="${message(code: 'myData.data.label', default: 'Data')}" />
					
						<g:sortableColumn property="recordCreatedDate" title="${message(code: 'myData.recordCreatedDate.label', default: 'Record Created Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${myDataInstanceList}" status="i" var="myDataInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${myDataInstance.id}">${fieldValue(bean: myDataInstance, field: "data")}</g:link></td>
					
						<td><g:formatDate date="${myDataInstance.recordCreatedDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${myDataInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
