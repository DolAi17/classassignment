class exchanger;
   real amount;
   real euro;

   function real exchanging(real m);
      amount=m;
      euro = 0.93871 * amount;
   endfunction
   
   function void display();
      $display("Dollar: %f\nEuro: %f\n", amount, euro);
   endfunction

endclass

module classEX;
 
  exchanger ex;
initial begin
  
   ex=new;
   ex.exchanging(10);
   ex.display();
end



endmodule
