var showTime = 1000;
			
    function show() {
        document.getElementById("test_image").style.visibility = "visible";
        setTimeout(hide, showTime);
    }
    
    function hide() {
        document.getElementById("test_image").style.visibility = "hidden";
    }