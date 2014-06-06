package scan;
import Klase.*;
import DAO.*;
import java.io.*;
import java.util.Arrays;

public class spasiSoftver{

 public void main(int r, String ip,String fajl) throws Exception {

     BufferedReader CSVFile = new BufferedReader(new FileReader("C:\\nadjiSoftver"+fajl+".csv"));

     String dataRow = CSVFile.readLine(); 
     dataRow = CSVFile.readLine();
     dataRow = CSVFile.readLine();
     dataRow = CSVFile.readLine();
     dataRow = CSVFile.readLine();
     
     while (dataRow != null){
         String[] dataArray = dataRow.split(",");
         int brojac=1;
         Softver s = new Softver();
         for (String item:dataArray) { 
        	 
        	 System.out.print(item); 
        	
        	 if(brojac==2){
        	 s.setDatumInstalacije(item);
        	 }
        	 else if(brojac==3){
        		s.setNaziv(item);
        	 }
        	 else if(brojac==4){
        		 s.setVerzija(item);
        	 }
        	 else if(brojac==5){
        		 s.setProizvodjac(item);
        	 }
        	 brojac++;
             
         }
        
         System.out.println(s.getRacunar_idRacunar()); 
         dataRow = CSVFile.readLine();
         dataRow = CSVFile.readLine();
         SoftverDAO sdao = new SoftverDAO();
         sdao.dodajSoftver(s.getDatumInstalacije(),s.getNaziv(),s.getProizvodjac(), s.getVerzija(),r);
     }
     
     CSVFile.close();
    
     
 } //main()
} // CSVRead
