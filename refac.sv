
class exchanger;
   real result_v;
   real rate;
   string result = "none";
   string target = "none";
    real EperD;
    real WperD;
    real YperD;
	real WperY;
	real DperE;
	real YperW;
	real YperE;
	real WperE;
  
  function rate_generator();
    
   	EperD= 0.93871;
   	WperD= 1335.9;
   	YperD= 148.29;
   	WperY= WperD/YperD;
   	DperE= 1/EperD;
   	YperW= 1/WperY;
   	YperE= EperD/YperD;
   	WperE= WperD/EperD;
    
    endfunction


  function display(real m);
      real amount = m;
      result_v = amount * rate;

      if(result_v != 0)
        $display("\n%s: %f ==> %s: %f ",target,amount, result, result_v);
      else begin
        $display("Wrong String Value!! Try again.\n");
        $display("rate %f  amount %f",rate, amount);
      end
    
   endfunction

endclass


class Switch_to_Won extends exchanger;

   string result = "Won";

  function tar_get(string t="");
    target = t;
      case (target)
      "Won" : rate =1;
      "Yen" : rate =WperY;
      "Euro": rate =WperE;
      "Dollar":rate =WperD;
      endcase
   endfunction
endclass




module classEX;
 
  exchanger ex;
  Switch_to_Won Won;

initial begin
  
   ex=new;
   Won=new;
   ex.rate_generator();
   
   Won.tar_get("Yen");
   Won.display(200);

  end

endmodule
