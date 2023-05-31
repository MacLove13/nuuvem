let uploaderId = 2;
let maxUploaders = 10;

function AddUploadField() {
	let element = document.getElementById('upload-fields')

	if (uploaderId > maxUploaders) {
		alert('You cannot upload so many files at once.')
		return;
	}

	element.innerHTML += `
		<div class="upload-item mt-3">
			${uploaderId}. <input type="file" name="upload_${uploaderId}" id="upload_${uploaderId}" required="required">
		</div>
	`
	uploaderId++;
}
