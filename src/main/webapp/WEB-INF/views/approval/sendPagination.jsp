<%--
  Created by IntelliJ IDEA.
  User: bshn1
  Date: 2019-10-29
  Time: 오전 1:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- 이전 페이지 가기 : 지금 있는 페이지에서 한페이지 전으로 -->

            <c:choose>
                <c:when test="${page == 1 }">
                    <li class="page-item  disabled"><a class="page-link" href="#" tabindex="-1">&laquo;</a></li>
                        <span aria-hidden="Previous"></span>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="${cp }/approval/send/${url}page=1" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>


            <c:choose>
                <c:when test="${page == 1 }">
                    <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">&lt;</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="${cp }/approval/send/${url}page=${page-1}" tabindex="-1">&lt;</a></li>
                </c:otherwise>
            </c:choose>

            <c:forEach begin="1" end="${paginationSize }" var="i">
                <c:choose>
                    <c:when test="${i == page }">
                         <li class="page-item disabled"><span class="page-link">${i }</span></li>
                    </c:when>
                    <c:otherwise>
                         <li class="page-item"><a class="page-link" href="${cp }/approval/send/${url}page=${i }">${i }</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${page == paginationSize || paginationSize == 0}">
                    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                </c:when>
                <c:otherwise>
                        <li class="page-item"><a class="page-link" href="${cp }/approval/send/${url}page=${page+1}">&gt;</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${page == paginationSize || paginationSize == 0}">
                    <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                        <span aria-hidden="Next"></span>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="${cp }/approval/send/${url}page=${paginationSize }" aria-label="Previous">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>


