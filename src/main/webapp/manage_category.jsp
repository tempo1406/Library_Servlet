<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!-- Main content -->

<head>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
</head>

<div class="content-wrapper">
    <section class="content">
        <div class="row justify-content-center">
            <div style="margin-top: 20px; color: red;">${errorString}</div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Danh sách thể loại sách</h3>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Tên thể loại</th>
                                        <th>Chỉnh sửa</th>
                                        <th>Xóa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${categoryList}" var="category" varStatus="loop">
                                        <tr>
                                            <td>${loop.index + 1}</td>
                                            <td>${category.getName()}</td>
                                            <td><a href="${pageContext.request.contextPath}/EditCategory?id=${category.getId()}" class="btn btn-sm btn-info">Chỉnh sửa</a></td>
                                            <td>
                                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal-${category.getId()}">Xóa</button>
                                            </td>
                                        </tr>
                                        <!-- Modal xác nhận xóa -->
                                        <div class="modal fade" id="deleteModal-${category.getId()}" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="deleteModalLabel">Chú ý</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Bạn có chắc chắn muốn xóa thể loại '${category.getName()}' không?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                                        <form action="${pageContext.request.contextPath}/DeleteCategory" method="post">
                                                            <input type="hidden" name="id" value="${category.getId()}">
                                                            <button type="submit" class="btn btn-danger">Xóa</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="card-header">
                                <button class="btn btn-primary" onclick="location.href = '${pageContext.request.contextPath}/AddCategory'">Thêm thể loại</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    <%@ include file="footer.jsp" %>
</div>
