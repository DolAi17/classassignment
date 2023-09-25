module a;

real EperD, WperY;
  
initial begin

	EperD = 0.93871;
	WperY = 9.00870;

end
  
function EtoD(real amount);
	real euro;
	euro = EperD * amount;
   $display("Dollar: %f\nEuro: %f\n", amount, euro);
endfunction

function DtoE(real amount);
	real dollar;
	dollar =amount / EperD;
   $display("Euro: %f\nDollar: %f\n", amount, dollar);
endfunction

function WtoY(real amount);
	real won;
	won = WperY * amount;
   $display("Yen: %f\nWon: %f\n", amount, won);
endfunction

function YtoW(real amount);
	real yen;
	yen = amount / WperY;
   $display("Won: %f\nYen: %f\n", amount, yen);
endfunction
  
  initial begin
    
    EtoD(10);
    DtoE(10);
    WtoY(10);
    YtoW(10);
  end
    
endmodule
