<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title> </title>
		<script src="../script/jquery.min.js" type="text/javascript"> </script>
		<script src='../script/qj2.js' type="text/javascript"> </script>
		<script src='qset.js' type="text/javascript"> </script>
		<script src='../script/qj_mess.js' type="text/javascript"> </script>
		<script src="../script/qbox.js" type="text/javascript"> </script>
		<script src='../script/mask.js' type="text/javascript"> </script>
		<link href="../qbox.css" rel="stylesheet" type="text/css" />
		<link href="css/jquery/themes/redmond/jquery.ui.all.css" rel="stylesheet" type="text/css" />
		<script src="css/jquery/ui/jquery.ui.core.js"> </script>
		<script src="css/jquery/ui/jquery.ui.widget.js"> </script>
		<script src="css/jquery/ui/jquery.ui.datepicker_tw.js"> </script>
		<script type="text/javascript">
		aPop = new Array(['txtXcarno', '', 'cicar', 'a.noa,cust', 'txtXcarno', 'cicar_b.aspx'],
			['txtXinsurerno', '', 'ciinsucomp', 'noa,insurer', 'txtXinsurerno', 'ciinsucomp_b.aspx']);
            if (location.href.indexOf('?') < 0) {
                location.href = location.href + "?;;;;"+((new Date()).getUTCFullYear()-1911);
            }
            $(document).ready(function() {
                q_getId();
                q_gf('', 'z_ciaccident');   
            });
            function q_gfPost() {
                $('#q_report').q_report({
                    fileName : 'z_ciaccident',
                    options : [ {
                        type : '1',
                        name : 'xnoa'
                    },{
                        type : '2',
                        name : 'xcarno',
                        dbf : 'cicar',
                        index : 'a.noa,cust',
                        src : 'cicar_b.aspx'
                    },{
                        type : '6',
                        name : 'xdriver'
                    },{
                        type : '6',
                        name : 'xid'
                    }, {
                        type : '2',
                        name : 'xinsurerno',
                        dbf : 'ciinsucomp',
                        index : 'noa,insurer',
                        src : 'ciinsucomp_b.aspx'
                    },{
                        type : '1',
                        name : 'hdate'
                    },{
                        type : '1',
                        name : 'xdate'
                    }]
                });
                		            
                    q_popAssign();
                var t_noa=typeof(q_getId()[5])=='undefined'?'':q_getId()[5];
                t_noa  =  t_noa.replace('noa=','');
                $('#txtXnoa1').val(t_noa).width(100);
                $('#txtXnoa2').val(t_noa).width(100);

                $('#txtHdate1').mask('999/99/99');
                $('#txtHdate1').datepicker();
                $('#txtHdate2').mask('999/99/99');
                $('#txtHdate2').datepicker();
                
                $('#txtXdate1').mask('999/99/99');
                $('#txtXdate1').datepicker();
                $('#txtXdate2').mask('999/99/99');
                $('#txtXdate2').datepicker();
            }
		</script>
	</head>
	<body ondragstart="return false" draggable="false"
	ondragenter="event.dataTransfer.dropEffect='none'; event.stopPropagation(); event.preventDefault();"
	ondragover="event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();"
	ondrop="event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();">
		<div id="q_menu"> </div>
		<div style="position: absolute;top: 10px;left:50px;z-index: 1;width:2000px;">
			<div id="container">
				<div id="q_report"> </div>
			</div>
			<div class="prt" style="margin-left: -40px;">
				<!--#include file="../inc/print_ctrl.inc"-->
			</div>
		</div>
	</body>
</html>