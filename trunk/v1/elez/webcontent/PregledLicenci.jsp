<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pregled licenci</title>
</head>
<body>
		<CENTER>
		<FORM action="PregledLicenci.jsp" method=GET >
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
		
				                                     
				<CENTER>			
				<table><tr><td>
				<LABEL>Pretraga po: &nbsp;</LABEL>&nbsp;</td><td>
				<select name="opcija"> 
					<option value="1">Serijski broj</option>
					<option value="2">Vrsta</option>
				</select></td></tr>
				<tr><td>
				<LABEL>Unesi: &nbsp;</LABEL>	</td>			
				<td><INPUT type = "text" name="unos" id = "unos">&nbsp;</td>
				<td>
				<INPUT type = "submit" name="Pretrazi" id="Pretrazi" value="Pretrazi">	
										</td></tr>
										<tr><td><br><br></td><td></td></tr></table>
										
				<TABLE id = "licenceTabela">
					<TR>
						<th>Serijski broj</th>
						<th>Trajanje</th>
						<th>Vrsta</th>
						<th>Cijena</th>
						<th>Status</th>
						<th>Broj nabavljenih</th>
						<th>Broj dostupnih</th>
						<th>Broj nabavke</th>
						<th>Datum nabavke</th>
					<TR>
<%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@page import="java.lang.*" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%
 
//System.out.println(request.getParameter("opcija"));
if (request.getParameter("Pretrazi")!=null) {
	LicencaDAO lic = new LicencaDAO();
	List<Licenca> licence = new ArrayList<Licenca>();
	String opcija = request.getParameter("opcija");
	int izabran = Integer.parseInt(opcija);

	if (izabran == 2) {
		licence = lic.selectLicencuPoVrsti(request.getParameter("unos"));

	}
	else {
		licence = lic.selectLicencuPoSerijskomBroju(request.getParameter("unos"));

	}
	
	for (int i = 0; i<licence.size(); i++) {
		out.println("<tr>");
		String sbroj = licence.get(i).getSerijskiBroj();
		int trajanje = licence.get(i).getTrajanje();
		String vrsta= licence.get(i).getVrsta();
		float cijena= licence.get(i).getCijena();
		String status= licence.get(i).getStatus();
		int brNabavljenih= licence.get(i).getBrojNabavljenih();
		int brDostupnih= licence.get(i).getBrojDostupnih();
		int brNabavke= licence.get(i).getBrojNabavke();
		String datum= licence.get(i).getDatumNabavke();
		
		String izlaz = "<td>" + sbroj + "</td>" + "<td>" + trajanje + "</td>"+ "<td>" + vrsta + "</td>"+ "<td>" + cijena + "</td>"+ "<td>" + status + "</td>"+ "<td>" + brNabavljenih + "</td>"+ "<td>" + brDostupnih + "</td>"+ "<td>" + brNabavke + "</td>"+ "<td>" + datum + "</td>" ;
		out.println(izlaz);
		out.println("</tr>");
	}
}
%>		
				</TABLE>
			</CENTER>
				
	                                            	
		
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
				<TD class="navigacija"  id="link4" style="background-color: #F0F0F0;">
				<A href = "PregledLicenci.jsp" id = "linkPregledLicenci" CLASS="navigacija">Pregled licenci</A><BR>
					</TD></tr>
					
						<TR>
				<TD class="navigacija"  id="link5" style="background-color: #FFFFFF;">
				<A href = "BrisanjeLicence.jsp" id = "linkIBrisanjeLicence" CLASS="navigacija">Brisanje licenci</A><BR>
					</TD></tr>
		</TABLE>		
			</TD></TR>
			</TABLE>	
			</FORM>		
		</CENTER>
	</BODY>
</HTML>

	
