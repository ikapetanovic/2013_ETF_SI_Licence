<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Brisanje licence</title>
</head>
<body>
					<%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@page import="java.lang.*" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
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
		<FORM action="BrisanjeLicence.jsp" method=GET >
			<table>
			<tr><td valign="top">
				<input type="text" name="unosPretrage"/>&nbsp;&nbsp;<input type="submit" name="trazi" value="Traži"/>
				</td>
				<td>		
				&nbsp;&nbsp;<select name="odabrani" style="width:300px;"> 
<%

System.out.println(request.getParameter("odabrani"));
if (request.getParameter("brisiLicencu")!=null) {
	LicencaDAO lic = new LicencaDAO();
	String id = request.getParameter("odabrani");
	lic.deleteLicenca( Integer.parseInt(id) );
}

	LicencaDAO lic = new LicencaDAO();
	List<Licenca> licence = new ArrayList<Licenca>();
	if (request.getParameter("trazi")!= null) licence = lic.selectLicencuPoSerijskomBroju(request.getParameter("unosPretrage"));
	else licence = lic.selectSveLicence();
	
	for (int i = 0; i<licence.size(); i++) {
		long ide = licence.get(i).getId();
		String sbroj = licence.get(i).getSerijskiBroj();
		int trajanje = licence.get(i).getTrajanje();
		String vrsta= licence.get(i).getVrsta();
		float cijena= licence.get(i).getCijena();
		String status= licence.get(i).getStatus();
		int brNabavljenih= licence.get(i).getBrojNabavljenih();
		int brDostupnih= licence.get(i).getBrojDostupnih();
		int brNabavke= licence.get(i).getBrojNabavke();
		String datum= licence.get(i).getDatumNabavke();
		// option value="1" >
		String izlaz = "<option value=\""+ ide + "\" >" + sbroj + " " + trajanje + " " + vrsta + " " + cijena + " " + status + " " + brNabavljenih + " " + brDostupnih + " " + brNabavke + " " + datum + "</option>" ;
		out.println(izlaz);
	}
%>		
					
				</select>
						</td><td valign="top">
				&nbsp;&nbsp;<INPUT type = "submit" name="brisiLicencu" id="brisiLicencu" value=Briši>			
		</td></tr></table></FORM>
		
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
				<TD class="navigacija"  id="link5" style="background-color: #F0F0F0;">
				<A href = "BrisanjeLicence.jsp" id = "linkIBrisanjeLicence" CLASS="navigacija">Brisanje licenci</A><BR>
					</TD></tr>
		</TABLE>				
			</TD></TR>
			</TABLE>	
			
		</CENTER>
	</BODY>
</HTML>

	
