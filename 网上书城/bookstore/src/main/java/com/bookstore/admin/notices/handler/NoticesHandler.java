package com.bookstore.admin.notices.handler;

import com.bookstore.admin.notices.service.INoticesService;
import com.bookstore.commons.beans.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/notices")
public class NoticesHandler {

    @Autowired
    INoticesService noticesService;

    //查询全部公告
    @RequestMapping("/findNotices")
    public String findNotices(Model model){
        List<Notice> notices = noticesService.findNotices();
        for (Notice n:notices){
            System.out.println(n);
        }
        model.addAttribute("notices",notices);
        return "/admin/notices/list.jsp";
    }

    //删除公告
    @RequestMapping("/removeNotice")
    public String removeNotice(String id,Model model){
        int rows = noticesService.removeNotice(id);
        if (rows > 0){
            System.out.println("删除成功");
            return "redirect:/admin/notices/findNotices";
        }else {
            System.out.println("删除失败");
            model.addAttribute("error","公告删除失败,请稍后重试");
            return "/admin/notices/error.jsp";
        }
    }

    //添加公告
    @RequestMapping("/addNotice")
    public String addNotice(Notice notice,Model model){
        int rows = noticesService.addNotice(notice);
        if (rows > 0){
            System.out.println("公告添加成功");
            return "redirect:/admin/notices/findNotices";
        }
        else {
            System.out.println("公告添加失败");
            model.addAttribute("error","公告添加失败,请稍后重试");
            return "/admin/notices/error.jsp";
        }
    }

    //查询公告详细信息
    @RequestMapping("/findNoticeById")
    public String findNoticeById(String id,Model model){
        Notice notice = noticesService.findNoticeById(id);
        model.addAttribute("n",notice);
        return "/admin/notices/edit.jsp";
    }

    //修改公告信息
    @RequestMapping("/editNotice")
    public String editNotice(Notice notice,Model model){
        System.out.println(notice);
        int rows = noticesService.editNotice(notice);
        if (rows > 0){
            System.out.println("公告修改失败");
            return "redirect:/admin/notices/findNotices";
        } else {
            System.out.println("公告修改失败");
            model.addAttribute("error","公告修改失败，请稍后重试");
            return "/admin/notices/error.jsp";
        }
    }
}
