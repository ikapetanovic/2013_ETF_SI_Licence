<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="scan.*" %>
<%@page import="DAO.*" %>
<%@page import="Klase.*" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
			<%

if(request.getParameter("skeniraj1")!=null){
	RuntimeExec skeniranje = new RuntimeExec();
	skeniranje.SkenirajS(request.getParameter("a"),request.getParameter("b"),request.getParameter("c"),Integer.parseInt(request.getParameter("pocetna")),Integer.parseInt(request.getParameter("krajnja")),request.getParameter("user"),request.getParameter("pass"));
}
%>

<% if(request.getParameter("sebe")!=null){
	RuntimeExec scan = new RuntimeExec();
	scan.SkenirajMoje();
}%>
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
				<A href = "PretragaIPregledSoftvera.jsp" id = "linkPregledRacunara" CLASS="navigacija">Pretraga softvera</A><BR>
					</TD>
					<TD id = "sporedniSadrzaj" rowspan="13">
				<center>
<FORM action="DetekcijaSoftvera.jsp" method=GET ><center>
<table><tr><td align="right">
	<LABEL>Odaberite ID filijale: &nbsp;</LABEL></td><td>
		<select name="lista" style="width:50px;">

<%
FilijalaDAO f = new FilijalaDAO();
  int naziv=0;
 List<Filijala> lista =new ArrayList<Filijala>();
 lista = f.selectSveFilijale();
 for(int i=0; i<lista.size();i++){
	 naziv=lista.get(i).getId();
 
 %>
		
		 
			<option><%=naziv %></option>
			<%} %>
			</select></td></tr><tr><td colspan="3"><br>Sa liste postojećih:<br><br><select size="3" style="width:300px;"><option>ID&nbsp;&nbsp;NAZIV</option>
			<%
FilijalaDAO f1 = new FilijalaDAO();
  String naziv1="pocetak";
 List<Filijala> lista1 =new ArrayList<Filijala>();
 lista1 = f1.selectSveFilijale();
 for(int i=0; i<lista1.size();i++){
	 naziv1=lista1.get(i).getId()+"&nbsp;&nbsp;&nbsp;&nbsp;"+lista1.get(i).getNaziv();
 
 %>
		
		 
			<option><%=naziv1 %></option>
			<%} %></select></td></tr><tr><td><br>
			<form action="DetekcijaSoftvera.jsp" method=GET>
				<input type="submit" name ="sebe" value="Skeniraj ovaj računar"/></form><br><br>
			<label>Raspon IP adresa:&nbsp;</label></td><td><br><input type="text" name="a" style="width:30px;"/>.<input type="text" name="b" style="width:30px;"/>.<input type="text" name="c" style="width:30px;"/>.<input type="text" name="pocetna" style="width:30px;"/>/<input type="text" name="krajnja" style="width:30px;"/></td></tr>
			<tr><td><br>Admin user:</td><td><br><input type="text" name="user" style="width:130px;"/></td></tr>
			<tr><td>Admin lozinka:</td><td><input type="password" name="pass" style="width:130px;"/></td></tr>
			<tr><td></td><td align="right">
			<br>
			<INPUT type = "submit" name="skeniraj1" id="skeniraj" value="Skeniraj">	
</td></tr>
			</table>
</center>
		
</td></tr>
<TR>
				<TD class="navigacija"  id="link2" style="background-color: #F0F0F0;">
				<A href = "DetekcijaSoftvera.jsp" id = "linkSoftver" CLASS="navigacija">Detekcija softvera</A><BR>
					</TD></tr>

				
		</TABLE>				
			</TD></TR></TABLE>	
			
		</CENTER>
	</BODY>
</jsp>

		