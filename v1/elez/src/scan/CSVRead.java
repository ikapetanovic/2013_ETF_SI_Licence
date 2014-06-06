package scan;
import Klase.*;
import DAO.*;
import java.io.*;
import java.util.Arrays;

public class CSVRead{

 public static void main(String[] arg) throws Exception {

     BufferedReader CSVFile = new BufferedReader(new FileReader("C:\\serijalizacija1.csv"));

     String dataRow = CSVFile.readLine(); 
     dataRow = CSVFile.readLine();
     dataRow = CSVFile.readLine();
     dataRow = CSVFile.readLine();
     dataRow = CSVFile.readLine();
     
     while (dataRow != null){
         String[] dataArray = dataRow.split(",");
         int brojac=1;
         Racunar r=new Racunar();
         for (String item:dataArray) { 
        	 System.out.print(item); 
        	
        	 if(brojac==1){
        	 r.setImeHosta(item);
        	 }
        	 else if(brojac==2){
        		 r.setOperativniSistem(item);
        	 }
        	 brojac++;
             
         }
         r.setFilijala_idFilijala(1);
         System.out.println(); 
         dataRow = CSVFile.readLine();
         dataRow = CSVFile.readLine();
         RacunarDAO DAO = new RacunarDAO();
         DAO.dodajRacunar(r.getImeHosta(), r.getOperativniSistem(), r.getFilijala_idFilijala());
     }
     
     CSVFile.close();
    
     
 } //main()
} // CSVRead
