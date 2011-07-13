

<%@ page import="sismetas.Semestre" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'semestre.label', default: 'Semestre')}" />
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
            <g:hasErrors bean="${semestreInstance}">
            <div class="errors">
                <g:renderErrors bean="${semestreInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${semestreInstance?.id}" />
                <g:hiddenField name="version" value="${semestreInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ano"><g:message code="semestre.ano.label" default="Ano" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: semestreInstance, field: 'ano', 'errors')}">
                                    <g:select name="ano" from="${semestreInstance.constraints.ano.inList}" value="${fieldValue(bean: semestreInstance, field: 'ano')}" valueMessagePrefix="semestre.ano"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="periodo"><g:message code="semestre.periodo.label" default="Periodo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: semestreInstance, field: 'periodo', 'errors')}">
                                    <g:select name="periodo" from="${semestreInstance.constraints.periodo.inList}" value="${fieldValue(bean: semestreInstance, field: 'periodo')}" valueMessagePrefix="semestre.periodo"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="quantidadeDeAlunos"><g:message code="semestre.quantidadeDeAlunos.label" default="Quantidade De Alunos" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: semestreInstance, field: 'quantidadeDeAlunos', 'errors')}">
                                    <g:textField name="quantidadeDeAlunos" value="${fieldValue(bean: semestreInstance, field: 'quantidadeDeAlunos')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="semestreDeConcluintes"><g:message code="semestre.semestreDeConcluintes.label" default="Semestre De Concluintes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: semestreInstance, field: 'semestreDeConcluintes', 'errors')}">
                                    <g:checkBox name="semestreDeConcluintes" value="${semestreInstance?.semestreDeConcluintes}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="turma"><g:message code="semestre.turma.label" default="Turma" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: semestreInstance, field: 'turma', 'errors')}">
                                    <g:select name="turma.id" from="${sismetas.Turma.list()}" optionKey="id" value="${semestreInstance?.turma?.id}"  />
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
