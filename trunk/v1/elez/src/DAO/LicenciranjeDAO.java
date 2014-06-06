package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Klase.Licenciranje;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;


public class LicenciranjeDAO 
{
	public void dodajLicenciranje (String datumAktivacije, int soft, int lic) throws Exception // skontati šta æemo za ostale
	{
		Connection c = (Connection)DAL.connect();
		try 
		{
			c = (Connection) DAL.connect();
			Statement ps = (Statement)c.createStatement();
			ps.executeUpdate("INSERT INTO `licenciranje` (`datumAktivacije`, `Softver_idSoftver`, `Licenca_idLicenca`) VALUES ('"+datumAktivacije+ "', '"+ soft + "','"+ lic +"' )");
			// skontati šta æemo za ostale
		} 
		catch (Exception e) 
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	}
	
	
	private Licenciranje ucitajLicenciranjaIzResultSeta(ResultSet rs) throws Exception
	{
		Licenciranje l = new Licenciranje();
		l.setIdLicenciranje(rs.getInt(1));
        l.setDatumAktivacije(rs.getString(2));
        l.setSoftver_idSoftver(rs.getInt(3));
        l.setLicenca_idLicenca(rs.getInt(4));	
		return l;
	}
	
	public List<Licenciranje> selectSvaLicenciranja() throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			Statement ps = (Statement)c.createStatement();
			ResultSet rs = ps.executeQuery("SELECT * FROM licenciranje");
			List<Licenciranje> licenciranja = new ArrayList<Licenciranje>();
			while (rs.next())
			{
				licenciranja.add(ucitajLicenciranjaIzResultSeta(rs));
			}
			return licenciranja;
		} 
		catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		
	}
	
	public Licenciranje selectLicenciranjePoLicenci(int idLicenca) throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			
			PreparedStatement dajPoIDLicenca = c.prepareStatement("SELECT * FROM licenciranje where Licenca_idLicenca=?");
			dajPoIDLicenca.setInt(1, idLicenca);
			ResultSet rs = dajPoIDLicenca.executeQuery();
			while (rs.next())
			{
				return ucitajLicenciranjaIzResultSeta(rs);
			}
		} 
		catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		
		return null;
		
	}
	
	public Licenciranje selectLicenciranjePoSoftveru(int idSoftver) throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			
			PreparedStatement dajPoIDSoftver = c.prepareStatement("SELECT * FROM licenciranje where Softver_idSoftver=?");
			dajPoIDSoftver.setInt(1, idSoftver);
			ResultSet rs = dajPoIDSoftver.executeQuery();
			while (rs.next())
			{
				return ucitajLicenciranjaIzResultSeta(rs);
			}
		} 
		catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		
		return null;
		
	}
	
	public int deleteLicenciranje(int id) throws Exception 
	{
		Connection c = (Connection) DAL.connect();
		PreparedStatement qDelete = c.prepareStatement("DELETE FROM licenciranje WHERE idLicenciranje=?");
		qDelete.setInt(1, id);
		return qDelete.executeUpdate();
	}
	
}

