<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Licenciranje</title>
</head>
<body>

<%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@page import="java.lang.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%boolean  ispravno = true;%>
<%

//
String datumAktivacije = "";
if (request.getParameter("licenciraj")!=null) {
datumAktivacije = request.getParameter("datumAktivacije");
out.println("<h5 style=\"color:red;\"></h5>");
try{
	DateFormat df = new SimpleDateFormat("dd.mm.yyyy");
	df.parse(datumAktivacije);
	} catch(Exception e){
		ispravno = false;
		out.println("<h5 style=\"color:red;\">Niste unijeli ispravan format datuma. Isparavan format datuma je: dd.mm.yyyy</h5>");
	}
}

	/*String neki = request.getParameter("datumAktivacije");
	String[] dt = neki.split("\\.");
	boolean validan = true;
	int mjesec = Integer.parseInt(dt[1]);
	int dan = Integer.parseInt(dt[0]);
	int godina =  Integer.parseInt(dt[2]);
	//out.println("<h5>dan:"+ dan  +"mjesec:" + mjesec + "godina"+ godina +"</h5>");
	if (mjesec < 1 || mjesec > 12 ) validan = false;
	if (dan < 1 || dan>31) validan = false;
	if(((mjesec == 4) || (mjesec == 6) || (mjesec == 9) || (mjesec == 11)) && (dan > 30)) validan = false;
	if (mjesec == 2) { 
		boolean uslov = ((godina % 4 == 0 || godina % 400 == 0 )&& (godina % 100 != 0));
		if (dan>29 || (dan>28 && !uslov)) {
			validan = false;
			}
	}
	if(godina<2013) validan = false;
	if (validan)
	out.println("<h5 style=\"color:red;\"></h5>");
	else {
		ispravno = false;
		out.println("<h5 style=\"color:red;\">Niste unijeli tacan datum.</h5>");
	}*/
//

if (request.getParameter("odustani")!=null) response.sendRedirect("PocetnaIT.jsp");
if (request.getParameter("licenciraj") != null) {
	LicenciranjeDAO DAO = new LicenciranjeDAO();
	String softver = request.getParameter("softver");
	String licenca = request.getParameter("licenca");
	String dAktivacije = request.getParameter("datumAktivacije");
	if (ispravno)
	DAO.dodajLicenciranje(dAktivacije, Integer.parseInt(softver),Integer.parseInt(licenca));
	
	LicencaDAO ldao = new LicencaDAO();
	Licenca odabrana = new Licenca();
	odabrana = ldao.selectLicencuPoIdu(Integer.parseInt(licenca));
	odabrana.setBrojDostupnih(odabrana.getBrojDostupnih() - 1);
	if (ispravno)
	ldao.updateLicencu(odabrana);
}

%>

<%


SoftverDAO sDAO = new SoftverDAO();
List<Softver> softveri = new ArrayList<Softver>();
softveri = sDAO.selectSveSoftvere();

LicencaDAO lDAO = new LicencaDAO();
List<Licenca> licence = new ArrayList<Licenca>();
licence = lDAO.selectSveLicence();

%>	
		<CENTER>
			<TABLE id = "glavnaTabela">
				
				<TR>
					<TD id = "glavniMeni">
					
					<a href="PretragaIPregledRacunara.jsp" class="glavniMeni" id="linkRacunari" > 
												Racunari
											</a> &nbsp;&nbsp;
											<a href="PretragaIPregledSoftvera.jsp" class="glavniMeni" id="linkSoftver"> 
												Softver
											</a> &nbsp;&nbsp;
											<a href="Licenciranje.jsp" class="glavniMeni" id="linkLicenciranje"> 
												Licence
											</a> &nbsp;&nbsp;
											
					
					</TD>
				</TR>
				<TR><TD id = "sporedniMeni"><a href="Prijava.jsp" class="sporedniMeni">Odjavi se</a></TD></TR>
				
				<TR><TD id = "sadrzaj">	
<TABLE style="border-collapse:collapse;">
			<TR>
				<TD class="navigacija"  id="link1" style="background-color: #F0F0F0;">
				<A href = "Licenciranje.jsp" id = "linkPregledRacunara" CLASS="navigacija">Licenciranje</A><BR>
					</TD>
					<TD id = "sporedniSadrzaj" rowspan="13">
<FORM action="Licenciranje.jsp" method=GET >
<center><table>
				<tr><td>
				
				<LABEL>Softver: &nbsp;</LABEL></td><td>
				<select name="softver" id="softver"> 
					<% 
					for (int i = 0; i<softveri.size(); i++) {
						String izlaz = "<option value=\"";
						izlaz += softveri.get(i).getIdSoftver();
						izlaz +="\">" + softveri.get(i).getNaziv() + "</option>";
						out.println(izlaz);
					}
					%>
				</select></td></tr>
				<tr><td>
				<LABEL>Licenca: &nbsp;</LABEL></td><td>
				<select name="licenca" id="licenca"> 
				<%
					for (int i = 0; i<licence.size(); i++) {
						String izlaz = "<option value=\"";
						izlaz += licence.get(i).getId();
						izlaz +="\">" + licence.get(i).getSerijskiBroj() + "</option>";
						out.println(izlaz);
					}
				%>
				</select></td></tr>
				<tr><td>			
				<LABEL>Datum aktivacije: &nbsp;</LABEL></td><td>
				<INPUT type = "text" name="datumAktivacije" id="datumAktivacije">&nbsp;</td></tr>
				<tr><td></td><td>		
				<br>
				<INPUT type = "submit" name="licenciraj" id="licenciraj" value="Licenciraj">&nbsp; 	<INPUT type = "submit" name="odustani" id="odustani" value="Odustani">&nbsp; 		</td></tr></table></center>
		</FORM>
					
		
</td></tr>
<TR>
				<TD class="navigacija"  id="link2" style="background-color: #FFFFFF;">
				<A href = "UnosLicence.jsp" id = "linkUnosLicence" CLASS="navigacija">Unos licence</A><BR>
					</TD></tr>
<TR>
				<TD class="navigacija"  id="link3" style="background-color: #FFFFFF;">
				<A href = "ModifikacijaLicence.jsp" id = "linkModifikacijaLicence" CLASS="navigacija">Modifikacija licence</A><BR>
					</TD></tr>
					
					<TR>
				<TD class="navigacija"  id="link4" style="background-color: #FFFFFF;">
				<A href = "PregledLicenci.jsp" id = "linkPregledLicenci" CLASS="navigacija">Pregled licenci</A><BR>
					</TD></tr>
					
						<TR>
				<TD class="navigacija"  id="link5" style="background-color: #FFFFFF;">
				<A href = "BrisanjeLicence.jsp" id = "linkIBrisanjeLicence" CLASS="navigacija">Brisanje licenci</A><BR>
					</TD></tr>
		</TABLE>				
			</TD></TR>
			</TABLE>	
			
		</CENTER>
	</BODY>
</HTML>

	
