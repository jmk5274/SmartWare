<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                   <form>
                       <div class="form-row">
                           <div class="col-1">
                               <label class="col-form-label">위치</label>
                           </div>
                           <div class="col">
                               <input type="text" class="form-control" placeholder="First name">
                           </div>
                           <div class="col">
                               <input type="text" class="form-control" placeholder="Last name">
                           </div>
                           <div class="col">
                               <input type="text" class="form-control" placeholder="Last name">
                           </div>
                           <div class="col">
                               <input type="text" class="form-control" placeholder="Last name">
                           </div>
                           <div class="col">
                               <input type="text" class="form-control" placeholder="Last name">
                           </div>
                       </div>
                   </form>
                   <br>
                   <div>
                       <h4>팝업 목록</h4>
                   </div>
                     <table class="table table-hover">
                         <thead>
                             <tr>
                                 <th>번호</th>
                                 <th>타이틀</th>
                                 <th>등록 날짜</th>
                                 <th>시작 날짜</th>
                                 <th>종료 날짜</th>
                             </tr>
                         </thead>
                         <tbody>
                           	<c:forEach items="${allPopupList }" var="popup">
    	                        <tr>
	                                <th>${popup.pop_id }</th>
	                                <td>${popup.pop_title }</td>
	                                <td><fmt:formatDate value="${popup.reg_dt }" pattern="yyyy/MM/dd"/></td>
	                                <td><fmt:formatDate value="${popup.pop_st_dt }" pattern="yyyy/MM/dd"/></td>
	                                <td><fmt:formatDate value="${popup.pop_end_dt }" pattern="yyyy/MM/dd"/></td>
	                            </tr>
                           	</c:forEach>	
                         </tbody>
                     </table>
                </div>
            </div>
        </div>
    </div>
</div>
