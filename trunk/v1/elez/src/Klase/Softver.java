package Klase;

//import java.util.Date;

public class Softver 
{
	int idSoftver;
	String datumInstalacije;
	String naziv;
	String verzija;
	String proizvodjac;
	int Racunar_idRacunar;
	

	public Softver(){}	

	public Softver(String di, String n, String v, String p, int r)
	{
		datumInstalacije=di;
		naziv=n;
		verzija=v;
		proizvodjac=p;
		Racunar_idRacunar=r;
		
	}
	
	public int getRacunar_idRacunar() 
	{
		return Racunar_idRacunar;
	}

	public void setRacunar_idRacunar(int racunar_idRacunar) 
	{
		Racunar_idRacunar = racunar_idRacunar;
	}

	public int getIdSoftver() 
	{
		return idSoftver;
	}
	public void setIdSoftver(int id) 
	{
		this.idSoftver = id;
	}
	
	
	public String getDatumInstalacije() 
	{
		return datumInstalacije ;
	}
	public void setDatumInstalacije(String datumInstalacije) 
	{
		this.datumInstalacije = datumInstalacije;
	}
	
	
	public String getNaziv()
	{
		return naziv;
	}
	public void setNaziv(String naziv)
	{
		this.naziv = naziv;
	}
	
		
	public String getVerzija() 
	{
		return verzija;
	}
	public void setVerzija(String verzija) 
	{
		this.verzija = verzija;
	}
	
	
	public String getProizvodjac() 
	{
		return proizvodjac;
	}
	public void setProizvodjac(String proizvodjac) 
	{
		this.proizvodjac = proizvodjac;
	}
	
	

}
