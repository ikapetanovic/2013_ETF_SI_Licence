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
				<A href = "PretragaIPregledSoftvera.jsp" id = "linkPregledSoftvera" CLASS="navigacija">Pregled softvera</A><BR>
					</TD>
					<TD id = "sporedniSadrzaj" rowspan="13">
			
			<FORM>
			<CENTER>
				
				<LABEL>Pretraga po: &nbsp;</LABEL>
				<select name="opcija">
					<option value=1>Naziv softvera</option>
					<option value=2>Proizvođač</option>
					<option value=3>Datum instalacije</option>
				</select>
				<br>
				<br>
				
				<LABEL>Unesi: &nbsp;</LABEL>				
				<INPUT type = "text" name="unos" id="unos">&nbsp;
				
				<INPUT type = "submit" name="Pretraži" id="Pretraži" value="Pretraži">	
				<br>
				<br>					
										
				<TABLE id = "softverTabela">
					<TR>
						<TH>Računar</TH>
						<TH>Naziv softvera</TH>
						<TH>Verzija</TH>
						<TH>Proizvođač</TH>
						<TH>Datum instalacije</TH>
					</TR>
		
					
<%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@page import="java.lang.*" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%boolean  ispravno = true;%>

<%

if (request.getParameter("Pretraži")!="") 
{
	SoftverDAO s = new SoftverDAO();
	RacunarDAO r = new RacunarDAO();
	List<Softver> softveri = new ArrayList<Softver>();
	String izabran = request.getParameter("opcija");
	
	try
	{

		if (izabran.equals("1")) 
		{
			softveri = s.selectSoftverPoNazivu(request.getParameter("unos"));
		}

		else if (izabran.equals("2"))
		{
			softveri = s.selectSoftverPoProizvodjacu(request.getParameter("unos"));
		}

		else 
		{
			String datumI = "";
			datumI = request.getParameter("unos");
			out.println("<h5 style=\"color:red;\"></h5>");
			try
			{
				DateFormat df = new SimpleDateFormat("dd.mm.yyyy");
				df.parse(datumI);
			} 
			catch(Exception e)
			{
				ispravno = false;
				out.println("<h5 style=\"color:red;\">Niste unijeli ispravan format datuma. Isparavan format datuma je: dd.mm.yyyy</h5>");
			}
			String neki = request.getParameter("unos");
			String [] dt = neki.split("\\.");
			boolean validan = true;
			int mjesec = Integer.parseInt(dt[1]);
			int dan = Integer.parseInt(dt[0]);
			int godina =  Integer.parseInt(dt[2]);
			if (mjesec < 1 || mjesec > 12 ) validan = false;
			if (dan < 1 || dan>31) validan = false;
			if(((mjesec == 4) || (mjesec == 6) || (mjesec == 9) || (mjesec == 11)) && (dan > 30)) validan = false;
			if (mjesec == 2) 
			{ 
				boolean uslov = ((godina % 4 == 0 || godina % 400 == 0 )&& (godina % 100 != 0));
				if (dan>29 || (dan>28 && !uslov)) 
				{
					validan = false;
				}
			}
			if(godina<2013) validan = false;
			if (validan) out.println("<h5 style=\"color:red;\"></h5>");
			else 
			{
				ispravno = false;
				out.println("<h5 style=\"color:red;\">Niste unijeli tacan datum.</h5>");
				
			}
			softveri = s.selectSoftverPoDatumuInstalacije(request.getParameter("unos"));
		}
		
		for (int i = 0; i<softveri.size(); i++) 
		{
			
			out.println("<tr>");
			int idRacunar = softveri.get(i).getRacunar_idRacunar();
			Racunar racunar = r.selectRacunarPoID(idRacunar);
			String imeHosta = racunar.getImeHosta();
			String nazivSoftvera = softveri.get(i).getNaziv();
			String verzija = softveri.get(i).getVerzija();
			String proizvodjac = softveri.get(i).getProizvodjac();
			String datumInstalacije = softveri.get(i).getDatumInstalacije();

			String izlaz = "<td>" + imeHosta + "</td>" + "<td>" + nazivSoftvera + "</td>"+ "<td>" + verzija + "</td>"+ "<td>" + proizvodjac + "</td>"+ "<td>" + datumInstalacije + "</td>";
			out.println(izlaz);
			out.println("</tr>");
		
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
				
			</TABLE>	
			</CENTER>
			
		</FORM>
</TD></TR><TR>
			<TD class="navigacija"  id="link2" style="background-color: #FFFFFF;">
				<A href = "DetekcijaSoftvera.jsp" id = "linkSkeniranje" CLASS="navigacija">Detekcija softvera</A><BR>
					</TD></TR>
					
		</TABLE>				
			</TD></TR></TABLE>	
			
		</CENTER>
	</BODY>
</HTML>


		