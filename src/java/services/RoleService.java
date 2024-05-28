/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.RoleDB;
import java.util.List;
import models.Role;

/**
 *
 * @author Hussein
 */
public class RoleService {
    private RoleDB rdb;
    
    public RoleService(){
        this.rdb = new RoleDB();
    }
    public List<Role> getAll() throws Exception {
        return rdb.getAll();
    }
    public Role get(Integer roleId) {
        return rdb.get(roleId);
    }
}
