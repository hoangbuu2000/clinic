<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">


<!-- index22:59-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/resources/assets/img/favicon.ico" />">
    <title><tiles:insertAttribute name="title" /></title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bootstrap.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/font-awesome.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/select2.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/dataTables.bootstrap4.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/bootstrap-datetimepicker.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/fullcalendar.min.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/tagsinput.css" />">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/css/style.css" />">
    <!--[if lt IE 9]>
<%--    <script src="<c:url value="/resources/assets/js/html5shiv.min.js" />"></script>--%>
<%--    <script src="<c:url value="/resources/assets/js/respond.min.js" />"></script>--%>
    <![endif]-->
</head>

<body>
<div class="main-wrapper">
    <tiles:insertAttribute name="navbar" />
    <tiles:insertAttribute name="sidebar" />
    <tiles:insertAttribute name="body" />
</div>
<div class="sidebar-overlay" data-reff=""></div>

<script>
    let e = document.getElementsByName("queQuan")[0];
    e.options.length = 0;
    let provinces = [
        'An Giang', 'Ba?? Ri??a - Vu??ng Ta??u', 'B????c Giang',
        'B????c Ka??n', 'Ba??c Li??u', 'B????c Ninh', 'B????n Tre',
        'Bi??nh ??i??nh', 'Bi??nh D????ng', 'Bi??nh Ph??????c', 'Bi??nh Thu????n',
        'Ca?? Mau', 'C????n Th??', 'Cao B????ng', '??a?? N????ng', '??????k L????k',
        '??????k N??ng', '??i????n Bi??n', '??????ng Nai', '??????ng Tha??p',
        'Gia Lai', 'Ha?? Giang', 'Ha?? Nam', 'Ha?? N????i', 'Ha?? Ti??nh',
        'Ha??i D????ng', 'Ha??i Pho??ng', 'H????u Giang', 'Ho??a Bi??nh',
        'H??ng Y??n', 'Kha??nh Ho??a', 'Ki??n Giang', 'Kon Tum',
        'Lai Ch??u', 'L??m ??????ng', 'La??ng S??n', 'La??o Cai',
        'Long An', 'Nam ??i??nh', 'Ngh???? An', 'Ninh Bi??nh',
        'Ninh Thu????n', 'Phu?? Tho??', 'Phu?? Y??n', 'Qua??ng Bi??nh',
        'Qua??ng Nam', 'Qua??ng Nga??i', 'Qua??ng Ninh', 'Qua??ng Tri??',
        'So??c Tr??ng', 'S??n La', 'T??y Ninh', 'Tha??i Bi??nh',
        'Tha??i Nguy??n', 'Thanh Ho??a', 'Th????a Thi??n Hu????', 'Ti????n Giang',
        'Tha??nh ph???? H???? Chi?? Minh', 'Tra?? Vinh', 'Tuy??n Quang',
        'Vi??nh Long', 'Vi??nh Phu??c', 'Y??n Ba??i'
    ]
    for(let i = 0; i < provinces.length; i++) {
        e.append(new Option(provinces[i], provinces[i]));
    }
</script>

<script src="<c:url value="/resources/assets/js/jquery-3.2.1.min.js" />"></script>
<script src="<c:url value="/resources/assets/js/popper.min.js" />"></script>
<script src="<c:url value="/resources/assets/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/assets/js/jquery.slimscroll.js" />"></script>
<script src="<c:url value="/resources/assets/js/select2.min.js" />"></script>
<script src="<c:url value="/resources/assets/js/jquery.dataTables.min.js" />"></script>
<script src="<c:url value="/resources/assets/js/dataTables.bootstrap4.min.js" />"></script>
<script src="<c:url value="/resources/assets/js/moment.min.js" />"></script>
<script src="<c:url value="/resources/assets/js/bootstrap-datetimepicker.min.js" />"></script>
<script src="<c:url value="/resources/assets/js/app.js" />"></script>
<script src="<c:url value="/resources/assets/js/Chart.bundle.js" />"></script>
<script src="<c:url value="/resources/assets/js/chart.js" />"></script>
<script src="<c:url value="/resources/assets/js/fullcalendar.min.js" />"></script>
<script src="<c:url value="/resources/assets/js/jquery.fullcalendar.js" />"></script>
<script src="<c:url value="/resources/assets/js/tagsinput.js" />"></script>

</body>


</html>