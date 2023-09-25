`define EperD 0.93871
`define WperY 9.00870


class exchanger;
   real amount;
   real result_v;
   string target;
   string result;

  function real getdata(real m, string t="", string r="");
      amount=m;
      target=t;
      result=r;
   endfunction

   function judge()
      if(target == "Dollar")
         result_v = `EperD * amount;
      else if(target == "Euro")
         result_v = amount / `EperD;
      else
         result_v = 0;
   endfunction
   
   function void display();
      if(result_v != 0)
     $display("%s: %f\n%s: %f\n",target,amount, result, result_v);
      else
     $display("Wrong String Value!! Try again.");

   endfunction

endclass

module classEX;
 
  exchanger ex;
initial begin
  
   ex=new;
  ex.getdata(10,"Dollar","Euro");
  ex.judge();
   ex.display();
   #1
  ex.getdata(10,"Euro","Dollar");
  ex.judge();
   ex.display();
end

endmodule
