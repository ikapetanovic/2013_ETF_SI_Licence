package DAO;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Klase.Racunar;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;


public class RacunarDAO {
	
	public void dodajRacunar(String imeHosta, String operativniSistem, int idFilijala) throws Exception 
	{
		Connection c = (Connection)DAL.connect();
		try 
		{
			c = (Connection) DAL.connect();
			Statement ps = (Statement)c.createStatement();
			ps.executeUpdate("INSERT INTO `racunar` (`imeHosta`,`operativniSistem`, `Filijala_idFilijala`) VALUES ('"+imeHosta+"', '"+operativniSistem+"', '"+idFilijala+"')");
		} 
		catch (Exception e)
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	} 
	
	public List<Racunar> selectSveRacunare() throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
		c= (Connection) DAL.connect();
		Statement ps = (Statement)c.createStatement();
		ResultSet rs = ps.executeQuery("SELECT * FROM racunar");
		List<Racunar> racunari = new ArrayList<Racunar>();
			while (rs.next())
			{
				racunari.add(ucitajRacunarIzResultSeta(rs));
			}
		return racunari;
		} 
		catch (Exception e) 
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		
	}
	
	private Racunar ucitajRacunarIzResultSeta(ResultSet rs) throws Exception
	{
		Racunar r = new Racunar();
		r.setIdRacunar(rs.getInt(1));
		r.setImeHosta(rs.getString(2));
		r.setOperativniSistem(rs.getString(3));
		r.setFilijala_idFilijala(rs.getInt(4));
		return r;
	}
	
	public Racunar selectRacunarPoID(int idRacunar) throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			PreparedStatement dajPoID = c.prepareStatement("SELECT * FROM racunar WHERE idRacunar=? ");
			dajPoID.setInt(1, idRacunar);
			ResultSet rs = dajPoID.executeQuery();
			while (rs.next())
			{
				return ucitajRacunarIzResultSeta(rs);
			}
		} 
		catch (Exception e) 
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		
		return null;
	}
	
	public List<Racunar> selectRacunarPoImeHosta(String imeHosta) throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			PreparedStatement dajPoImeHosta = c.prepareStatement("SELECT * FROM racunar WHERE imeHosta=? ");
			dajPoImeHosta.setString(1, imeHosta);
			ResultSet rs = dajPoImeHosta.executeQuery();
			List<Racunar> racunari = new ArrayList<Racunar>();
			while (rs.next())
			{
				racunari.add(ucitajRacunarIzResultSeta(rs));
			}
			return racunari;
		} 
		catch (Exception e) 
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	}
	
	public Racunar selectRacunarPoHost(String imeHosta) throws Exception
	{
	Connection c = (Connection) DAL.connect();
	try
	{
	c= (Connection) DAL.connect();
	PreparedStatement dajPoHost = c.prepareStatement("SELECT * FROM racunar WHERE imeHosta=? ");
	dajPoHost.setString(1, imeHosta);
	ResultSet rs = dajPoHost.executeQuery();
	while (rs.next())
	{
	return ucitajRacunarIzResultSeta(rs);
	}
	}
	catch (Exception e)
	{
	DAL.disconnect();
	throw new Exception(e.getMessage());
	}

	return null;
	}
	
	public List<Racunar> selectRacunarPoOperativnomSistemu(String operativniSistem) throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			PreparedStatement dajPoOperativniSistem = c.prepareStatement("SELECT * FROM racunar WHERE operativniSistem=? ");
			dajPoOperativniSistem.setString(1, operativniSistem);
			ResultSet rs = dajPoOperativniSistem.executeQuery();
			List<Racunar> racunari = new ArrayList<Racunar>();
			while (rs.next())
			{
				racunari.add(ucitajRacunarIzResultSeta(rs));
			}
			return racunari;
		} 
		catch (Exception e) 
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	}
	
	public List<Racunar> selectRacunarPoNazivuFilijale(String nazivFilijale) throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			PreparedStatement dajPoNazivuFilijale = c.prepareStatement("select r.idRacunar, r.imeHosta, r.operativniSistem, r.Filijala_idFilijala from racunar r, filijala f where r.Filijala_idFilijala=f.idFilijala and naziv=?");
			dajPoNazivuFilijale.setString(1, nazivFilijale);
			ResultSet rs =dajPoNazivuFilijale.executeQuery();
			List<Racunar> racunari = new ArrayList<Racunar>();
			while (rs.next())
			{
				racunari.add(ucitajRacunarIzResultSeta(rs));
			}
			return racunari;
		} 
		catch (Exception e) 
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	}

	public int deleteRacunar(int id) throws Exception 
	{
		Connection c = (Connection) DAL.connect();
		PreparedStatement qDelete = c.prepareStatement("DELETE FROM racunar WHERE idRacunar=?");
		qDelete.setInt(1, id);
		return qDelete.executeUpdate();
	}

	

}