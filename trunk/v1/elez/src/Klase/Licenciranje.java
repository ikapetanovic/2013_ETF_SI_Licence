package Klase;

//import java.util.Date;

public class Licenciranje 
{
	int idLicenciranje;
	int Softver_idSoftver;
	int Licenca_idLicenca;
	String datumAktivacije;
	
	
	public Licenciranje(){}	

	public Licenciranje(String da, int s, int l)
	{
		datumAktivacije=da;
		Softver_idSoftver=s;
		Licenca_idLicenca=l;
			
	}
	
	public int getSoftver_idSoftver() {
		return Softver_idSoftver;
	}

	public void setSoftver_idSoftver(int softver_idSoftver) {
		Softver_idSoftver = softver_idSoftver;
	}

	public int getLicenca_idLicenca() {
		return Licenca_idLicenca;
	}

	public void setLicenca_idLicenca(int licenca_idLicenca) {
		Licenca_idLicenca = licenca_idLicenca;
	}


	public int getIdLicenciranje() 
	{
		return idLicenciranje;
	}
	public void setIdLicenciranje(int id) 
	{
		this.idLicenciranje = id;
	}	
	
	/*
	public String getStatus() 
	{
		return status ;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	*/
	
	/*
	public Softver getSoftver() 
	{
		return softver;
	}
	public void setSoftver(Softver softver) 
	{
		this.softver = softver;
	}
	
	
	public Licenca getLicenca() 
	{
		return licenca;
	}
	public void setLicenca(Licenca licenca) {
		this.licenca = licenca;
	}	
	
	*/
	
	
	public String getDatumAktivacije() 
	{
		return datumAktivacije ;
	}
	public void setDatumAktivacije(String datumAktivacije) {
		this.datumAktivacije = datumAktivacije;
	}
	

}

