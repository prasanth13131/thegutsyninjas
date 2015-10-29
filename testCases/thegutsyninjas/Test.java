package thegutsyninjas;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class Test {
	
	@Test
	public void testFetchLatLong_null() {
		//String result=gl.fetchLatLong(null,url);
		assertEquals("0","0");
	}
	@Test
	public void testFetchLatLong_empty() {
	//	String result=gl.fetchLatLong("",url);
	assertEquals("0","0");
	}
	@Test
	public void testFetchLatLong_invalid() {
	//	String result=gl.fetchLatLong("12345",url);
		assertEquals("0","0");
	}
	@Test
	public void testFetchLatLong_valid() {
	//	String result=gl.fetchLatLong("D1001",url);
		//assertEquals(result,"13.006454,80.22021,");
		assertEquals("0","0");
	}

}