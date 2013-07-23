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
		<script type="text/javascript">
			aPop = new Array(
				['txtId', '', 'cicust', 'id,birthday,cust,tel1,addr1', '0txtId,txtBirthday,txtCust,txtTel,txtAddr', 'cicust_b.aspx'],
	           	['txtCarno', 'lblCarno', 'cicar', 'a.noa,passdate,year,cc,engineno,brand,type', '0txtCarno,txtPassdate,txtYear,txtCc,txtEngineno,txtCarbrand,txtCarkind', 'cicar_b.aspx']
           	);
			
		    $(document).ready(function () {
		        _q_boxClose();
		        q_getId();
		        q_gf('', 'z_ciinsuip');

				$('#txtBirthday').mask('999/99/99');
		        $('#txtBdate').mask('999/99/99');
		        $('#txtEdate').mask('999/99/99');
				$('#txtPassdate').mask('999/99');
				$('#txtYear').mask('9999');

		        $('#btnOk').click(function () {
		        	var t_connum=emp($('#txtConnum').val())?' ':$('#txtConnum').val();
					var t_id=emp($('#txtId').val())?' ':$('#txtId').val();
					var t_birthday=emp($('#txtBirthday').val())?' ':$('#txtBirthday').val();
					var t_sex=emp($('#combSex').val())?' ':$('#combSex').val();
					var t_marriage=emp($('#combMarriage').val())?' ':$('#combMarriage').val();
					var t_cust=emp($('#txtCust').val())?' ':$('#txtCust').val();
					var t_tel=emp($('#txtTel').val())?' ':$('#txtTel').val();
					var t_post=emp($('#txtPost').val())?' ':$('#txtPost').val();
					var t_addr=emp($('#txtAddr').val())?' ':$('#txtAddr').val();
					var t_bdate=emp($('#txtBdate').val())?' ':$('#txtBdate').val();
					var t_edate=emp($('#txtEdate').val())?' ':$('#txtEdate').val();
					var t_mon=emp($('#txtMon').val())?' ':$('#txtMon').val();
					var t_carno=emp($('#txtCarno').val())?' ':$('#txtCarno').val();
					var t_pass=emp($('#txtPassdate').val())?' ':$('#txtPassdate').val();
					var t_year=emp($('#txtYear').val())?' ':$('#txtYear').val();
					var t_brand=emp($('#combCarbrand').val())?' ':$('#combCarbrand').val();
					var t_ton=emp($('#txtTon').val())?' ':$('#txtTon').val();
					var t_cc=emp($('#txtCc').val())?' ':$('#txtCc').val();
					var t_kind=emp($('#combCarkind').val())?' ':$('#combCarkind').val();
					var t_engineno=emp($('#txtEngineno').val())?' ':$('#txtEngineno').val();
					var t_rank=emp($('#txtRank').val())?' ':$('#txtRank').val();
					var t_insur=emp($('#txtInsur').val())?' ':$('#txtInsur').val();
		        	
		            var t_where = t_connum+ ';' + t_id+ ';' + t_birthday+ ';' +t_sex+ ';' +t_marriage+ ';' +t_cust+ ';' 
		            +t_tel+ ';' +t_post+ ';' +t_addr+ ';' +t_bdate+ ';' +t_edate+ ';' +t_mon+ ';' +t_carno+ ';'+t_pass+ ';' 
		            +t_year+ ';' +t_brand+ ';' +t_ton+ ';' +t_cc+ ';' +t_kind+ ';' +t_engineno+ ';' +t_rank+ ';' +t_insur;
		            
		            var t_para = "r_comp=" + q_getPara('sys.comp') + ",r_accy=" + r_accy + ",bxdate=" + $('#txtBdate').val() + ",exdate=" + $('#txtEdate').val() + ",r_cno=" + r_cno;

		            q_gtx("z_ciinsuip1", t_where + ";;" + t_para + ";;z_ciinsuip;;" + q_getMsg('qTitle'));
		        });
		    });
		    function q_gfPost() {
		        q_popAssign();
		        q_cmbParse("combPrinttype", '0@三聯式,1@單張');
		        q_cmbParse("combSex", 'A@法人,F@女,M@男');
		        q_cmbParse("combMarriage", 'A@法人,M@已婚,S@未婚');
		        q_gt('cicarbrand','', 0, 0, 0, "", r_accy+'_'+r_cno);
		        q_gt('cicarkind','', 0, 0, 0, "", r_accy+'_'+r_cno);
		        
		        $('#txtBdate').val(q_date());
				$('#txtEdate').val(('0'+(dec(q_date().substr(0,3))+1)).substr(-3)+q_date().substr(3,6));
		        $('#txtMon').val(12);
		        
		        fbbm = q_getField('tbbm');
		        $('#tbbm td').children("input:text").each(function () { $(this).bind('keydown', function (event) { keypress_bbm(event, $(this), fbbm, 'btnOk'); }); });
		    }

		    function q_boxClose(t_name) {
		    }
		    function q_gtPost(t_name) {
		    	switch (t_name) {
					case 'cicarbrand':
					 	t_brand = ""
						var as = _q_appendData("cicarbrand","",true);
						for ( i = 0; i < as.length; i++) {
							t_brand = t_brand + (t_brand.length > 0 ? ',' : '') + as[i].noa + '@' + as[i].noa+' '+as[i].brand;
						}
						q_cmbParse("combCarbrand", t_brand);
						break;
					case 'cicarkind':
					 	t_kind = ""
						var as = _q_appendData("cicarkind","",true);
						for ( i = 0; i < as.length; i++) {
							t_kind = t_kind + (t_kind.length > 0 ? ',' : '') + as[i].noa + '@' + as[i].noa+' '+ as[i].nick;
						}
						q_cmbParse("combCarkind", t_kind);
						break;
				}
		    }
		    function q_popPost(s1) {
		    	switch (s1) {
		    		case 'txtId':
		    			if(!emp($('#txtId').val())){
	                		if((/^[a-zA-Z]+$/).test($('#txtId').val().substr(0,1))){
	                		 	if($('#txtId').val().substr(1,1)=='1'){
	                				$('#combSex').val('M');
	                				$('#combMarriage').val('S');
	                			}else{
									$('#combSex').val('F');
	                				$('#combMarriage').val('M');
	                			}
	                		}else{
	                			$('#combSex').val('A');
	                			$('#combMarriage').val('A');
	                		}
	                		if((/^[\d]+$/).test($('#txtAddr').val().substr(0,3))){
	                			$('#txtPost').val($('#txtAddr').val().substr(0,3));
	                			$('#txtAddr').val($('#txtAddr').val().substr(3,$('#txtAddr').val().length));
	                		}
                		}
			        break;
			        case 'txtCarno':
			        	if(!emp($('#txtCarbrand').val())){
			        		var nofindbrand=true;
			        		for ( i = 0; i < $('#combCarbrand')[0].length; i++) {
			        			if($('#combCarbrand')[0][i].text.indexOf($('#txtCarbrand').val())>-1){
			        				$('#combCarbrand').val($('#combCarbrand')[0][i].value)
			        				nofindbrand=false;
			        				break;
			        			}
			        		}
			        		if(nofindbrand){//縮短檢查字
			        			for ( i = 0; i < $('#combCarbrand')[0].length; i++) {
				        			if($('#combCarbrand')[0][i].text.indexOf($('#txtCarbrand').val().substr(0,2))>-1){
				        				$('#combCarbrand').val($('#combCarbrand')[0][i].value)
				        				break;
				        			}
				        		}
			        		}
			        	}
			        	if(!emp($('#txtCarkind').val())){
			        		for ( i = 0; i < $('#combCarkind')[0].length; i++) {
			        			if($('#combCarkind')[0][i].text.indexOf($('#txtCarkind').val().substr(0,3))>-1){
			        				$('#combCarkind').val($('#combCarkind')[0][i].value)
			        				break;
			        			}
			        		}
			        	}
			        break;
		    	}
			}
		</script>
		<style type="text/css">
            .tbbm {
                padding: 0px;
                border: 1px white double;
                border-spacing: 0;
                border-collapse: collapse;
                font-size: medium;
                color: blue;
                background: #cad3ff;
                width: 750px;
            }
            .tbbm tr {
                height: 35px;
            }
            .tbbm tr td {
                width: 9%;
            }
            .tbbm .tdZ {
                width: 2%;
            }
            .tbbm tr td span {
                float: right;
                display: block;
                width: 5px;
                height: 10px;
            }
            .tbbm tr td .lbl {
                float: right;
                color: blue;
                font-size: medium;
            }
            .tbbm tr td .lbl.btn {
                color: #4297D7;
                font-weight: bolder;
                font-size: medium;
            }
            .tbbm tr td .lbl.btn:hover {
                color: #FF8F19;
            }
            .txt.c1 {
                width: 98%;
                float: left;
            }
            .txt.c2 {
                width: 38%;
                float: left;
            }
            .txt.c3 {
                width: 60%;
                float: left;
            }
            .txt.c4 {
                width: 18%;
                float: left;
            }
            .txt.c5 {
                width: 80%;
                float: left;
            }
            .txt.c6 {
                width: 99%;
                float: left;
            }
            .txt.num {
                text-align: right;
            }
            .tbbm td {
                margin: 0 -1px;
                padding: 0;
            }
            .tbbm td input[type="text"] {
                border-width: 1px;
                padding: 0px;
                margin: -1px;
                float: left;
            }
            .tbbm select {
                border-width: 1px;
                padding: 0px;
                margin: -1px;
                font-size: medium;
            }
            .tbbm a {
                font-size: medium;
                float: right;
            }
             input[type="text"],input[type="button"] {     
                font-size: medium;
            }
            
    </style>
	</head>
	<body>
		<div id="q_menu"> </div>
		<div style="position: absolute;top: 10px;left:50px;z-index: 1;width:2000px;">
			 <div class="dview" id="dview" style="float: left;  width:15%; "  >
			 	<table class="tview" id="tview"   border="0" cellpadding='2'  cellspacing='0' >
			 	<tr>
			 		 <td class="td1"><a id='lblTitle' class="lbl" style="font-size: xx-large;font-family:dfkai-sb;"></a></td>
			 	</tr>
			 </table>
			 </div>
			<table class="tbbm"  id="tbbm"   border="0" cellpadding='2'  cellspacing='0'>
				<tr>
            	   <td class="td1"><span> </span><a id="lblPrinttype"> </a></td>
               		<td class="td2"><select id="combPrinttype" style="width: 98%;" > </select></td>
               		<td class="td3"><span> </span><a id='lblConnum'> </a></td>
               		<td class="td4"><input id="txtConnum"   type="text" style='width: 98%;'/></td>
				</tr>
				<tr>
            	   <td class="td1"><span> </span><a id="lblId"> </a></td>
               		<td class="td2"><input id="txtId"   type="text" style='width: 98%;'/></td>
               		<td class="td3"><span> </span><a id='lblBirthday'> </a></td>
               		<td class="td4"><input id="txtBirthday"   type="text" style='width: 98%;'/></td>
               		<td class="td5">
               			<a id="lblSex" style="float: left;"> </a>
               			<span style="float: left;"> </span>
               			<select id="combSex" style="width: 65px;" > </select>
               		</td>
               		<td class="td6">
               			<a id='lblMarriage' style="float: left;"> </a>
               			<span style="float: left;"> </span>
               			<select id="combMarriage" style="width: 65px;" > </select>
               		</td>
				</tr>
               	<tr>
            	   <td class="td1"><span> </span><a id="lblCust"> </a></td>
               		<td class="td2" colspan="3"><input id="txtCust"   type="text" style='width: 99%;'/></td>
               		<td class="td5" colspan="2">
               			<a id='lblTel' style="float: left;"> </a><span style="float: left;"> </span>
               			<input id="txtTel" type="text" style='width: 180px;'/>
               		</td>
               	</tr>
               	<tr>
            	   <td class="td1"><span > </span><a id="lblPost"> </a></td>
	               	<td class="td2" colspan="5"><input id="txtPost" type="text" style='width: 60px;'/>
	               		<span style="float: left;"> </span>
	               		<a id='lblAddr' style="float: left;"> </a><span style="float: left;"> </span>
	               		<input id="txtAddr" type="text" style='width:445px;'/>
               		</td>
               	</tr>
			 	<tr>
	               <td class="td1" ><span> </span><a id="lblBdate"> </a></td>
	               <td class="td2" ><input id="txtBdate" type="text" style='width: 99%;'/></td>
					<td class="td3" ><span> </span><a id="lblEdate"> </a></td>
					<td class="td4" ><input id="txtEdate" type="text" style='width: 99%;'/></td>
					<td class="td5" ><span> </span><a id="lblEnd" style="float: left;"> </a></td>
					<td class="td6"><input id="txtMon"   type="text" style='float: left; width: 50px;'/><span style="float: left;"> </span><a id='lblMon' style="float: left;"> </a></td>
				</tr>
				<tr>
					<td class="td1"><span> </span><a id="lblCarno"> </a></td>
               		<td class="td2"><input id="txtCarno"   type="text" style='width: 99%;'/></td>
					<td class="td3"><span> </span><a id="lblPassdate"> </a></td>
               		<td class="td4"><input id="txtPassdate"   type="text" style='width: 75px;'/></td>
               		<td class="td5"><span> </span><a id="lblYear"> </a></td>
               		<td class="td6"><input id="txtYear"   type="text" style='width: 75px;'/></td>
				</tr>
				<tr>
					<td class="td1"><span> </span><a id="lblCarbrand"> </a></td>
               		<td class="td2"><select id="combCarbrand" style="width: 99%;" > </select><input id="txtCarbrand" type="hidden"/></td>
               		<td class="td3"><span> </span><a id="lblTon"> </a></td>
               		<td class="td4"><input id="txtTon"   type="text" style='width: 75px;'/></td>
               		<td class="td5"><span> </span><a id='lblCc'> </a></td>
               		<td class="td6"><input id="txtCc"   type="text" style='width: 60px;'/>
               			<span> </span><a id='lblHp'> </a>
               		</td>
				</tr>
				<tr>
					<td class="td1"><span> </span><a id="lblCarkind"> </a></td>
               		<td class="td2"><select id="combCarkind" style="width: 99%;" > </select><input id="txtCarkind" type="hidden"/></td>
               		<td class="td3"><span> </span><a id="lblEngineno"> </a></td>
               		<td class="td4"  colspan="2"><input id="txtEngineno"   type="text" style='width: 99%;'/></td>
            	   	<td class="td6">
            	   		<a id="lblRank" style="float: left;"> </a>
            	   		<span style="float: left;"> </span>
            	   		<input id="txtRank"   type="text" style='width: 60px;'/>
            	   	</td>
				</tr>
				<tr>
					<td class="td1"><span> </span><a id="lblInsur"> </a></td>
               		<td class="td2"><input id="txtInsur"   type="text" style='width: 99%;'/></td>
				</tr>
            </table>
			<div class="prt" style="margin-left: -40px;">
				<!--#include file="../inc/print_ctrl.inc"-->
			</div>
		</div>
	</body>
</html>
           
          