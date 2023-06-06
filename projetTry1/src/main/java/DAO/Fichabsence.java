package DAO;

import java.sql.Date;

public class Fichabsence {
   private String typefich,module;
   private int idfich, count;
   private Date datefich;
public String getTypefich() {
	return typefich;
}
public void setTypefich(String typefich) {
	this.typefich = typefich;
}
public String getModule() {
	return module;
}
public void setModule(String module) {
	this.module = module;
}
public int getIdfich() {
	return idfich;
}
public void setIdfich(int idfich) {
	this.idfich = idfich;
}
 
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}
public Date getDatefich() {
	return datefich;
}
public void setDatefich(Date datefich) {
	this.datefich = datefich;
}
 
   
}
