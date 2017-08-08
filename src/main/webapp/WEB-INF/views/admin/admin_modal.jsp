<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
	
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>        
      </div>
      <div class="modal-body">
       <div class="Grid Grid--withGutter" role="presentation">
			<div class="Grid-cell">
				<div class="AdaptiveStreamUserGallery-user js-stream-item"
					data-item-type="user" role="listitem" data-item-id="3259624118"
					id="stream-item-user-3259624118" data-item-type="user">
					<div		class="ProfileCard js-actionable-user
    ProfileCard--wide
    
    "
						data-screen-name="dia_official" data-user-id="3259624118"
						data-feedback-token="" data-impression-id="">
						<c:if test="${s_dto.department eq '회계부'}">
						<a class="ProfileCard-bg js-nav" href="/dia_official"
							tabindex="-1" aria-hidden="true"
							style="background-color: #3B94D9; background-image: url(${pageContext.request.contextPath}/img/admin/김과장1.jpg);">
						</a>
						</c:if>
						<c:if test="${s_dto.department eq '인사부'}">
						<a class="ProfileCard-bg js-nav" href="/dia_official"
							tabindex="-1" aria-hidden="true"
							style="background-color: #3B94D9; background-image: url(${pageContext.request.contextPath}/img/admin/김과장2.jpg);">
						</a></c:if>
						<c:if test="${s_dto.department eq '후원부'}">
						<a class="ProfileCard-bg js-nav" href="/dia_official"
							tabindex="-1" aria-hidden="true"
							style="background-color: #3B94D9; background-image: url(${pageContext.request.contextPath}/img/admin/프로듀사.jpg);">
						</a></c:if>
						<c:if test="${s_dto.department eq '매니저'}">
						<a class="ProfileCard-bg js-nav" href="/dia_official"
							tabindex="-1" aria-hidden="true"
							style="background-color: #3B94D9; background-image: url(${pageContext.request.contextPath}/img/admin/sun_sun.jpg);">
						</a>
						</c:if>

						<div class="ProfileCard-content">
							<a class="ProfileCard-avatarLink js-nav js-tooltip"
								href="/dia_official" tabindex="-1" aria-hidden="true"> <img
								class="ProfileCard-avatarImage js-action-profile-avatar"
								src="<c:url value="${s_dto.picture}"/>"
								alt="">
							</a>
							<div class="ProfileCardStats">
								<ul
									class="ProfileCardStats-statList Arrange Arrange--bottom Arrange--equal">
									<li class="ProfileCardStats-stat Arrange-sizeFit"> <span
											class="ProfileCardStats-statLabel u-block">이름</span> <span
											class="ProfileCardStats-statValue" 
											data-is-compact="false">&emsp;${s_dto.name}</span>
									</li>
									<li class="ProfileCardStats-stat Arrange-sizeFit"> <span
											class="ProfileCardStats-statLabel u-block">부서</span> <span
											class="ProfileCardStats-statValue" 
											data-is-compact="false">&emsp;${s_dto.department}</span>
									</li>
									<li class="ProfileCardStats-stat Arrange-sizeFit"> <span
											class="ProfileCardStats-statLabel u-block">직책</span> <span
											class="ProfileCardStats-statValue" 
											data-is-compact="false">&emsp;${s_dto.position}</span>
									</li>
								</ul>
							</div>
							<div class="ProfileCard-actions">
								<div
									class="ProfileCard-userActions with-rightCaret js-userActions">
									<div class="UserActions   u-textLeft">
										<div class="user-actions btn-group not-following "
											data-user-id="3259624118" data-screen-name="dia_official"
											data-name="DIA 다이아" data-protected="false">
											<span class="UserActions-moreActions u-inlineBlock">
												<button type="button"
													class="js-tooltip unmute-button btn small plain-btn"
													data-placement="top">
													<span class="Icon Icon--muted Icon--medium"><span
														class="visuallyhidden"><span class="username u-dir"
															dir="ltr"></span>전화번호 : </span><b>${s_dto.phone}</b></span>
												</button>
												<button type="button"
													class="first-load js-tooltip mute-button btn small plain-btn"
													data-placement="top">
													<span class="Icon Icon--unmuted Icon--medium"><span
														class="visuallyhidden"><span class="username u-dir"
															dir="ltr"></span>이메일 : </span><b>${s_dto.email}</b></span>
												</button>										
											</span>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>