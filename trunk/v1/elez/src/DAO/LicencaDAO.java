package DAO;
import Klase.Licenca;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class LicencaDAO {
	public long dodajLicencu(String serijskiBroj,int trajanje, String vrsta, float cijena, String status, int brojDostupnih,int brojNabavljenih, int brojNabavke,String datumNabavke) throws Exception {
		Connection c = DAL.connect();
		try {
			c = DAL.connect();
			Statement ps = c.createStatement();
			long id = ps.executeUpdate("INSERT INTO `licenca` (`serijskiBroj`,`trajanje`,`vrsta`,`cijena`,`status`,`brojNabavljenih`, `brojDostupnih`, `brojNabavke`, `datumNabavke`) VALUES ('"+serijskiBroj+"', '"+trajanje+"',  '"+vrsta+"',  '"+cijena+"',  '"+ status +"','"+brojNabavljenih+"','"+brojDostupnih+"','"+brojNabavke+"','"+datumNabavke+"')");
			return id;
		} catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	}
	
	public List<Licenca> selectSveLicence() throws Exception{
		Connection c = DAL.connect();
		try{
		c=DAL.connect();
		Statement ps = c.createStatement();
		ResultSet rs = ps.executeQuery("SELECT * FROM licenca");
		List<Licenca> licence = new ArrayList<Licenca>();
		while (rs.next()){
			licence.add(ucitajLicencuIzResultSeta(rs));
		}
		return licence;
		} catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		
	}
	
	public Licenca selectLicencuPoIdu(int id) throws Exception{
		Connection c = (Connection) DAL.connect();
		try{
		c= (Connection) DAL.connect();
		PreparedStatement dajPoIdu = c.prepareStatement("SELECT * FROM licenca WHERE idLicenca=?");
		dajPoIdu.setInt(1, id);
		ResultSet rs = dajPoIdu.executeQuery();
		while (rs.next()){
			return ucitajLicencuIzResultSeta(rs);
		}
		
		} catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
		return null;
	}
	
	public List<Licenca> selectLicencuPoSerijskomBroju(String serijskiBroj) throws Exception{
		Connection c = (Connection) DAL.connect();
		try{
		c= (Connection) DAL.connect();
		PreparedStatement dajPoSerijskomBroju = c.prepareStatement("SELECT * FROM licenca WHERE serijskiBroj=? ");
		dajPoSerijskomBroju.setString(1, serijskiBroj);
		ResultSet rs = dajPoSerijskomBroju.executeQuery();
		List <Licenca> licence= new ArrayList<Licenca>();
		while(rs.next()){
			licence.add(ucitajLicencuIzResultSeta(rs));
		}
		return licence;
		} catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	}
	
	public List<Licenca> selectLicencuPoVrsti(String vrsta) throws Exception{
		Connection c = (Connection) DAL.connect();
		try{
		c= (Connection) DAL.connect();
		PreparedStatement dajPoVrsti = c.prepareStatement("SELECT * FROM licenca WHERE vrsta=? ");
		dajPoVrsti.setString(1, vrsta);
		ResultSet rs = dajPoVrsti.executeQuery();
		List <Licenca> licence= new ArrayList<Licenca>();
		while(rs.next()){
			licence.add(ucitajLicencuIzResultSeta(rs));
		}
		return licence;
		} catch (Exception e) {
			DAL.disconnect();
			throw new Exception(e.getMessage());
		} 
	}
	private Licenca ucitajLicencuIzResultSeta(ResultSet rs) throws Exception{
		Licenca l=new Licenca();
		l.setId(rs.getInt(1));
		l.setSerijskiBroj(rs.getString(2));
		l.setTrajanje(rs.getInt(3));
		l.setVrsta(rs.getString(4));
		l.setCijena(rs.getFloat(5));
		l.setStatus(rs.getString(6));
		l.setBrojNabavljenih(rs.getInt(7));
		l.setBrojDostupnih(rs.getInt(8));
		l.setBrojNabavke(rs.getInt(9));
		l.setDatumNabavke(rs.getString(10));
		return l;
	}
	
	public int deleteLicenca(int id) throws Exception {
		Connection c = (Connection) DAL.connect();
		PreparedStatement qDelete = c.prepareStatement("DELETE FROM licenca WHERE idLicenca=?");
		qDelete.setInt(1, id);
		return qDelete.executeUpdate();
	}
	
	public int updateLicencu(Licenca l) throws Exception {
		Connection c = (Connection) DAL.connect();
		PreparedStatement qUpdate = c.prepareStatement("UPDATE licenca SET idLicenca=?, serijskiBroj=?, trajanje=?, vrsta=?, cijena=?, status=?, brojNabavljenih=?, brojDostupnih=?, brojNabavke=?, datumNabavke=? WHERE idLicenca=?");
		qUpdate.setLong(1, l.getId());
		qUpdate.setString(2, l.getSerijskiBroj());
		qUpdate.setInt(3, l.getTrajanje());	
		qUpdate.setString(4, l.getVrsta());
		qUpdate.setFloat(5, l.getCijena());
		qUpdate.setString(6, l.getStatus());
		qUpdate.setInt(7, l.getBrojNabavljenih());
		qUpdate.setInt(8, l.getBrojDostupnih());
		qUpdate.setInt(9, l.getBrojNabavke());
		qUpdate.setString(10, l.getDatumNabavke());
		qUpdate.setLong(11, l.getId());
		return qUpdate.executeUpdate();
	}
	
}
