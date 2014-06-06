<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" type="text/javascript">  
function redirect(site){  
 window.location= site  
}  
</script> 
</head>
<body>

<%
if (request.getParameter("Generisi")!="") 
{
	
}
	
%>

		<CENTER>
			<TABLE id = "glavnaTabela">
				
				<TR>
					<TD id = "glavniMeni">
					
					<a href="KreiranjeIzvjestaja.jsp" class="glavniMeni" id="linkIzvjestaji" >
												Izvještaji
											</a> &nbsp;&nbsp;
											
											
					
					</TD>
				</TR>
				<TR><TD id = "sporedniMeni"><a href="Prijava.jsp" class="sporedniMeni">Odjavi se</a></TD></TR>
				
				<TR><TD id = "sadrzaj">	

<TABLE style="border-collapse:collapse;">
			<TR>
				<TD CLASS="navigacija" id="link1" style="background-color: #F0F0F0;">
					<A href = "KreiranjeIzvještaja.jsp" id = "linkisf" CLASS="navigacija" >Kreiranje izvještaja</A><BR>
				</TD>
				<TD id = "sporedniSadrzaj" rowspan="13">
				<FORM>
				<TABLE align="center">
<TR><TD class = "dugme">Naziv: &nbsp;</TD><TD>

<select onchange="redirect(this.value)">
<option> Odaberite tip izvještaja </option>
<option value="IzvjestajPregledSprovedenihLicenciranja.jsp">Pregled sprovedenih licenciranja</option>
<option value="IzvjestajOInstaliranimSoftverima.jsp">Izvještaj o instaliranim softverima</option>
<option value="IzvjestajONabavljenimLicencama.jsp">Izvještaj o nabavljenim licencama</option>
</select>
</TD></TR>
</TABLE>
</FORM>
				
		</TABLE>
		</td></tr></table>
		</center>
		</body>
		
		</html>






