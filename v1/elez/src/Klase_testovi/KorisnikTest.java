package Klase_testovi;

import junit.framework.Assert;
import Klase.Korisnik;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class KorisnikTest 
{

	Korisnik k;

	@Before
	public void setUp() throws Exception 
	{
		k=new Korisnik();
		k.setIme("Imenko");
		k.setPrezime("Prezimenko");
		k.setBrojTelefona("033-123-456");
		k.setEmail("iprezimenko@email.com");
		k.setKorisnickoIme("iprezimenko1");
		k.setLozinka("imenko123sifra");
		k.setPrivilegija("Administrator");
		k.setDatumKreiranja("2013-12-12");
		
	}

	@After
	public void tearDown() throws Exception 
	{
		k=null;
	}
	
	
	@Test
	public void TestIme()
	{
		Assert.assertEquals("Imenko", k.getIme());
	}
	
	@Test
	public void TestPrezime()
	{
		Assert.assertEquals("Prezimenko", k.getPrezime());
	}
	
	@Test
	public void TestBrojTelefona()
	{
		Assert.assertEquals("033-123-456", k.getBrojTelefona());
	}
	
	@Test
	public void TestEmail()
	{
		Assert.assertEquals("iprezimenko@email.com", k.getEmail());
	}
	
	@Test
	public void TestKorisnickoIme()
	{
		Assert.assertEquals("iprezimenko1", k.getKorisnickoIme());
	}
	
	@Test
	public void TestLozinka()
	{
		Assert.assertEquals("imenko123sifra", k.getLozinka());
	}
	
	
	
	@Test
	public void TestPrivilegija()
	{
		Assert.assertEquals("Administrator", k.getPrivilegija());
	}
	
	
	@Test
	public void TestDatumaKreiranja()
	{
		Assert.assertEquals("2013-12-12", k.getDatumKreiranja());
	}
	
	
	

}
