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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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

    /* 결재진행현황 체크박스화 */
    @PostMapping("applCheckBox")
    public String applCheckBox(String apprMember, Model model) {
        List<Map> applList = new ArrayList<>();

        for (String findMember : checkMember(apprMember)) {
            applList.add(employeeService.getEmployeeDetail(findMember));
        }
        model.addAttribute("applList", applList);
        return "jsonView";
    }

    /* 송신한 결재 목록 */
    @GetMapping("sendApprovalList")
    public String getSendAppl(HttpServletRequest request, HttpSession session, Model model) {
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

        Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
        if (inputFlashMap != null) {
            Boolean res = (Boolean) inputFlashMap.get("res");
            model.addAttribute("res", res);
        } else {
            model.addAttribute("res", false);
        }
        return "tiles/approval/sendApplList";
    }

    /* 송신 후 완료된 결재 목록 */
    @GetMapping("sendApplCompleList")
    public String getSendComple(HttpServletRequest request, HttpSession session, Model model) {
        String emp_id = ((Employee)session.getAttribute("S_EMPLOYEE")).getEmp_id();
        List<Map> applications = approvalService.sendApplCompleList(emp_id);
        List<Map> applList = new ArrayList<>();
        for (Map application : applications) {
            List<ApplAppr> applApprs = approvalService.confirmStatus((String) application.get("APPL_ID"));
            Map data = new HashMap();
            data.put("application", application);
            data.put("applApprs", applApprs);
            applList.add(data);
        }
        model.addAttribute("applList", applList );
        return "tiles/approval/sendApplCompleList";
    }

    /* 송신 후 반려된 결재 목록 */
    @GetMapping("sendApplReferList")
    public String getSendRefer(HttpServletRequest request, HttpSession session, Model model) {
        String emp_id = ((Employee)session.getAttribute("S_EMPLOYEE")).getEmp_id();
        List<Map> applications = approvalService.sendApplReferList(emp_id);
        List<Map> applList = new ArrayList<>();
        for (Map application : applications) {
            List<ApplAppr> applApprs = approvalService.confirmStatus((String) application.get("APPL_ID"));
            Map data = new HashMap();
            data.put("application", application);
            data.put("applApprs", applApprs);
            applList.add(data);
        }
        model.addAttribute("applList", applList );
        return "tiles/approval/sendApplReferList";
    }

    /* 결재 등록 */
    @PostMapping("sendApprovalList")
    public String postSendAppl(@RequestParam Map param, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
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
                redirectAttributes.addFlashAttribute("res", true);
            }

        } else {
            redirectAttributes.addFlashAttribute("res", false);
        }

        return "redirect:/approval/sendApprovalList";
    }

    /* 결재할 문서 목록*/
    @GetMapping("confirmApplList")
    public String confirmApplList(HttpServletRequest request, @RequestParam Map param, HttpSession session, Model model) {
        String emp_id = ((Employee)session.getAttribute("S_EMPLOYEE")).getEmp_id();

        List<Map> applList = approvalService.confirmApplList(emp_id);
        if (applList != null) {
            model.addAttribute("applList", applList);
        }

        Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
        if (inputFlashMap != null) {
            Boolean res = (Boolean) inputFlashMap.get("res");
            model.addAttribute("res", res);
        } else {
            model.addAttribute("res", false);
        }

        return "tiles/approval/confirmApplList";
    }

    @GetMapping("confirmApplCompleList")
    public String confirmApplCompleList(HttpServletRequest request, @RequestParam Map param, HttpSession session, Model model) {
        String emp_id = ((Employee)session.getAttribute("S_EMPLOYEE")).getEmp_id();

        List<Map> applList = approvalService.confirmApplCompleList(emp_id);
        if (applList != null) {
            model.addAttribute("applList", applList);
        }

        Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
        if (inputFlashMap != null) {
            Boolean res = (Boolean) inputFlashMap.get("res");
            model.addAttribute("res", res);
        } else {
            model.addAttribute("res", false);
        }

        return "tiles/approval/confirmApplCompleList";
    }

    @GetMapping("confirmReferCompleList")
    public String confirmReferCompleList(HttpServletRequest request, @RequestParam Map param, HttpSession session, Model model) {
        String emp_id = ((Employee)session.getAttribute("S_EMPLOYEE")).getEmp_id();

        List<Map> applList = approvalService.confirmApplReferList(emp_id);
        if (applList != null) {
            model.addAttribute("applList", applList);
        }

        Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
        if (inputFlashMap != null) {
            Boolean res = (Boolean) inputFlashMap.get("res");
            model.addAttribute("res", res);
        } else {
            model.addAttribute("res", false);
        }

        return "tiles/approval/confirmApplReferList";
    }

    /* 해당 결재문서 상세보기 */
    @GetMapping("/{appl_id}")
    public String approvalDetail(HttpSession session, Model model, @PathVariable String appl_id, String flag) {
        Employee employee = (Employee)session.getAttribute("S_EMPLOYEE");
        Application appl = approvalService.getAppl(appl_id);

        model.addAttribute("appl", appl);
        model.addAttribute("flag", flag);
        return "tiles/approval/approvalDetail";
    }

    /* 결재하기 */
    @PostMapping("checkAppl")
    public String checkAppl(@RequestParam Map data, HttpSession session, RedirectAttributes redirectAttributes) {
        Employee employee = (Employee)session.getAttribute("S_EMPLOYEE");
        data.put("emp_id", employee.getEmp_id());
        int checkAppl = approvalService.checkAppl(data);

        ApplAppr applAppr = new ApplAppr();
        applAppr.setAppl_id((String) data.get("appl_id"));
        applAppr.setAppr_emp(employee.getEmp_id());

        int checkAble = approvalService.checkAble(applAppr);

        if (checkAble != 0 && checkAppl != 0) {
            redirectAttributes.addFlashAttribute("res", true);
        }

        return "redirect:/approval/confirmApplCompleList";
    }

    /* 반려하기 */
    @PostMapping("checkRefer")
    public String checkRefer(@RequestParam Map data, HttpSession session, RedirectAttributes redirectAttributes) {
        Employee employee = (Employee)session.getAttribute("S_EMPLOYEE");
        data.put("emp_id", employee.getEmp_id());
        int referAppl = approvalService.referAppl(data);

        return "redirect:/approval/confirmApplList";
    }

    /* 도장사진 입력 */
    @GetMapping("empSignPicture")
    public void empSignPicture(HttpSession session, HttpServletResponse response, HttpServletRequest request) {
//        Employee employee = (Employee)session.getAttribute("S_EMPLOYEE");
        String sign = request.getParameter("sign");

        ServletOutputStream sos = null;
        FileInputStream fis = null;
        File picture = null;
        String path = "C:/picture/sign";

        try {
            sos = response.getOutputStream();
            picture = new File(path+"/"+sign);
            try {
                fis = new FileInputStream(picture);
            } catch (Exception e) {
                picture = new File(path+"/no_img.png");
                fis = new FileInputStream(picture);
            }
            byte[] buff = new byte[512];
            int len = 0;

            while((len = fis.read(buff, 0, 512)) != -1) {
                sos.write(buff,0,len);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                fis.close();
                sos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
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
