package com.nt.factory;

import com.nt.comp.AppoloTyre;
import com.nt.comp.BudgetCar;
import com.nt.comp.CEATTyre;
import com.nt.comp.Car;
import com.nt.comp.LuxuryCar;
import com.nt.comp.MRFTyre;
import com.nt.comp.SportsCar;
import com.nt.comp.Tyre;

public class CarFactory {

	// factory method
	public static Car getInstance(String type) {
		Tyre tyre = null;
		Car car = null;
		if (type.equalsIgnoreCase("luxury")) {
			tyre = new CEATTyre();
			car = new LuxuryCar(tyre);
		}
		else if (type.equalsIgnoreCase("sports")) {
			tyre = new MRFTyre();
			car = new SportsCar(tyre);
		}
		else if (type.equalsIgnoreCase("budget")) {
			tyre = new AppoloTyre();
			car = new BudgetCar(tyre);
		}
		else
		{
			throw new IllegalArgumentException("Invalid Car Type");
		}
		return car;
	}
}
