<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="myModal_ins" class="modal fade" role="dialog">
	<div class="modal-dialog" style="width: 950px">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title well"><label>${member.department}업무 추가</label></h4>
			</div>
			<div class="modal-body">
				<input type="hidden" id="iconcls" value="icon-ok">
				<div class="modal_d1 well">
												 <div class="mat-div">
    <label for="name" class="mat-label">프로젝트명</label>
    <input type="text" class="mat-input" id="name">
  </div>
  <div class="mat-div">
    <label for="begin" class="mat-label">시작날짜</label>
    <input type="date" class="mat-input"  id="begin">
  </div>
  <div class="mat-div">
    <label for="end" class="mat-label">끝 날짜</label>
    <input type="date" class="mat-input"  id="end">
  </div>
  
				</div>
				<div class="modal_d2 well" style="overflow: auto">
					<table class="table" width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr><td colspan="3"><label>${member.department} 명단 리스트</label></td></tr>
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
										class="btn-default insert_gogo" value="클릭"></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
				<div class="modal_d3 well" style="overflow: auto">
					<table class="table" width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td colspan="3"><label>프로젝트 참여인원</label></td>							
						</tr>						
					</table>
				</div>

				<input type="hidden" id="progress" value="0">
				<button href="javascript:void(0)" class="easyui-linkbutton"
					onclick="append()" data-dismiss="modal">추가</button>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" onclick="setting()" >Close</button>
			</div>
		</div>

	</div>
</div>