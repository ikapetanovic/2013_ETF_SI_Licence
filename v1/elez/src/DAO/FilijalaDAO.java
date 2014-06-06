package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Klase.Filijala;
import Klase.Licenca;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;


public class FilijalaDAO {	
	public void dodajFilijalu(String naziv, String grad, String adresa, String brojTelefona, String email) throws Exception {
		Connection c = (Connection)DAL.connect();
		try {
			c = (Connection) DAL.connect();
			Statement ps = (Statement)c.createStatement();
			ps.executeUpdate("INSERT INTO `filijala` (`naziv`,`grad`,`adresa`,`brojTelefona`,`email`) VALUES ('"+naziv+"', '"+grad+"', '"+adresa+"', '"+brojTelefona+"', '"+email+"')");
		} catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	} 
	public List<Filijala> selectSveFilijale() throws Exception{
		Connection c = (Connection) DAL.connect();
		try{
		c= (Connection) DAL.connect();
		Statement ps = (Statement)c.createStatement();
		ResultSet rs = ps.executeQuery("SELECT * FROM filijala");
		List<Filijala> filijale = new ArrayList<Filijala>();
		while (rs.next()){
			filijale.add(ucitajFilijaluIzResultSeta(rs));
		}
		return filijale;
		} catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		
	}
	public List<Filijala> selectFilijaluPoGradu(String grad) throws Exception{
		Connection c = (Connection) DAL.connect();
		try{
		c= (Connection) DAL.connect();
		PreparedStatement dajPoGradu = c.prepareStatement("SELECT * FROM filijala WHERE grad=? ");
		dajPoGradu.setString(1, grad);
		ResultSet rs = dajPoGradu.executeQuery();
		List <Filijala> filijale= new ArrayList<Filijala>();
		while(rs.next()){
			filijale.add(ucitajFilijaluIzResultSeta(rs));
		}
		return filijale;
		} catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	}
	public Filijala selectFilijaluPoIdu(int id) throws Exception{
		Connection c = (Connection) DAL.connect();
		try{
		c= (Connection) DAL.connect();
		PreparedStatement dajPoIdu = c.prepareStatement("SELECT * FROM filijala WHERE idFilijala=?");
		dajPoIdu.setInt(1, id);
		ResultSet rs = dajPoIdu.executeQuery();
		while (rs.next()){
			return ucitajFilijaluIzResultSeta(rs);
		}
		
		} catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		return null;
	}
	public List<Filijala> selectFilijaluPoNazivu(String naziv) throws Exception{
		Connection c = (Connection) DAL.connect();
		try{
		c= (Connection) DAL.connect();
		PreparedStatement dajPoNazivu = c.prepareStatement("SELECT * FROM filijala WHERE naziv=? ");
		dajPoNazivu.setString(1, naziv);
		ResultSet rs = dajPoNazivu.executeQuery();
		List <Filijala> filijale= new ArrayList<Filijala>();
		while(rs.next()){
			filijale.add(ucitajFilijaluIzResultSeta(rs));
		}
		return filijale;
		} catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		
	}
	public List<Filijala> selectFilijaluPoAdresi(String adresa) throws Exception{
		Connection c = (Connection) DAL.connect();
		try{
		c= (Connection) DAL.connect();
		PreparedStatement dajPoAdresi = c.prepareStatement("SELECT * FROM filijala WHERE adresa=?");
		dajPoAdresi.setString(1, adresa);
		ResultSet rs = dajPoAdresi.executeQuery();
		List <Filijala> filijale= new ArrayList();
		while(rs.next()){
			filijale.add(ucitajFilijaluIzResultSeta(rs));
		}
		return filijale;
		} catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		
	}
private Filijala ucitajFilijaluIzResultSeta(ResultSet rs) throws Exception{
		Filijala f=new Filijala();
		f.setId(rs.getInt(1));
		f.setNaziv(rs.getString(2));
		f.setGrad(rs.getString(3));
		f.setAdresa(rs.getString(4));
		f.setBrojTelefona(rs.getString(5));
		f.seteMail(rs.getString(6));
		return f;
	}
public int deleteFilijala(int id) throws Exception {
	Connection c = (Connection) DAL.connect();
	PreparedStatement qDelete = c.prepareStatement("DELETE FROM filijala WHERE idFilijala=?");
	qDelete.setInt(1, id);
	return qDelete.executeUpdate();
}

public int updateFilijalu(Filijala f) throws Exception {
	Connection c = (Connection) DAL.connect();
	PreparedStatement qUpdate = c.prepareStatement("UPDATE filijala SET idFilijala=?, naziv=?, grad=?, adresa=?, brojTelefona=?, email=? WHERE idFilijala=?");
	qUpdate.setLong(1, f.getId());
	qUpdate.setString(2, f.getNaziv());
	qUpdate.setString(3, f.getGrad());
	qUpdate.setString(4, f.getAdresa());
	qUpdate.setString(5, f.getBrojTelefona());
	qUpdate.setString(6, f.geteMail());
	qUpdate.setLong(7, f.getId());
	return qUpdate.executeUpdate();
}
}
