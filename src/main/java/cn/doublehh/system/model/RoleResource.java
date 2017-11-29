package cn.doublehh.system.model;

import java.io.Serializable;
import javax.persistence.*;

@Table(name = "t_s_role_resource")
public class RoleResource implements Serializable {
    @Id
    private Integer id;

    @Column(name = "role_id")
    private Integer roleId;

    @Column(name = "resource_id")
    private Integer resourceId;

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
     * @return role_id
     */
    public Integer getRoleId() {
        return roleId;
    }

    /**
     * @param roleId
     */
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    /**
     * @return resource_id
     */
    public Integer getResourceId() {
        return resourceId;
    }

    /**
     * @param resourceId
     */
    public void setResourceId(Integer resourceId) {
        this.resourceId = resourceId;
    }
}