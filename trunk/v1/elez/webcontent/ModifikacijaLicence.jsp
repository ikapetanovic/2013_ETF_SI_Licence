<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modifikacija licence</title>
</head>
<%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@page import="java.lang.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
if (request.getParameter("odustani") != null) response.sendRedirect("PocetnaIT.jsp");
LicencaDAO licDAO = new LicencaDAO();
List<Licenca> licence = new ArrayList<Licenca>();
licence = licDAO.selectSveLicence();
Licenca odabrana = new Licenca();
if (request.getParameter("odaberi") != null) {
	String izabrana = request.getParameter("izbor");
	int id = Integer.parseInt(izabrana);
	odabrana = licDAO.selectLicencuPoIdu(id);
}

if (request.getParameter("azurirajLicencu") != null) {
	String izabrana = request.getParameter("izbor");
	int id = Integer.parseInt(izabrana);
	odabrana = licDAO.selectLicencuPoIdu(id);
	String sbroj = request.getParameter("sbroj");
	String trajanje = request.getParameter("trajanje");
	String brnabavljenih = request.getParameter("brnabavljenih");
	String vrsta = request.getParameter("vrsta");
	String brnabavke = request.getParameter("brnabavke");
	String datumnabavke = request.getParameter("datumnabavke");
	String cijena = request.getParameter("cijena");
	odabrana.setSerijskiBroj(sbroj);
	odabrana.setTrajanje(Integer.parseInt(trajanje));
	odabrana.setBrojNabavljenih(Integer.parseInt(brnabavljenih));
	odabrana.setVrsta(vrsta);
	odabrana.setBrojNabavke(Integer.parseInt(brnabavke));
	odabrana.setDatumNabavke(datumnabavke);
	odabrana.setCijena(Float.parseFloat(cijena));
	
	boolean ispravno = true;
	String datumAktivacije = "";
	if (request.getParameter("licenciraj")!=null) {
	datumAktivacije = request.getParameter("datumnabavke");
	out.println("<h5 style=\"color:red;\"></h5>");
	try{
		DateFormat df = new SimpleDateFormat("dd.mm.yyyy");
		df.parse(datumAktivacije);
		} catch(Exception e){
			ispravno = false;
			out.println("<h5 style=\"color:red;\">Niste unijeli ispravan format datuma. Isparavan format datuma je: dd.mm.yyyy</h5>");
		}
	}

		String neki = request.getParameter("datumnabavke");
		String [] dt = neki.split("\\.");
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
		}
	if (ispravno)
	licDAO.updateLicencu(odabrana);
}

%>


<body>
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
				<TD class="navigacija"  id="link1" style="background-color: #FFFFFF;">
				<A href = "Licenciranje.jsp" id = "linkPregledRacunara" CLASS="navigacija">Licenciranje</A><BR>
					</TD>
					<TD id = "sporedniSadrzaj" rowspan="13">

<FORM action="ModifikacijaLicence.jsp" method=GET >
				<center>
				<table>
				<tr>
				<td>Licenca: &nbsp;</td>
				<td>
				<select name="izbor">
				<%
				int j = 0;
				if (request.getParameter("izbor")!=null) j = Integer.parseInt(request.getParameter("izbor"));
				for (int i = 0; i<licence.size(); i++) {
					String izlaz = "";
					izlaz = "<option value=\"" + licence.get(i).getId() + "\"";
					if (licence.get(i).getId() == j) izlaz +=" selected ";
					izlaz+=   ">" + licence.get(i).getSerijskiBroj() + "  " +
						licence.get(i).getVrsta() +"</option>";
					out.println(izlaz);
				}
				%>
				</select>
				<input type="submit" value="Odaberi" name="odaberi" >
				</td>
				</tr>
				<tr>
				<td>
				<LABEL>Serijski broj: &nbsp;</LABEL>
				</td>
				<td>
				<% 
				String p0 = "<input type=\"text\" name=\"sbroj\" value=\"";
				if (request.getParameter("odaberi") != null) p0 += odabrana.getSerijskiBroj();
				p0 += "\">";
				out.println(p0);
				%>
				 </td></tr>
				
				<tr>
				<td>
				<LABEL>Trajanje: &nbsp;</LABEL>
				</td>
				<td>
				<% 
				String p1 = "<input type=\"text\" name=\"trajanje\" value=\"";
				if (request.getParameter("odaberi") != null) p1 += odabrana.getTrajanje();
				p1 += "\">";
				out.println(p1);
				%>
				 </td></tr>
				<tr>
				<td>				
				<LABEL>Broj nabavljenih: &nbsp;</LABEL>
				</td>
				<td>
				<% 
				String p2 = "<input type=\"text\" name=\"brnabavljenih\" value=\"";
				if (request.getParameter("odaberi") != null) p2 += odabrana.getBrojNabavljenih();
				p2 += "\">";
				out.println(p2);
				%>
				</td></tr>
				<tr>
				<td>		
					
				<LABEL>Vrsta: &nbsp;</LABEL>
				</td>
				<td>
				<% 
				String p3 = "<input type=\"text\" name=\"vrsta\" value=\"";
				if (request.getParameter("odaberi") != null) p3 += odabrana.getVrsta();
				p3 += "\">";
				out.println(p3);
				%>
				</td></tr>
				<tr>
				<td>
				<LABEL>Broj nabavke: &nbsp;</LABEL>
				</td>
				<td>
				<% 
				String p4 = "<input type=\"text\" name=\"brnabavke\" value=\"";
				if (request.getParameter("odaberi") != null) p4 += odabrana.getBrojNabavke();
				p4 += "\">";
				out.println(p4);
				%>
				</td></tr>
				<tr>
				<td>
				<LABEL>Datum nabavke: &nbsp;</LABEL>
				</td>
				<td>
				<% 
				String p5 = "<input type=\"text\" name=\"datumnabavke\" value=\"";
				if (request.getParameter("odaberi") != null) p5 += odabrana.getDatumNabavke();
				p5 += "\">";
				out.println(p5);
				%>
				</td></tr>
				<tr>
				<td>
				<LABEL>Cijena: &nbsp;</LABEL>
				</td>
				<td>
				<% 
				String p6 = "<input type=\"text\" name=\"cijena\" value=\"";
				if (request.getParameter("odaberi") != null) p6 += odabrana.getCijena();
				p6 += "\">";
				out.println(p6);
				%>
				</td></tr>
			
				<tr>
				<td></td><td>
				<INPUT type = "submit" name="azurirajLicencu" id="azurirajLicencu" value=Ažuriraj>		&nbsp;
				<INPUT type = "submit" name="odustani" id="odustani" value="Odustani">		&nbsp;	
	</td></tr></table>	</center></FORM>
</td></tr>
<TR>
				<TD class="navigacija"  id="link2" style="background-color: #FFFFFF;">
				<A href = "UnosLicence.jsp" id = "linkUnosLicence" CLASS="navigacija">Unos licence</A><BR>
					</TD></tr>
<TR>
				<TD class="navigacija"  id="link3" style="background-color: #F0F0F0;">
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

	
