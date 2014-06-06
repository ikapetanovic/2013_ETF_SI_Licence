package Klase_testovi;


import junit.framework.Assert;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import Klase.Licenca;

public class LicencaTest {
	 Licenca l;

	@Before
	public void setUp() throws Exception {
		l = new Licenca();
		l.setSerijskiBroj("123-123-123-123");
		l.setTrajanje(12);
		l.setVrsta("Open");
		l.setStatus("validna");
		l.setCijena((float) 19.99);
		l.setBrojDostupnih(20);
		l.setBrojNabavljenih(20);
		l.setBrojNabavke(1345);
		l.setDatumNabavke("12.12.2012");
	}

	@After
	public void tearDown() throws Exception {
		l=null;
	}

	@Test
	public void TestSerijskogBroja() {
		Assert.assertEquals("123-123-123-123", l.getSerijskiBroj());
	}
	
	@Test
	public void TestTrajanja() {
		Assert.assertEquals(12, l.getTrajanje());
	}
	
	@Test
	public void TestVrste() {
		Assert.assertEquals("Open", l.getVrsta());
	}
	
	@Test
	public void TestCijene() {
		Assert.assertEquals((float) 19.99, l.getCijena());
	}
	
	@Test
	public void TestStatusa() {
		Assert.assertEquals("validna", l.getStatus());
	}
	
	@Test
	public void TestBrojaDostupnih() {
		Assert.assertEquals(20, l.getBrojDostupnih());
	}

	@Test
	public void TestBrojaNabavljenih() {
		Assert.assertEquals(20, l.getBrojNabavljenih());
	}
	
	@Test
	public void TestBrojaNabavke() {
		Assert.assertEquals(1345,l.getBrojNabavke());
	}
	
	@Test
	public void TestDatumaNabavke() {
		Assert.assertEquals("12.12.2012",l.getDatumNabavke());
	}
	
}
