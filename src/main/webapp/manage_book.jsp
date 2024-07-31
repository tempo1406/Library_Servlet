<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<head>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css">
</head>

<div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <form role="form" method="post" action="${pageContext.request.contextPath}/SearchBook">
                            <div class="card-header">
                                <h3 class="card-title">Danh sách sách trong thư viện</h3>
                                <div class="card-tools" style="margin-right: 1px;">
                                    <div class="input-group input-group-sm" style="width: 200px;">
                                        <input type="text" name="data_search" class="form-control float-right" placeholder="Tìm kiếm theo tên">
                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-primary">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="row justify-content-center">
                            <div style="margin-top: 20px; color: red;">${errorString}</div>
                        </div>
                        <div class="card-body">
                            <div class="card-header" style="margin-left: -20px; margin-top: -40px;">
                                <input type="button" value="Thêm sách" class="btn btn-primary" onclick="location.href = '${pageContext.request.contextPath}/AddBook'">
                            </div>
                            <table class="table table-bordered table-hover" id="example2">
                                <thead>
                                    <tr>
                                        <th style="width: 10px">STT</th>
                                        <th style="width: 318px;">Tên</th>
                                        <th>Thể loại</th>
                                        <th>Số lượng</th>
                                        <th>Ngày nhập</th>
                                        <th>Hình ảnh</th>
                                        <th>Chỉnh sửa</th>
                                        <th>Xóa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${bookList}" var="book" varStatus="loop">
                                        <tr>
                                            <td>${loop.index+1}</td>
                                            <td>${book.getName()}</td>
                                            <td>${book.getCategory().getName()}</td>
                                            <td style="text-align: center;">${book.getAmount()}</td>
                                            <td>${book.getDay()}</td>
                                            <td style="text-align: center;">
                                                <img src="Resources/img/products/${book.getImage()}" width="35" height="50">
                                    <figcaption>
                                        <a href="Resources/img/products/${book.getImage()}" style="font-size: 14px;" target="_blank">Xem chi tiết</a>
                                    </figcaption>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/EditBook?id=${book.getId()}" class="btn btn-sm btn-info">Chỉnh sửa</a>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-primary btn-danger" data-toggle="modal" data-target="#staticBackdrop-${book.getId()}" style="padding-bottom: 5px; padding-top: 3px; font-size: 14px">Xóa</button>
                                    </td>
                                    </tr>
                                    <div class="modal fade" id="staticBackdrop-${book.getId()}" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="staticBackdropLabel1">Chú ý</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <span class="text-danger"> Bạn có muốn chắc xóa cuốn sách '${book.getName()}'?</span>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                                    <a class="btn btn-primary btn-danger" href="${pageContext.request.contextPath}/ManageBook?action=deleteBook&id=${book.getId()}">Xóa</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="row" style="margin-top: 20px;">
                            <div class="col-sm-12 col-md-7">
                                <div class="dataTables_paginate paging_simple_numbers">
                                    <ul class="pagination">
                                        <li class="paginate_button page-item previous ${currentP == 1 ? 'disabled' : ''}">
                                            <a href="${pageContext.request.contextPath}/ManageBook?index=${currentP - 1}" class="page-link">Previous</a>
                                        </li>
                                        <c:forEach var="i" begin="1" end="${endP}">
                                            <li class="paginate_button page-item ${currentP == i ? 'active' : ''}">
                                                <a href="${pageContext.request.contextPath}/ManageBook?index=${i}" class="page-link">${i}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="paginate_button page-item next ${currentP == endP ? 'disabled' : ''}">
                                            <a href="${pageContext.request.contextPath}/ManageBook?index=${currentP + 1}" class="page-link">Next</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</div>
<%@ include file="footer.jsp" %>
