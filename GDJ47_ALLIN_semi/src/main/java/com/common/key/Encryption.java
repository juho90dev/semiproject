package com.common.key;

public class Encryption {
    
	public static void main(String[] args) throws Exception{
        
		String key = "This is Key!!!!!";
		
		AES128 aes = new AES128(key);
		
		
		String txt = "Hello World";
		String encrypt = aes.encrypt(txt);
		String decrypt = aes.decrypt(encrypt); 
		
		
		System.out.println("평문 : " + txt);
		System.out.println("암호화 : " + encrypt);
		System.out.println("복호화 : " + decrypt);
    	
    }
    
}
