<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
		<meta http-equiv="Content-Type" content="text/html"; charset=UTF-8" />
        <meta name="layout" content="main" />
		<title>Sistema de Metas IFPB</title>
    </head>
    <body>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
	<g:if test="${session.user}">
		<center>Utilize o menu acima para navegar no sistema</center>
	</g:if>
	<g:else>
		<g:form action="authenticate" method="post" >
		<div class="dialog">
        <table>
			<tbody>            
				<tr class="prop">
					<td class="name">
						<label for="email">E-mail:</label>
					</td>
					<td>
						<input type="text" id="email" name="email"/>
					</td>
				</tr>          
				<tr class="prop">
					<td class="name">
						<label for="senha">Senha:</label>
					</td>
					<td>
						<input type="password" id="senha" name="senha"/>
					</td>
				</tr> 
			</tbody>
		</table>
        </div>
		<div class="buttons">
			<span class="button"><input class="save" type="submit" value="Login" /></span>
		</div>
		</g:form>
	</g:else>
	</body>
</html>