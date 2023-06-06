package DAO;

import java.sql.Date;

public class Ensiegnant {
     private int code;
     private String nom,prenom,status,email,password,fonction,etatcivil,departement,type;
     public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	Date date; 
	public int getCode() {
		return code;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	 
	@Override
	public String toString() {
		return "Ensiegnant [code=" + code + ", nom=" + nom + ", prenom=" + prenom + ", status=" + status + ", email="
				+ email + ", password=" + password + ", fonction=" + fonction + ", etatcivil=" + etatcivil
				+ ", departement=" + departement + ", date=" + date + "]";
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFonction() {
		return fonction;
	}
	public void setFonction(String fonction) {
		this.fonction = fonction;
	}
	public String getEtatcivil() {
		return etatcivil;
	}
	public void setEtatcivil(String etatcivil) {
		this.etatcivil = etatcivil;
	}
	public String getDepartement() {
		return departement;
	}
	public void setDepartement(String departement) {
		this.departement = departement;
	}
}
