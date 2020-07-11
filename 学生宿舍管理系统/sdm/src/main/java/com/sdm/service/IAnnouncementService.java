package com.sdm.service;

import com.sdm.commons.beans.Announcement;

import java.util.List;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
public interface IAnnouncementService {
    List<Announcement> findAnnouncement();

    int deleteAnno(int anno_id);

    void addAnno(Announcement announcement);

    int modifyById(Announcement announcement);

    Announcement findAnnoById(String id);

    List<String> findAllId();
}
