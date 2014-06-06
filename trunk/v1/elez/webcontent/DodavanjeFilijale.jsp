<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dodavanje filijale</title>
</head>
<body>
<%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@ page import="java.util.regex.*"%> 

<%
if (request.getParameter("Odustani")!=null) response.sendRedirect("PocetnaAdministrator.jsp");
 if (request.getParameter("Dodaj")!=null) {
	String naziv = request.getParameter("naziv");
	String adresa = request.getParameter("adresa");
	String grad = request.getParameter("grad");
	String brojTelefona = request.getParameter("brojTelefona");
	String eMail = request.getParameter("eMail");
	FilijalaDAO fdao=new FilijalaDAO();
	try {
		Pattern pt=Pattern.compile("^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"); 
		Matcher mt=pt.matcher(eMail); 
		boolean bl=mt.matches(); 
		Pattern pt1=Pattern.compile("\\d{3}-\\d{3}-\\d{3}"); 
		Matcher mt1=pt1.matcher(brojTelefona);
		boolean bl1=mt.matches(); 
		if(bl==false || bl1==false) 
		{ 
			out.println("Podaci nisu u validnom formatu."); 
		} 
		else 
		{
		fdao.dodajFilijalu(naziv,grad, adresa, brojTelefona, eMail);
		out.println("Uspješno dodano u bazu");
		}
	} catch (Exception e) {
		out.println(e.getMessage());
	}
	
}
%>	

<center>
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
				<TD class="navigacija"  id="link1" style="background-color: #F0F0F0;">
				<A href = "DodavanjaFilijale.jsp" id = "Kreiranjefilijale" CLASS="navigacija">Kreiranje filijale</A><BR>
					</TD>
					<TD id = "sporedniSadrzaj" rowspan="13">
					<CENTER>
							<FORM action="DodavanjeFilijale.jsp" method=GET >
							<table><tr><td>
<LABEL>Naziv: &nbsp;</LABEL></td><td>
				<INPUT type = "text" name="naziv" id="naziv">&nbsp;</td></tr>
				<tr><td>
<LABEL>Grad: &nbsp;</LABEL></td><td>
				<INPUT type = "text" name="grad" id="grad">&nbsp;</td></tr>
				<tr><td>
<LABEL>Adresa: &nbsp;</LABEL></td><td>
				<INPUT type = "text" name="adresa" id="adresa">&nbsp;</td></tr>
				<tr><td>			
<LABEL>Broj telefona(Ispravan format je: 000-000-000): &nbsp;</LABEL></td><td>
				<INPUT type = "text" name="brojTelefona" id="brojTelefona">&nbsp;</td></tr>
				<tr><td>				
<LABEL>E-mail(Ispravan format je: neko@nesto.com): &nbsp;</LABEL></td><td>
				<INPUT type = "text" name="eMail" id="eMail">&nbsp;</td></tr>
				<tr><td></td><td>				
				<INPUT type = "submit" name="Dodaj" id="Dodaj" value="Dodaj">
				<INPUT type = "submit" name="Odustani" id="Odustani" value="Odustani">	</td></tr></table>		
</FORM>
				</CENTER></TD></TR>
				<tr>
			<TD class="navigacija"  id="link2" style="background-color: #FFFFFF;">
				<A href = "ModifikacijaFilijale.jsp" id = "linkModifikacijaFilijale" CLASS="navigacija">Modifikacija filijale</A><BR>
					</TD></tr>
				<TR>
				<TD class="navigacija"  id="link3" style="background-color: #FFFFFF;">
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