<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HallOfArt - Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/css/admin_styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
  	<%@ include file="/WEB-INF/view/layout/admin_header.jsp"%>
    
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
<!--                         		파랑 카드 -->
<!--                             <div class="col-xl-3 col-md-6"> -->
<!--                                 <div class="card bg-primary text-white mb-4"> -->
<!--                                     <div class="card-body">Primary Card</div> -->
<!--                                     <div class="card-footer d-flex align-items-center justify-content-between"> -->
<!--                                         <a class="small text-white stretched-link" href="#">View Details</a> -->
<!--                                         <div class="small text-white"><i class="fas fa-angle-right"></i></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->

<!-- 								노랑 카드 -->
<!--                             <div class="col-xl-3 col-md-6"> -->
<!--                                 <div class="card bg-warning text-white mb-4"> -->
<!--                                     <div class="card-body">Warning Card</div> -->
<!--                                     <div class="card-footer d-flex align-items-center justify-content-between"> -->
<!--                                         <a class="small text-white stretched-link" href="#">View Details</a> -->
<!--                                         <div class="small text-white"><i class="fas fa-angle-right"></i></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->

<!-- 								초록 카드 -->
<!--                             <div class="col-xl-3 col-md-6"> -->
<!--                                 <div class="card bg-success text-white mb-4"> -->
<!--                                     <div class="card-body">Success Card</div> -->
<!--                                     <div class="card-footer d-flex align-items-center justify-content-between"> -->
<!--                                         <a class="small text-white stretched-link" href="#">View Details</a> -->
<!--                                         <div class="small text-white"><i class="fas fa-angle-right"></i></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->

<!-- 								빨강 카드 -->
<!--                             <div class="col-xl-3 col-md-6"> -->
<!--                                 <div class="card bg-danger text-white mb-4"> -->
<!--                                     <div class="card-body">Danger Card</div> -->
<!--                                     <div class="card-footer d-flex align-items-center justify-content-between"> -->
<!--                                         <a class="small text-white stretched-link" href="#">View Details</a> -->
<!--                                         <div class="small text-white"><i class="fas fa-angle-right"></i></div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                        <h3 class="mt-4">사용자 정보</h3>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">User & Show Total Count</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        User Count
                                    </div>
                                    <div class="card-body">
										사용자 수 : ${count.totalUser}
									</div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Show Count
                                    </div>
                                    <div class="card-body">
										공연 수 : ${count.totalShow1}&nbsp;/&nbsp;
										전시 수 : ${count.totalShow2} 
									</div>
                                </div>
                            </div>
                        </div>
                        
	                    <h3 class="mt-4">공연/전시 정보</h3>
	                    <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Recent Show</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Recent Show
                            </div>
                            <div class="card-body">
								<table id="showList" style="margin: auto; text-align: center;">
		                   			<tr style="height: 70px; padding-top: 30px;">
		                   				<td style="width:10%">no.</td>
		                   				<td style="width:10%">유형</td>
		                   				<td style="width:25%">제목</td>
		                   				<td style="width:25%">날짜</td>
		                   				<td style="width:25%">상태</td>
		                   			</tr>
		                   			<c:forEach var="li" items="${list}" varStatus="status">
		                   				<c:if test="${status.count <= 5}">
			                   				<tr>
			                   					<td>${li.id}</td>
			                   					<td>
			                   						<c:choose>
			                   							<c:when test="${li.showTypeId1 eq 1}">
															공연
			                   							</c:when>
			                   							<c:otherwise>
			                   								전시
			                   							</c:otherwise>
			                   						</c:choose>
		                   						</td>
			                   					<td class="titleTd">${li.title}</td>
			                   					<td>${li.startDate} ~ ${li.endDate}</td>
			                   					<td>
			                   						<input type="hidden" id="statusId" value="${li.id}">
			                   						${li.showStatus}
			               						</td>
			                   				</tr>
		                   				</c:if>
		                   			</c:forEach>
		                   			<tr>
		                   				<td style="width:10%">...</td>
		                   				<td style="width:10%">...</td>
		                   				<td style="width:25%">...</td>
		                   				<td style="width:25%">...</td>
		                   				<td style="width:25%">...</td>
		                   			</tr>
		                   		</table>                         
                            </div>
                        </div>
	                    
	                    
	                    <h3 class="mt-4">결제 내역 정보</h3>
	                    <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Merchant Information</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-header" id="merchantHeader">
                                <i class="fas fa-table me-1"></i>
                                Recent Merchant
                            </div>
                            <div class="card-body" id="merchantDiv">
								결제 정보                                
                            </div>
                        </div>
                    </div>
                </main>
<%@ include file="/WEB-INF/view/layout/admin_footer.jsp"%>
            </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script>
        	$(document).ready(function(){
        		$("#merchantDiv").hide();
        		$("#merchantHeader").css("cursor", "pointer");       			
        		
        		$("#merchantHeader").on("click", function(){       			
	        		let password = prompt("비밀번호를 입력해주세요");
        			alert(password);
	        		$("#merchantDiv").show();
        		});
        		
        	});
        </script>
    </body>
</html>
