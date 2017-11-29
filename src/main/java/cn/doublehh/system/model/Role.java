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
import cn.doublehh.system.model.User;

import org.springframework.format.annotation.DateTimeFormat;

@Table(name = "t_s_role")
public class Role implements Serializable {
    @Id
    private Integer id;

    /**
     * 角色名
     */
    private String roid;

    /**
     * 角色中文名
     */
    private String name;

    /**
     * 状态
     */
    private String enabled;

    /**
     * 创建时间
     */
    @CreateDate
    @DateTimeFormat
    @Column(name = "create_date")
    private Date createDate;

    /**
     * 修改时间
     */
    @UpdateDate
    @DateTimeFormat
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

    @Transient
    private List<User> users = new ArrayList<User>();
    
    @Transient
    private List<Resource> resources = new ArrayList<Resource>();
    
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
     * 获取角色名
     *
     * @return roid - 角色名
     */
    public String getRoid() {
        return roid;
    }

    /**
     * 设置角色名
     *
     * @param roid 角色名
     */
    public void setRoid(String roid) {
        this.roid = roid;
    }

    /**
     * 获取角色中文名
     *
     * @return name - 角色中文名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置角色中文名
     *
     * @param name 角色中文名
     */
    public void setName(String name) {
        this.name = name;
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
	 * @return the users
	 */
	public List<User> getUsers() {
		return users;
	}

	/**
	 * @param users the users to set
	 */
	public void setUsers(List<User> users) {
		this.users = users;
	}

	/**
	 * @return the resources
	 */
	public List<Resource> getResources() {
		return resources;
	}

	/**
	 * @param resources the resources to set
	 */
	public void setResources(List<Resource> resources) {
		this.resources = resources;
	}
    
    
}