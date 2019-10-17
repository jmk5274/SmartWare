package kr.or.ddit.smartware.approval.web;

import kr.or.ddit.smartware.approval.model.Form;
import kr.or.ddit.smartware.approval.service.IFormService;
import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.service.IDepartmentService;
import kr.or.ddit.smartware.employee.service.IEmployeeService;
import kr.or.ddit.smartware.employee.service.IPositionService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@RequestMapping("approval")
@Controller
public class ApprovalController {
    private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);

    @Resource(name = "departmentService")
    private IDepartmentService departmentService;

    @Resource(name = "positionService")
    private IPositionService positionService;

    @Resource(name = "employeeService")
    private IEmployeeService employeeService;

    @Resource(name = "formService")
    private IFormService formService;

    @GetMapping("approvalPage")
    public String approvalPage(Model model) {
        List<Map> departList = departmentService.getDepartMentList();

        List<Employee> employeeList = employeeService.allEmployeeList();
        List<Map> positionList = positionService.getPositionList();
        List<Form> formList = formService.getFormList();

        logger.debug("departList - {}", departList);
        model.addAttribute("departList", departList);
        model.addAttribute("employeeList", employeeList);
        model.addAttribute("positionList", positionList);
        model.addAttribute("formList", formList);

        return "tiles/approval/approvalPage";
    }

    @PostMapping("formInfo")
    public String formInfo(String form_id, Model model) {
        Form form = formService.getFormInfo(form_id);
        if (form != null) {
            model.addAttribute("form_cont", form.getForm_cont());
        }
        return "jsonView";
    }
}
