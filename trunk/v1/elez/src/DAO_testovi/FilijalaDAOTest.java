package DAO_testovi;

import static org.junit.Assert.*;

import org.junit.AfterClass;
import org.junit.Test;
import Klase.Filijala;
import java.util.*;
import DAO.DAL;
import DAO.FilijalaDAO;

public class FilijalaDAOTest {

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}
	private static FilijalaDAO fdao= new FilijalaDAO();
	/*@Test
	public void test()  throws Exception {
		DAL.connect();
		fdao.dodajFilijalu("MojaFilijala", "Ilidza:P", "Poligonska 21", "659-968", "a@hotmail.com");
		DAL.disconnect();	
	}*/
	@Test
	public void testSelectSveFilijale()  throws Exception {
		DAL.connect();
		List<Filijala> izBaze= new ArrayList<Filijala>();
		izBaze=fdao.selectSveFilijale();
		assertNotNull(izBaze);
		DAL.disconnect();	
	}
	@Test
	public void testSelectFilijelePoNazivu()  throws Exception {
		DAL.connect();
		String naziv="amra";
		List<Filijala> izBaze= new ArrayList();
		izBaze=fdao.selectFilijaluPoNazivu(naziv);
		assertNotNull(izBaze);
		DAL.disconnect();	
	}
	@Test
	public void testSelectFilijelePoAdresi()  throws Exception {
		DAL.connect();
		String adresa="aaaa";
		List<Filijala> izBaze= new ArrayList();
		izBaze=fdao.selectFilijaluPoAdresi(adresa);
		assertNotNull(izBaze);
		DAL.disconnect();	
	}
	@Test
	public void testSelectFilijelePoGradu()  throws Exception {
		DAL.connect();
		String grad="sarajevo";
		List<Filijala> izBaze= new ArrayList();
		izBaze=fdao.selectFilijaluPoGradu(grad);
		assertNotNull(izBaze);
		DAL.disconnect();	
	}
	@Test
	public void testSelectFilijelePoIdu()  throws Exception {
		DAL.connect();
		int id=19;
		Filijala izBaze= new Filijala();
		izBaze=fdao.selectFilijaluPoIdu(id);
		assertNotNull(izBaze);
		DAL.disconnect();	
	}
	@Test
	public void testUpdateFilijala()  throws Exception {
		DAL.connect();
		int id=1;
		Filijala f= new Filijala();
		FilijalaDAO fdao=new FilijalaDAO();
		f=fdao.selectFilijaluPoIdu(id);
		f.setAdresa("nova adresa");
		f.setGrad("ha");
		f.setNaziv(",oja");
		f.seteMail("novi mail");
		int i=fdao.updateFilijalu(f);
		assertEquals("novi mail", f.geteMail());
		DAL.disconnect();	
	}
	@Test
	public void testDeleteFilijala()  throws Exception {
		DAL.connect();
		int id=2;
		Filijala f= new Filijala();
		FilijalaDAO fdao=new FilijalaDAO();
		f=fdao.selectFilijaluPoIdu(id);
		int eval=fdao.deleteFilijala(2);
		assertEquals(1,eval);
	}
}
