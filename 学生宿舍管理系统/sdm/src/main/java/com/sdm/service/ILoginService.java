/**
 * Created by IntelliJ IDEA.
 * User: 枫桥夜泊
 * Date: 2019/12/26
 * Time: 18:12
 */
package com.sdm.service;

import com.sdm.commons.beans.Student;
import com.sdm.commons.beans.User;

public interface ILoginService {
    User checkLogin(String username, String password);
    Student checkSnoLogin(String sno, String password);
}
