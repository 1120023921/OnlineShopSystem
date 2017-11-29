package cn.doublehh.system.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import cn.doublehh.base.audit.CreateBy;
import cn.doublehh.base.audit.CreateDate;
import cn.doublehh.base.audit.UpdateBy;
import cn.doublehh.base.audit.UpdateDate;

@Table(name = "t_s_user")
public class User implements Serializable {
    @Id
    private Integer id;

    /**
     * 用户名
     */
    private String uid;

    /**
     * 中文名
     */
    private String name;

    /**
     * 性别
     */
    private String sex;

    /**
     * 电话
     */
    private String tel;

    /**
     * 邮件
     */
    private String mail;

    /**
     * 状态
     */
    private String enabled;
    
    /**
     * 地址
     */
    private String address;

    /**
     * 创建时间
     */
    @CreateDate
    @Column(name = "create_date")
    private Date createDate;

    /**
     * 修改时间
     */
    @UpdateDate
    @Column(name = "update_date")
    private Date updateDate;

    /**
     * 创建者
     */
    @CreateBy
    @Column(name = "create_by")
    private String createBy;

    /**
     * 修改者
     */
    @UpdateBy
    @Column(name = "update_by")
    private String updateBy;

    /**
     * 备注
     */
    private String remark;

    /**
     * 密码
     */
    private String password;

    @Transient
    private List<Role> roles = new ArrayList<Role>();
    
    private static final long serialVersionUID = 1L;

    public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

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
     * 获取用户名
     *
     * @return uid - 用户名
     */
    public String getUid() {
        return uid;
    }

    /**
     * 设置用户名
     *
     * @param uid 用户名
     */
    public void setUid(String uid) {
        this.uid = uid;
    }

    /**
     * 获取中文名
     *
     * @return name - 中文名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置中文名
     *
     * @param name 中文名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取性别
     *
     * @return sex - 性别
     */
    public String getSex() {
        return sex;
    }

    /**
     * 设置性别
     *
     * @param sex 性别
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * 获取电话
     *
     * @return tel - 电话
     */
    public String getTel() {
        return tel;
    }

    /**
     * 设置电话
     *
     * @param tel 电话
     */
    public void setTel(String tel) {
        this.tel = tel;
    }

    /**
     * 获取邮件
     *
     * @return mail - 邮件
     */
    public String getMail() {
        return mail;
    }

    /**
     * 设置邮件
     *
     * @param mail 邮件
     */
    public void setMail(String mail) {
        this.mail = mail;
    }

    /**
     * 获取状态
     *
     * @return enabled - 状态
     */
    public String getEnabled() {
        return enabled;
    }

    /**
     * 设置状态
     *
     * @param enabled 状态
     */
    public void setEnabled(String enabled) {
        this.enabled = enabled;
    }

    /**
     * 获取创建时间
     *
     * @return create_date - 创建时间
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * 设置创建时间
     *
     * @param createDate 创建时间
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 获取修改时间
     *
     * @return update_date - 修改时间
     */
    public Date getUpdateDate() {
        return updateDate;
    }

    /**
     * 设置修改时间
     *
     * @param updateDate 修改时间
     */
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    /**
     * 获取创建者
     *
     * @return create_by - 创建者
     */
    public String getCreateBy() {
        return createBy;
    }

    /**
     * 设置创建者
     *
     * @param createBy 创建者
     */
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    /**
     * 获取修改者
     *
     * @return update_by - 修改者
     */
    public String getUpdateBy() {
        return updateBy;
    }

    /**
     * 设置修改者
     *
     * @param updateBy 修改者
     */
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    /**
     * 获取备注
     *
     * @return remark - 备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 设置备注
     *
     * @param remark 备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取密码
     *
     * @return password - 密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置密码
     *
     * @param password 密码
     */
    public void setPassword(String password) {
        this.password = password;
    }

	/**
	 * @return the roles
	 */
	public List<Role> getRoles() {
		return roles;
	}

	/**
	 * @param roles the roles to set
	 */
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	
    
    
}