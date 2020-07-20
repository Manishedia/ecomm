package com.nt.comp;

//Following Rule 3 (final)
//Following Rule 2 (Interface Implementation)
public final class DTDC implements Courier {

	public DTDC() {
		System.out.println("DTDC:: 0-Param Constructor");
	}

	@Override
	public String deliver(int orderId) {
		System.out.println("DTDC.deliver()");
		return "DTDC Courier will deliver order id+ " + orderId + "Products";
	}

}
