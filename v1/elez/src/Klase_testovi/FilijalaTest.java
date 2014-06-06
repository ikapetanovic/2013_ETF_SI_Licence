package Klase_testovi;

import junit.framework.Assert;
import Klase.Filijala;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class FilijalaTest {

	Filijala f;

	@Before
	public void setUp() throws Exception {
	f=new Filijala();
	f.setAdresa("Adresica");
	f.setBrojTelefona("061/666-999");
	f.seteMail("mojmail@hotmail.com");
	f.setGrad("Sarajevo");
	f.setNaziv("IT");
	}

	@After
	public void tearDown() throws Exception {
	f=null;
	}
	@Test
	public void TestAdrese(){
		Assert.assertEquals("Adresica", f.getAdresa());
	}
	@Test
	public void TestBrojaTelefona(){
		Assert.assertEquals("061/666-999", f.getBrojTelefona());
	}
	@Test
	public void TesteMaila(){
		Assert.assertEquals("mojmail@hotmail.com", f.geteMail());
	}
	@Test
	public void Testgrada(){
		Assert.assertEquals("Sarajevo", f.getGrad());
	}
	@Test
	public void TestNaziva(){
		Assert.assertEquals("IT", f.getNaziv());
	}

}
