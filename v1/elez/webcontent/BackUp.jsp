<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<LINK rel = "stylesheet" href = "stil.css" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Backup</title>
</head>
<body>

<%
if (request.getParameter("odustani")!=null) response.sendRedirect("PocetnaAdministrator.jsp");
%>

	<FORM action="BackUp.jsp" method=GET >
	
	<p>
	
		<label>Naziv baze: </label> &nbsp;
		<INPUT type = "text" name="baza" id="baza"> <br><br>
		
		<label>Username: </label> &nbsp; 
		<INPUT type = "text" name="username" id="username"><br><br>
		
		<label>Password: </label> &nbsp; 
		<INPUT type = "text" name="password" id="password"><br><br>
		
		<label>Putanja do mysql: </label> &nbsp; 
		<INPUT type = "text" name="putanja1" id="putanja1"><br><br><br><br><br><br>
		
		<label>Putanja fajla (sa nazivom): </label> &nbsp; 
		<INPUT type = "text" name="putanja2" id="putanja2" size="55"> &nbsp; 
		<INPUT type = "submit" name="exportuj" class="exportuj" value=Exportuj>	<br><br>	
		
		</p>
		
		
		
		<% 
		if (request.getParameter("exportuj")!=null)
		{
			String dbName = request.getParameter("baza");
			String dbUserName = request.getParameter("username");
			String dbPassword = request.getParameter("password");			
			String doMySqla = request.getParameter("putanja1");
			String path = request.getParameter("putanja2");
			
			String executeCmd;

			if (dbPassword.equals(""))
				executeCmd = doMySqla + "\\mysqldump -u " + dbUserName + " --add-drop-database -B " + dbName + " -r " + path;
			else
				executeCmd = doMySqla + "\\mysqldump -u " + dbUserName + " -p" + dbPassword + " --add-drop-database -B " + dbName + " -r " + path;
			

			Process runtimeProcess;
			
	        try 
	        {	   		 
	            runtimeProcess = Runtime.getRuntime().exec(executeCmd);
	            int processComplete = runtimeProcess.waitFor();
	 
	            if (processComplete == 0)
	            	out.println("Uspješan backup.");
				else
					out.println("Nije napravljen backup!");
	        } 
	        catch (Exception ex) 
	        {
	        	out.println(ex.getMessage());
	        }
		        

		}
		
		// Izvor: http://omindu.wordpress.com/2011/06/27/mysql-database-backup-restore-using-java/

		%>
		
		<p>
		<br>
		<br>
		<label>Naziv fajla za import (sa putanjom):</label>&nbsp;		
		<INPUT type = "text" name="putanja3" id="putanja3" size="55"> &nbsp;		
		<INPUT type = "submit" name="importuj" class="importuj" value=Importuj>	<br> <br>
		
		</p>
		
		<% 
		
		if (request.getParameter("importuj")!=null)
		{
			//The following method is to restore a complete database backup (backup with add, drop database command)
			
			String dbName = request.getParameter("baza");
			String dbUserName = request.getParameter("username");
			String dbPassword = request.getParameter("password");
			
			String doMySqla = request.getParameter("putanja1");
			String path = request.getParameter("putanja3");
			
			String[] executeCmd;
			
			if (dbPassword.equals(""))
				executeCmd = new String[]{doMySqla + "\\mysql", "--user=" + dbUserName, "-e", "source "+path};
			else
				executeCmd = new String[]{doMySqla + "\\mysql", "--user=" + dbUserName, "--password=" + dbPassword, "-e", "source "+path};
			
			
			Process runtimeProcess;
	        try 
	        {	 
	            runtimeProcess = Runtime.getRuntime().exec(executeCmd);
	            int processComplete = runtimeProcess.waitFor();
	 
	            if (processComplete == 0)
	                out.println("Uspješan restore");
	            else
	                out.println("Nesupješan restore!");
	        } catch (Exception ex) 
	        {
	        	out.println(ex.getMessage());
	        }
	        
	        // Izvor: http://omindu.wordpress.com/2011/06/27/mysql-database-backup-restore-using-java/ 
		} 
	       
		
		%>
		
		<br>
		<br>
		 <p>	
		<INPUT type = "submit" name="odustani" id="odustani" value="Odustani"/>
		</p>
	
	</FORM>
	
</BODY>
</HTML>	
		
	