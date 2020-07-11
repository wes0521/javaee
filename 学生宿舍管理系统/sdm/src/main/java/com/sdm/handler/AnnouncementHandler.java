package com.sdm.handler;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sdm.commons.beans.Announcement;
import com.sdm.service.IAnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/anno")
public class AnnouncementHandler {

    @Autowired
    private IAnnouncementService announcementService;

    /**
     * 查询公告内容
     * @param session
     * @return
     */
    @RequestMapping("/findAnnouncement.do")
    public String findAnnouncement(@RequestParam(defaultValue = "1",required = true) Integer pageNum, HttpSession session){
        System.out.println("查询公告");
        //获取指定页的大小，pageSize=8
        PageHelper.startPage(pageNum,5);

        List<Announcement> announcements = announcementService.findAnnouncement();

        //使用PageInfo包装数据
        //navigatePages：导航的页码数
        PageInfo pageInfo = new PageInfo(announcements);
        session.setAttribute("pageInfo",pageInfo);

        for(Announcement anno:announcements){
            System.out.println(anno);
        }
        session.setAttribute("announcements",announcements);
        return "/listAnnouncement.jsp";
    }

    @RequestMapping("/findAnnByStudent.do")
    public String findAnnByStudent(@RequestParam(defaultValue = "1",required = true) Integer pageNum, HttpSession session){
        System.out.println("学生查询公告");
        //获取指定页的大小，pageSize=8
        PageHelper.startPage(pageNum,5);

        List<Announcement> announcements = announcementService.findAnnouncement();

        //使用PageInfo包装数据
        //navigatePages：导航的页码数
        PageInfo pageInfo = new PageInfo(announcements);
        session.setAttribute("pageInfo",pageInfo);
        session.setAttribute("announcements",announcements);
        return "/listAnnByStudent.jsp";
    }


    /**
     * 删除公告内容
     * @param session
     * @return
     */
    @RequestMapping("/deleteAnnouncement.do")
    public String deleteAnnouncement(int anno_id,HttpSession session){
        System.out.println("删除公告内容");
        int row = announcementService.deleteAnno(anno_id);
        if (row>0){
            System.out.println("删除成功");
        }else {
            System.out.println("删除失败");
        }
        session.getAttribute("anno_id");
        return "/anno/findAnnouncement.do";
    }

    /**
     * 添加
     */
    @RequestMapping("/addAnno.do")
    public String addAnno(Announcement announcement, HttpSession session){
        System.out.println("添加公告内容");
        System.out.println(announcement);
        announcementService.addAnno(announcement);
        System.out.println(announcement);
        return "redirect:/anno/findAnnouncement.do";
    }

    /**
     * 根据id查询
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/updateAnno2.do")
    public String updateAnno2(String id,HttpSession session){
        System.out.println("根据id查询");
        System.out.println(id);
        List<String> ids = findAllId();
        Announcement announcement = announcementService.findAnnoById(id);
        session.setAttribute("announcement",announcement);
        session.setAttribute("ids",ids);
        System.out.println("查询完毕");
        return "/listAnnoOne.jsp";
    }


    @RequestMapping("/updateAnno1.do")
    public String updateAnno1(String id,HttpSession session){
        System.out.println("修改先查询");
        System.out.println(id);
        List<String> ids = findAllId();
        Announcement announcement = announcementService.findAnnoById(id);
        session.setAttribute("announcement",announcement);
        session.setAttribute("ids",ids);
        System.out.println("查询完毕");
        return "/updateAnno.jsp";
    }

    @RequestMapping("/updateAnno.do")
    public String updateAnno(String id , Announcement announcement){
        System.out.println("修改公告");
        System.out.println(id);
        int row = announcementService.modifyById(announcement);
        Announcement announcement1 = announcementService.findAnnoById(id);
        System.out.println(announcement1);
        if (row > 0){
            System.out.println("修改成功");
        }else {
            System.out.println("修改失败");
        }
        return "/listAnnouncement.jsp";
    }

    public List<String> findAllId() {
        return announcementService.findAllId();
    }
}
