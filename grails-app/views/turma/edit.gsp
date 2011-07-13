

<%@ page import="sismetas.Turma" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'turma.label', default: 'Turma')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${turmaInstance}">
            <div class="errors">
                <g:renderErrors bean="${turmaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${turmaInstance?.id}" />
                <g:hiddenField name="version" value="${turmaInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ano"><g:message code="turma.ano.label" default="Ano" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turmaInstance, field: 'ano', 'errors')}">
                                    <g:select name="ano" from="${turmaInstance.constraints.ano.inList}" value="${fieldValue(bean: turmaInstance, field: 'ano')}" valueMessagePrefix="turma.ano"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="periodo"><g:message code="turma.periodo.label" default="Periodo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turmaInstance, field: 'periodo', 'errors')}">
                                    <g:select name="periodo" from="${turmaInstance.constraints.periodo.inList}" value="${fieldValue(bean: turmaInstance, field: 'periodo')}" valueMessagePrefix="turma.periodo"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="vagasEdital"><g:message code="turma.vagasEdital.label" default="Vagas Edital" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turmaInstance, field: 'vagasEdital', 'errors')}">
                                    <g:textField name="vagasEdital" value="${fieldValue(bean: turmaInstance, field: 'vagasEdital')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="curso"><g:message code="turma.curso.label" default="Curso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turmaInstance, field: 'curso', 'errors')}">
                                    <g:select name="curso.id" from="${sismetas.Curso.list()}" optionKey="id" value="${turmaInstance?.curso?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="semestre"><g:message code="turma.semestre.label" default="Semestre" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turmaInstance, field: 'semestre', 'errors')}">
                                    
<ul>
<g:each in="${turmaInstance?.semestre?}" var="s">
    <li><g:link controller="semestre" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="semestre" action="create" params="['turma.id': turmaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'semestre.label', default: 'Semestre')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
