<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
	alert('선택하신 좌석이 결제대기 상태가 되었습니다. 결제를 완료하셔야 좌석예매가 완료됩니다.');
	location.href = '/user/payList/'+ ${user.id};
</script>