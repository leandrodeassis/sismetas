<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Relatório - Sistema de Metas IFPB</title>    
  </head>
  <body>
	
      <center><h1>Relatório</h1></center>
	  <h2>1. Índice de eficiência</h2>
	  		<center><table border="1" cellspacing="2" cellpadding="0" style='border-collapse:collapse;border:none'>
			<tr>
			<th style="background:#D9D9D9"><b>Ano/Período</b></th>
			<th style="background:#D9D9D9"><b>Índice de Eficiência</b></th>
			</tr>
			<g:each in="${turmasMapMeta1}">
			<tr>
			<th>${it.key}</th>
			<th>${it.value}%</th>
			</tr>
			</g:each>
			</table></center>
	  <h2>2. Índice de eficácia</h2>
		<center><table border="1" cellspacing="2" cellpadding="0" style='border-collapse:collapse;border:none'>
			<tr>
			<th style="background:#D9D9D9"><b>Ano/Período</b></th>
			<th style="background:#D9D9D9"><b>Índice Eficácia</b></th>
			</tr>
			<g:each in="${turmasMapMeta2}">
			<tr>
			<th>${it.key}</th>
			<th>${it.value}%</th>
			</tr>
			</g:each>
			</tr>
		</table></center>
		
	  <h2>3. Alunos matriculados em relação à força de trabalho</h2>
		<center><table border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none'>
			<tr>		
			<th style="background:#D9D9D9"><b>Número de Alunos Matriculados</b></th>
			<th>${turmasListMeta3[0]}</th>
			</tr>
	
			<tr>
			<th  style="background:#D9D9D9">Número de Alunos CERTIFIC</th>
			<th>${turmasListMeta3[1]}</th>
			</tr>
			<tr>
			<th>Carga Horária CERTIFIC</th>
			<th>${turmasListMeta3[2]}</th>
			</tr>		
		
			<tr>
			<th>Número de Professores DE</th>
			<th>${turmasListMeta3[3]}</th>
			</tr>
			<tr>
			<th>Número de Professores T40</th>
			<th>${turmasListMeta3[4]}</th>
			</tr>
			<tr>
			<th>Número de Professores T20</th>
			<th>${turmasListMeta3[5]}</th>
			</tr>
			<tr>
			</tr>
			<tr>
			<th style="background:#D9D9D9">Alunos matriculados em relação à força de trabalho</th>
			<th style="background:#D9D9D9">${turmasListMeta3[6]}</th>
			</tr>
			</table></center>
		
		 

	  <!--<h2>4. Vagas para os cursos técnicos</h2>
	  <center><table border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none'>
		<tr>
		<th style="background:#D9D9D9">Matriculados na Instituição</th>
		<th style="background:#D9D9D9">Matriculados em Ensino Técnico</th>
		<th style="background:#D9D9D9">Porcentagem</th>
		</tr>
		<tr>
		<th>${totalVCT}</th>
		<th>${totalVCT}</th>
		<th>${totalVCT}%</th>
		</tr>
	  </table></center>
	  <h2>5. Vagas para a formação de professores e Licenciaturas</h2>
	  <center><table border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none'>
		<tr>
		<th style="background:#D9D9D9">Matriculados na Instituição</th>
		<th style="background:#D9D9D9">Matriculados em Licenciatura</th>
		<th style="background:#D9D9D9">Porcentagem</th>
		</tr>
		<tr>
		<th>${totalVL}</th>
		<th>${totalVL}</th>
		<th>${totalVL}%</th>
		</tr>
	  </table></center>	!--> 
  </body>
</html>