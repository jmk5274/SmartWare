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
    public String approvalPage(HttpServletRequest request, Model model) {
        List<Department> departList = departmentService.getAllDepartment();
        List<Map> employeeList = employeeService.getDetailEmpList();
        List<Position> positionList = positionService.getAllPosition();
        List<Form> formList = formService.getFormList();

        model.addAttribute("departList", departList);
        model.addAttribute("employeeList", employeeList);
        model.addAttribute("positionList", positionList);
        model.addAttribute("formList", formList);

        Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
        if (inputFlashMap != null) {
            Map data = (Map) inputFlashMap.get("data");
            model.addAttribute("refer", data);
        }

        return "tiles/approval/approvalPage";
    }

    @PostMapping("formInfo")
    public String formInfo(String form_id, Model model) {
        Form form = formService.getFormInfo(form_id);
        if (form != null) {
            model.addAttribute("form_cont", form.getForm_cont());
            model.addAttribute("applCnt", approvalService.applCnt());
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

    /* 결재문서 송신 */
    @GetMapping("send/{url}")
    public String sendApprovalControl(@RequestParam(name = "page", defaultValue = "1") int page,
                                       @RequestParam(name = "pageSize", defaultValue = "10") int pageSize,
                                       @PathVariable("url") String url, HttpServletRequest request, HttpSession session, Model model) {
        String emp_id = ((Employee)session.getAttribute("S_EMPLOYEE")).getEmp_id();
        List<Map> applications = new ArrayList<>();
        String returnJsp = "tiles/approval/";
        int totalCnt = 0;

        Map sqlData = new HashMap();
        sqlData.put("emp_id", emp_id);
        sqlData.put("page", page);
        sqlData.put("pageSize", pageSize);

        /* 송신한 결재 목록 */
        if (url.equals("applList")) {
            totalCnt = approvalService.sendApplListCnt(emp_id);
            applications= approvalService.sendApplList(sqlData);
            returnJsp += "sendApplList";

            Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
            if (inputFlashMap != null) {
                Boolean res = (Boolean) inputFlashMap.get("res");
                model.addAttribute("res", res);
                model.addAttribute("emp_id", inputFlashMap.get("emp_id"));
            } else {
                model.addAttribute("res", false);
            }
        }
        /* 송신 후 완료된 결재 목록 */
        else if (url.equals("applCompleList")) {
            totalCnt = approvalService.sendApplCompleListCnt(emp_id);
            applications = approvalService.sendApplCompleList(sqlData);
            returnJsp += "sendApplCompleList";
        }
        /* 송신 후 반려된 결재 목록 */
        else if (url.equals("applReferList")) {
            totalCnt = approvalService.sendApplReferListCnt(emp_id);
            applications = approvalService.sendApplReferList(sqlData);
            returnJsp += "sendApplReferList";
        }

        List<Map> applList = new ArrayList<>();
        for (Map application : applications) {
            List<ApplAppr> applApprs = approvalService.confirmStatus((String) application.get("APPL_ID"));
            Map data = new HashMap();
            data.put("application", application);
            data.put("applApprs", applApprs);
            applList.add(data);
        }

        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("paginationSize", (int)Math.ceil((double) totalCnt / pageSize));
        model.addAttribute("applList", applList );
        model.addAttribute("url", url);
        return returnJsp;
    }

    /* 결재 등록 */
    @PostMapping("send/approvalList")
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
                redirectAttributes.addFlashAttribute("emp_id", approvalService.sendApplMember((String) param.get("appl_id")));
            }

        } else {
            redirectAttributes.addFlashAttribute("res", false);
        }

        return "redirect:/approval/send/applList";
    }

    /* 결재할 문서 관련 */
    @GetMapping("confirm/{url}")
    public String confirmControl(@RequestParam(name = "page", defaultValue = "1") int page,
                                 @RequestParam(name = "pageSize", defaultValue = "10") int pageSize,
                                 @PathVariable("url") String url, HttpServletRequest request, HttpSession session, Model model) {
        String emp_id = ((Employee)session.getAttribute("S_EMPLOYEE")).getEmp_id();
        String returnJsp = "tiles/approval/";
        int totalCnt = 0;

        Map sqlData = new HashMap();
        sqlData.put("emp_id", emp_id);
        sqlData.put("page", page);
        sqlData.put("pageSize", pageSize);

        List<Map> applList = new ArrayList<>();

        Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);

        if (inputFlashMap != null) {
            Boolean res = (Boolean) inputFlashMap.get("res");
            model.addAttribute("res", res);
        } else {
            model.addAttribute("res", false);
        }

        /* 결재할 문서 목록 */
        if (url.equals("applList")) {
            applList = approvalService.confirmApplList(sqlData);
            totalCnt = approvalService.confirmApplListCnt(emp_id);
            returnJsp += "confirmApplList";

            if (inputFlashMap != null) {
                model.addAttribute("appr_emp", inputFlashMap.get("appr_emp"));
                model.addAttribute("refer", true);
            }
        } else if (url.equals("applCompleList")) {
            applList = approvalService.confirmApplCompleList(sqlData);
            totalCnt = approvalService.confirmApplCompleListCnt(emp_id);
            returnJsp += "confirmApplCompleList";

            if (inputFlashMap != null) {
                logger.debug("appr_emp : {}", inputFlashMap.get("appr_emp"));
                model.addAttribute("appr_emp", inputFlashMap.get("appr_emp"));
            }
        } else if (url.equals("referCompleList")) {
            applList = approvalService.confirmApplReferList(sqlData);
            totalCnt = approvalService.confirmApplReferListCnt(emp_id);
            returnJsp += "confirmApplReferList";
        }
        if (applList != null) {
            model.addAttribute("applList", applList);
        }



        model.addAttribute("page", page);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("paginationSize", (int)Math.ceil((double) totalCnt / pageSize));
        model.addAttribute("url", url);
        return returnJsp;
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
            redirectAttributes.addFlashAttribute("appr_emp", approvalService.sendToNextMember(applAppr));
        }

        return "redirect:/approval/confirm/applCompleList";
    }

    /* 반려하기 */
    @PostMapping("checkRefer")
    public String checkRefer(@RequestParam Map data, HttpSession session, RedirectAttributes redirectAttributes) {
        Employee employee = (Employee)session.getAttribute("S_EMPLOYEE");
        data.put("emp_id", employee.getEmp_id());
        int referAppl = approvalService.referAppl(data);

        ApplAppr applAppr = new ApplAppr();
        applAppr.setAppl_id((String) data.get("appl_id"));
        applAppr.setAppr_emp(employee.getEmp_id());

        if (referAppl != 0 ) {
            redirectAttributes.addFlashAttribute("appr_emp", approvalService.referAlarm(applAppr));
        }

        return "redirect:/approval/confirm/applList";
    }

    /* 반려된 문서 재송신 */
    @PostMapping("reSend")
    public String reSend(@RequestParam Map data, RedirectAttributes redirectAttributes) {
        if (data != null) {
            redirectAttributes.addFlashAttribute("data", data);
        }
        return "redirect:/approval/approvalPage";
    }

    @PostMapping("getRefer")
    public String getRefer(String appl_id, Model model) {
        Application appl = approvalService.getAppl(appl_id);
        if (appl != null) {
            model.addAttribute("appl", appl);
        }
        return "jsonView";
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
