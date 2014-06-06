<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kreiranje korisnika</title>
</head>
<body>

<%@page import="DAO.*"%>
<%@page import="Klase.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>

<%
if (request.getParameter("odustani")!=null) response.sendRedirect("PocetnaAdministrator.jsp");
%> 

<%
	if (request.getParameter("kreirajKorisnika")!=null) 
	{
		
		String ime = request.getParameter("ime");		
		String prezime = request.getParameter("prezime");
		String brojTelefona = request.getParameter("brojTelefona");
		String email = request.getParameter("email");
		String privilegije = request.getParameter("privilegije");
		String lozinka = request.getParameter("lozinka");
		String lozinka2 = request.getParameter("lozinkaP");
		
		Korisnik k = new Korisnik();
		
		
		if (!k.provjeriImePrezime(ime) || !k.provjeriImePrezime(prezime) || !k.provjeriTelefon(brojTelefona) || !k.provjeriEmail(email) || !k.provjeriLozinku(lozinka))
		{
			out.println("Podaci nisu u validnom formatu.");
		}
		else if (!lozinka.equals(lozinka2))
		{
			out.println("Niste unijeli istu lozinku.");
		}
		else
		{
			KorisnikDAO kdao = new KorisnikDAO();
			String korisnickoIme = ime.substring(0, 1) + prezime;
			
			try 
			{
				List<Korisnik> korisnici = kdao.dajSveKorisnike(korisnickoIme);
				
				if (korisnici.size() > 0)
				{
					int broj = korisnici.size();
					korisnickoIme = korisnickoIme + broj;
				}		
				
				kdao.dodajKorisnika(ime, prezime, brojTelefona, email, korisnickoIme.toLowerCase(), lozinka, privilegije);		
				
				out.println("Korisnik je uspješno dodan u bazu.");
				
			}		
			catch (Exception e) 
			{
				out.println("Korisnik nije dodan u bazu.");
			}	
			
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
				<TD class="navigacija"  id="link1" style="background-color: #F0F0F0;">
				<A href = "KreiranjeKorisnika.jsp" id = "linkNoviKorisnik" CLASS="navigacija">Novi korisnik</A><BR>
					</TD>
					<TD id = "sporedniSadrzaj" rowspan="54">
					
					
					
					<FORM action="KreiranjeKorisnika.jsp" method=GET >
				<center><table><tr><td>
				
				<LABEL>Ime: &nbsp;</LABEL></td><td>
				<INPUT type = "text" name="ime" id="ime">&nbsp;
				</td></tr><tr><td>
				
				<LABEL>Prezime: &nbsp;</LABEL></td>
				<td>
				<INPUT type = "text" name="prezime" id="prezime">&nbsp;
				</td></tr><tr><td>
				
				<LABEL>Broj telefona: &nbsp;</LABEL></td>
				<td>
				<INPUT type = "text" name="brojTelefona" id="brojTelefona">&nbsp;
				</td></tr><tr><td>
				
				<LABEL>Email: &nbsp;</LABEL></td><td>
				<INPUT type = "text" name="email" id="email">&nbsp;
				</td></tr>
				<tr><td>
				
				<LABEL>Privilegije: &nbsp;</LABEL>
				</td><td><select name = "privilegije"> 
					<option>Administrator</option>
					<option>IT osoblje</option>
					<option>Ostali</option>
				</select></td></tr>
				
				
				<tr><td><LABEL>Lozinka: &nbsp;</LABEL></td><td>
				<INPUT type = "password" name="lozinka" id="lozinka">&nbsp;
				</td></tr>
				
				<tr><td><LABEL>Potvrdi lozinku: &nbsp;</LABEL></td><td>
				<INPUT type = "password" name="lozinkaP" id="lozinkP">&nbsp;
				</td></tr>
				
				
				<tr><td></td><td><br></td></tr>
				<tr><td></td><td><INPUT type = "submit" name="kreirajKorisnika" class="kreirajKorisnika" value=Spasi>	&nbsp; &nbsp; 	
				<INPUT type = "submit" name="odustani" id="odustani" value="Odustani"/>	
		</td></tr></table></center></FORM>
		
		
			
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
					<TD class="navigacija"  id="link4" style="background-color: #FFFFFF;">
				<A href = "PretragaIPregledKorisnika.jsp" id = "linkPregledKorisnika" CLASS="navigacija">Pregled korisnika</A><BR>
					</TD>
					
					
					</tr>
					<tr><td></td></tr>
					<tr><td></td></tr>
					
					
		</TABLE>				
			</TD></TR></TABLE>	
			
		</CENTER>
	</BODY>
</HTML>
