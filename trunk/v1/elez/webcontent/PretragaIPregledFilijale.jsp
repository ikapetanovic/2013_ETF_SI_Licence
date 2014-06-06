	

    <%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>
    <LINK rel = "stylesheet" href = "stil.css" type = "text/css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Pretraga i pregled filijale</title>
    </head>
    <body>
 <%
 if (request.getParameter("odustani")!=null) response.sendRedirect("PocetnaAdministrator.jsp");

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
				<A href = "DodavanjeFilijale.jsp" id = "Kreiranjefilijale" CLASS="navigacija">Kreiranje filijale</A><BR>
					</TD>
					<TD id = "sporedniSadrzaj" rowspan="13">
					<CENTER>
    <FORM action="PretragaIPregledFilijale.jsp" method=GET >
                            <CENTER>
                                    <LABEL>Pretraga po: &nbsp;</LABEL>
                                    <select name="opcija">
                                            <option value="1">Naziv</option>
                                            <option value="2">Grad</option>
                                            <option value="3">Adresa</option>
                                    </select>
                                    <br>
                                    <br>
                                   
                                    <LABEL>Unesi: &nbsp;</LABEL>                           
                                    <INPUT type = "text" name="unos" id="unos">&nbsp;
                                                                                   
    <INPUT type = "submit" name="Pretraži" id="Pretraži" value="Pretraži"> <input type="submit" name="odustani" id="odustani" value="Odustani"/>		      
                                                                                   
                                    <TABLE id = "filijalaTabela">
                                            <TR>
                                                    <TH>Naziv</TH>
                                                    <TH>Grad</TH>
                                                    <TH>Adresa</TH>
                                                    <TH>Broj telefona</TH>
                                                    <TH>E-mail</TH>
                                            <TR>
                                           
 <%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@page import="java.lang.*" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
if (request.getParameter("Pretraži")!="") 
{
	FilijalaDAO f= new FilijalaDAO();
	List<Filijala> filijale = new ArrayList<Filijala>();
	String opcija = request.getParameter("opcija");
	try
	{
		int izabran=Integer.parseInt(opcija);

		if (izabran==1) 
		{
			filijale = f.selectFilijaluPoNazivu(request.getParameter("unos"));
		}

		else if (izabran==2)
		{
			filijale = f.selectFilijaluPoGradu(request.getParameter("unos"));		}

		else 
		{
			filijale = f.selectFilijaluPoAdresi(request.getParameter("unos"));		}
		
		for (int i = 0; i<filijale.size(); i++) 
		{
			out.println("<tr>");
			String naziv = filijale.get(i).getNaziv();
			String grad=filijale.get(i).getGrad();
			String adresa=filijale.get(i).getAdresa();
			String brojTelefona=filijale.get(i).getBrojTelefona();
			String eMail=filijale.get(i).geteMail();

			String izlaz = "<td>" + naziv + "</td>" + "<td>" + grad + "</td>"+ "<td>" + adresa + "</td>"+ "<td>" + brojTelefona + "</td>"+ "<td>" + eMail + "</td>";
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
  </CENTER></TD></TR>
				<tr>
			<TD class="navigacija"  id="link2" style="background-color: #FFFFFF;">
				<A href = "ModifikacijaFilijale.jsp" id = "linkModifikacijaFilijale" CLASS="navigacija">Modifikacija filijale</A><BR>
					</TD></tr>
				<TR>
				<TD class="navigacija"  id="link3" style="background-color: #FFFFFF;">
				<A href = "BrisanjeFilijale.jsp" id = "linkBrisanjefilijale" CLASS="navigacija">Brisanje filijale</A><BR>
					</TD></TR>
		<TR>
				<TD class="navigacija"  id="link4" style="background-color: #F0F0F0;">
				<A href = "PretragaIPregledFilijale.jsp" id = "linkPretragafilijale" CLASS="navigacija">Pretraga i pregled</A><BR>
					</TD></TR>
		
		</TABLE>				
			</TD></TR></TABLE>	
			
		</CENTER>
	</BODY>
</HTML>
  