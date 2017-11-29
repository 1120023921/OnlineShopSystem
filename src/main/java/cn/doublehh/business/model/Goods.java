package cn.doublehh.business.model;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "goods")
public class Goods implements Serializable {
	@Id
	private String id;

	private String fruit;

	private Double price;

	private String pic;

	private static final long serialVersionUID = 1L;

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
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
	 * @return fruit
	 */
	public String getFruit() {
		return fruit;
	}

	/**
	 * @param fruit
	 */
	public void setFruit(String fruit) {
		this.fruit = fruit;
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
}