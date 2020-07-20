package com.nt.comp;

public class LuxuryCar implements Car {

	private Tyre tyre;

	public LuxuryCar(Tyre tyre) {
		System.out.println("LuxuryCar :: 1-Param Constructor");
		this.tyre = tyre;
	}

	@Override
	public void drive() {
		System.out.println("Driving Sports Car having "+tyre.roadGrip());

	}

}
