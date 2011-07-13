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
			<th style="background:#D9D9D9"><b>Turma</b></th>
			<th style="background:#D9D9D9"><b>Índice Eficiência Turma</b></th>
			</tr>
			<g:each in="${turmas}">
			<tr>
			<th>${it.key}</th>
			<th>${it.value}%</th>
			</tr>
			</g:each>
			<th style="background:#D9D9D9">Total</th>
			<th style="background:#D9D9D9">${indiceEficienciaTotal}%</th>
			</table></center>
	  <h2>2. Índice de eficácia</h2>
		<center><table border="1" cellspacing="2" cellpadding="0" style='border-collapse:collapse;border:none'>
			<tr>
			<th style="background:#D9D9D9"><b>Turma</b></th>
			<th style="background:#D9D9D9"><b>Vagas Edital</b></th>
			<th style="background:#D9D9D9"><b>Concluintes</b></th>
			<th style="background:#D9D9D9"><b>Índice Eficácia Turma</b></th>
			</tr>
			<g:each in="${eficacia}">
			<tr>
			<th>${it.key}</th>
			<th>${it.value[0]}</th>
			<th>${it.value[1]}</th>
			<th>${it.value[2]}%</th>
			</tr>
			</g:each>
			<tr>
			<th style="background:#D9D9D9">Total</th>
			<th></th>
			<th></th>
			<th style="background:#D9D9D9">${indiceEficaciaTotal}%</th>
			</tr>
		</table></center>
		
	  <h2>3. Alunos matriculados em relação à força de trabalho</h2>
		<center><table border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none'>
			<tr>
			<th style="background:#D9D9D9"><b>Curso</b></th>
			<th style="background:#D9D9D9"><b>Número de Alunos Matriculados</b></th>
			</tr>
			<g:each in="${curso}">
			<tr>
			<th>${it.nome}</th>
			<th>${it.numeroDeAlunosMatriculados}</th>
			</tr>
			</g:each>
			<th style="background:#D9D9D9"><b>Total de Alunos Matriculados</b></th>
			<th style="background:#D9D9D9"><b>${totalAlunosMatriculados}</b></th>
			</tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		
			<tr>
			<th>Número de Alunos CERTIFIC</th>
			<th>${certific[0]}</th>
			</tr>
			<tr>
			<th>Carga Horária CERTIFIC</th>
			<th>${certific[1]}</th>
			</tr>		
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		
			<tr>
			<th>Número de Professores DE</th>
			<th>${profs[0]}</th>
			</tr>
			<tr>
			<th>Número de Professores T20</th>
			<th>${profs[1]}</th>
			</tr>
			<tr>
			<th>Número de Professores T40</th>
			<th>${profs[2]}</th>
			</tr>
			<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			</tr>
			<tr>
			<th style="background:#D9D9D9">Alunos matriculados em relação à força de trabalho</th>
			<th style="background:#D9D9D9">${totalFT}</th>
			</tr>
			</table></center>
		
		 

	  <h2>4. Vagas para os cursos técnicos</h2>
	  <center><table border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none'>
		<tr>
		<th style="background:#D9D9D9">Matriculados na Instituição</th>
		<th style="background:#D9D9D9">Matriculados em Ensino Técnico</th>
		<th style="background:#D9D9D9">Porcentagem</th>
		</tr>
		<tr>
		<th>${totalVCT[0]}</th>
		<th>${totalVCT[1]}</th>
		<th>${totalVCT[2]}%</th>
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
		<th>${totalVL[0]}</th>
		<th>${totalVL[1]}</th>
		<th>${totalVL[2]}%</th>
		</tr>
	  </table></center>	  
  </body>
</html>