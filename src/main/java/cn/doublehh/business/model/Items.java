package cn.doublehh.business.model;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "items")
public class Items implements Serializable {
    @Id
    private String id;

    private Double price;

    private String order_id;

    private String goods_id;

    private Integer num;

    private Double eachprice;

    private String goods_name;

    private static final long serialVersionUID = 1L;

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
     * @return num
     */
    public Integer getNum() {
        return num;
    }

    /**
     * @param num
     */
    public void setNum(Integer num) {
        this.num = num;
    }

    /**
     * @return eachprice
     */
    public Double getEachprice() {
        return eachprice;
    }

    /**
     * @param eachprice
     */
    public void setEachprice(Double eachprice) {
        this.eachprice = eachprice;
    }

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

}