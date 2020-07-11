package com.sdm.dao;

import com.sdm.commons.beans.Announcement;

import java.util.List;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
public interface IAnnouncementDao {
    List<Announcement> selectAnnouncement();

    int deleteAnnoById(int anno_id);

    void addAnnos(Announcement announcement);


    int updateAnnoById(Announcement announcement);

    Announcement findAnnoById(String id);

    List<String> findAllId();

}
