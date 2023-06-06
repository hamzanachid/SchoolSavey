package DAO;

import java.sql.Date; 

public class Etudiant { 
     private String nom,prenom,etat_civil,module,niveau,cne,apogee,adress,phone;
     public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getNiveau() {
		return niveau;
	}
	public void setNiveau(String niveau) {
		this.niveau = niveau;
	}
	private Date daten;
	
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "Etudiant [nom=" + nom + ", prenom=" + prenom + ", etat_civil=" + etat_civil + ", module=" + module
				+ ", niveau=" + niveau + ", cne=" + cne + ", apogee=" + apogee + ", adress=" + adress + ", phone="
				+ phone + ", daten=" + daten + "]";
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	 
	public String getCne() {
		return cne;
	}
	public void setCne(String cne) {
		this.cne = cne;
	}
	public String getApogee() {
		return apogee;
	}
	public void setApogee(String apogee) {
		this.apogee = apogee;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPronom() {
		return prenom;
	}
	public void setPronom(String prenom) {
		this.prenom = prenom;
	}
	public String getEtat_civil() {
		return etat_civil;
	}
	public void setEtat_civil(String etat_civil) {
		this.etat_civil = etat_civil;
	}
	public Date getDaten() {
		return daten;
	}
	public void setDaten(Date daten) {
		this.daten = daten;
	} 
     
}
