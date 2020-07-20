package com.nt.comp;

public class AppoloTyre implements Tyre {

	public AppoloTyre() {
		System.out.println("AppoloTyre :: 0-Param Constructor");
	}
	
	@Override
	public String roadGrip() {
		return "Appolo Tyre:: Standard Road Grip --> Suitable for Any Transportation";

	}

}
