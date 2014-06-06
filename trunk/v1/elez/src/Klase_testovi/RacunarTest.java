package Klase_testovi;

import junit.framework.Assert;
import Klase.Racunar;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class RacunarTest {
	
	Racunar r;
	
	@Before
	
	public void setUp() throws Exception 
	{
		r = new Racunar();
		r.setImeHosta("Nedim-PC");
		r.setOperativniSistem("Windows 7");
		r.setFilijala_idFilijala(1);
	}

	@After
	public void tearDown() throws Exception 
	{
	r = null;
	}

	@Test
	public void testGetImeHosta() 
	{
		Assert.assertEquals("Nedim-PC", r.getImeHosta());
	}

	@Test
	public void testGetOperativniSistem() {
		Assert.assertEquals("Windows 7", r.getOperativniSistem());
	}

	@Test
	public void testGetNazivFilijale() {
		Assert.assertEquals(1, r.getFilijala_idFilijala());
	}



}
