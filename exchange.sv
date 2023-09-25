module a;

function EtoD(real amount);
	real euro;
	euro = 0.93871 * amount;
	$display("Dollar %f = Euro %f", amount, euro);
endfunction

function DtoE(real amount);
	real dollar;
	dollar =amount / 0.93871;
    $display("Euro %f = Dollar %f", amount, dollar);
endfunction

function WtoY(real amount);
	real won;
	won = 9.00870 * amount;
	$display("Yen %f = Won %f", amount, won);
endfunction

function YtoW(real amount);
	real yen;
	yen = amount / 9.00870;
	$display("Won %f = Yen %f", amount, yen);
endfunction
  
  initial begin
    
    EtoD(10);
    DtoE(10);
    WtoY(10);
    YtoW(10);
  end
    
endmodule
