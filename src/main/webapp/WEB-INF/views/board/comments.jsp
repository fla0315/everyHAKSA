<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<table>
		<caption>답변</caption>
		<tbody>
			<colgroup>
				<col style="width:30%;" />
				<col style="width:50%;" />
				<col style="width:20%;" />
			</colgroup>
			<%if(list==null || list.isEmpty()){ %>
				<tr>
					<td colspan="2" class="align_center">데이터가 없습니다.</td>
				</tr>
			<%} else {%>
				<%for(int i=0;i<list.size();i++){ 
					CommentVO cvo = list.get(i);
				%>
				<tr>
					<td><%=cvo.getName() %></td>
					<td><%=cvo.getContent() %></td>
					<td><%=sdf.format(cvo.getRegdate()) %></td>
				</tr>
				<%}//for %>
			<%} %>
		</tbody>
</table>
<%@ include file="comments_write.jsp" %> <!-- 수정엄금!!!!!!!! 바보야!!!! -->