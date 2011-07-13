

<%@ page import="sismetas.Curso" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'curso.label', default: 'Curso')}" />
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
            <g:hasErrors bean="${cursoInstance}">
            <div class="errors">
                <g:renderErrors bean="${cursoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${cursoInstance?.id}" />
                <g:hiddenField name="version" value="${cursoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nome"><g:message code="curso.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursoInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" maxlength="100" value="${cursoInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tipoDeCurso"><g:message code="curso.tipoDeCurso.label" default="Tipo De Curso" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursoInstance, field: 'tipoDeCurso', 'errors')}">
                                    <g:select name="tipoDeCurso" from="${cursoInstance.constraints.tipoDeCurso.inList}" value="${cursoInstance?.tipoDeCurso}" valueMessagePrefix="curso.tipoDeCurso"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="turmas"><g:message code="curso.turmas.label" default="Turmas" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cursoInstance, field: 'turmas', 'errors')}">
                                    
<ul>
<g:each in="${cursoInstance?.turmas?}" var="t">
    <li><g:link controller="turma" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="turma" action="create" params="['curso.id': cursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'turma.label', default: 'Turma')])}</g:link>

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
