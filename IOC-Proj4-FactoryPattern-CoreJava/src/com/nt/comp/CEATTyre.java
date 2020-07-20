package com.nt.comp;

public class CEATTyre implements Tyre {

	public CEATTyre() {
		System.out.println("CEATTyre :: 0-Param Constructor");
	}

	@Override
	public String roadGrip() {
		return "CEAT Tyre:: Smooth Road Grip --> Suitable forLuxury Comfort";

	}

}
