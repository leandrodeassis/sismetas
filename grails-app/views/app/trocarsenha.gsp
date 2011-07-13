
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>Mudança de Senha</title>         
  </head>
  <body>
	<div id="pageBody">
      <h1>Mudança de Senha</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:form action="trocarSenhaUsuario" method="post" >
        <div class="dialog">
          <table>
            <tbody>            
              <tr class="prop">
                <td class="name">
                  <label for="email">Email:</label>
                </td>
                <td>
                  <input type="text" id="email" name="email"/>
                </td>
              </tr> 
          
              <tr class="prop">
                <td class="name">
                  <label for="senha">Senha Antiga:</label>
                </td>
                <td>
                  <input type="password" id="senha" name="senha"/>
                </td>
              </tr> 
            
               <tr class="prop">
                <td class="name">
                  <label for="senha">Senha Nova:</label>
                </td>
                <td>
                  <input type="password" id="senhanova1" name="senhanova1"/>
                </td>
              </tr> 
            
              <tr class="prop">
                <td class="name">
                  <label for="senha">Repita Senha Nova:</label>
                </td>
                <td>
                  <input type="password" id="senhanova2" name="senhanova2"/>
                </td>
              </tr> 
 
            </tbody>
          </table>
        </div>
        <div class="buttons">
          <span class="button">
            <input class="save" type="submit" value="Mudar Senha" />
          </span>
        </div>
      </g:form>
    </div>
  </body>
</html>
