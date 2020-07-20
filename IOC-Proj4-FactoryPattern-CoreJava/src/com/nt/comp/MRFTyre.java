package com.nt.comp;

public class MRFTyre implements Tyre {

	public MRFTyre() {
		System.out.println("MRFTyre :: 0-Param Constructor");
	}

	@Override
	public String roadGrip() {
		return "MRF Tyre:: Super Road Grip --> Suitable for Sports";

	}

}
