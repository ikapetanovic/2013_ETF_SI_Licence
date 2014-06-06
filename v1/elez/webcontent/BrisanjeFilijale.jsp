<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Brisanje filijale</title>
</head>
<body>
	<%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@page import="java.lang.*" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>	
<%
if (request.getParameter("Odustani")!=null) response.sendRedirect("PocetnaAdministrator.jsp");

if (request.getParameter("Obriši")!="") {
	FilijalaDAO fdao = new FilijalaDAO();
	String id = request.getParameter("unos");
	try{
	Filijala f=fdao.selectFilijaluPoIdu(Integer.parseInt(id));
	fdao.deleteFilijala(f.getId());
	out.println("Uspješno obrisana filijala sa unesenim ID-em");
	} catch(Exception e){
		
	}
}
%>		

		<CENTER>
			<TABLE id = "glavnaTabela">
				
				<TR>
					<TD id = "glavniMeni">
					
					<a href="KreiranjeKorisnika.jsp" class="glavniMeni" id="linkKorisnici" >
												Korisnici
											</a> &nbsp;&nbsp;
											<a href="BackUp.jsp" class="glavniMeni" id="linkBackUp">
												BackUp
											</a> &nbsp;&nbsp;
											<a href="DodavanjeFilijale.jsp" class="glavniMeni" id="linkFilijale"> 
												Filijale
											</a> &nbsp;&nbsp;
					</TD>
				</TR>
				<TR><TD id = "sporedniMeni"><a href="Prijava.jsp" class="sporedniMeni">Odjavi se</a></TD></TR>
				
				<TR><TD id = "sadrzaj">	
<TABLE style="border-collapse:collapse;">
			<TR>
				<TD class="navigacija"  id="link1" style="background-color: #FFFFFF;">
				<A href = "DodavanjeFilijale.jsp" id = "Kreiranjefilijale" CLASS="navigacija">Kreiranje filijale</A><BR>
					</TD>
					<TD id = "sporedniSadrzaj" rowspan="13">
					<CENTER>
							<FORM action="BrisanjeFilijale.jsp" method=GET >
					<table><tr><td>
				</td></tr>
				<tr><td>
				
				<LABEL>Unesi ID filijale: &nbsp;</LABEL>	</td><td>			
				<INPUT type = "text" name="unos" id="unos">&nbsp;</td></tr>
<tr><td></td><td>
&nbsp;</td></tr>
										
				<tr><td colspan="2">
				</td><td>
				<INPUT type = "submit" name="Obriši" id="Obriši" value="Obriši">&nbsp;<INPUT type = "submit" name="Odustani" id="Odustani" value="Odustani">	</td></tr></table>	
				</FORM>
				</CENTER></TD></TR>
				<tr>
			<TD class="navigacija"  id="link2" style="background-color: #FFFFFF;">
				<A href = "ModifikacijaFilijale.jsp" id = "linkModifikacijaFilijale" CLASS="navigacija">Modifikacija filijale</A><BR>
					</TD></tr>
				<TR>
				<TD class="navigacija"  id="link3" style="background-color: #F0F0F0;">
				<A href = "BrisanjeFilijale.jsp" id = "linkBrisanjefilijale" CLASS="navigacija">Brisanje filijale</A><BR>
					</TD></TR>
						<TR>
				<TD class="navigacija"  id="link4" style="background-color: #FFFFFF;">
				<A href = "PretragaIPregledFilijale.jsp" id = "linkPretragafilijale" CLASS="navigacija">Pretraga i pregled</A><BR>
					</TD></TR>
					</TABLE>	
		</TABLE>				
			
		</CENTER>
	</BODY>
</HTML>
