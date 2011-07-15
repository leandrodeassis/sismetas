<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Relatório - Sistema de Metas IFPB</title>
	
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Semestre');
        data.addColumn('number', 'Índice (%)');
        data.addColumn('number', 'Meta (%)');
        data.addRows(${numPontosQueVaiTer});
		<g:set var="teste" value="${0}" />
		
		<g:each in="${turmasMapMeta1}">
			<g:set var="passei" value="${passei}"
		
		</g:each>



		<g:set var="teste" value="${teste+1}" />
		
        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(data, {width: 700, height: 240, title: 'Índice de Eficiência da Instituição',
                          hAxis: {title: 'Semestres', titleTextStyle: {color: 'red'}}
                         });
      }
    </script>

  </head>
  <body>	  
	  
      <center><h1>Relatório</h1></center>
	  <h2>1. Índice de eficiência</h2>
	  <center><table>
	  <th>
	  		<table border="1" cellspacing="2" cellpadding="0" style='border-collapse:collapse;border:none'>
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
			</table>
		</th>
		<th>

		<div id="chart_div"></div>

		</th>
			
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

	 <h2>4. Vagas para os cursos técnicos</h2>
	  <center><table border="1" cellspacing="0" cellpadding="0" style='border-collapse:collapse;border:none'>
		<tr>
		<th style="background:#D9D9D9">Matriculados na Instituição</th>
		<th style="background:#D9D9D9">Matriculados em Ensino Técnico</th>
		<th style="background:#D9D9D9">Porcentagem</th>
		</tr>
		<tr>
		<th>${turmasListMeta4[0]}</th>
		<th>${turmasListMeta4[1]}</th>
		<th>${turmasListMeta4[2]}%</th>
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
		<th>${turmasListMeta5[0]}</th>
		<th>${turmasListMeta5[1]}</th>
		<th>${turmasListMeta5[2]}%</th>
		</tr>
	  </table></center>
  </body>
</html>