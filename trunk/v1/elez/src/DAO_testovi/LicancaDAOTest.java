package DAO_testovi;
import java.util.ArrayList;
import java.util.List;

import Klase.Licenca;


import static org.junit.Assert.*;

import org.junit.Test;

import DAO.DAL;
import DAO.LicencaDAO;

public class LicancaDAOTest {

	LicencaDAO l=new LicencaDAO();
	@Test
	public void test() throws Exception {
		DAL.connect();
		l.dodajLicencu("123-123-123-123",12,"Open",(float) 19.99,"validna",20,20,1345,"12.12.2012");
		DAL.disconnect();
	}
	@Test
	public void testSelectSveLicence()  throws Exception {
		DAL.connect();
		List<Licenca> izBaze= new ArrayList<Licenca>();
		izBaze=l.selectSveLicence();
		assertNotNull(izBaze);
		DAL.disconnect();	
	}

}
