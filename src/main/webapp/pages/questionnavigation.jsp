
<style>
	textarea
	{
		border:none;
	}
</style>

<script>

var xmlhttp;

	function getRemainingTime()
	{
		xmlhttp= new XMLHttpRequest();

		xmlhttp.onload=showtime;
		
		xmlhttp.open("get","showRemainingTime",true);
		
		xmlhttp.send();
		
	}

	function showtime()
	{
		
		alert(xmlhttp.responseText);
		
		if(xmlhttp.readyState==4 && xmlhttp.status==200){

			document.questionForm.show.value=xmlhttp.responseText;
			
			if(xmlhttp.responseText==0)
			{
				alert("Time Up !!")
				//xmlhttp.open("get","endexam",true);
				window.location.href="score";
			}
			
			
		}
	}

	
	setInterval(getRemainingTime,60000);// 1000 ms - 1 sec  60000ms - 60sec

	function getResponse()
	{
		var qno = document.questionForm.qno.value;
		var question = document.questionForm.question.value;
		var submittedAnswer = document.questionForm.option.value;
		
		//alert(qno + " " + question + submittedAnswer);

		var xmlhttp = new XMLHttpRequest();

		var data = "?qno="+qno+"&question="+question+"&submittedAnswer="+submittedAnswer;

		xmlhttp.open("get","storeResponse" + data,true);
		
		xmlhttp.send();
	}

	
	
</script>

<body>



${message}


<form name="questionForm">
	<label > Remaining Minutes </label>
	<input  style="border:none" type="text" name="show" value="Total Duration 3 minutes"><br><br>

	<input  style="border:none" type="text" name="qno" value="${question.qno}"><br><br>
	
	<textarea  rows=4 cols=50 name="question"> ${question.question} </textarea><br><br>
		
	<input  type="radio" name="option" value="${question.option1}" onclick="getResponse()"> <span> ${question.option1} </span><br><br>
	
	<input  type="radio" name="option" value="${question.option2}" onclick="getResponse()">  <span> ${question.option2} </span> <br><br>
		
	<input  type="radio" name="option" value="${question.option3}" onclick="getResponse()"> <span> ${question.option3} </span> <br><br>
	
	<input  type="radio" name="option" value="${question.option4}" onclick="getResponse()"> <span> ${question.option4} </span> <br><br>
		
	<input type="submit" value="next" formaction="next">
	<input type="submit" value="previous" formaction="previous">
	<input type="submit" value="end exam" formaction="endexam">

</form>

 

</body>