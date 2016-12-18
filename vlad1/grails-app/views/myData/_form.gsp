<%@ page import="com.datastore.MyData" %>



<div class="fieldcontain ${hasErrors(bean: myDataInstance, field: 'data', 'error')} required">
	<label for="data">
		<g:message code="myData.data.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="data" cols="40" rows="5" maxlength="255" required="" value="${myDataInstance?.data}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: myDataInstance, field: 'recordCreatedDate', 'error')} required">
	<label for="recordCreatedDate">
		<g:message code="myData.recordCreatedDate.label" default="Record Created Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="recordCreatedDate" precision="day"  value="${myDataInstance?.recordCreatedDate}"  />

</div>

