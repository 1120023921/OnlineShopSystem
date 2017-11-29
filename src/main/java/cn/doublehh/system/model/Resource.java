package cn.doublehh.system.model;


import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import cn.doublehh.base.audit.CreateBy;
import cn.doublehh.base.audit.CreateDate;
import cn.doublehh.base.audit.UpdateBy;
import cn.doublehh.base.audit.UpdateDate;

@Table(name = "t_s_resource")
public class Resource implements Serializable {
    @Id
    private Integer id;

    /**
     * 璧勬簮鍚�
     */
    private String reid;

    /**
     * 璧勬簮涓枃鍚�
     */
    private String name;

    /**
     * 绫诲瀷
     */
    private String type;

    /**
     * 鐘舵��
     */
    private String enabled;

    /**
     * 鍒涘缓鏃堕棿
     */
    @CreateDate
    @DateTimeFormat
    @Column(name = "create_date")
    private Date createDate;

    /**
     * 淇敼鏃堕棿
     */
    @UpdateDate
    @DateTimeFormat
    @Column(name = "update_date")
    private Date updateDate;

    /**
     * 鍒涘缓鑰�
     */
    @CreateBy
    @Column(name = "create_by")
    private String createBy;

    /**
     * 淇敼鑰�
     */
    @UpdateBy
    @Column(name = "update_by")
    private String updateBy;

    /**
     * 澶囨敞
     */
    private String remark;

    /**
     * 鐖惰祫婧怚D
     */
    private Integer pid;

    /**
     * 璧勬簮鍊�
     */
    private String value;
    
    /**
     * 鏄惁鍙跺瓙鑺傜偣
     */
    private String leaf;

    
    private static final long serialVersionUID = 1L;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 鑾峰彇璧勬簮鍚�
     *
     * @return reid - 璧勬簮鍚�
     */
    public String getReid() {
        return reid;
    }

    /**
     * 璁剧疆璧勬簮鍚�
     *
     * @param reid 璧勬簮鍚�
     */
    public void setReid(String reid) {
        this.reid = reid;
    }

    /**
     * 鑾峰彇璧勬簮涓枃鍚�
     *
     * @return name - 璧勬簮涓枃鍚�
     */
    public String getName() {
        return name;
    }

    /**
     * 璁剧疆璧勬簮涓枃鍚�
     *
     * @param name 璧勬簮涓枃鍚�
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 鑾峰彇绫诲瀷
     *
     * @return type - 绫诲瀷
     */
    public String getType() {
        return type;
    }

    /**
     * 璁剧疆绫诲瀷
     *
     * @param type 绫诲瀷
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 鑾峰彇鐘舵��
     *
     * @return enabled - 鐘舵��
     */
    public String getEnabled() {
        return enabled;
    }

    /**
     * 璁剧疆鐘舵��
     *
     * @param enabled 鐘舵��
     */
    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }

    /**
     * 鑾峰彇鍒涘缓鏃堕棿
     *
     * @return create_date - 鍒涘缓鏃堕棿
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * 璁剧疆鍒涘缓鏃堕棿
     *
     * @param createDate 鍒涘缓鏃堕棿
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 鑾峰彇淇敼鏃堕棿
     *
     * @return update_date - 淇敼鏃堕棿
     */
    public Date getUpdateDate() {
        return updateDate;
    }

    /**
     * 璁剧疆淇敼鏃堕棿
     *
     * @param updateDate 淇敼鏃堕棿
     */
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    /**
     * 鑾峰彇鍒涘缓鑰�
     *
     * @return create_by - 鍒涘缓鑰�
     */
    public String getCreateBy() {
        return createBy;
    }

    /**
     * 璁剧疆鍒涘缓鑰�
     *
     * @param createBy 鍒涘缓鑰�
     */
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    /**
     * 鑾峰彇淇敼鑰�
     *
     * @return update_by - 淇敼鑰�
     */
    public String getUpdateBy() {
        return updateBy;
    }

    /**
     * 璁剧疆淇敼鑰�
     *
     * @param updateBy 淇敼鑰�
     */
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    /**
     * 鑾峰彇澶囨敞
     *
     * @return remark - 澶囨敞
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 璁剧疆澶囨敞
     *
     * @param remark 澶囨敞
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 鑾峰彇鐖惰祫婧怚D
     *
     * @return pid - 鐖惰祫婧怚D
     */
    public Integer getPid() {
        return pid;
    }

    /**
     * 璁剧疆鐖惰祫婧怚D
     *
     * @param pid 鐖惰祫婧怚D
     */
    public void setPid(Integer pid) {
        this.pid = pid;
    }

    /**
     * 鑾峰彇璧勬簮鍊�
     *
     * @return value - 璧勬簮鍊�
     */
    public String getValue() {
        return value;
    }

    /**
     * 璁剧疆璧勬簮鍊�
     *
     * @param value 璧勬簮鍊�
     */
    public void setValue(String value) {
        this.value = value;
    }

	/**
	 * @return the leaf
	 */
	public String getLeaf() {
		return leaf;
	}

	/**
	 * @param leaf the leaf to set
	 */
	public void setLeaf(String leaf) {
		this.leaf = leaf;
	}
    
}