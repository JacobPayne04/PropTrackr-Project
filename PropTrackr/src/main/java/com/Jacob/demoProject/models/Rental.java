package com.Jacob.demoProject.models;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "rental")
public class Rental {

	// VARIABLES + VALIDATIONS
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	// TO CONNECT USER TO BOOKS (ONE-TO-MANY)
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;

	// title
	@NotBlank(message = "address is required")
	private String address;

	@Min(1)
	@NotNull
	private Integer zip;

	@NotBlank(message = "day of week is required")
	private String state;

	@NotBlank(message = "Your description is required")
	private String fname;

	@NotBlank(message = "Your description is required")
	private String lname;

	@NotBlank(message = "lease length is required")
	private String leaselength;

	

	// CreatedAt, UpdatedAt
	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;

	// empty constructor
	public Rental() {
	}

	public Rental(@NotEmpty(message = "address is required") String address,
			@NotEmpty(message = "zip is required") Integer zip, @NotEmpty(message = "state is required") String state,
			@NotEmpty(message = "first name is required") String fname,
			@NotEmpty(message = "last name is required") String lname,
			@NotEmpty(message = "last name is required") String leaselength) {
		super();
		this.address = address;
		this.zip = zip;
		this.state = state;
		this.fname = fname;
		this.lname = lname;
		this.leaselength = leaselength;
	}

	// GETTERS AND SETTERS
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getZip() {
		return zip;
	}

	public void setZip(Integer zip) {
		this.zip = zip;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getLeaselength() {
		return leaselength;
	}

	public void setLeaselength(String leaselength) {
		this.leaselength = leaselength;
	}

	// PREPERSIST AND PREUPDATE
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

}