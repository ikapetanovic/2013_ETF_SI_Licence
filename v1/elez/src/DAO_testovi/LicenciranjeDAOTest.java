package DAO_testovi;

import static org.junit.Assert.*;

import org.junit.AfterClass;
import org.junit.Test;
import Klase.Licenciranje;
import java.util.*;
import DAO.DAL;
import DAO.LicenciranjeDAO;

public class LicenciranjeDAOTest 
{

	@AfterClass
	public static void tearDownAfterClass() throws Exception 
	{
	}
	
	private static LicenciranjeDAO fdao= new LicenciranjeDAO();	
		
	@Test
	public void testSelectSveSoftvere()  throws Exception 
	{
		DAL.connect();
		List<Licenciranje> izBaze= new ArrayList<Licenciranje>();
		izBaze=fdao.selectSvaLicenciranja();
		assertNotNull(izBaze);
		DAL.disconnect();	
	}
}

