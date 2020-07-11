package com.hrm.job.handler;

import com.hrm.commons.beans.Job;
import com.hrm.job.service.IJobService;
import com.hrm.utils.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/job")
public class JobHandler {

    @Autowired
    private IJobService jobService;

    //查询职位
    @RequestMapping("/findJob")
    public String findJob(@RequestParam(defaultValue = "1") int pageIndex, String name, Model model){
        PageModel pageModel = new PageModel();
        pageModel.setPageIndex(pageIndex);
        int recordCount = jobService.findJobCount(name);
        pageModel.setRecordCount(recordCount);
        List<Job> jobs = jobService.findJob(name,pageModel);
       /* for (Job j:jobs){
            System.out.println(j);
        }*/
        model.addAttribute("jobs",jobs);
        model.addAttribute("pageModel",pageModel);
        model.addAttribute("name",name);
        return "/jsp/job/job.jsp";
    }

    //通过id查询职位
  @RequestMapping("/findJobById")
    public String findJobById(int id,Model model,int pageIndex){
        Job job = jobService.findJobById(id);
        model.addAttribute("job",job);
        model.addAttribute("pageIndex",pageIndex);
        return "/jsp/job/showUpdateJob.jsp";
    }

    //修改职位
    @RequestMapping("/modifyJob")
    @ResponseBody
    public String modifyJob(Job job){
        System.out.println(job);
        int rows = jobService.modifyJob(job);
        if(rows > 0){
            return "OK";
        }
        else{
            return "FAIL";
        }
    }

    //删除职位
    @RequestMapping("/removeJob")
    @ResponseBody
    public String removeJob(Integer[] ids){
        try {
            int rows = jobService.removeJob(ids);
            if (rows == ids.length){
                return "OK";
            }
            else{
                return "FAIL";
            }
        }catch (DataIntegrityViolationException e){
            return "ERROR";
        }
    }

    //添加职位
    @RequestMapping("/addJob")
    @ResponseBody
    public Object addJob(Job job){
        System.out.println(job);
        int rows = jobService.addJob(job);
        if (rows > 0){
            PageModel pageModel = new PageModel();
            int recordCount = jobService.findJobCount(null);
            pageModel.setRecordCount(recordCount);
            return pageModel.getTotalSize();
        }
        else{
            return "FAIL";
        }
    }
}
