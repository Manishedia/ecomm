package com.nt.comp;

public class Test {

	private int a, b;

	static {
		System.out.println("Test:: Static Block");
	}

	public Test() {
		System.out.println("Test :: 0-param Constructor");
	}

	public Test(int a, int b) {
		System.out.println("Test.Test() :- Calling 2-Param Constructor");
		this.a = a;
		this.b = b;
	}

	@Override
	public String toString() {
		return "Test [a=" + a + ", b=" + b + "]";
	}
	
	
}
