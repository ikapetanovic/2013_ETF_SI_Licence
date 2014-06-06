%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<TR><TD id = "sporedniMeni"></TD></TR>
				
				<TR><TD id = "sadrzaj">	
				<center>
<FORM action="SkeniranjeSoftvera.jsp" method=GET >
			<LABEL> Računar je nepoznat sistemu!<br> Registujte ga!<br><br>
			<LABEL>Odabite filijalu: &nbsp;</LABEL>
			<select> 
				<option>Filijala 1 </option>
				<option>Filijala 2 </option>
				
			</select>
			<br>
			<br>
			
			<INPUT type = "submit" name="skeniraj" id="skeniraj" value="Registruj">	
</center>
			</TD></TR></TABLE>	
			
		</CENTER>
	</BODY>
</jsp>

		