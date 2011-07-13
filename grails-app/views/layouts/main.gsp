<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <center><div id="IFPB Logo"><a href="http://www.ifpb.edu.br"><img src="${resource(dir:'images',file:'grails_logo.png')}" alt="Grails" border="0" /></center></a></div>
		<div class="buttons" style="font-size:14px">
		<g:if test="${session.user}">
            <g:form>                
                    <td text-align="right"><b>Bem-vindo, ${session.user}.</b>
					<span class="menuButton"><g:link controller="usuario" class="list" action="list" style="font-size:12px"><g:message code="Usuários" args="[entityName]" /></g:link></span>
					<span class="menuButton"><g:link controller="curso" class="list" action="list" style="font-size:12px"><g:message code="Cursos" args="[entityName]" /></g:link></span>
					<span class="menuButton"><g:link controller="turma" class="list" action="list" style="font-size:12px"><g:message code="Turmas" args="[entityName]" /></g:link></span>
					<span class="menuButton"><g:link controller="semestre" class="list" action="list" style="font-size:12px"><g:message code="Semestres" args="[entityName]" /></g:link></span>					
					<span class="menuButton"><g:link controller="app" class="prof" action="prof" style="font-size:12px"><g:message code="Professores" args="[entityName]" /></g:link></span>					
					<span class="menuButton"><g:link controller="app" class="relatorio" action="relatorio" style="font-size:12px"><g:message code="Relatório" args="[entityName]" /></g:link></span>					
					<span class="menuButton"><g:link controller="app" class="key" action="trocarsenha" style="font-size:12px"><g:message code="Mudar Senha" args="[entityName]" /></g:link></span>
					<span class="menuButton"><g:link controller="app" class="logout" action="logout" style="font-size:12px"><g:message code="Sair" args="[entityName]" /></g:link></span>
                    </td>
			</g:form>
		</g:if>
		</div>
        <g:layoutBody />
    </body>
</html>