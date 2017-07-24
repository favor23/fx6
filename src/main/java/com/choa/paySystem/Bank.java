package com.choa.paySystem;

public class Bank {
	public String number_ck(String str) {
		/*  String cardNum1 = request.getParameter("cardNum1");
	      String cardNum2 = request.getParameter("cardNum2");
	      String cardNum3 = request.getParameter("cardNum3");
	      String cardNum4 = request.getParameter("cardNum4");
	      String str = cardNum1 + cardNum2 + cardNum3 + cardNum4;
	      */
	      String message=null;
	      int[] ints = new int[str.length()];
	     
	      for(int i = 0;i< str.length(); i++){
	         ints[i] = Integer.parseInt(str.substring(i, i+1));
	        }
	        for(int i=ints.length-2; i>=0; i=i-2){
	           int j = ints[i];
	           j = j*2;
	            
	           if(j > 9){
	              j = j%10 + 1;
	            }
	            ints[i] = j;
	        }
	        
	        int sum = 0;
	        
	        for(int i = 0;i< ints.length; i++){
	            sum+=ints[i];
	        }
	        
	        if(sum%10 == 0){
	         message="올바른 카드번호";
	      } else {
	         message="잘못된 카드번호";
	      }
	      
	      return message;
	   }
}
