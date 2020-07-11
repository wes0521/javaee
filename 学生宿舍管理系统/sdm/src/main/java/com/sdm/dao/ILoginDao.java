/**
 * Created by IntelliJ IDEA.
 * User: 枫桥夜泊
 * Date: 2019/12/26
 * Time: 17:58
 */
package com.sdm.dao;

import com.sdm.commons.beans.Student;
import com.sdm.commons.beans.User;
import org.springframework.web.bind.annotation.RequestParam;

public interface ILoginDao {
    /**
     * 查找用户名和密码
     * @param username 登录用户名
     * @return
     */
    User findByUsername(String username);
//    Student selectBySno( @RequestParam("sno")String sno);

}
