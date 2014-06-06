package Klase_testovi;

import junit.framework.Assert;
import Klase.Licenciranje;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class LicenciranjeTest 
{

	Licenciranje l;

	@Before
	public void setUp() throws Exception 
	{
		l=new Licenciranje();
		l.setDatumAktivacije("2013-12-12");
		// skontati šta æemo za preostalo
	}

	@After
	public void tearDown() throws Exception 
	{
		l=null;
	}
	
	@Test
	public void TestDatumaAktivacije()
	{
		Assert.assertEquals("2013-12-12", l.getDatumAktivacije());
	}
	
	// skontati šta æemo za preostalo

}
