

<%@ page import="sismetas.Campus" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'campus.label', default: 'Campus')}" />
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
            <g:hasErrors bean="${campusInstance}">
            <div class="errors">
                <g:renderErrors bean="${campusInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome"><g:message code="campus.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: campusInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" maxlength="100" value="${campusInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantidadeDeProfessoresDE"><g:message code="campus.quantidadeDeProfessoresDE.label" default="Quantidade De Professores DE" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: campusInstance, field: 'quantidadeDeProfessoresDE', 'errors')}">
                                    <g:textField name="quantidadeDeProfessoresDE" value="${fieldValue(bean: campusInstance, field: 'quantidadeDeProfessoresDE')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantidadeDeProfessoresT20"><g:message code="campus.quantidadeDeProfessoresT20.label" default="Quantidade De Professores T20" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: campusInstance, field: 'quantidadeDeProfessoresT20', 'errors')}">
                                    <g:textField name="quantidadeDeProfessoresT20" value="${fieldValue(bean: campusInstance, field: 'quantidadeDeProfessoresT20')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantidadeDeProfessoresT40"><g:message code="campus.quantidadeDeProfessoresT40.label" default="Quantidade De Professores T40" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: campusInstance, field: 'quantidadeDeProfessoresT40', 'errors')}">
                                    <g:textField name="quantidadeDeProfessoresT40" value="${fieldValue(bean: campusInstance, field: 'quantidadeDeProfessoresT40')}" />
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
