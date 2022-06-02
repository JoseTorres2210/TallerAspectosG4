package com.bank;

import java.io.File;
import java.io.FileWriter;
import java.util.Calendar;

public aspect Logger {
	File file = new File("log.txt");
	Calendar cal = Calendar.getInstance();
    pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");    	
    }
    
    String msg1="Transaccion: Depostio - Fecha: "+cal.getTime()+"\n";
    pointcut successmoneyMakeTransaction() : call(* moneyMakeTransaction(..) );
    after() : successmoneyMakeTransaction() {    	
    	try{
    		FileWriter texto= new FileWriter(file,true);    		    		
    		texto.write(msg1);
    		texto.close();
    	}catch(Exception e) {
    		System.out.print("Error al escribir...");
    	}    	
    	System.out.print(msg1);
    }
    
    String msg2="Transaccion: Retiro - Fecha: "+cal.getTime()+"\n";
    pointcut succesmoneyWithdrawal() : call(* moneyWithdrawal(..) );
    after() : succesmoneyWithdrawal() {
    	try{
    		FileWriter texto= new FileWriter(file,true);    		    		
    		texto.write(msg2);
    		texto.close();
    	}catch(Exception e) {
    		System.out.print("Error al escribir...");
    	}    	
    	System.out.print(msg2);
    }
}