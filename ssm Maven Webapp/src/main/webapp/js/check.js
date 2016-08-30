var selAll = document.getElementById("checkAll");
	function selectAll() {
	
		var obj = document.getElementsByName("check");
		if (document.getElementById("checkAll").checked == false) {
			for ( var i = 0; i < obj.length; i++) {
				obj[i].checked = false;
			}
		} else {
			for ( var i = 0; i < obj.length; i++) {
				obj[i].checked = true;
				
			}
		}

	}
	function setSelectAll(value) {
		var obj = document.getElementsByName("check");
		var count = obj.length;
		var selectCount = 0;
		for ( var i = 0; i < count; i++) {
			if (obj[i].checked == true) {
				selectCount++;
			}
		}
		if (count == selectCount) {
			document.getElementById("checkAll").checked = true;
		} else {
			document.getElementById("checkAll").checked = false;
		}
		return value;
	}