<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Prijava</title>
</head>
<body>

<%@page import="DAO.*"%>
<%@page import="Klase.*"%>
<%@page import="java.util.*"%>

<%

	if (request.getParameter("prijava")!=null) 
	{			
		String korisnickoIme = request.getParameter("korisnickoIme");
		String lozinka = request.getParameter("lozinka");
		
		try 
		{
			KorisnikDAO kdao = new KorisnikDAO();
			Korisnik k = null;
			try
			{	
							
				k = kdao.dajKorisnika(korisnickoIme);
				
				
				if(k == null)
				{
					out.println("Korisnik sa unesenim korisničkim imenom ne postoji!");
				}
				else				
				{
					if (k.getLozinka().equals(lozinka))
					{
						
						if (k.getPrivilegija().equals("Administrator"))
						{				
							response.sendRedirect("PocetnaAdministrator.jsp");								
						}
						else if (k.getPrivilegija().equals("IT osoblje"))
						{
							response.sendRedirect("PocetnaIT.jsp");
						}
						else if (k.getPrivilegija().equals("Ostali"))
						{
							response.sendRedirect("PocetnaOstali.jsp");
						}
						else
							out.println("Greška.");
					} 
					else 
					{
						out.println("Greška.");
					}
				}
			}
			catch(Exception e)
			{
				out.println("Greška.");
			}	
		} 
		catch (Exception ex) 
		{
			out.println("Greška.");
		}
	}


%>
		<CENTER>
			<TABLE id = "glavnaTabela">
				
				<TR>
					<TD id = "glavniMeni">					
						<center><a href="#" class="glavniMeni">Dobrodošli!</a></center>					
					</TD>
				</TR>
				
				<TR>
					<TD id = "sporedniMeni"><a href="#" class="sporedniMeni">Unesite svoje korisničke podatke!</a></TD>
				</TR>
				
				<TR>
					<TD id = "sadrzaj">	

						<CENTER>
						<FORM action="Prijava.jsp" method=GET >
							<table> 
								<tr><td><LABEL>Korisničko ime:&nbsp;</LABEL></td>		
								<td><INPUT type = "text" name="korisnickoIme">&nbsp;</td></tr>		
								
								<tr><td><LABEL>Lozinka:&nbsp;</LABEL>	</td>	
								<td><INPUT type = "password" name="lozinka">&nbsp;		</td></tr>
								<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
								
								<INPUT type = "submit" name="prijava" value="Prijavi se"/></td></tr>
							</TABLE>
							</form>
						</CENTER>						
					</TD>
				</TR>
			</TABLE>	
			
		</CENTER>
	</BODY>
</HTML>