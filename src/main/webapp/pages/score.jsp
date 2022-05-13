<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
table,th,td
{
	border : 1px solid green;
	border-collapse:collapse;
	
}

th,td
{
	padding:10px;
	text-align:center;
}

table
{
	margin-left : 300px;
}

</style>

<h1> Your Score is ${score} </h1>



<table>
	<tr>
		<th>qno</th>
		<th>question</th>
		<th>submittedanswer</th>
		<th>correctanswer</th>
	<tr>
	<c:forEach var="answer" items="${submittedDetails.values()}">
			<tr>
				<td>${answer.qno}</td>
				<td>${answer.question}</td>
				<td>${answer.submittedAnswer}</td>
				<td>${answer.correctAnswer}</td>
			</tr>
	</c:forEach>
</table>


<h1>Want to attempt exam again?</h1>

<a href="/" style="text-decoration:none">Go to Login</a> <!-- href attribute needs url  -->