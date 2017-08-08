<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="myModal_ins" class="modal fade" role="dialog">
	<div class="modal-dialog" style="width: 950px">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title well">${member.department}업무 추가</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" id="iconcls" value="icon-ok">
				<div class="modal_d1 well">
					프로젝트명<input type="text" id="name" value=""> <br> 시작날짜<input
						type="date" id="begin" value=""> <br>~<br> 끝 날짜<input
						type="date" id="end" value="">
				</div>
				<div class="modal_d2 well" style="overflow: auto">
					<table class="table" width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr><td colspan="3">${member.department} 명단 리스트</td></tr>
						<tr>
							<td></td>
							<td>이름</td>
							<td>직책</td>
						</tr>
						<c:forEach items="${admin_list}" var="dto">
							<c:if test="${dto.department eq member.department}">
								<tr>
									<td rowspan="2"><img class="admin_smell_img"
										src="<c:url value="${dto.picture}"/>"></td>
									<td>${dto.name}</td>
									<td>${dto.position}</td>
								</tr>
								<tr>
									
									<td colspan="2"><input id="${dto.id}" type="button"
										class="btn-default insert_gogo" value="참여"></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
				<div class="modal_d3 well" style="overflow: auto">
					<table class="table" width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td colspan="3">프로젝트 참여인원</td>							
						</tr>						
					</table>
				</div>

				<input type="hidden" id="progress" value="0">
				<button href="javascript:void(0)" class="easyui-linkbutton"
					onclick="append()" data-dismiss="modal" >추가</button>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
			</div>
		</div>

	</div>
</div>