package kr.or.ddit.smartware.approval.web;

import com.sun.org.apache.xpath.internal.operations.Mod;
import kr.or.ddit.smartware.approval.model.ApplAppr;
import kr.or.ddit.smartware.approval.model.Application;
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
import org.springframework.web.bind.annotation.RequestParam;

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

        List<Map> apprMemInfoList = new ArrayList<>();
        for (ApprMember apprMember : apprMemList) {
            apprMemInfoList.add(employeeService.getEmployeeDetail(apprMember.getAppr_emp()));
        }

        model.addAttribute("apprMemInfoList", apprMemInfoList);

        return "jsonView";
    }

    @PostMapping("applCheckBox")
    public String applCheckBox(String apprMember, Model model) {
        List<Map> applList = new ArrayList<>();

        for (String findMember : checkMember(apprMember)) {
            applList.add(employeeService.getEmployeeDetail(findMember));
        }
        model.addAttribute("applList", applList);
        return "jsonView";
    }

    @GetMapping("sendApprovalList")
    public String getSendAppl(HttpSession session, Model model) {
        String emp_id = ((Employee)session.getAttribute("S_EMPLOYEE")).getEmp_id();
        List<Map> applications = approvalService.sendApplList(emp_id);
        List<Map> applList = new ArrayList<>();
        for (Map application : applications) {
            List<ApplAppr> applApprs = approvalService.confirmStatus((String) application.get("APPL_ID"));
            Map data = new HashMap();
            data.put("application", application);
            data.put("applApprs", applApprs);
            applList.add(data);
        }
        model.addAttribute("applList", applList );
        model.addAttribute("res", false);
        return "tiles/approval/sendApplList";
    }

    @PostMapping("sendApprovalList")
    public String postSendAppl(@RequestParam Map param, HttpSession session, Model model) {
        String emp_id = ((Employee)session.getAttribute("S_EMPLOYEE")).getEmp_id();
        param.put("emp_id", emp_id);
        List<String> apprList = checkMember((String) param.get("to"));

        if(approvalService.insertAppl(param) == 1 ) {
            int num = 0;
            for (String apprMem : apprList) {
                param.put("appr_emp", apprMem);
                num += approvalService.setAppr(param);
            }
            if (apprList.size() == num) {
                model.addAttribute("res", true);
                List<Map> applications = approvalService.sendApplList(emp_id);
                List<Map> applList = new ArrayList<>();
                for (Map application : applications) {
                    List<ApplAppr> applApprs = approvalService.confirmStatus((String) application.get("APPL_ID"));
                    Map data = new HashMap();
                    data.put("application", application);
                    data.put("applApprs", applApprs);
                    applList.add(data);
                }
                model.addAttribute("applList", applList );
            }

        } else {
            model.addAttribute("res", false);
        }

        return "tiles/approval/sendApplList";
    }

    @GetMapping("approvalList")
    public String approvalList(@RequestParam Map param, HttpSession session, Model model) {
        String emp_id = ((Employee)session.getAttribute("S_EMPLOYEE")).getEmp_id();

        List<Map> applList = approvalService.confirmApplList(emp_id);
        if (applList != null) {
            model.addAttribute("applList", applList);
        }
        return "tiles/approval/confirmApplList";
    }

    @GetMapping("approvalDetail")
    public String approvalDetail(Model model, String appl_id, String flag) {
        Application appl = approvalService.getAppl(appl_id);

        model.addAttribute("appl", appl);
        model.addAttribute("flag", flag);
        return "tiles/approval/approvalDetail";
    }



    /* 받는 사람 아이디 추출 */
    private List<String> checkMember(String apprMember) {
        final Pattern PATTERN_BRACKET = Pattern.compile("\\([^\\(\\)]+\\)");
        final String VOID = "";

        List<String> findMembers = new ArrayList<>();

        Matcher matcher = PATTERN_BRACKET.matcher(apprMember);

        String pureText = apprMember;
        String findMember = "";

        while (matcher.find()) {
            int startIdx = matcher.start();
            int endIdx = matcher.end();

            findMember = pureText.substring(startIdx+1, endIdx-1);
            pureText = pureText.replace(findMember, VOID);
            matcher = PATTERN_BRACKET.matcher(pureText);

            findMembers.add(findMember);
        }

        return findMembers;
    }
}
