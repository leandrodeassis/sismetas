
<%@ page import="sismetas.Campi" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'campi.label', default: 'Campi')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'campi.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'campi.nome.label', default: 'Nome')}" />
                        
                            <g:sortableColumn property="quantidadeDeProfessoresDE" title="${message(code: 'campi.quantidadeDeProfessoresDE.label', default: 'Quantidade De Professores DE')}" />
                        
                            <g:sortableColumn property="quantidadeDeProfessoresT20" title="${message(code: 'campi.quantidadeDeProfessoresT20.label', default: 'Quantidade De Professores T20')}" />
                        
                            <g:sortableColumn property="quantidadeDeProfessoresT40" title="${message(code: 'campi.quantidadeDeProfessoresT40.label', default: 'Quantidade De Professores T40')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${campiInstanceList}" status="i" var="campiInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${campiInstance.id}">${fieldValue(bean: campiInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: campiInstance, field: "nome")}</td>
                        
                            <td>${fieldValue(bean: campiInstance, field: "quantidadeDeProfessoresDE")}</td>
                        
                            <td>${fieldValue(bean: campiInstance, field: "quantidadeDeProfessoresT20")}</td>
                        
                            <td>${fieldValue(bean: campiInstance, field: "quantidadeDeProfessoresT40")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${campiInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
