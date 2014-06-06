package Klase_testovi;

import junit.framework.Assert;
import Klase.Softver;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class SoftverTest 
{

	Softver s;

	@Before
	public void setUp() throws Exception 
	{
		s=new Softver();
		s.setDatumInstalacije("2013-12-12");		
		s.setNaziv("Microsoft Word");
		s.setVerzija("2010");
		s.setProizvodjac("Microsoft");
		// skontati šta æemo za preostalo
	}

	@After
	public void tearDown() throws Exception 
	{
		s=null;
	}
	
	@Test
	public void TestDatumaInstalacije()
	{
		Assert.assertEquals("2013-12-12", s.getDatumInstalacije());
	}
	
	@Test
	public void TestNaziva()
	{
		Assert.assertEquals("Microsoft Word", s.getNaziv());
	}
	
	@Test
	public void TesteVerzije(){
		Assert.assertEquals("2010", s.getVerzija());
	}
	
	@Test
	public void TestProizvodjaca(){
		Assert.assertEquals("Microsoft", s.getProizvodjac());
	}

}
