// exchange

function get_Euro_from_Dollar(real amount);
	real euro;
	real euro = 0.93871 * amount;
	$display("Dollar %f = Euro %f", amount, euro);
endfunction

function get_Dollar_from_Euro(real amount);
	real dollar;
	dollar =amount / 0.93871
	$display("Euro %f = Dollar %f", amount, euro);
endfunction
