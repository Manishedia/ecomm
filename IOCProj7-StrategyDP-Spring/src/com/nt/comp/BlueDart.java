package com.nt.comp;

//Following Rule 3 (final)
//Following Rule 2 (Interface Implementation)
public final class BlueDart implements Courier {

	public BlueDart() {
		System.out.println("BlueDart :: 0-Param Constructor");
	}

	@Override
	public String deliver(int orderId) {
		System.out.println("BlueDart.deliver()");
		return "BlueDart Courier will deliver order id+ " + orderId + " Product";
	}

}
