

<%@ page import="sismetas.Turma" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'turma.label', default: 'Turma')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${turmaInstance}">
            <div class="errors">
                <g:renderErrors bean="${turmaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="turno"><g:message code="turma.turno.label" default="Turno" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turmaInstance, field: 'turno', 'errors')}">
                                    <g:select name="turno" from="${turmaInstance.constraints.turno.inList}" value="${turmaInstance?.turno}" valueMessagePrefix="turma.turno"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="codigoTurma"><g:message code="turma.codigoTurma.label" default="Codigo Turma" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turmaInstance, field: 'codigoTurma', 'errors')}">
                                    <g:select name="codigoTurma" from="${turmaInstance.constraints.codigoTurma.inList}" value="${turmaInstance?.codigoTurma}" valueMessagePrefix="turma.codigoTurma"  />
                                </td>
                            </tr>
                        
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
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
