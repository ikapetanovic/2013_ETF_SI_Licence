package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Klase.Korisnik;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;


public class KorisnikDAO 
{
	public void dodajKorisnika (String ime, String prezime, String brojTelefona, String email, String korisnickoIme, String lozinka, String privilegije) throws Exception
	{
		Connection c = (Connection)DAL.connect();
		try 
		{
			c = (Connection) DAL.connect();
			Statement ps = (Statement)c.createStatement();
			ps.executeUpdate("INSERT INTO `korisnik` (`ime`,`prezime`,`brojTelefona`,`email`,`korisnickoIme`,`lozinka`,`privilegije`,`datumKreiranja`) VALUES ('"+ime+"', '"+prezime+"', '"+brojTelefona+"', '"+email+"', '"+korisnickoIme+"', '"+lozinka+"', '"+privilegije+"', curdate())");
	
		} 
		catch (Exception e) 
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	}
	
	
	
	private Korisnik ucitajKorisnikaIzResultSeta(ResultSet rs) throws Exception
	{
		Korisnik k = new Korisnik();
		
		k.setidKorisnik(rs.getInt(1));
		k.setIme(rs.getString(2));
		k.setPrezime(rs.getString(3));
		k.setBrojTelefona(rs.getString(4));
		k.setEmail(rs.getString(5));
		k.setKorisnickoIme(rs.getString(6));
		k.setLozinka(rs.getString(7));
		k.setPrivilegija(rs.getString(8));
		k.setDatumKreiranja(rs.getString(9));
		
		return k;
	}
	
	public List<Korisnik> selectSveKorisnike() throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			Statement ps = (Statement)c.createStatement();
			ResultSet rs = ps.executeQuery("SELECT * FROM korisnik");
			List<Korisnik> korisnici = new ArrayList<Korisnik>();
			while (rs.next())
			{
				korisnici.add(ucitajKorisnikaIzResultSeta(rs));
			}
			return korisnici;
		} 
		catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		
	}
	
	public int deleteKorisnik(int id) throws Exception 
	{
		Connection c = (Connection) DAL.connect();
		PreparedStatement qDelete = c.prepareStatement("DELETE FROM korisnik WHERE idKorisnik=?");
		qDelete.setInt(1, id);
		return qDelete.executeUpdate();
	}
	
	public List<Korisnik> dajSveKorisnike(String korisnickoIme) throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			Statement ps = (Statement)c.createStatement();
			ResultSet rs = ps.executeQuery("SELECT * FROM korisnik WHERE korisnickoIme LIKE '"+korisnickoIme+"%';");
			
			List<Korisnik> korisnici = new ArrayList<Korisnik>();
			
			while (rs.next())
			{
				korisnici.add(ucitajKorisnikaIzResultSeta(rs));
			}
			return korisnici;
		} 
		catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 		
	}
	
	public Korisnik dajKorisnika(String korisnickoIme) throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			Statement ps = (Statement)c.createStatement();
			ResultSet rs = ps.executeQuery("SELECT * FROM korisnik WHERE korisnickoIme = '"+korisnickoIme+"';");			
			
			Korisnik k = null;
			
			if (rs.next())
			{
				k = new Korisnik();				
				k.setidKorisnik(rs.getInt(1));
				k.setIme(rs.getString(2));
				k.setPrezime(rs.getString(3));
				k.setBrojTelefona(rs.getString(4));
				k.setEmail(rs.getString(5));
				k.setKorisnickoIme(rs.getString(6));
				k.setLozinka(rs.getString(7));
				k.setPrivilegija(rs.getString(8));
				k.setDatumKreiranja(rs.getString(9));
								
			}
			return k;
			
		} 
		catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		
	}
	
	public Korisnik selectKorisnikaPoIdu(int id) throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			PreparedStatement dajPoIdu = c.prepareStatement("SELECT * FROM korisnik WHERE idKorisnik=?");
			dajPoIdu.setInt(1, id);
			ResultSet rs = dajPoIdu.executeQuery();
			while (rs.next())
			{
				return ucitajKorisnikaIzResultSeta(rs);
			}		
		} 
		catch (Exception e) 
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		return null;
	}
	
	public int updateKorisnika(Korisnik k) throws Exception 
	{
		Connection c = (Connection) DAL.connect();
		PreparedStatement qUpdate = c.prepareStatement("UPDATE korisnik SET ime=?, prezime=?, brojTelefona=?, email=?, lozinka=?, privilegije=? WHERE idKorisnik=?");

		qUpdate.setString(1, k.getIme());
		qUpdate.setString(2, k.getPrezime());	
		qUpdate.setString(3, k.getBrojTelefona());
		qUpdate.setString(4, k.getEmail());
		qUpdate.setString(5, k.getLozinka());
		qUpdate.setString(6, k.getPrivilegija());
		qUpdate.setInt(7, k.getidKorisnik());
		
		return qUpdate.executeUpdate();
	}
	
	public List<Korisnik> selectKorisnikePoImenu(String ime) throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			PreparedStatement dajPoImenu = c.prepareStatement("SELECT * FROM korisnik WHERE ime=? ");
			dajPoImenu.setString(1, ime);
			ResultSet rs = dajPoImenu.executeQuery();
			List <Korisnik> korisnici= new ArrayList<Korisnik>();
			while(rs.next())
			{
				korisnici.add(ucitajKorisnikaIzResultSeta(rs));
			}
		return korisnici;
		
		} 
		catch (Exception e) 
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	}
	
	public List<Korisnik> selectKorisnikePoPrezimenu(String prezime) throws Exception
	{
		Connection c = (Connection) DAL.connect();
		try
		{
			c= (Connection) DAL.connect();
			PreparedStatement dajPoPrezimenu = c.prepareStatement("SELECT * FROM korisnik WHERE prezime=? ");
			dajPoPrezimenu.setString(1, prezime);
			ResultSet rs = dajPoPrezimenu.executeQuery();
			List <Korisnik> korisnici= new ArrayList<Korisnik>();
			while(rs.next())
			{
				korisnici.add(ucitajKorisnikaIzResultSeta(rs));
			}
		return korisnici;
		
		} 
		catch (Exception e) 
		{
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	}
	
}
