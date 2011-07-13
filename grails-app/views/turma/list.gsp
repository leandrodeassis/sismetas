
<%@ page import="sismetas.Turma" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'turma.label', default: 'Turma')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'turma.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="ano" title="${message(code: 'turma.ano.label', default: 'Ano')}" />
                        
                            <g:sortableColumn property="periodo" title="${message(code: 'turma.periodo.label', default: 'Periodo')}" />
                        
                            <g:sortableColumn property="numeroDeConcluintes" title="${message(code: 'turma.numeroDeConcluintes.label', default: 'Numero De Concluintes')}" />
                        
                            <th><g:message code="turma.curso.label" default="Curso" /></th>
                        
                            <g:sortableColumn property="quantidadeDeAlunos" title="${message(code: 'turma.quantidadeDeAlunos.label', default: 'Quantidade De Alunos')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${turmaInstanceList}" status="i" var="turmaInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${turmaInstance.id}">${fieldValue(bean: turmaInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: turmaInstance, field: "ano")}</td>
                        
                            <td>${fieldValue(bean: turmaInstance, field: "periodo")}</td>
                        
                            <td>${fieldValue(bean: turmaInstance, field: "numeroDeConcluintes")}</td>
                        
                            <td>${fieldValue(bean: turmaInstance, field: "curso")}</td>
                        
                            <td>${fieldValue(bean: turmaInstance, field: "quantidadeDeAlunos")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${turmaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
