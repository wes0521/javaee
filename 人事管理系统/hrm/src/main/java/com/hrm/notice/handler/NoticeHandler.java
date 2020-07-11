package com.hrm.notice.handler;

import com.hrm.commons.beans.Notice;
import com.hrm.commons.beans.User;
import com.hrm.notice.service.INoticeService;
import com.hrm.utils.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeHandler {
    @Autowired
    private INoticeService noticeService;

    //查询公告
    @RequestMapping("/findNotice")
    public String findNotice(@RequestParam(defaultValue = "1") int pageIndex, Notice notice, Model model){
        PageModel pageModel = new PageModel();
        pageModel.setPageIndex(pageIndex);
        //System.out.println(notice+"-------------");
        List<Notice> notices = noticeService.findNotice(notice,pageModel);
        int recordCount = noticeService.findNoticeCount(notice);
        pageModel.setRecordCount(recordCount);
        //System.out.println("recordCount------->"+recordCount);
        /*for (Notice n:notices){
            System.out.println(n);
        }*/
        model.addAttribute("notices",notices);
        model.addAttribute("pageModel",pageModel);
        model.addAttribute("notice",notice);
        return "/jsp/notice/notice.jsp";
    }

    //公告修改
    @RequestMapping("/modifyNotice")
    public String modifyNotice(String flag, Notice notice,Model model,int pageIndex){
        if (flag == null){
            Notice notice1 = noticeService.findNoticeById(notice.getId());
            model.addAttribute("notice",notice1);
            model.addAttribute("pageIndex",pageIndex);
            return "/jsp/notice/showUpdateNotice.jsp";
        }else{
            int rows = noticeService.modifyNotice(notice);
            if (rows > 0){
                return "redirect:/notice/findNotice?pageIndex="+pageIndex;
            }
            else {
                model.addAttribute("fail","公告信息修改失败！");
                return "/jsp/fail.jsp";
            }

        }
    }

    //预览公告
    @RequestMapping("/previewNotice")
    public String previewNotice(int id,Model model){
        Notice notice = noticeService.findNoticeById(id);
        model.addAttribute("notice",notice);
        return "/jsp/notice/previewNotice.jsp";
    }

    //公告删除
    @RequestMapping("/removeNotice")
    public String removeNotice(Integer[] ids, Model model){
        int rows = noticeService.removeNotice(ids);
        if (rows == ids.length){
            return "redirect:/notice/findNotice";
        }
        else{
            model.addAttribute("fail","公告信息删除失败！");
            return "/jsp/fail.jsp";
        }
    }

    //添加公告
    @RequestMapping("/addNotice")
    public String addNotice(Notice notice, Model model, HttpSession session){
        //获取当前登录用户
        User login_user = (User) session.getAttribute("login_user");
        notice.setUser(login_user);
        int rows = noticeService.addNotice(notice);
        if (rows > 0 ){
            PageModel pageModel = new PageModel();
            int recordCount = noticeService.findNoticeCount(null);
            pageModel.setRecordCount(recordCount);
            return "redirect:/notice/findNotice?pageIndex="+pageModel.getTotalSize();
        }
        else {
            model.addAttribute("fail","公告添加失败！");
            return "/jsp/fail.jsp";
        }
    }
}
