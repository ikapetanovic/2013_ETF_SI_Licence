<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Brisanje korisnika</title>
</head>
<body>

<%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.util.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

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
				<TR><TD id = "sporedniMeni">
				<a href="#" class="sporedniMeni">Odjavi se</a></TD></TR>
				
				<TR><TD id = "sadrzaj">	
<TABLE style="border-collapse:collapse;">
			<TR>
				<TD class="navigacija"  id="link1" style="background-color: #FFFFFF;">
				<A href = "KreiranjeKorisnika.jsp" id = "linkNoviKorisnik" CLASS="navigacija">Novi korisnik</A><BR>
					</TD>
					<TD id = "sporedniSadrzaj" rowspan="13">
			<FORM action="BrisanjeKorisnika.jsp" method=GET >
			<table>
			<tr><td valign="top">
				
				</td>
				
				<td>		
				&nbsp;&nbsp;
				<select name="odabrani" style="width:300px;"> 

<%

	System.out.println(request.getParameter("odabrani"));
	
	try
	{
		if (request.getParameter("brisiKorisnika")!=null) 
		{
			KorisnikDAO kdao = new KorisnikDAO();
			String id = request.getParameter("odabrani");
			kdao.deleteKorisnik(Integer.parseInt(id));
			out.println("Korisnik je izbrisan.");
		}
	}
	catch (Exception e)
	{
		out.println("Korisnik nije izbrisan!");
	}

	try
	{
		KorisnikDAO kdao = new KorisnikDAO();
		List<Korisnik> korisnici = new ArrayList<Korisnik>();
		korisnici = kdao.selectSveKorisnike();
		
		for (int i = 0; i<korisnici.size(); i++) 
		{
			long id = korisnici.get(i).getidKorisnik();
			String ime = korisnici.get(i).getIme();
			String prezime = korisnici.get(i).getPrezime();			
			String korisnickoIme = korisnici.get(i).getKorisnickoIme();			
			String privilegije = korisnici.get(i).getPrivilegija();
			
			// option value="1" >
			String izlaz = "<option value=\""+ id + "\" >" + ime + " | " + prezime + " | " + korisnickoIme + " | " + privilegije + "</option>" ;
			out.println(izlaz);
		}
	}
	catch (Exception e)
	{
		out.println(e.getMessage());
	}
	
%>
				</select>
				
				
						</td><td valign="top">
				&nbsp;&nbsp;<INPUT type = "submit" name="brisiKorisnika" id="brisiKorisnika" value=Briši>			
		</td></tr></table></FORM>
				</TD></TR>
				<tr>
				
				<TD class="navigacija"  id="link2" style="background-color: #FFFFFF;">
				<A href = "ModifikacijaKorisnika.jsp" id = "linkModifikacijaKorisnika" CLASS="navigacija">Modifikacija korisnika</A><BR>
					</TD></tr>
					
				<tr>
				
				<TD class="navigacija"  id="link3" style="background-color: #F0F0F0;">
				<A href = "BrisanjeKorisnika.jsp" id = "linkBrisanjeKorisnika" CLASS="navigacija">Brisanje korisnika</A><BR>
					</TD></tr>
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
