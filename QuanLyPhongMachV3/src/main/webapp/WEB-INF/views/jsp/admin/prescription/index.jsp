<%--
  Created by IntelliJ IDEA.
  User: Buu
  Date: 08/04/2021
  Time: 10:45 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="page-wrapper" style="min-height: 754px;">
    <div class="content">
        <div class="row">
            <div class="col-sm-4 col-3">
                <h4 class="page-title"><spring:message code="prescription.index.page.title" /></h4>
            </div>
            <div class="col-sm-8 col-9 text-right m-b-20">
                <a href="<c:url value="/admin/prescription/addorupdate" />" class="btn btn-primary float-right btn-rounded"><i class="fa fa-plus"></i> <spring:message code="prescription.index.add" /></a>
            </div>
        </div>
        <div class="row filter-row">
            <div class="col-sm-6 col-md-3">
                <div class="form-group form-focus">
                    <label class="focus-label"><spring:message code="prescription.index.table.doctor.id" /></label>
                    <input id="doctorID" name="doctorID" type="text" class="form-control floating">
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <div class="form-group form-focus">
                    <label class="focus-label"><spring:message code="prescription.index.table.patient.id" /></label>
                    <input id="patientID" name="patientID" type="text" class="form-control floating">
                </div>
            </div>
            <div class="col-sm-6 col-md-3">
                <a href="javascript:;" onclick="search1()" class="btn btn-success btn-block"> <spring:message code="prescription.index.table.search" /> </a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <table id="table-data" class="table table-striped custom-table">
                        <thead>
                        <tr>
                            <th style="min-width:200px;"><spring:message code="prescription.index.table.prescription.id" /></th>
                            <th><spring:message code="prescription.index.table.doctor.name" /></th>
                            <th><spring:message code="prescription.index.table.patient.name" /></th>
                            <th><spring:message code="prescription.index.table.disease.name" /></th>
                            <th style="min-width: 110px;"><spring:message code="prescription.index.table.date" /></th>
                            <th class="text-right"><spring:message code="prescription.index.table.action" /></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${prescriptions}" var="e">
                            <tr>
                                <td><a href="<c:url value="/admin/prescription/details?id=${e.id}" />">${e.id}</a></td>
                                <td>
                                    <img width="28" height="28" src="<c:url value="${e.bacSi.image}" />" class="rounded-circle" alt="">
                                    <h2>${e.bacSi.ten}</h2>
                                </td>
                                <td>${e.benhNhan.ten}</td>
                                <td>${e.loaiBenh.tenBenh}</td>
                                <td><fmt:formatDate value="${e.ngayKeToa}" pattern="dd-MM-yyyy" /></td>
                                <td class="text-right">
                                    <div class="dropdown dropdown-action">
                                        <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                        <div class="dropdown-menu dropdown-menu-right">
                                            <a class="dropdown-item" href="<c:url value="/admin/prescription/addorupdate?id=${e.id}" />"><i class="fa fa-pencil m-r-5"></i> <spring:message code="prescription.index.table.action.edit" /></a>
                                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_prescription${e.id}"><i class="fa fa-trash-o m-r-5"></i> <spring:message code="prescription.index.table.action.delete" /></a>
                                        </div>
                                    </div>
                                    <div id="delete_prescription${e.id}" class="modal fade delete-modal" role="dialog">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-body text-center">
                                                    <h3><spring:message code="prescription.index.table.action.delete.message" /></h3>
                                                    <div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal"><spring:message code="prescription.index.table.action.close" /></a>
                                                        <form:form action="/admin/prescription/delete?id=${e.id}" method="post">
                                                            <button type="submit" class="btn btn-danger"><spring:message code="prescription.index.table.action.delete" /></button>
                                                        </form:form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="notification-box">
        <div class="msg-sidebar notifications msg-noti">
            <div class="topnav-dropdown-header">
                <span>Messages</span>
            </div>
            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 630px;"><div class="drop-scroll msg-list-scroll" id="msg_list" style="overflow: hidden; width: auto; height: 630px;">
                <ul class="list-box">
                    <li>
                        <a href="chat.html">
                            <div class="list-item">
                                <div class="list-left">
                                    <span class="avatar">R</span>
                                </div>
                                <div class="list-body">
                                    <span class="message-author">Richard Miles </span>
                                    <span class="message-time">12:28 AM</span>
                                    <div class="clearfix"></div>
                                    <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="chat.html">
                            <div class="list-item new-message">
                                <div class="list-left">
                                    <span class="avatar">J</span>
                                </div>
                                <div class="list-body">
                                    <span class="message-author">John Doe</span>
                                    <span class="message-time">1 Aug</span>
                                    <div class="clearfix"></div>
                                    <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="chat.html">
                            <div class="list-item">
                                <div class="list-left">
                                    <span class="avatar">T</span>
                                </div>
                                <div class="list-body">
                                    <span class="message-author"> Tarah Shropshire </span>
                                    <span class="message-time">12:28 AM</span>
                                    <div class="clearfix"></div>
                                    <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="chat.html">
                            <div class="list-item">
                                <div class="list-left">
                                    <span class="avatar">M</span>
                                </div>
                                <div class="list-body">
                                    <span class="message-author">Mike Litorus</span>
                                    <span class="message-time">12:28 AM</span>
                                    <div class="clearfix"></div>
                                    <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="chat.html">
                            <div class="list-item">
                                <div class="list-left">
                                    <span class="avatar">C</span>
                                </div>
                                <div class="list-body">
                                    <span class="message-author"> Catherine Manseau </span>
                                    <span class="message-time">12:28 AM</span>
                                    <div class="clearfix"></div>
                                    <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="chat.html">
                            <div class="list-item">
                                <div class="list-left">
                                    <span class="avatar">D</span>
                                </div>
                                <div class="list-body">
                                    <span class="message-author"> Domenic Houston </span>
                                    <span class="message-time">12:28 AM</span>
                                    <div class="clearfix"></div>
                                    <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="chat.html">
                            <div class="list-item">
                                <div class="list-left">
                                    <span class="avatar">B</span>
                                </div>
                                <div class="list-body">
                                    <span class="message-author"> Buster Wigton </span>
                                    <span class="message-time">12:28 AM</span>
                                    <div class="clearfix"></div>
                                    <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="chat.html">
                            <div class="list-item">
                                <div class="list-left">
                                    <span class="avatar">R</span>
                                </div>
                                <div class="list-body">
                                    <span class="message-author"> Rolland Webber </span>
                                    <span class="message-time">12:28 AM</span>
                                    <div class="clearfix"></div>
                                    <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="chat.html">
                            <div class="list-item">
                                <div class="list-left">
                                    <span class="avatar">C</span>
                                </div>
                                <div class="list-body">
                                    <span class="message-author"> Claire Mapes </span>
                                    <span class="message-time">12:28 AM</span>
                                    <div class="clearfix"></div>
                                    <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="chat.html">
                            <div class="list-item">
                                <div class="list-left">
                                    <span class="avatar">M</span>
                                </div>
                                <div class="list-body">
                                    <span class="message-author">Melita Faucher</span>
                                    <span class="message-time">12:28 AM</span>
                                    <div class="clearfix"></div>
                                    <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="chat.html">
                            <div class="list-item">
                                <div class="list-left">
                                    <span class="avatar">J</span>
                                </div>
                                <div class="list-body">
                                    <span class="message-author">Jeffery Lalor</span>
                                    <span class="message-time">12:28 AM</span>
                                    <div class="clearfix"></div>
                                    <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="chat.html">
                            <div class="list-item">
                                <div class="list-left">
                                    <span class="avatar">L</span>
                                </div>
                                <div class="list-body">
                                    <span class="message-author">Loren Gatlin</span>
                                    <span class="message-time">12:28 AM</span>
                                    <div class="clearfix"></div>
                                    <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="chat.html">
                            <div class="list-item">
                                <div class="list-left">
                                    <span class="avatar">T</span>
                                </div>
                                <div class="list-body">
                                    <span class="message-author">Tarah Shropshire</span>
                                    <span class="message-time">12:28 AM</span>
                                    <div class="clearfix"></div>
                                    <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                </div>
                            </div>
                        </a>
                    </li>
                </ul>
            </div><div class="slimScrollBar" style="background: rgb(135, 135, 135); width: 4px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 0px; z-index: 99; right: 1px; height: 809px;"></div><div class="slimScrollRail" style="width: 4px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
            <div class="topnav-dropdown-footer">
                <a href="chat.html">See all messages</a>
            </div>
        </div>
    </div>
