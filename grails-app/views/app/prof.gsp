
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>Configurações de Professores/CERTIFIC</title>         
  </head>
  <body>
	<div id="pageBody">
      <h1>Configurações de Professores/CERTIFIC</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:form action="configProf" method="post" >
        <div class="dialog">
          <table>
            <tbody>            
              <tr class="prop">
                <td class="name">
                  <label for="profsDE">Quantidade de Professores DE:</label>
                </td>
                <td>
                  <input type="text" id="profsDE" name="profsDE" value="${profsDE}" />
                </td>
              </tr> 
          
              <tr class="prop">
                <td class="name">
                  <label for="profsT40">Quantidade de Professores T40:</label>
                </td>
                <td>
                  <input type="text" id="profsT40" name="profsT40" value="${profsT40}" />
                </td>
              </tr> 
            
               <tr class="prop">
                <td class="name">
                  <label for="profsT20">Quantidade de Professores T20:</label>
                </td>
                <td>
                  <input type="text" id="profsT20" name="profsT20" value="${profsT20}" />
                </td>
              </tr>

               <tr class="prop">
                <td class="name">
                  <label for="chCertific">Carga Horária CERTIFIC:</label>
                </td>
                <td>
                  <input type="text" id="chCertific" name="chCertific" value="${chCertific}" />
                </td>
              </tr>
			  
               <tr class="prop">
                <td class="name">
                  <label for="numAlunosCertific">Número de Alunos CERTIFIC:</label>
                </td>
                <td>
                  <input type="text" id="numAlunosCertific" name="numAlunosCertific" value="${numAlunosCertific}" />
                </td>
              </tr> 

            </tbody>
          </table>
        </div>
        <div class="buttons">
          <span class="button">
            <input class="save" type="submit" value="OK" />
          </span>
        </div>
      </g:form>
    </div>
  </body>
</html>