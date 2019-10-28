package kr.or.ddit.smartware.approval.batch;

import kr.or.ddit.smartware.approval.service.IBatchService;
import kr.or.ddit.smartware.employee.model.Employee;
import kr.or.ddit.smartware.employee.service.IEmployeeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;

import javax.annotation.Resource;
import java.util.List;

public class CreateApproval {
    private static final Logger logger = LoggerFactory.getLogger(CreateApproval.class);

    @Resource(name = "employeeService")
    private IEmployeeService employeeService;
    @Resource(name = "batchService")
    private IBatchService batchService;

    @Scheduled(cron = "0 0 02 * * ?")
    public void scheduleRun() {
        // 결재선 배치
        List<Employee> employees = employeeService.allEmployeeList();
        logger.debug("배치 시작");
        batchService.delApprMem();
        batchService.delErdAppr();
        batchService.setErdAppr();

        for (Employee employee : employees) {
            batchService.setApprMem(employee.getEmp_id());
        }

        // 사원 근태 배치
        batchService.setCommute();

        logger.debug("배치 끝");
    }

}
