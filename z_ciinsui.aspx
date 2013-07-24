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
						 ['txtXcardealno', '', 'cicardeal', 'noa,comp', 'txtXcardealno', 'cardeal_b.aspx'],
						 ['txtXinsurerno', '', 'ciinsucomp', 'noa,insurer', 'txtXinsurerno', 'ciinsucomp_b.aspx'],
						  ['txtXsales', '', 'cisale', 'noa,namea', 'txtXsales', 'cisale_b.aspx']
						  ['txtXtel', '', 'cicust', 'tel1', 'txtXtel', '']
		);
            if (location.href.indexOf('?') < 0) {
                location.href = location.href + "?;;;;"+((new Date()).getUTCFullYear()-1911);
            }
            $(document).ready(function() {
                q_getId();
                q_gf('', 'z_ciinsui');   
            });
            function q_gfPost() {
                $('#q_report').q_report({
                    fileName : 'z_ciinsui',
                    options : [{/*[1][2]-車牌*/
                        type : '2',
                        name : 'xcarno',
                        dbf : 'cicar',
                        index : 'a.noa,cust',
                        src : 'cicar_b.aspx'
                    }, {/*[3][4]-車主*/
                        type : '2',
                        name : 'xcust',
                        dbf : 'cicust',
                        index : 'noa,cust',
                        src : 'cicust_b.aspx'
                    }, {/*[5][6]-所屬車行*/
                        type : '2',
                        name : 'xcardealno',
                        dbf : 'cicardeal',
                        index : 'noa,cardeal',
                        src : 'cicardeal_b.aspx'
                    }, {/*[7][8]-保險公司*/
                        type : '2',
                        name : 'xinsurerno',
                        dbf : 'ciinsucomp',
                        index : 'noa,insurer',
                        src : 'ciinsucomp_b.aspx'
                    },{/*[9][10]-保險起保日*/
                        type : '1',
                        name : 'bdate'
                    },{/*[11][12]-保險到期日*/
                        type : '1',
                        name : 'edate'
                    }, {/*[13][14]-業務*/
                        type : '2',
                        name : 'xsales',
                        dbf : 'cisale',
                        index : 'noa,namea',
                        src : 'cisale_b.aspx'
                    }, {/*[15]-電話*/
                        type : '6',
                        name : 'xtel'
                    }]
                });
                q_langShow();
	                q_popAssign();
                $('#txtBdate1').mask('999/99/99');
                $('#txtBdate1').datepicker();
                $('#txtBdate2').mask('999/99/99');
                $('#txtBdate2').datepicker();
                $('#txtEdate1').mask('999/99/99');
                $('#txtEdate1').datepicker();
                $('#txtEdate2').mask('999/99/99');
                $('#txtEdate2').datepicker();
                
                var t_date,t_year,t_month,t_day;
	                t_date = new Date();
	                t_date.setDate(1);
	                t_year = t_date.getUTCFullYear()-1911;
	                t_year = t_year>99?t_year+'':'0'+t_year;
	                t_month = t_date.getUTCMonth()+1;
	                t_month = t_month>9?t_month+'':'0'+t_month;
	                t_day = t_date.getUTCDate();
	                t_day = t_day>9?t_day+'':'0'+t_day;
	                $('#txtEdate1').val(t_year+'/'+t_month+'/'+t_day);
	                t_date = new Date();
	                t_date.setDate(35);
	                t_date.setDate(0);
	                t_year = t_date.getUTCFullYear()-1911;
	                t_year = t_year>99?t_year+'':'0'+t_year;
	                t_month = t_date.getUTCMonth()+1;
	                t_month = t_month>9?t_month+'':'0'+t_month;
	                t_day = t_date.getUTCDate();
	                t_day = t_day>9?t_day+'':'0'+t_day;
	                $('#txtEdate2').val(t_year+'/'+t_month+'/'+t_day);
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