<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">${member.department}업무 추가</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" id="iconcls" value="icon-ok">
				<div class="modal_d1">
					프로젝트명<input type="text" id="name" value=""> <br> 시작날짜<input
						type="date" id="begin" value=""> <br>~<br> 끝 날짜<input
						type="date" id="end" value="">
				</div>
				<div class="modal_d2" style="overflow: auto">
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
									<td><input id="${dto.id}" type="button"
										class="btn-default select_one_a" value="정보"></td>
									<td><input id="${dto.id}" type="button"
										class="btn-default insert_gogo" value="참여"></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
				<div class="modal_d3" style="overflow: auto">
					<table class="table" width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td colspan="3">프로젝트 참여인원</td>
							
						</tr>
						<c:forEach items="${admin_list}" var="dto">
							<c:if test="${dto.department eq member.department}">
							<div class="dto_id_select"></div>
								<%-- <div class="dto_id_select"><c:if test="${dto.id eq dto.id}">
								<tr>
									<td rowspan="2"><img class="admin_smell_img"
										src="<c:url value="${dto.picture}"/>"></td>
									<td>${dto.name}</td>
									<td>${dto.position}</td>
								</tr>
								<tr>
									<td colspan="2"><input id="${dto.id}" type="button"
										class="btn-default select_one_x" value="참여취소"></td>
									
								</tr>
								</c:if></div> --%>
							</c:if>
						</c:forEach>
					</table>
				</div>

				<input type="hidden" id="progress" value="0">
				<button href="javascript:void(0)" class="easyui-linkbutton"
					onclick="append()" data-dismiss="modal">추가</button>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>

<div id="myModal_mod" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Modal Header</h4>
			</div>
			<div class="modal-body">
				<input type="hidden" id="iconcls_mod" value="icon-ok"> <input
					type="hidden" id="id_mod" value=""> 프로젝트명<input type="text"
					id="name_mod" value=""> 프로젝트 할사람<input type="text"
					id="persons_mod" value=""> 시작<input type="text"
					id="begin_mod" value=""> 끝<input type="text" id="end_mod"
					value=""> 퍼센트<input type="number" id="progress_mod"
					value="">
				<button href="javascript:void(0)" class="easyui-linkbutton"
					onclick="dbupdatesave()" data-dismiss="modal">추가</button>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>