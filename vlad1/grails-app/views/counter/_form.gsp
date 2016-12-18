<%@ page import="com.counter_value.Counter" %>



<div class="fieldcontain ${hasErrors(bean: counterInstance, field: 'value', 'error')} required">
	<label for="value">
		<g:message code="counter.value.label" default="Value" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="value" type="number" value="${counterInstance.value}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: counterInstance, field: 'namePK', 'error')} required">
	<label for="namePK">
		<g:message code="counter.namePK.label" default="Name PK" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="namePK" required="" value="${counterInstance?.namePK}"/>

</div>

