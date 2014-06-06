<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dodavanje filijale</title>
</head>
<body>

<FORM action="DodavanjeFilijale.jsp" method=GET >
<LABEL>Naziv: &nbsp;</LABEL>
				<INPUT type = "text" name="naziv" id="naziv">&nbsp;
				<br>
				<br>
<LABEL>Grad: &nbsp;</LABEL>
				<INPUT type = "text" name="grad" id="grad">&nbsp;
				<br>
				<br>
<LABEL>Adresa: &nbsp;</LABEL>
				<INPUT type = "text" name="adresa" id="adresa">&nbsp;
				<br>
				<br>			
<LABEL>Broj telefona: &nbsp;</LABEL>
				<INPUT type = "text" name="brojTelefona" id="brojTelefona">&nbsp;
				<br>
				<br>				
<LABEL>E-mail: &nbsp;</LABEL>
				<INPUT type = "text" name="eMail" id="eMail">&nbsp;
				<br>
				<br>				
				<INPUT type = "submit" name="Dodaj" id="Dodaj" value="Dodaj">			
</FORM>
</body>
</html>