<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
				<A href = "PretragaIPregledRacunara.jsp" id = "linkPregledRacunara" CLASS="navigacija">Pretraga računara</A><BR>
					</TD>
					<TD id = "sporedniSadrzaj" rowspan="13">
			
		<FORM>
				<CENTER>
				
				<LABEL>Pretraga po: &nbsp;</LABEL>
				<select name="opcija"> 
					<option value=1>Naziv hosta</option>
					<option value=2>Operativni sistem</option>
					<option value=3>Naziv filijale</option>
				</select>
				<br>
				<br>
				<LABEL>Unesi: &nbsp;</LABEL>				
				<INPUT type = "text" name="unos" id="unos">&nbsp;
				
				<INPUT type = "submit" name="Pretraži" id="Pretraži" value="Pretraži">						
				<br>
				<br>					
				<TABLE id = "RačunarTabela">
					<TR>
						<TH>Naziv hosta</TH>
						<TH>Operativni sistem</TH>
						<TH>Naziv filijale</TH>	
					</TR>
				
					
<%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@page import="java.lang.*" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
if (request.getParameter("Pretraži")!="") 
{
	RacunarDAO r = new RacunarDAO();
	FilijalaDAO f = new FilijalaDAO();
	List<Racunar> racunari = new ArrayList<Racunar>();
	String izabran = request.getParameter("opcija");
	try
	{

		if (izabran.equals("1")) 
		{
			racunari = r.selectRacunarPoImeHosta(request.getParameter("unos"));
		}

		else if (izabran.equals("2"))
		{
			racunari = r.selectRacunarPoOperativnomSistemu(request.getParameter("unos"));
		}

		else 
		{
			racunari = r.selectRacunarPoNazivuFilijale(request.getParameter("unos"));
		}
		for (int i = 0; i<racunari.size(); i++) 
		{
		
			out.println("<tr>");
			int idFilijala = racunari.get(i).getFilijala_idFilijala();
			Filijala filijala = f.selectFilijaluPoIdu(idFilijala);
			String nazivFilijale = filijala.getNaziv();
			String imeHosta = racunari.get(i).getImeHosta();
			String operativniSistem = racunari.get(i).getOperativniSistem();

			String izlaz = "<td>" + imeHosta + "</td>" + "<td>" + operativniSistem + "</td>"+ "<td>" + nazivFilijale + "</td>";
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

%>			</TABLE>
			
			</CENTER>		
		</FORM>

			</TD></TR><TR>
			<TD class="navigacija"  id="link2" style="background-color: #FFFFFF;">
				<A href = "Skeniranje.jsp" id = "linkSkeniranje" CLASS="navigacija">Detekcija računara</A><BR>
					</TD></TR>		
		</TABLE>				
			</TD></TR>	
				
			</TABLE>	
		</CENTER>
	</BODY>
</HTML>