</div>

<script>
    function search1() {
        let id = $('#eplID');
        let name = $('#eplName');
        $.getJSON('/admin/prescription/search?id=' + id.val() + '&name=' + name.val()).done(function (task) {
            console.log("DONE: ", JSON.stringify(task));
            $('#table-data tbody tr').remove();
            let ds = task;
            for(let i = 0; i < ds.length; i++) {
                console.log(ds[i].id);
                if (ds[i].id != null) {
                    let date = formatDate(new Date(ds[i].ngayVaoLam))
                    $('#table-data').find('tbody').append(
                        '<tr>'+
                        '<td>'+
                        '<img width="28" height="28" src="'+ds[i].image+'" class="rounded-circle" alt="">'+
                        '<h2>'+ds[i].ten+'</h2>'+
                        '</td>'+
                        '<td>'+ds[i].id+'</td>'+
                        '<td>'+ds[i].email+'</td>'+
                        '<td>'+ds[i].dienThoai+'</td>'+
                        '<td>'+date+'</td>'+
                        '<td>'+
                        '<span class="custom-badge status-green">Pharmacist</span>'+
                        '</td>'+
                        '<td class="text-right">'+
                        '<div class="dropdown dropdown-action">'+
                        '<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>'+
                        '<div class="dropdown-menu dropdown-menu-right">'+
                        '<a class="dropdown-item" href="/admin/prescription/edit/'+ds[i].id+'"><i class="fa fa-pencil m-r-5"></i> Edit</a>'+
                        '<a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_prescription'+ds[i].id+'"><i class="fa fa-trash-o m-r-5"></i> Delete</a>'+
                        '</div>'+
                        '</div>'+
                        '<div id="delete_prescription'+ds[i].id+'" class="modal fade delete-modal" role="dialog">'+
                        '<div class="modal-dialog modal-dialog-centered">'+
                        '<div class="modal-content">'+
                        '<div class="modal-body text-center">'+
                        '<h3>Are you sure want to delete this prescription ('+ds[i].ten+')?</h3>'+
                        '<div class="m-t-20"> <a href="#" class="btn btn-white" data-dismiss="modal">Close</a>'+
                        '<form action="/admin/prescription/delete/'+ds[i].id+'" method="post">'+
                        '<button type="submit" class="btn btn-danger">Delete</button>'+
                        '</form>'+
                        '</div>'+
                        '</div>'+
                        '</div>'+
                        '</div>'+
                        '</div>'+
                        '</td>'+
                        '</tr>'
                    );
                }

            }
        });
    }

    function formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;

        return [day, month, year].join('-');
    }
</script>
