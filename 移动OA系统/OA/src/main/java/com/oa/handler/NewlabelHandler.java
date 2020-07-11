package com.oa.handler;

import com.oa.commons.beans.Newlabel;
import com.oa.commons.vo.Page;
import com.oa.service.INewlabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/newlabel")
public class NewlabelHandler {
   @Autowired
    private INewlabelService newlabelService;

    @RequestMapping("/findAll.do")
    public String findAll(@RequestParam(defaultValue = "2") int pagenum , HttpSession session){
        System.out.println("findAll");
        Page<Newlabel> newlabels = newlabelService.findCurrentPage(pagenum);
        List<String> labels = newlabelService.findlabels();
        session.setAttribute("labels",labels);
        session.setAttribute("page",newlabels);
        return "/html/news/newLabelManager.jsp";
    }

    @RequestMapping("/findAll01.do")
    public String findAll01(String label_name, @RequestParam(defaultValue = "1") int pagenum, HttpSession session){
        int id = findParentId(label_name);
        Page<Newlabel> newlabels1 = newlabelService.findCurrentPage01(id,pagenum);
        session.setAttribute("page1",newlabels1);
        session.setAttribute("id",id);
        List<String> labels = newlabelService.findlabels();
        session.setAttribute("labels",labels);
        session.setAttribute("name",label_name);
        return "/html/news/newLabelManagerOne.jsp";
    }

//
//    @RequestMapping("/findOne.do")
//    public String findOne(String label_name, HttpSession session){
//        System.out.println("findOne");
//
//        Newlabel newlabel2 = findlabelInfo(label_name);
//        //List<Newlabel> newlabels3 = newlabelService.findlabelChildren(label_name); //  newlabels3---->>子栏目信息
//        int iid = findParentId(label_name);
//        System.out.println(iid);
//        List<Newlabel> newlabels3 = newlabelService.findlabelChildren(iid);
//
////        Newlabel newlabels3 = newlabelService.findlabelChildren(label_name);
//
//        session.setAttribute("label_name",label_name);//      label_name------->>   要查找的栏目名称
//        session.setAttribute("newlabels3",newlabels3);
//        System.out.println("-----------");
//
//        // System.out.println(newlabel2);
//        //List<String> labels = newlabelService.findlabels();
//        session.setAttribute("newlabel2",newlabel2);//             newlabel2------->本栏目的父栏目信息
//        List<String> labels = newlabelService.findlabels();
//        session.setAttribute("labels",labels);//        labels---------------->>所有的栏目的list集合
//        return "/html/news/newLabelManagerOne.jsp";
//    }


    @RequestMapping("findlabels.do")
    public String findlabels(HttpSession session){
        List<String> labels = newlabelService.findlabels();
        for (String l:labels){
            System.out.println(l);
        }
        session.setAttribute("labels",labels);
        return "/html/news/labelAdd.jsp";
    }

    @RequestMapping("/update01.do")
    public String Update01(@RequestParam("id") int id, String label_name, HttpSession session){
        Newlabel newlabel02 = newlabelService.findById(id);
        session.setAttribute("newlabel01",newlabel02);
        return "/html/news/labelUpdate.jsp";
    }
    @RequestMapping("/update.do")
    public String Update(Newlabel newlabel, int id, @RequestParam("label_name") String label_name, @RequestParam("parentLabel_name") String parentLabel_name, HttpSession session){
        int pid = findParentId(parentLabel_name);
        Newlabel parentNewlabel = findlabelInfo(parentLabel_name);
        if (id - pid == 0){
            pid = 0;
        }
        newlabel.setParent(parentNewlabel);
        newlabel.setPid(pid);
        int row  = newlabelService.modifyNewLabel(newlabel);
        if (row > 0){
            System.out.println("修改成功");
        }else {
            System.out.println("修改失败");
        }
        session.getAttribute("id");
        return "/html/news/labelUpdate.jsp";
    }

    @RequestMapping("/delete.do")
    public String delete(int id, HttpSession session){
        System.out.println("delete");
        int row  = newlabelService.removeNewLabel(id);
        if (row > 0){
            System.out.println("删除成功");
        }else {
            System.out.println("删除失败");
        }
        session.getAttribute("id");
        return "/newlabel/findAll.do?pagenum=1";//调用findAll.do  再查一次
    }

    //    通过栏目名称查询栏目信息
    public Newlabel findlabelInfo(String labelName){
        return newlabelService.findlabelInfo(labelName);
    }

//    通过栏目名称查询id
    public int findParentId(String labelName){
        return newlabelService.findParentId(labelName);
    }

    @RequestMapping(value = "insert.do", method= RequestMethod.POST)
    public String add(Newlabel newlabel,@RequestParam("label_name") String label_name,@RequestParam("label_content") String label_content, @RequestParam("parentLabel_name") String parentLabel_name ,HttpSession session){
        int pid = 0;
        if(parentLabel_name.equals("null")){
            newlabel.setPid(0);
        }
        else{
            pid = findParentId(parentLabel_name);
            newlabel.setPid(pid);
        }
        int row = newlabelService.addNewLabel(newlabel);
        //session.setAttribute("newlabel");
        if (row > 0){
            System.out.println("插入成功");
        }else {
            System.out.println("插入失败");
        }
        //return "/newlabel/findAll.do?pagenum=1";
        return "/html/news/labelAdd.jsp";
    }
}
