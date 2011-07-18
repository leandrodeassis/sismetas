<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Relatório - Sistema de Metas IFPB</title>
	
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawAll);
	  function drawAll() {
		drawChart();
		drawChart2();
		drawChart3();
		drawChart4();
		drawChart5();
	  }  
	  
      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Semestre');
        data.addColumn('number', 'Índice (%)');
        data.addColumn('number', 'Meta (%)');
        data.addRows(${numPontosQueVaiTer1});	
		data.setValue(${numPontosQueVaiTer1-1}, 0, "2016.2");
		data.setValue(${numPontosQueVaiTer1-1}, 2, 90);	
		data.setValue(${numPontosQueVaiTer1-2}, 0, "2016.1");
		data.setValue(${numPontosQueVaiTer1-2}, 2, 90);
		data.setValue(${numPontosQueVaiTer1-3}, 0, "2015.2");
		data.setValue(${numPontosQueVaiTer1-3}, 2, 85);
		data.setValue(${numPontosQueVaiTer1-4}, 0, "2015.1");
		data.setValue(${numPontosQueVaiTer1-4}, 2, 85);
		data.setValue(${numPontosQueVaiTer1-5}, 0, "2014.2");
		data.setValue(${numPontosQueVaiTer1-5}, 2, 80);
		data.setValue(${numPontosQueVaiTer1-6}, 0, "2014.1");
		data.setValue(${numPontosQueVaiTer1-6}, 2, 80);
		data.setValue(${numPontosQueVaiTer1-7}, 0, "2013.2");
		data.setValue(${numPontosQueVaiTer1-7}, 2, 75);
		data.setValue(${numPontosQueVaiTer1-8}, 0, "2013.1");
		data.setValue(${numPontosQueVaiTer1-8}, 2, 75);
		<g:set var="posicao" value="${0}" />
		<g:each in="${turmasMapMeta1}">
			data.setValue(${posicao},0,"${it.key}")
			data.setValue(${posicao},1,${it.value})
			<g:set var="posicao" value="${posicao+1}" />			
		</g:each>		
        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(data, {width: 1000, height: 240, title: 'Índice de Eficiência da Instituição',
                          hAxis: {title: 'Semestres', titleTextStyle: {color: 'black'}}
                         });
      }

      function drawChart2() {
        var data2 = new google.visualization.DataTable();
        data2.addColumn('string', 'Semestre');
        data2.addColumn('number', 'Índice (%)');
        data2.addColumn('number', 'Meta (%)');
        data2.addRows(${numPontosQueVaiTer2});	
		data2.setValue(${numPontosQueVaiTer2-1}, 0, "2016.2");
		data2.setValue(${numPontosQueVaiTer2-1}, 2, 80);	
		data2.setValue(${numPontosQueVaiTer2-2}, 0, "2016.1");
		data2.setValue(${numPontosQueVaiTer2-2}, 2, 80);
		data2.setValue(${numPontosQueVaiTer2-3}, 0, "2015.2");
		data2.setValue(${numPontosQueVaiTer2-3}, 2, 75);
		data2.setValue(${numPontosQueVaiTer2-4}, 0, "2015.1");
		data2.setValue(${numPontosQueVaiTer2-4}, 2, 75);
		data2.setValue(${numPontosQueVaiTer2-5}, 0, "2014.2");
		data2.setValue(${numPontosQueVaiTer2-5}, 2, 75);
		data2.setValue(${numPontosQueVaiTer2-6}, 0, "2014.1");
		data2.setValue(${numPontosQueVaiTer2-6}, 2, 75);
		data2.setValue(${numPontosQueVaiTer2-7}, 0, "2013.2");
		data2.setValue(${numPontosQueVaiTer2-7}, 2, 70);
		data2.setValue(${numPontosQueVaiTer2-8}, 0, "2013.1");
		data2.setValue(${numPontosQueVaiTer2-8}, 2, 70);
		<g:set var="posicao" value="${0}" />
		<g:each in="${turmasMapMeta2}">
			data2.setValue(${posicao},0,"${it.key}")
			data2.setValue(${posicao},1,${it.value})
			<g:set var="posicao" value="${posicao+1}" />			
		</g:each>		
        var chart2 = new google.visualization.LineChart(document.getElementById('chart_div2'));
        chart2.draw(data2, {width: 1000, height: 240, title: 'Índice de Eficácia da Instituição',
                          hAxis: {title: 'Semestres', titleTextStyle: {color: 'red'}}
                         });
      }
	  
	  function drawChart3() {
        var data3 = new google.visualization.DataTable();        
        data3.addColumn('number', 'Índice');
        data3.addColumn('number', 'Meta');
        data3.addRows(1);	
		data3.setValue(0,0,${turmasListMeta3[6]});
		data3.setValue(0,1,20);
		
        var chart3 = new google.visualization.ColumnChart(document.getElementById('chart_div3'));
        chart3.draw(data3, {width: 400, height: 240, title: 'Alunos matriculados em relação à força de trabalho'});
      }
	  
	  function drawChart4() {
        var data4 = new google.visualization.DataTable();        
        data4.addColumn('number', 'Índice (%)');
        data4.addColumn('number', 'Meta (%)');
        data4.addRows(1);	
		data4.setValue(0,0,${turmasListMeta4[2]});
		data4.setValue(0,1,50);
		
        var chart4 = new google.visualization.ColumnChart(document.getElementById('chart_div4'));
        chart4.draw(data4, {width: 400, height: 240, title: 'Vagas para os Cursos técnicos'});
      }
	  
	  function drawChart5() {
        var data5 = new google.visualization.DataTable();        
        data5.addColumn('number', 'Índice (%)');
        data5.addColumn('number', 'Meta (%)');
        data5.addRows(1);	
		data5.setValue(0,0,${turmasListMeta5[2]});
		data5.setValue(0,1,20);
		
        var chart5 = new google.visualization.ColumnChart(document.getElementById('chart_div5'));
        chart5.draw(data5, {width: 400, height: 240, title: 'Vagas para Licenciaturas'});
      }
	  
	  
    </script>

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
			</table>
		<div id="chart_div"></div></center>			
		
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
		</table>
		<div id="chart_div2"></div></center>
		
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
			</table>
			<div id="chart_div3"></div></center>			

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
	  </table>
	  <div id="chart_div4"></div></center>
	 
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
	  </table>
	  <div id="chart_div5"></div></center>
  </body>
</html>