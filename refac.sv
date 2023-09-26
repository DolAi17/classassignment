
/////////////////////////////////////////////////////////////////
class exchanger;
   real result_v;
   real rate;
   string result;
   string target;
    real EperD, EperY, EperW;
    real WperD, WperY,WperE;
    real YperD, YperW, YperE;
  	real DperE, DperW, DperY;
   real WperW, YperY, EperE, DperD;
  
  function rate_generator();
    
   	EperD= 0.93871;
   	WperD= 1335.9;
   	YperD= 148.29;
    EperW= EperD/WperD;
    EperY= EperD/YperD;
    DperW= 1/WperD;
    DperY= 1/YperD;
   	WperY= WperD/YperD;
   	DperE= 1/EperD;
   	YperW= YperD/WperD;
   	YperE= EperD/YperD;
   	WperE= WperD/EperD;
      WperW= 1;
      YperY= 1;
      DperD= 1;
      EperE= 1;
    
    endfunction


  function display(real m);
      real amount = m;
      result_v = amount * rate;

      if(result_v != 0)
        $display("\n%s: %f ==> %s: %f ",target,amount, result, result_v);
      else begin
        $display("\nWrong Value!! Try again.VV VV");
        $display("rate %f  amount %f  result %s  target %s" ,rate, amount, result, target);
      end
    
   endfunction

endclass

////////////////////////////////////////////////////////////////////////
//////////////////////////child class///////////////////////////////////
////////////////////////////////////////////////////////////////////////


////////////////////Won child////////////////////////////////////

class Switch_to_Won extends exchanger;

  function tar_get(string t="");
    this.result = "Won";
    this.target = t;
    case (this.target)
      "Won" : this.rate =WperW;
      "Yen" : this.rate =WperY;
      "Euro": this.rate =WperE;
      "Dollar":this.rate =WperD;
      endcase
   endfunction
  
endclass

////////////////////yen child////////////////////////////////////

class Switch_to_Yen extends exchanger;

  function tar_get(string t="");
    this.result = "Yen";
    this.target = t;
    case (this.target)
      "Won" : this.rate =YperW;
      "Yen" : this.rate =YperY;
      "Euro": this.rate =YperE;
      "Dollar":this.rate =YperD;
      endcase
   endfunction
  
endclass

////////////////////Euro child////////////////////////////////////

class Switch_to_Euro extends exchanger;

  function tar_get(string t="");
    this.result = "Euro";
    this.target = t;
    case (this.target)
      "Won" : this.rate =EperW;
      "Yen" : this.rate =EperY;
      "Euro": this.rate =EperE;
      "Dollar":this.rate =EperD;
      endcase
   endfunction
  
endclass

////////////////////Dollar child////////////////////////////////////

class Switch_to_Dollar extends exchanger;

  function tar_get(string t="");
    this.result = "Dollar";
    this.target = t;
    case (this.target)
      "Won" : this.rate =DperW;
      "Yen" : this.rate =DperY;
      "Euro": this.rate =DperE;
      "Dollar":this.rate =DperD;
      endcase
   endfunction
  
endclass


////////////////////////////////////////////////////////////////////
/////////////////////////////Module/////////////////////////////////
////////////////////////////////////////////////////////////////////

module classEX;
 
  Switch_to_Won Won;
  Switch_to_Yen Yen;
  Switch_to_Euro Eur;
  Switch_to_Dollar Dol;

initial begin
  
   Won=new;
   Yen=new;
   Eur=new;
   Dol=new;


   Won.rate_generator();
   Won.tar_get("Dollar");
   Won.display(150);
   Won.tar_get("Euro");
   Won.display(150);
   Won.tar_get("Yen");
   Won.display(150);
   Won.tar_get("Won");
   Won.display(150);

  #10
  
   Yen.rate_generator();
   Yen.tar_get("Dollar");
   Yen.display(150);
   Yen.tar_get("Euro");
   Yen.display(150);
   Yen.tar_get("Yen");
   Yen.display(150);
   Yen.tar_get("Won");
   Yen.display(150);

  #10
  
   Eur.rate_generator();
   Eur.tar_get("Dollar");
   Eur.display(150);
   Eur.tar_get("Euro");
   Eur.display(150);
   Eur.tar_get("Yen");
   Eur.display(150);
   Eur.tar_get("Won");
   Eur.display(150);
  
  #10

   Dol.rate_generator();
   Dol.tar_get("Dollar");
   Dol.display(150);
   Dol.tar_get("Euro");
   Dol.display(150);
   Dol.tar_get("Yen");
   Dol.display(150);
   Dol.tar_get("Won");
   Dol.display(150);


  end

endmodule
