<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.util.HashMap"%>
    
<html>
    <head>
        <link rel="stylesheet" href="../main.css">
    </head>
    <body>
        <%!HashMap<String, Integer> noteBookList = new HashMap<String, Integer>(); %>
        <% noteBookList = (HashMap<String, Integer>)request.getAttribute("noteBookList"); %>
        <% for(String notebook: noteBookList.keySet()){ %>
            <div class="card cursorPointer" >
                <%=notebook%>
                <div>
                    <button class="btn btn-outline-success" onclick="window.location.href='/noteBook?id=<%=noteBookList.get(notebook) %>'">Open Notebook</button>
                    <button class="btn btn-outline-warning" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="setData('<%=notebook %>', <%=noteBookList.get(notebook)%>)">Edit Notebook</button>
                    <button class="btn btn-outline-danger" onclick="deleteNoteBook(<%=noteBookList.get(notebook)%>)">Delete Notebook</button>
                </div>
            </div>
        <% } %>

    </body>
    <script>
        function setData(name, id){
            document.getElementById("type").value = "edit";
            document.getElementById("noteBookId").value=id
            document.getElementById("noteBookName").value = name;
        }

        function deleteNoteBook(id) {
            console.log("delete", id);
    		let xhr = new XMLHttpRequest();

            fetch("/noteBook?type=delete&id="+id, {
                method : "POST",
                body: new FormData(),
            }).then((res) => {
                if(res.status == 200){
                    window.location.href = "/home";
                }
            });
    	}
    </script>
</html>