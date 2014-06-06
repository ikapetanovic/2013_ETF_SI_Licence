package DAO_testovi;


import static org.junit.Assert.*;


import org.junit.AfterClass;
import org.junit.Test;

import Klase.Racunar;
import java.util.*;

import DAO.DAL;
import DAO.RacunarDAO;

public class RacunarDAOTest {

	@AfterClass
	public static void tearDownAfterClass() throws Exception 
	{
	}
	private static RacunarDAO rdao= new RacunarDAO();
	
	@Test
	public void testSelectSveRacunare()  throws Exception {
		DAL.connect();
		List<Racunar> izBaze= new ArrayList<Racunar>();
		izBaze=rdao.selectSveRacunare();
		assertNotNull(izBaze);
		DAL.disconnect();	
	}
}


