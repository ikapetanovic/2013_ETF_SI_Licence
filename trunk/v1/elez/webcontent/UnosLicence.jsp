<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Unesi licencu</title>
</head>

 	

<%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%
if (request.getParameter("odustani") != null) response.sendRedirect("PocetnaIT.jsp");

if (request.getParameter("UnesiLicencu")!=null) {
	String sbroj = request.getParameter("sbroj");
	String trajanje = request.getParameter("trajanje");
	String vrsta = request.getParameter("vrsta");
	String cijena = request.getParameter("cijena");
	String status = request.getParameter("status");
	String brojNabavljenih = request.getParameter("brojNabavljenih");
	String brojDostupnih = request.getParameter("brojDostupnih");
	String brojNabavke = request.getParameter("brojNabavke");
	String datumNabavke = request.getParameter("datumNabavke");
	
	boolean ispravno = true;
	String datumAktivacije = "";
	if (request.getParameter("licenciraj")!=null) {
	datumAktivacije = request.getParameter("datumNabavke");
	out.println("<h5 style=\"color:red;\"></h5>");
	try{
		DateFormat df = new SimpleDateFormat("dd.mm.yyyy");
		df.parse(datumAktivacije);
		} catch(Exception e){
			ispravno = false;
			out.println("<h5 style=\"color:red;\">Niste unijeli ispravan format datuma. Isparavan format datuma je: dd.mm.yyyy</h5>");
		}
	}

		String neki = request.getParameter("datumNabavke");
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

	LicencaDAO ldao=new LicencaDAO();
	try {
		if (ispravno)
		ldao.dodajLicencu(sbroj, Integer.parseInt(trajanje), vrsta,Float.parseFloat(cijena), status,Integer.parseInt(brojDostupnih),Integer.parseInt(brojNabavljenih),Integer.parseInt(brojNabavke), datumNabavke);
	} catch (Exception e) {
		out.println(e.getMessage());
	}
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
					<form action="UnosLicence.jsp" method=GET>
		<center><table>
		<tr><td>
		<LABEL>Serijski broj:&nbsp;</LABEL>		</td><td>
		<INPUT type = "text" name="sbroj">&nbsp;	</td></tr>	
		<tr><td>		
		<LABEL>Trajanje:&nbsp;</LABEL>		</td><td>
		<INPUT type = "text" name="trajanje">&nbsp;		</td></tr>
		<tr><td>		
		<LABEL>Vrsta:&nbsp;</LABEL>		</td><td>
		<INPUT type = "text" name="vrsta">&nbsp;		</td></tr>
		<tr><td>		
		<LABEL>Cijena:&nbsp;</LABEL>	</td><td>	
		<INPUT type = "text" name="cijena">&nbsp;	</td></tr>
		<tr><td>
		<LABEL>Status:&nbsp;</LABEL>	</td><td>	
		<INPUT type = "text" name="status">&nbsp;		</td></tr>
		<tr><td>	
		<LABEL>Broj nabavljenih:&nbsp;</LABEL></td><td>		
		<INPUT type = "text" name ="brojNabavljenih">&nbsp;	</td></tr>	
		<tr><td>
		<LABEL>Broj dostupnih:&nbsp;</LABEL>	</td>	<td>
		<INPUT type = "text" name="brojDostupnih">&nbsp;	</td></tr>	
		<tr><td>		
		<LABEL>Broj nabavke:&nbsp;</LABEL></td><td>		
		<INPUT type = "text" name="brojNabavke">&nbsp;	</td></tr>	
		<tr><td>		
		<LABEL>Datum nabavke:&nbsp;</LABEL>		</td><td>
		<INPUT type = "text" name="datumNabavke">&nbsp;	</td></tr>	
		<tr><td></td><td>		
		
		<INPUT type = "submit" name="UnesiLicencu" value="Unesi">&nbsp;<INPUT type = "submit" name="odustani" value="Odustani">&nbsp;</td></tr>

</table></center>
</form>
					
		
</td></tr>
<TR>
				<TD class="navigacija"  id="link2" style="background-color: #F0F0F0;">
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

	
