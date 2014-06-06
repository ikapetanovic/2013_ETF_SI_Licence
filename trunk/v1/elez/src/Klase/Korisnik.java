package Klase;

import java.util.regex.*;

public class Korisnik 
{
	int idKorisnik;
	String ime;
	String prezime;
	String brojTelefona;
	String email;
	String korisnickoIme;
	String lozinka;
	String privilegija;
	String datumKreiranja; // datum!
	
	public Korisnik(){}	

	public Korisnik(String ime, String prezime, String brojTelefona, String email, String korisnickoIme, String lozinka, String privilegija, String datumKreiranja)
	{
		this.ime = ime;
		this.prezime = prezime;
		this.brojTelefona = brojTelefona;
		this.email = email;
		this.korisnickoIme = korisnickoIme;
		this.lozinka = lozinka;
		this.privilegija = privilegija;
		this.datumKreiranja = datumKreiranja;
	}
	

	public int getidKorisnik() {
		return idKorisnik;
	}
	public void setidKorisnik(int id) {
		this.idKorisnik = id;
	}
	
	
	public String getIme() {
		return ime ;
	}
	public void setIme(String ime) {
		this.ime = ime;
	}
	
	
	public String getPrezime() {
		return prezime;
	}
	public void setPrezime (String prezime) {
		this.prezime = prezime;
	}
	
		
	public String getBrojTelefona() {
		return brojTelefona;
	}
	public void setBrojTelefona(String brojTelefona) {
		this.brojTelefona = brojTelefona;
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getKorisnickoIme() {
		return korisnickoIme;
	}
	public void setKorisnickoIme(String korisnickoIme) {
		this.korisnickoIme = korisnickoIme;
	}
	
	public String getLozinka() {
		return lozinka;
	}
	public void setLozinka(String lozinka) {
		this.lozinka = lozinka;
	}
	
	public String getPrivilegija() {
		return privilegija;
	}
	public void setPrivilegija(String privilegija) {
		this.privilegija = privilegija;
	}
	
	
	public String getDatumKreiranja() {
		return datumKreiranja;
	}
	public void setDatumKreiranja(String datumKreiranja) {
		this.datumKreiranja = datumKreiranja;
	}
	
	
	// Telefon format: (000)000-000
	public boolean provjeriTelefon (String brojTelefona)		
	{
		if (brojTelefona.length() != 12)
			return false;
		
		if (brojTelefona.charAt(0) != '(' || brojTelefona.charAt(4) != ')'
				|| brojTelefona.charAt(8) != '-')
			return false;
		
		for (int i = 1; i < 4; i++) 
		{
			if ((brojTelefona.charAt(i) >= '0' && brojTelefona.charAt(i) <= '9'))
				continue;
			else
				return false;
		}
		
		for (int i = 5; i < 8; i++) 
		{
			if ((brojTelefona.charAt(i) >= '0' && brojTelefona.charAt(i) <= '9'))
				continue;
			else
				return false;
		}
		
		for (int i = 9; i < 12; i++) 
		{
			if ((brojTelefona.charAt(i) >= '0' && brojTelefona.charAt(i) <= '9'))
				continue;
			else
				return false;
		}
		return true;
	}
	
	public boolean provjeriLozinku (String sifra)		
	{
		boolean b = false;
		
		if (sifra.length() < 6)
			return b;
		
		for (int i = 0; i < sifra.length(); i++)
		{
			if (Character.isDigit(sifra.charAt(i)))
			{
				b = true;
				break;
			}		
		}
		
		return b;		
	}
	
	public boolean provjeriImePrezime (String imePrezime)		
	{
		if (imePrezime.length() < 2)
			return false;
		
		for (int i = 0; i < imePrezime.length(); i++)
		{
			if (Character.isDigit(imePrezime.charAt(i)))
				return false;		
		}
		
		if (!Character.isUpperCase(imePrezime.charAt(0)))
			return false;
		
		return true;		
	}
	
	public boolean provjeriEmail (String email)		
	{
		Pattern pt=Pattern.compile("^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"); 
		Matcher mt=pt.matcher(email); 
		boolean bl=mt.matches();		
		return bl;		
	}

	
	

}
