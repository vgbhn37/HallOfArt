//답변하기 버튼 눌렀을때 폼활성화
document.querySelector("#answerBtn").addEventListener("click", function() {
	let answerForm = document.querySelector("#answerForm")
	answerForm.style.display = "";
})

//답변 유효성 검사
function validationInquiryDetail() {
	let form = document.querySelector("#aForm");
	let title = form.elements["title"].value;
	let content = form.elements["content"].value;

	if (!title) {
		alert("제목을 입력하세요.");
		return false;
	}
	if (!content) {
		alert("내용을 입력하세요.");
		return false;
	}

	return true;
}

function sendDetail() {
	if (validationInquiryDetail()) {
		document.querySelector("#aForm").submit();
	}
}