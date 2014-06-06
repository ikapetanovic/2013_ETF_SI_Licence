
		<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pretraga i pregled korisnika</title>
</head>
<body>


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
				<A href = "KreiranjeKorisnika.jsp" id = "linkNoviKorisnik" CLASS="navigacija">Novi korisnik</A><BR>
					</TD>
					<TD id = "sporedniSadrzaj" rowspan="13">
					
			<FORM action="PretragaIPregledKorisnika.jsp" method=GET >
				
				<CENTER>			
				<table><tr><td>
				<LABEL>Pretraga po: &nbsp;</LABEL>&nbsp;</td><td>
				<select name="opcija"> 
					<option>Ime</option>
					<option>Prezime</option>
				</select></td></tr>
				<tr><td>
				<LABEL>Unesi: &nbsp;</LABEL>	</td>			
				<td><INPUT type = "text" name="unos" id = "unos">&nbsp;</td>
				<td>
				<INPUT type = "submit" name="Pretrazi" id="Pretrazi" value="Pretraži">	
										</td></tr>
										<tr><td><br><br></td><td></td></tr></table>
										
				<TABLE id = "korisnikTabela">
					<TR>
						<TH>Ime</TH>
						<TH>Prezime</TH>
						<TH>Broj telefona</TH>
						<TH>Email</TH>
						<TH>Korisničko ime</TH>
						<TH>Lozinka</TH>
						<TH>Privilegije</TH>
						<TH>Datum kreiranja</TH>
					<TR>
					
<%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@page import="java.lang.*" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
 

if (request.getParameter("Pretrazi")!=null) 
{
	KorisnikDAO kdao = new KorisnikDAO();	
	List<Korisnik> korisnici = new ArrayList<Korisnik>();	
	String opcija = request.getParameter("opcija");

	if (opcija.equals("Ime")) 
		korisnici = kdao.selectKorisnikePoImenu(request.getParameter("unos"));
	else
		korisnici = kdao.selectKorisnikePoPrezimenu(request.getParameter("unos"));
	
	
	for (int i = 0; i < korisnici.size(); i++) 
	{
		out.println("<tr>");
		String ime = korisnici.get(i).getIme();
		String prezime = korisnici.get(i).getPrezime();
		String brojTelefona = korisnici.get(i).getBrojTelefona();
		String email = korisnici.get(i).getEmail();
		String korisnickoIme = korisnici.get(i).getKorisnickoIme();
		String lozinka = korisnici.get(i).getLozinka();
		String privilegije = korisnici.get(i).getPrivilegija();
		String datumKreiranja = korisnici.get(i).getDatumKreiranja();
		
		String izlaz = "<td>" + ime + "</td>" + "<td>" + prezime + "</td>"+ "<td>" + brojTelefona + "</td>"+ "<td>" + email + "</td>"+ "<td>" + korisnickoIme + "</td>"+ "<td>" + lozinka + "</td>"+ "<td>" + privilegije + "</td>"+ "<td>" + datumKreiranja + "</td>" ;
		out.println(izlaz);
		out.println("</tr>");
	}
}
%>					
					
									
				</TABLE>
			</CENTER>
				
	</FORM>
				</TD></TR>
				<tr>
				
				<TD class="navigacija"  id="link2" style="background-color: #FFFFFF;">
				<A href = "ModifikacijaKorisnika.jsp" id = "linkModifikacijaKorisnika" CLASS="navigacija">Modifikacija korisnika</A><BR>
					</TD></tr>
					
				<tr>
				
				<TD class="navigacija"  id="link3" style="background-color: #FFFFFF;">
				<A href = "BrisanjeKorisnika.jsp" id = "linkBrisanjeKorisnika" CLASS="navigacija">Brisanje korisnika</A><BR>
					</TD></tr>
					<tr>
					<TD class="navigacija"  id="link4" style="background-color: #F0F0F0;">
				<A href = "PretragaIPregledKorisnika.jsp" id = "linkPregledKorisnika" CLASS="navigacija">Pregled korisnika</A><BR>
					</TD>
					
					
					</tr>
					
					
		</TABLE>				
			</TD></TR></TABLE>	
			
		</CENTER>
	</BODY>
</HTML>
		

		