package com.thegutsyninjas;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.thegutsyninjas.DBOperation;

public class DBOperationTest {
	
	@Test
	public void testgetActiveCustomersCount_null() {
		Integer fixture=new DBOperation().getActiveCustomersCount("1");
		assertNotNull(fixture.toString());
	}
	@Test
	public void testgetCustomerName_null() {
		String fixture=new DBOperation().getCustomerName();
		assertNotNull(fixture);
	}
	@Test
	public void testgetCustomerName_valid() {
		String fixture=new DBOperation().getCustomerName();
		assertEquals("Daniel",fixture);
	}
	@Test
	public void testgetEngineers_null() {
		assertNotNull(new DBOperation().getEngineers("ALL"));
	}
	@Test
	public void testgetEngineers_valid() {
		assertEquals(20,new DBOperation().getEngineers("ALL").size());
	}
	@Test
	public void testgetEngineers_valid_FIOS() {
		assertEquals(5,new DBOperation().getEngineers("FIOS").size());
	}
	@Test
	public void testgetEngineers_valid_TV() {
		assertEquals(5,new DBOperation().getEngineers("TV").size());
	}
	@Test
	public void testgetEngineers_valid_INTE() {
		assertEquals(5,new DBOperation().getEngineers("INTE").size());
	}
	@Test
	public void testgetEngineers_valid_VOICE() {
		assertEquals(5,new DBOperation().getEngineers("VOICE").size());
	}
	@Test
	public void testgetRequestDetailsOfCustomer_null() {
		assertNotNull(new DBOperation().getRequestDetailsOfCustomer("15"));
	}
	@Test
	public void testgetRequestDetailsOfCustomer_valid() {
		assertEquals(1,new DBOperation().getRequestDetailsOfCustomer("15").size());
	}
	@Test
	public void testgetRequestId_null() {
		Integer fixture=new DBOperation().getRequestId();
		assertNotNull(fixture);
	}
	@Test
	public void testgetQueueCustomersCountt_null() {
		Integer fixture=new DBOperation().getQueueCustomersCount("1");
		assertNotNull(fixture.toString());
	}
	@Test
	public void testgetNewCustomersCount_null() {
		Integer fixture=new DBOperation().getNewCustomersCount("1");
		assertNotNull(fixture.toString());
	}
	@Test
	public void testgetEngPosition_null() {
		assertNotNull(new DBOperation().getEngPosition("1"));
	}
	@Test
	public void testgetEngPosition_valid() {
		assertEquals(1,new DBOperation().getEngPosition("1").size());
	}
}
