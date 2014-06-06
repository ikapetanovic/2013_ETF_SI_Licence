package DAO_testovi;

import static org.junit.Assert.*;

import org.junit.AfterClass;
import org.junit.Test;
import Klase.Softver;
import java.util.*;
import DAO.DAL;
import DAO.SoftverDAO;

public class SoftverDAOTest 
{

	@AfterClass
	public static void tearDownAfterClass() throws Exception 
	{
	}
	
	private static SoftverDAO fdao= new SoftverDAO();	
		
	@Test
	public void testSelectSveSoftvere()  throws Exception 
	{
		DAL.connect();
		List<Softver> izBaze= new ArrayList<Softver>();
		izBaze=fdao.selectSveSoftvere();
		assertNotNull(izBaze);
		DAL.disconnect();	
	}
}
