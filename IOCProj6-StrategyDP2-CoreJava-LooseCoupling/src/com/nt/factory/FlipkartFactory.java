package com.nt.factory;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import com.nt.comp.Courier;
import com.nt.comp.Flipkart;

public class FlipkartFactory {
	private static Properties props;
	static {
		InputStream is = null;
		try {
			// Locate properties file using stream/reader
			is = new FileInputStream("src/com/nt/commons/info.properties");

			// Load Properties file into java.util.Properties object
			props = new Properties();
			props.load(is);
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Flipkart getInstance() throws Exception {

		Courier courier = null;
		Flipkart fpkt = null;

		// get Dependent class and Create object
		courier=(Courier)Class.forName(props.getProperty("sdp.dependent")).newInstance();

		// Create Target class object
		fpkt = new Flipkart();

		// Assign Dependent class object to target class object
		fpkt.setCourier(courier);

		return fpkt;
	}
}
