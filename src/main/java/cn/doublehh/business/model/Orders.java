package cn.doublehh.business.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

@Table(name = "orders")
public class Orders implements Serializable {
	@Id
	private String id;

	private Double price;

	private String uid;

	private Date time;

	private String status;

	private String remark;

	private static final long serialVersionUID = 1L;

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	/**
	 * @return id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return price
	 */
	public Double getPrice() {
		return price;
	}

	/**
	 * @param price
	 */
	public void setPrice(Double price) {
		this.price = price;
	}

	/**
	 * @return uid
	 */
	public String getUid() {
		return uid;
	}

	/**
	 * @param uid
	 */
	public void setUid(String uid) {
		this.uid = uid;
	}

	/**
	 * @return time
	 */
	public Date getTime() {
		return time;
	}

	/**
	 * @param time
	 */
	public void setTime(Date time) {
		this.time = time;
	}

	/**
	 * @return status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status
	 */
	public void setStatus(String status) {
		this.status = status;
	}
}