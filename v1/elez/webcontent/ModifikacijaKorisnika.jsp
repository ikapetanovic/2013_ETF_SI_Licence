<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modifikacija korisnika</title>
</head>

<%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
	if (request.getParameter("odustani")!=null) response.sendRedirect("PocetnaAdministrator.jsp");
	
	KorisnikDAO kdao = new KorisnikDAO();
	List<Korisnik> korisnici = new ArrayList<Korisnik>();
	korisnici = kdao.selectSveKorisnike(); 
	Korisnik odabran = new Korisnik();
	

	if (request.getParameter("odaberi") != null) 
	{
		String izabran = request.getParameter("izbor");
		int id = Integer.parseInt(izabran);
		odabran = kdao.selectKorisnikaPoIdu(id);
	}
	
	if (request.getParameter("azurirajKorisnika") != null) 
	{
		String izabran = request.getParameter("izbor");
		int id = Integer.parseInt(izabran);
		
		odabran = kdao.selectKorisnikaPoIdu(id);

		String ime = request.getParameter("ime");		
		String prezime = request.getParameter("prezime");
		String brojTelefona = request.getParameter("brojTelefona");
		String email = request.getParameter("email");
		String privilegije = request.getParameter("privilegije");
		String lozinka = request.getParameter("lozinka");
		
		
		odabran.setIme(ime);
		odabran.setPrezime(prezime);
		odabran.setBrojTelefona(brojTelefona);
		odabran.setEmail(email);
		odabran.setPrivilegija(privilegije);
		odabran.setLozinka(lozinka);
		
		
		if (!odabran.provjeriImePrezime(ime) || !odabran.provjeriImePrezime(prezime) || !odabran.provjeriTelefon(brojTelefona) || !odabran.provjeriEmail(email) || !odabran.provjeriLozinku(lozinka))
		{
			out.println("Podaci nisu u validnom formatu.");
		}		
		else
		{ 
			try 
			{
				kdao.updateKorisnika(odabran);
				out.println("Podaci su uspješno ažurirani.");				
			}		
			catch (Exception e) 
			{
				out.println(e.getMessage());
			}			
		}
	}

%>



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
<FORM action="ModifikacijaKorisnika.jsp" method=GET >
				<center>
				<table>
				
				<tr>
				<td>Korisnik: &nbsp;</td>
				<td>
				<select name="izbor">
				<%
				
				int j = 0;
				if (request.getParameter("izbor")!=null) 
					j = Integer.parseInt(request.getParameter("izbor"));
				
				for (int i = 0; i<korisnici.size(); i++) 
				{
					String izlaz = "";
					izlaz = "<option value=\"" + korisnici.get(i).getidKorisnik() + "\"";
					if (korisnici.get(i).getidKorisnik() == j) 
						izlaz += " selected ";
					izlaz += ">" + korisnici.get(i).getIme() + "  " + korisnici.get(i).getPrezime() + " " + korisnici.get(i).getKorisnickoIme() + "</option>";
					out.println(izlaz);
				}
				
				%>
				</select>
				
				<input type="submit" value="Odaberi" name="odaberi" >
				</td>
				</tr>
				
				<tr>
				<td>
				<LABEL>Ime: &nbsp;</LABEL>
				</td>
				<td>
				<% 
					String p0 = "<input type=\"text\" name=\"ime\" value=\"";
					if (request.getParameter("odaberi") != null) 
						p0 += odabran.getIme();
					p0 += "\">";
					out.println(p0);
				%>
				
				</td></tr>
				
				<tr>
				<td>
				<LABEL>Prezime: &nbsp;</LABEL>
				</td>
				<td>
				
					<%
					String p1 = "<input type=\"text\" name=\"prezime\" value=\"";
					if (request.getParameter("odaberi") != null) 
						p1 += odabran.getPrezime();
					p1 += "\">";
					out.println(p1);
					%>
					
					
					
				 </td></tr>
				<tr>
				<td>				
				<LABEL>Broj telefona: &nbsp;</LABEL>
				</td>
				<td>
					<% 
					String p2 = "<input type=\"text\" name=\"brojTelefona\" value=\"";
					if (request.getParameter("odaberi") != null) 
						p2 += odabran.getBrojTelefona();
					p2 += "\">";
					out.println(p2);
					%>
				 </td></tr>
				<tr>
				<td>	
				<LABEL>Email: &nbsp;</LABEL>
				</td>
				<td>
					<% 
					String p3 = "<input type=\"text\" name=\"email\" value=\"";
					if (request.getParameter("odaberi") != null) 
						p3 += odabran.getEmail();
					p3 += "\">";
					out.println(p3);
					%>
				 </td></tr>
				<tr>
				<td>
				<LABEL>Privilegije: &nbsp;</LABEL>
				</td>
				<td>
				
				
				
				<select name = "privilegije"> 
					<option>Administrator</option>
					<option>IT osoblje</option>
					<option>Ostali</option>
				</select>
				
				
				
				</td></tr>
				<tr>
				<td>
				
				
				<LABEL>Lozinka: &nbsp;</LABEL>
				</td>
				<td>
					<% 
					String p5 = "<input type=\"password\" name=\"lozinka\" value=\"";
					if (request.getParameter("odaberi") != null) 
						p5 += odabran.getLozinka();
					p5 += "\">";
					out.println(p5);
					%>
				 </td></tr>
				<tr>
				<td>
				</td><td>
			
				

				<INPUT type = "submit" name="azurirajKorisnika" id="azurirajKorisnika" value=Ažuriraj>	&nbsp;
				<INPUT type = "submit" name="odustani" id="odustani" value="Odustani"/>

	</td></tr></table>	</center></FORM>

				</TD></TR>
				<tr>
				
				<TD class="navigacija"  id="link2" style="background-color: #F0F0F0;">
				<A href = "ModifikacijaKorisnika.jsp" id = "linkModifikacijaKorisnika" CLASS="navigacija">Modifikacija korisnika</A><BR>
					</TD></tr>
					
				<tr>
				
				<TD class="navigacija"  id="link3" style="background-color: #FFFFFF;">
				<A href = "BrisanjeKorisnika.jsp" id = "linkBrisanjeKorisnika" CLASS="navigacija">Brisanje korisnika</A><BR>
					</TD></tr>
					<tr><td></td></tr>
					<tr>
					<TD class="navigacija"  id="link4" style="background-color: #FFFFFF;">
				<A href = "PretragaIPregledKorisnika.jsp" id = "linkPregledKorisnika" CLASS="navigacija">Pregled korisnika</A><BR>
					</TD>
					
					
					</tr>
					
					
		</TABLE>				
			</TD></TR></TABLE>	
			
		</CENTER>
	</BODY>
</HTML>
