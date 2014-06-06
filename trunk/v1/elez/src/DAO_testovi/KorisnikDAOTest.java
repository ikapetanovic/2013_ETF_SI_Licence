package DAO_testovi;

import static org.junit.Assert.*;

import org.junit.AfterClass;
import org.junit.Test;
import Klase.Korisnik;
import java.util.*;
import DAO.DAL;
import DAO.KorisnikDAO;

public class KorisnikDAOTest 
{

	@AfterClass
	public static void tearDownAfterClass() throws Exception 
	{
	}
	
	private static KorisnikDAO fdao= new KorisnikDAO();	
		
	@Test
	public void testSelectSveSoftvere()  throws Exception 
	{
		DAL.connect();
		List<Korisnik> izBaze= new ArrayList<Korisnik>();
		izBaze=fdao.selectSveKorisnike();
		assertNotNull(izBaze);
		DAL.disconnect();	
	}
}
