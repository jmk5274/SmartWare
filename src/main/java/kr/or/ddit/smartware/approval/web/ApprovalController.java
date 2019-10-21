package kr.or.ddit.smartware.approval.web;

import kr.or.ddit.smartware.approval.model.ApprMember;
import kr.or.ddit.smartware.approval.model.Form;
import kr.or.ddit.smartware.approval.service.IApprovalService;
import kr.or.ddit.smartware.approval.service.IFormService;
import kr.or.ddit.smartware.employee.model.Department;
import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.model.Position;
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
import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    @Resource(name = "approvalService")
    private IApprovalService approvalService;

    @GetMapping("approvalPage")
    public String approvalPage(Model model) {
        List<Department> departList = departmentService.getAllDepartment();
        List<Map> employeeList = employeeService.getDetailEmpList();
        List<Position> positionList = positionService.getAllPosition();
        List<Form> formList = formService.getFormList();

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

    @PostMapping("myAppr")
    public String myAppr(HttpSession session, String form_id, Model model) {
        Employee employee = (Employee) session.getAttribute("S_EMPLOYEE");

        Form formInfo = formService.getFormInfo(form_id);

        Map data = new HashMap();
        data.put("appr_line_id", formInfo.getAppr_line_id());
        data.put("emp_id", employee.getEmp_id());

        List<ApprMember> apprMemList = approvalService.getApprMember(data);

        List<Map> empList = new ArrayList<>();
        for (ApprMember apprMember : apprMemList) {
           empList.add(employeeService.getEmployeeDetail(apprMember.getAppr_emp()));
        }

        model.addAttribute("empList", empList);

        return "jsonView";
    }

    @PostMapping("applCheckBox")
    public String applCheckBox(String apprMember, Model model) {
        final Pattern PATTERN_BRACKET = Pattern.compile("\\([^\\(\\)]+\\)");
        final String VOID = "";

        List<Map> empList = new ArrayList<>();

        Matcher matcher = PATTERN_BRACKET.matcher(apprMember);

        String pureText = apprMember;
        String findMember = new String();

        while (matcher.find()) {
            int startIdx = matcher.start();
            int endIdx = matcher.end();

            findMember = pureText.substring(startIdx+1, endIdx-1);
            pureText = pureText.replace(findMember, VOID);
            matcher = PATTERN_BRACKET.matcher(pureText);

            empList.add(employeeService.getEmployeeDetail(findMember));
        }
        logger.debug("members : {}", empList);
        model.addAttribute("empList", empList);
        return "jsonView";
    }
}
