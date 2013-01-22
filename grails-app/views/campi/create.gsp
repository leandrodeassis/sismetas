

<%@ page import="sismetas.Campi" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'campi.label', default: 'Campi')}" />
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
            <g:hasErrors bean="${campiInstance}">
            <div class="errors">
                <g:renderErrors bean="${campiInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome"><g:message code="campi.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: campiInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" maxlength="100" value="${campiInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantidadeDeProfessoresDE"><g:message code="campi.quantidadeDeProfessoresDE.label" default="Quantidade De Professores DE" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: campiInstance, field: 'quantidadeDeProfessoresDE', 'errors')}">
                                    <g:textField name="quantidadeDeProfessoresDE" value="${fieldValue(bean: campiInstance, field: 'quantidadeDeProfessoresDE')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantidadeDeProfessoresT20"><g:message code="campi.quantidadeDeProfessoresT20.label" default="Quantidade De Professores T20" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: campiInstance, field: 'quantidadeDeProfessoresT20', 'errors')}">
                                    <g:textField name="quantidadeDeProfessoresT20" value="${fieldValue(bean: campiInstance, field: 'quantidadeDeProfessoresT20')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantidadeDeProfessoresT40"><g:message code="campi.quantidadeDeProfessoresT40.label" default="Quantidade De Professores T40" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: campiInstance, field: 'quantidadeDeProfessoresT40', 'errors')}">
                                    <g:textField name="quantidadeDeProfessoresT40" value="${fieldValue(bean: campiInstance, field: 'quantidadeDeProfessoresT40')}" />
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
