`define EperD 0.93871
`define WperY 9.00870


class exchanger;
   real amount;
   real result_v;
   string target;
   string result;

  function getdata(real m, string t="", string r="");
      amount=m;
      target=t;
      result=r;
   endfunction

  function judge();
      if(target == "Dollar")
         result_v = `EperD * amount;
      else if(target == "Euro")
         result_v = amount / `EperD;
      else
         result_v = 0;
   endfunction
   
   function void display();
      if(result_v != 0)
        $display("\n%s: %f ==> %s: %f ",target,amount, result, result_v);
      else
        $display("Wrong String Value!! Try again.\n");

   endfunction

endclass


class WYexchanger extends exchanger;

  function judge();     
      if(target == "Yen")
         result_v = `WperY * amount;
      else if(target == "Won")
         result_v = amount / `WperY;
      else
         result_v = 0;
   endfunction
endclass




module classEX;
 
  exchanger ex;
  WYexchanger WYex;

initial begin
  
   ex=new;
   WYex=new;

  ex.getdata(10,"Dollar","Euro");
  ex.judge();
  ex.display();
  ex.getdata(10,"Euro","Dollar");
  ex.judge();
  ex.display(); 
  WYex.getdata(10,"Won","Yen");
  WYex.judge();
  WYex.display();
  WYex.getdata(10,"Yen","Won");
  WYex.judge();
  WYex.display();
  WYex.getdata(10,"You","we");
  WYex.judge();
  WYex.display();
end

endmodule
