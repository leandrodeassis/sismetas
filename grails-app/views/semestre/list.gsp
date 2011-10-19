
<%@ page import="sismetas.Semestre" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'semestre.label', default: 'Semestre')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'semestre.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="ano" title="${message(code: 'semestre.ano.label', default: 'Ano')}" />
                        
                            <g:sortableColumn property="periodo" title="${message(code: 'semestre.periodo.label', default: 'Periodo')}" />
                        
                            <g:sortableColumn property="quantidadeDeAlunos" title="${message(code: 'semestre.quantidadeDeAlunos.label', default: 'Quantidade De Alunos')}" />
                        
                            <g:sortableColumn property="semestreDeConcluintes" title="${message(code: 'semestre.semestreDeConcluintes.label', default: 'Semestre De Concluintes')}" />
                        
                            <th><g:message code="semestre.turma.label" default="Turma" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${semestreInstanceList}" status="i" var="semestreInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${semestreInstance.id}">${fieldValue(bean: semestreInstance, field: "id")}</g:link></td>
                        
							<td> <g:formatNumber number="${semestreInstance.ano}" format="#" /> </td>
                        
                            <td>${fieldValue(bean: semestreInstance, field: "periodo")}</td>
                        
                            <td>${fieldValue(bean: semestreInstance, field: "quantidadeDeAlunos")}</td>
                        
                            <td><g:formatBoolean boolean="${semestreInstance.semestreDeConcluintes}" /></td>
                        
                            <td>${fieldValue(bean: semestreInstance, field: "turma")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${semestreInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
