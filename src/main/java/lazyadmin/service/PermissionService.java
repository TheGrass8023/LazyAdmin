package lazyadmin.service;


import lazyadmin.entity.Permission;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
public interface PermissionService {

    public Permission createPermission(Permission permission);

    public void deletePermission(Long permissionId);

    List<Permission> findAll();

    List<Permission> findByRole(Long id);

    void updatePermission(Permission p);
}
