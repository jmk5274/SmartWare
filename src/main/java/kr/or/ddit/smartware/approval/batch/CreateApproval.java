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

    @Scheduled(cron = "* * 2 * * *")
    public void scheduleRun() {
        List<Employee> employees = employeeService.allEmployeeList();
        logger.debug("배치 시작");
        batchService.delApprMem();
        batchService.delErdAppr();
        batchService.setErdAppr();

        for (Employee employee : employees) {
            batchService.setApprMem(employee.getEmp_id());
        }
        logger.debug("배치 끝");
    }

}
