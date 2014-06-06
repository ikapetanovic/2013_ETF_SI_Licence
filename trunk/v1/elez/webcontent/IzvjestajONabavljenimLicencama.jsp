<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<CENTER>
			<TABLE id = "glavnaTabela">
				
				<TR>
					<TD id = "glavniMeni">
					
					<a href="KreiranjeIzvjestaja.jsp" class="glavniMeni" id="linkIzvjestaji" >
												Izvještaji
											</a> &nbsp;&nbsp;
											
											
					
					</TD>
				</TR>
				<TR><TD id = "sporedniMeni"><a href="Prijava.jsp" class="sporedniMeni">Odjavi se</a></TD></TR>
				
				<TR><TD id = "sadrzaj">	

<TABLE style="border-collapse:collapse;">
			<TR>
				<TD id = "sporedniSadrzaj" rowspan="13">
				<FORM>

<table>
<TR><TD class = "dugme">Početni datum: &nbsp;</TD><TD><INPUT type = "text"  name = "pocetniDatum" class="tekst"></TD></TR>
<TR><TD class = "dugme">Krajnji datum: &nbsp;</TD><TD><INPUT type = "text"  name = "krajnjiDatum" class="tekst"></TD></TR>
<TR><td><INPUT type = "submit" name="ispisi" id="ispisi" value="Ispiši"></td></TR>
</table>
<br>
<br>
<br>					
<table>
<tr>
<th>Naziv softvera</th>
<th>Broj verzije</th>
<th>Proizvođač</th>
<th>Serijski broj licence</th>
<th>Datum nabavke licence</th>
<th>Cijena licence</th>
<th>Trajanje licence</th>
<th>Vrsta licence</th>
<th>Broj nabavljenih licenci</th>
<th>Broj dostupnih licenci</th>
</tr>

<%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@page import="java.lang.*" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%boolean  ispravno = true;%>


<%
String pocetniDatum = "";
String krajnjiDatum = "";

if (request.getParameter("ispisi")!=null) 
{
	pocetniDatum = request.getParameter("pocetniDatum");
	krajnjiDatum = request.getParameter("krajnjiDatum");
	try
	{
	DateFormat df = new SimpleDateFormat("dd.mm.yyyy");
	df.parse(pocetniDatum);
	DateFormat ds = new SimpleDateFormat("dd.mm.yyyy");
	ds.parse(krajnjiDatum);
	} 
	catch(Exception e)
	{
		ispravno = false;
	}
	String prvi = request.getParameter("pocetniDatum");
	String drugi = request.getParameter("krajnjiDatum");
	String [] dp = prvi.split("\\.");
	String [] dd = drugi.split("\\.");
	boolean validan = true;
	int mjesecp = Integer.parseInt(dp[1]);
	int danp = Integer.parseInt(dp[0]);
	int godinap =  Integer.parseInt(dp[2]);
	int mjesecd = Integer.parseInt(dd[1]);
	int dand = Integer.parseInt(dd[0]);
	int godinad =  Integer.parseInt(dd[2]);
	if (mjesecp < 1 || mjesecp > 12 || mjesecd < 1 || mjesecd > 12) validan = false;
	if (danp < 1 || danp>31 || dand < 1 || dand>31) validan = false;
	if((((mjesecp == 4) || (mjesecp == 6) || (mjesecp == 9) || (mjesecp == 11)) && (danp > 30)) || (((mjesecd == 4) || (mjesecd == 6) || (mjesecd == 9) || (mjesecd == 11)) && (dand > 30))) validan = false;
	if (mjesecp == 2) 
	{ 
		boolean uslov = ((godinap % 4 == 0 || godinap % 400 == 0 )&& (godinap % 100 != 0));
		if (danp>29 || (danp>28 && !uslov)) 
		{
			validan = false;
		}
	}
	if (mjesecd == 2) 
	{ 
		boolean uslov = ((godinad % 4 == 0 || godinad % 400 == 0 )&& (godinad % 100 != 0));
		if (dand>29 || (dand>28 && !uslov)) 
		{
			validan = false;
		}
	}
	if(godinap<2013) validan = false;
	if(godinad<2013) validan = false;
	if (validan) out.println("<h5 style=\"color:red;\"></h5>");
	else 
	{
		ispravno = false;
		
	}
}

if (request.getParameter("ispisi")!="") 
{
	LicencaDAO ldao = new LicencaDAO();
	LicenciranjeDAO lidao = new LicenciranjeDAO();
	SoftverDAO sdao = new SoftverDAO();
	List<Licenca> licence = new ArrayList<Licenca>();
	licence = ldao.selectSveLicence();
	try
	{

		for (int i = 0; i<licence.size(); i++) 
		{
			out.println("<tr>");
			int idLicenca = (int)licence.get(i).getId();
			Licenciranje licenciranje = lidao.selectLicenciranjePoLicenci(idLicenca);
			int idSoftver = licenciranje.getSoftver_idSoftver();
			String datumAktivacije = licenciranje.getDatumAktivacije();
			Softver softver = sdao.selectSoftverPoID(idSoftver);
			String nazivSoftvera = softver.getNaziv();
			String proizvodjac = softver.getProizvodjac();
			String verzija = softver.getVerzija();
			String sbroj = licence.get(i).getSerijskiBroj();
			int trajanje = licence.get(i).getTrajanje();
			String vrsta= licence.get(i).getVrsta();
			float cijena= licence.get(i).getCijena();
			int brNabavljenih= licence.get(i).getBrojNabavljenih();
			int brDostupnih= licence.get(i).getBrojDostupnih();
			String datum= licence.get(i).getDatumNabavke();
			
			Date datumI;
			DateFormat di = new SimpleDateFormat("mm.dd.yyyy");
			datumI = di.parse(datumAktivacije);
			
			Date datumP;
			DateFormat dt = new SimpleDateFormat("mm.dd.yyyy");
			datumP = dt.parse(pocetniDatum);
			
			Date datumK;
			DateFormat dk = new SimpleDateFormat("mm.dd.yyyy");
			datumK = dk.parse(krajnjiDatum);
			
			Date datumKreiranja =  Calendar.getInstance().getTime();
			Format formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
			String datumKr = formatter.format(datumKreiranja);
			
			if((datumI.after(datumP) && datumI.before(datumK))|| datumI.equals(datumP) || datumI.equals(datumK))
			{
			out.println("<br>");
			out.println("<tr>");
			String izlaz = "<td>" + nazivSoftvera + "</td>" + "<td>" + verzija + "</td>" + "<td>" + proizvodjac + "</td>" + "<td>" + sbroj + "</td>" + "<td>" + datum + "</td>"+ "<td>" + cijena + "</td>"+ "<td>" + trajanje + "</td>"+ "<td>" + vrsta + "</td>"+ "<td>" + brNabavljenih + "</td>"+ "<td>" + brDostupnih + "</td>";
			out.println(izlaz);
			out.println("</tr>");
			out.println("<br>");
			out.println("<br>");
			out.println("<br>");
			out.println("Datum kreiranja: "+datumKr);
			}
		}
	}
	catch(Exception e)
	{
		out.println(" ");
	}
}
else
{
    out.println("Unesite podatke za pretragu!");
}
%>
</table>

</FORM>
				<tr><td></td></tr>
		</TABLE>
		</td></tr></table>
		</center>
		</body>
		</html>






