<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modifikacija filijale</title>
</head>
<body>
<%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.regex.*"%> 
<%
if (request.getParameter("odustani")!=null) response.sendRedirect("PocetnaAdministrator.jsp");
FilijalaDAO fdao = new FilijalaDAO();
List<Filijala> filijale = new ArrayList<Filijala>();
filijale = fdao.selectSveFilijale();
Filijala odabrana = new Filijala();
if (request.getParameter("odaberi") != null) {
	String izabrana = request.getParameter("izbor");
	int id = Integer.parseInt(izabrana);
	odabrana = fdao.selectFilijaluPoIdu(id);
}

if (request.getParameter("azurirajFilijalu") != null) {
	String izabrana = request.getParameter("izbor");
	int id = Integer.parseInt(izabrana);
	odabrana = fdao.selectFilijaluPoIdu(id);
	String naziv = request.getParameter("naziv");
	String grad = request.getParameter("grad");
	String adresa = request.getParameter("adresa");
	String brojTelefona = request.getParameter("brojTelefona");
	String eMail = request.getParameter("eMail");
	odabrana.setAdresa(adresa);
	odabrana.setNaziv(naziv);
	odabrana.setBrojTelefona(brojTelefona);
	odabrana.setGrad(grad);
	odabrana.seteMail(eMail);
	boolean ispravno = true;
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
		}else{
	fdao.updateFilijalu(odabrana);
	out.println("Filijala je uspješno modificirana");
		}
	} catch(Exception e){
		out.println(e.getMessage());
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
				<A href = "DodavanjeFilijale.jsp" id = "linkNoviKorisnik" CLASS="navigacija">Kreiranje filijale</A><BR>
					</TD>
					<TD id = "sporedniSadrzaj" rowspan="13">
			
		<FORM action="ModifikacijaFilijale.jsp" method=GET >
		<center><table><tr><td>
       <LABEL>Filijala: &nbsp;</LABEL></td>
				<td>
				<select name="izbor">
				<%
				int j = 0;
				if (request.getParameter("izbor")!=null) j = Integer.parseInt(request.getParameter("izbor"));
				for (int i = 0; i<filijale.size(); i++) {
					String izlaz = "";
					izlaz = "<option value=\"" + filijale.get(i).getId() + "\"";
					if (filijale.get(i).getId() == j) izlaz +=" selected ";
					izlaz+=   ">" + filijale.get(i).getNaziv()+ "  " +
						filijale.get(i).getAdresa() +"</option>";
					out.println(izlaz);
				}
				%>
				</select>
				<input type="submit" value="Odaberi" name="odaberi" >	
<LABEL> &nbsp;</LABEL>	</td>
<tr><td>
<br>	
<LABEL>Naziv: &nbsp;</LABEL></td><td>
				<% 
				String p0 = "<input type=\"text\" name=\"naziv\" value=\"";
				if (request.getParameter("odaberi") != null) p0 += odabrana.getNaziv();
				p0 += "\">";
				out.println(p0);
				%>
				            <tr><td>
<LABEL>Grad: &nbsp;</LABEL></td><td>
	            <% 
				String p2 = "<input type=\"text\" name=\"grad\" value=\"";
				if (request.getParameter("odaberi") != null) p2 += odabrana.getGrad();
				p2 += "\">";
				out.println(p2);
				%>				<tr><td>
<LABEL>Adresa: &nbsp;</LABEL></td><td>
	            <% 
				String p1 = "<input type=\"text\" name=\"adresa\" value=\"";
				if (request.getParameter("odaberi") != null) p1 += odabrana.getAdresa();
				p1+= "\">";
				out.println(p1);
				%>				<tr><td>			
<LABEL>Broj telefona: &nbsp;</LABEL></td><td>
	            <% 
				String p3 = "<input type=\"text\" name=\"brojTelefona\" value=\"";
				if (request.getParameter("odaberi") != null) p3 += odabrana.getBrojTelefona();
				p3 += "\">";
				out.println(p3);
				%>				<tr><td>				
<LABEL>E-mail: &nbsp;</LABEL></td><td>
	<% 
				String p4 = "<input type=\"text\" name=\"eMail\" value=\"";
				if (request.getParameter("odaberi") != null) p4 += odabrana.geteMail();
				p4 += "\">";
				out.println(p4);
				%>				<tr><td></td><td>				
				<INPUT type = "submit" name="azurirajFilijalu" id="azurirajFilijalu" value="Spasi promjene"/>&nbsp;<input type="button" name="odustani" id="odustani" value="Odustani"/></td></tr></table></center>			
</FORM>
				
			</TD></TR>
			<tr>
			<TD class="navigacija"  id="link2" style="background-color: #F0F0F0;">
				<A href = "ModifikacijaFilijale.jsp" id = "linkModifikacijaFilijale" CLASS="navigacija">Modifikacija filijale</A><BR>
					</TD></tr>
					<tr>
			<TD class="navigacija"  id="link3" style="background-color: #FFFFFF;">
				<A href = "BrisanjeFilijale.jsp" id = "linkMo" CLASS="navigacija">Brisanje filijale</A><BR>
					</TD></tr>
					<TR>
				<TD class="navigacija"  id="link4" style="background-color: #FFFFFF;">
				<A href = "PretragaIPregledFilijale.jsp" id = "linkPretragafilijale" CLASS="navigacija">Pretraga i pregled</A><BR>
					</TD></TR>
					</TABLE>	
			
		</CENTER>
	</BODY>
</HTML>