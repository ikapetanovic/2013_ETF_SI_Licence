package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Klase.Softver;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;


public class SoftverDAO 
{
	public void dodajSoftver (String datumInstalacije, String naziv, String verzija, String proizvodjac, int racunar) throws Exception
	{
		Connection c = (Connection)DAL.connect();
		try 
		{
			c = (Connection) DAL.connect();
			Statement ps = (Statement)c.createStatement();
			ps.executeUpdate("INSERT INTO `softver` (`datumInstalacije`,`naziv`,`verzija`,`proizvodjac`,`Racunar_idRacunar`) VALUES ('"+datumInstalacije+"', '"+naziv+"', '"+verzija+"', '"+proizvodjac+"', '"+racunar+"')");
		
		} 
		catch (Exception e) 
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	}
	
	
	private Softver ucitajSoftverIzResultSeta(ResultSet rs) throws Exception
	{
		Softver s = new Softver();
		s.setIdSoftver(rs.getInt(1));
		s.setDatumInstalacije(rs.getString(2));
		s.setNaziv(rs.getString(3));
		s.setVerzija(rs.getString(4));
		s.setProizvodjac(rs.getString(5));
		s.setRacunar_idRacunar(rs.getInt(6));
		return s;
	}
	
	public List<Softver> selectSveSoftvere() throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			Statement ps = (Statement)c.createStatement();
			ResultSet rs = ps.executeQuery("SELECT * FROM softver");
			List<Softver> softveri = new ArrayList<Softver>();
			while (rs.next())
			{
				softveri.add(ucitajSoftverIzResultSeta(rs));
			}
			return softveri;
		} 
		catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		
	}
	
	public List<Softver> selectSoftverPoNazivu(String nazivSoftvera) throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			PreparedStatement dajPoNazivu = c.prepareStatement("SELECT * FROM softver WHERE naziv=? ");
			dajPoNazivu.setString(1, nazivSoftvera);
			ResultSet rs = dajPoNazivu.executeQuery();
			List <Softver> softveri= new ArrayList<Softver>();
			while (rs.next())
			{
				softveri.add(ucitajSoftverIzResultSeta(rs));
			}
			return softveri;
		} 
		catch (Exception e) 
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	}
	
	public List<Softver> selectSoftverPoProizvodjacu(String nazivProizvodjaca) throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			PreparedStatement dajPoProizvodjacu = c.prepareStatement("SELECT * FROM softver WHERE proizvodjac=? ");
			dajPoProizvodjacu.setString(1, nazivProizvodjaca);
			ResultSet rs = dajPoProizvodjacu.executeQuery();
			List <Softver> softveri= new ArrayList<Softver>();
			while (rs.next())
			{
				softveri.add(ucitajSoftverIzResultSeta(rs));
			}
			return softveri;
		} 
		catch (Exception e) 
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	}
	
	public List<Softver> selectSoftverPoDatumuInstalacije(String datumInstalacije) throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			PreparedStatement dajPoDatumuInstalacije = c.prepareStatement("SELECT * FROM softver WHERE datumInstalacije=? ");
			dajPoDatumuInstalacije.setString(1, datumInstalacije);
			ResultSet rs = dajPoDatumuInstalacije.executeQuery();
			List <Softver> softveri= new ArrayList<Softver>();
			while (rs.next())
			{
				softveri.add(ucitajSoftverIzResultSeta(rs));
			}
			return softveri;
		} 
		catch (Exception e) 
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	}
	
	public Softver selectSoftverPoID(int idSoftver) throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			PreparedStatement dajPoID = c.prepareStatement("SELECT * FROM softver WHERE idSoftver=? ");
			dajPoID.setInt(1, idSoftver);
			ResultSet rs = dajPoID.executeQuery();
			while (rs.next())
			{
				return ucitajSoftverIzResultSeta(rs);
			}
		} 
		catch (Exception e) 
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		
		return null;
	}
	
	public int deleteSoftver(int id) throws Exception 
	{
		Connection c = (Connection) DAL.connect();
		PreparedStatement qDelete = c.prepareStatement("DELETE FROM softver WHERE idSoftver=?");
		qDelete.setInt(1, id);
		return qDelete.executeUpdate();
	}
	
}
