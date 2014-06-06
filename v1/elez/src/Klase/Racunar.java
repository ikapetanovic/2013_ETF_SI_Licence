package Klase;

public class Racunar {
	
	int idRacunar;
	String imeHosta;
	String operativniSistem;
	int Filijala_idFilijala;

	public Racunar(){}
	
	public Racunar(String ih, String os, int f, String m)
	{
		imeHosta = ih;
		operativniSistem = os;
		Filijala_idFilijala = f;

	}

	public int getFilijala_idFilijala() {
		return Filijala_idFilijala;
	}

	public void setFilijala_idFilijala(int filijala_idFilijala) {
		Filijala_idFilijala = filijala_idFilijala;
	}

	public String getImeHosta()
	{
		return imeHosta;
	}

	public void setImeHosta(String imeHosta) 
	{
		this.imeHosta = imeHosta;
	}

	public String getOperativniSistem() 
	{
		return operativniSistem;
	}

	public void setOperativniSistem(String operativniSistem) 
	{
		this.operativniSistem = operativniSistem;
	}

	public int getIdRacunar()
	{
		return idRacunar;
	}

	public void setIdRacunar(int idRacunar)
	{
		this.idRacunar = idRacunar;
	}
}
