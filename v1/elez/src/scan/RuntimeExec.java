package scan;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import DAO.RacunarDAO;
import Klase.Racunar;
import scan.spasiRacunar;




public class RuntimeExec {
public StreamWrapper getStreamWrapper(InputStream is, String type){
            return new StreamWrapper(is, type);
}
private class StreamWrapper extends Thread {
    InputStream is = null;
    String type = null;          
    String message = null;
 
    public String getMessage() {
            return message;
    }
 
    StreamWrapper(InputStream is, String type) {
        this.is = is;
        this.type = type;
    }
 
    public void run() {
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            StringBuffer buffer = new StringBuffer();
            String line = null;
            while ( (line = br.readLine()) != null) {
                buffer.append(line);
            }
            message = buffer.toString();
        } catch (IOException ioe) {
            ioe.printStackTrace();  
        }
    }
}
  
 

public void Skeniraj(String a, String b, String c, int pocetak, int kraj, String u, String p, int f) {

	for(int i=pocetak; i<kraj;i++){
		nadjiRacunar(a, b, c,Integer.toString(i), u, p);
		spasiRacunar o1 = new spasiRacunar();
		String ip = a+"."+b+"."+c+"."+Integer.toString(i);
		try {
			o1.main(f,ip,Integer.toString(i));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
            
            }

public void SkenirajMene(int f) {
	nadjiMene();
	spasiMene o2 = new spasiMene();
	try {o2.main(f);}
	catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

public void SkenirajMoje() {
RacunarDAO dao1 = new RacunarDAO();
Racunar priv1 = new Racunar();

int r1=22;
try {
	priv1=dao1.selectRacunarPoHost("GLAVNI");

r1=priv1.getIdRacunar();
}
catch (Exception e1) {
	//// TODO Auto-generated catch block
	e1.printStackTrace();
}

nadjiMoje();
spasiMoje o3 = new spasiMoje();
try {
	
	o3.main(r1);
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}}




public void SkenirajS(String a, String b, String c, int pocetak, int kraj, String u, String p){
RacunarDAO dao = new RacunarDAO();
Racunar priv = new Racunar();
int r=22;

for(int i=pocetak; i<kraj;i++){
	String ip=a+"."+b+"."+c+"."+Integer.toString(i);
	String fajl=Integer.toString(i);
	try {
	
priv = dao.selectRacunarPoHost(a+"."+b+"."+c+"."+Integer.toString(i));
r=priv.getIdRacunar();
} catch (Exception e1) {
	//// TODO Auto-generated catch block
	e1.printStackTrace();
}
nadjiSoftver(a, b, c,Integer.toString(i), u, p);

spasiSoftver o2 = new spasiSoftver(); 


try {
	
	o2.main(r,ip,fajl);
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}}
}
public void nadjiRacunar(String a, String b, String c, String d,String u, String p){
	
	Runtime rt = Runtime.getRuntime();
    RuntimeExec rte = new RuntimeExec();
    StreamWrapper error, output;
   
   
    try {
                Process proc = rt.exec("wmic /node:"+a+"."+b+"."+c+"."+d+" /user:"+u+" /password:"+p+" /output:C:\\racunari"+d+".csv os get name /format:csv.xsl");
                
                error = rte.getStreamWrapper(proc.getErrorStream(), "ERROR");
                output = rte.getStreamWrapper(proc.getInputStream(), "OUTPUT");
                int exitVal = 0;

                error.start();
                output.start();
                error.join(3000);
                output.join(3000);
                exitVal = proc.waitFor();
                System.out.println("Output: "+output.message+"\nError: "+error.message);
    } catch (IOException e) {
                e.printStackTrace();
    } catch (InterruptedException e) {
                e.printStackTrace();
    }
}
    
    
   
    
public void nadjiMene () {
	
	
	Runtime rt = Runtime.getRuntime();
    RuntimeExec rte = new RuntimeExec();
    StreamWrapper error, output;
   
   
    try {
                Process proc = rt.exec("wmic /output:C:\\ja.csv os get name /format:csv.xsl");
                
                error = rte.getStreamWrapper(proc.getErrorStream(), "ERROR");
                output = rte.getStreamWrapper(proc.getInputStream(), "OUTPUT");
                int exitVal = 0;

                error.start();
                output.start();
                error.join(3000);
                output.join(3000);
                exitVal = proc.waitFor();
                System.out.println("Output: "+output.message+"\nError: "+error.message);
    } catch (IOException e) {
                e.printStackTrace();
    } catch (InterruptedException e) {
                e.printStackTrace();
    }
} 	
	
	
	
	


public void nadjiMoje() {
	

	Runtime rt = Runtime.getRuntime();
    RuntimeExec rte = new RuntimeExec();
    StreamWrapper error, output;
   
   
    try {
                Process proc = rt.exec("wmic /output:C:\\moje.csv product get installdate, name, version, vendor /format:csv.xsl");
                
                error = rte.getStreamWrapper(proc.getErrorStream(), "ERROR");
                output = rte.getStreamWrapper(proc.getInputStream(), "OUTPUT");
                int exitVal = 0;

                error.start();
                output.start();
                error.join(3000);
                output.join(3000);
                exitVal = proc.waitFor();
                System.out.println("Output: "+output.message+"\nError: "+error.message);
    } catch (IOException e) {
                e.printStackTrace();
    } catch (InterruptedException e) {
                e.printStackTrace();
    }
    


}

public void nadjiSoftver(String a, String b, String c, String d,String u, String p){
	
	Runtime rt = Runtime.getRuntime();
    RuntimeExec rte = new RuntimeExec();
    StreamWrapper error, output;
   
   
    try {
                Process proc = rt.exec("wmic /node:"+a+"."+b+"."+c+"."+d+" /user:"+u+" /password:"+p+" /output:C:\\nadjiSoftver"+d+".csv product get installdate, name, version, vendor /format:csv.xsl");
                
                error = rte.getStreamWrapper(proc.getErrorStream(), "ERROR");
                output = rte.getStreamWrapper(proc.getInputStream(), "OUTPUT");
                int exitVal = 0;

                error.start();
                output.start();
                error.join(3000);
                output.join(3000);
                exitVal = proc.waitFor();
                System.out.println("Output: "+output.message+"\nError: "+error.message);
    } catch (IOException e) {
                e.printStackTrace();
    } catch (InterruptedException e) {
                e.printStackTrace();
    }
    
    
   
    
	
	
	
	
	
}


}