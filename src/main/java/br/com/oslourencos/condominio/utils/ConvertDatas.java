package br.com.oslourencos.condominio.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class ConvertDatas {

		
		public Timestamp getDataSql(String data) {
			
			SimpleDateFormat sdf = null;
			Calendar c =  Calendar.getInstance();
			
			try {
				if(data.contains(":00:") || data.contains(":59:")) {
					sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
					System.out.println("Tem \n " + data );
				} 
				
				sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
				
				c.setTime(sdf.parse(data)); 
				
				return  new Timestamp((c.getTimeInMillis()/1000)*1000);
	
			}  catch (ParseException e) { 
				e.printStackTrace();
			}
			
			return null;
		}
		
		public static void timestampComMili(long l) {
	        System.out.println("Com mili: " + new Timestamp(l));
	    }
	    public static void timestampSemMili(long l) {
	        System.out.println("Sem mili: " + new Timestamp((l/1000)*1000));
	    }
	    
		
		public static void main (String [] args) {
			
			System.out.println("\n ----------------------------------------------------------------------------------------- ");
			
			
			System.out.println(new ConvertDatas().getDataSql("01/06/2018 00:00:00"));
			System.out.println(new ConvertDatas().getDataSql("20/11/2018 23:59"));
			
			System.out.println("\n ----------------------------------------------------------------------------------------- ");
			
			timestampComMili(Calendar.getInstance().getTimeInMillis());
	        timestampSemMili(Calendar.getInstance().getTimeInMillis());
	        
		}
}
