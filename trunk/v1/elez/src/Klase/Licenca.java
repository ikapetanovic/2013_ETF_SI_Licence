package Klase;

public class Licenca {
long id;
String serijskiBroj;
int trajanje;
String vrsta;
float cijena;
String status;
int brojDostupnih;
int brojNabavljenih;
int brojNabavke;
String datumNabavke;

public Licenca(){
	
}
public Licenca(String _sbroj,int _trajanje, String _vrsta, float _cijena, String _status, int _brojDostupnih,int _brojNabavljenih, int _brojNabavke,String _datumNabavke ){
	 serijskiBroj=_sbroj;
	 trajanje=_trajanje;
	 vrsta=_vrsta;
	 cijena=_cijena;
	 status=_status;
	 brojDostupnih=_brojDostupnih;
	 brojNabavljenih=_brojNabavljenih;
	 setBrojNabavke(_brojNabavke);
	 datumNabavke=_datumNabavke;
}

public long getId() {
	return id;
}
public void setId (long ID) {
	this.id = ID;
}
public String getSerijskiBroj() {
	return serijskiBroj;
}
public void setSerijskiBroj(String serijskiBroj) {
	this.serijskiBroj = serijskiBroj;
}
public int getTrajanje() {
	return trajanje;
}
public void setTrajanje(int trajanje) {
	this.trajanje = trajanje;
}
public int getBrojNabavljenih () {
	return brojNabavljenih;
}
public void setBrojNabavljenih (int brojNabavljenih) {
	this.brojNabavljenih = brojNabavljenih;
}
public int getBrojDostupnih () {
	return brojDostupnih;
}
public void setBrojDostupnih (int BrojDostupnih) {
	this.brojDostupnih = BrojDostupnih;
}	
public String getVrsta() {
	return vrsta;
}
public void setVrsta(String vrsta) {
	this.vrsta = vrsta;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public float getCijena() {
	return cijena;
}
public void setCijena(float cijena) {
	this.cijena = cijena;
}
public String getDatumNabavke() {
	return datumNabavke;
}
public void setDatumNabavke(String datumNabavke) {
	this.datumNabavke = datumNabavke;
}
public int getBrojNabavke() {
	return brojNabavke;
}
public void setBrojNabavke(int brojNabavke) {
	this.brojNabavke = brojNabavke;
}
}
