<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
BoardDAO dao = new BoardDAO(application);    
    
<!DOCTYPE html>
<html>
<head>
    
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
   <style>
        .nav-link2{
            color: blue;
        }
        .nav-link{
            color: white;
        }
        .copyright{
            clear:both;
        }
        .copyright .copy_logo{
            float:left;
            width:25%;
            font-size: 40px;
        }
        .copyright .copy_info{
            float:left;
            width:70%;
            height:100px;
            font-size:12px;
            margin-top: 5px;
        }
        /* hr{
          border: 0;
          height: 3px;
          background: #000000;
        } */
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-white bg-dark">
        <div class="container-fluid ">
            <a class="navbar-brand bg-white" href="javascript:void(0)">
                <img src="https://tjoeun.co.kr/images/logo.gif?v=20190918" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="mynavbar">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0)">자유게시판</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0);">자료실</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0);">방명록</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="javascript:void(0);" role="button"
                            data-bs-toggle="dropdown">드롭다운</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">SubMenu1</a></li>
                            <li><a class="dropdown-item" href="#">SubMenu2</a></li>
                            <li><a class="dropdown-item" href="#">SubMenu3</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                     
                      <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Search">
                        <button class="btn btn-warning" type="submit">
                          <i class="bi bi-search"></i></button>
                      </div>
                    </li>
                </ul>
                <ul class="navbar-nav justify-content-end">
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0)">
                          <i class="bi bi-person-fill-add"></i> 회원가입</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="javascript:void(0);">
                          <i class="bi bi-person-lines-fill"></i> 회원정보수정</a>
                    </li>
                    <li class="nav-item">
                       
                        <a class="nav-link" href="javascript:void(0);">
                          <i class="bi bi-box-arrow-in-right"></i> 로그인</a>
                    </li>
                    <li class="nav-item">
                       
                    <a class="nav-link" href="javascript:void(0);">
                      <i class="bi bi-box-arrow-right"></i> 로그아웃</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row" style="height: 100px;">
            <div class="col-sm-3 mb-3 mt-2" >
                <button class="btn btn-secondary" style="width: 100%; height: 110%; font-weight: bold;">
                    웹사이트제작</button>
               
            </div>
            <div class="col-sm-6 mt-2">
                <h3>게시판 목록 - 자유게시판</h3>
            </div>
            <div class="col-sm-3">
              <div class="input-group mt-5 mb-3">
                <select class="form-select w-25">
                  <option selected>제목</option>
                  <option>내용</option>
                  <option>작성자</option>
                </select>
                <input type="text" class="form-control w-50" placeholder="" />
                <button class="btn btn-warning" type="submit">
                  <i class="bi bi-search"></i></button>
                </button>
              </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row ">
            <div class="col-sm-3">
                <div class="btn-group-vertical dropend"
                  style=" width: 100%; height: 120px; margin-top: 20px;">
                    <button type="button" class="btn btn-primary active-">자유게시판</button>
                    <button type="button" class="btn">자료실</button>
                    <button type="button" class="btn">방명록</button>
                    <button type="button" class="btn btn-white dropdown-toggle"
                    data-bs-toggle="dropdown">드롭다운</button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">SubMenu1</a>
                        <a class="dropdown-item" href="#">SubMenu2</a>                    
                        <a class="dropdown-item" href="#">SubMenu3</a>                    
                    </div>
                </div>
            </div>
            <div class="col-sm-9 ">
                <table class="table table-hover table-striped" style="margin-top: 10px;">
                    <colgroup>
                        <col style="width: 5%;">
                        <col style="width: 50%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 10%;">
                        <col style="width: 5%;">
                    </colgroup>
                    <thead class="table-secondary text-center">
                        <tr>
                            <th>번호</th>
                            <th >제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>조회수</th>
                            <th>첨부</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>100</td>
                            <td><a href="#">제목</a>
                            </td>
                            <td>작성자</td>
                            <td>작성일</td>
                            <th>조회수</th>
                            <th><i class="bi bi-pin-angle-fill"></i></th>
                        </tr>
                        <tr>
                            <td>100</td>
                            <td><a href="#">제목</a></td>
                            <td>작성자</td>
                            <td>작성일</td>
                            <td>조회수</td>
                            <td><i class="bi bi-card-image"></i></td>
                        </tr>
                        <tr>
                            <td>100</td>
                            <td><a href="#">제목</a></td>
                            <td>작성자</td>
                            <td>작성일</td>
                            <td>조회수</td>
                            <td><i class="bi bi-pin-angle-fill"></i></td>
                        </tr>
                        <tr>
                            <td>100</td>
                            <td><a href="#">제목</a></td>
                            <td>작성자</td>
                            <td>작성일</td>
                            <td>조회수</td>
                            <td><i class="bi bi-card-image"></i></td>
                        </tr>
                        <tr>
                            <td>100</td>
                            <td><a href="#">제목</a></td>
                            <td>작성자</td>
                            <td>작성일</td>
                            <td>조회수</td>
                            <td><i class="bi bi-pin-angle-fill"></i></td>
                        </tr>
                        <tr>
                            <td>100</td>
                            <td><a href="#">제목</a></td>
                            <td>작성자</td>
                            <td>작성일</td>
                            <td>조회수</td>
                            <td><i class="bi bi-card-image"></i></td>
                        </tr>
                        <tr>
                            <td>100</td>
                            <td><a href="#">제목</a></td>
                            <td>작성자</td>
                            <td>작성일</td>
                            <td>조회수</td>
                            <td><i class="bi bi-pin-angle-fill"></i></td>
                        </tr>
                        <tr>
                            <td>100</td>
                            <td><a href="#">제목</a></td>
                            <td>작성자</td>
                            <td>작성일</td>
                            <td>조회수</td>
                            <td><i class="bi bi-card-image"></i></td>
                        </tr>
                    </tbody>
                </table>
                <div class="btn-group mb-3 ms-5 btn btn-justify-content-end">
                  <button type="button" class="btn">Basic</button>
                  <button type="button" class="btn btn-primary">글쓰기</button>
                  <button type="button" class="btn btn-secondary">수정하기</button>
                  <button type="button" class="btn btn-success">삭제하기</button>
                  <button type="button" class="btn btn-info">답글쓰기</button>
                  <button type="button" class="btn btn-warning">리스트보기</button>
                  <button type="button" class="btn btn-danger">전송하기</button>
                  <button type="button" class="btn btn-dark">Reset</button>
                  <button type="button" class="btn btn-light">Light</button>
                  <button type="button" class="btn btn-link">Link</button>    
              </div>
              <ul class="pagination justify-content-center">
                  <li class="page-item"><a class="page-link"href="#"><i class="bi bi-skip-backward-fill"></i></a></li>
                  <li class="page-item"><a class="page-link" href="#"><i class="bi bi-skip-start-fill"></i></a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item active"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">4</a></li>
                  <li class="page-item"><a class="page-link" href="#">5</a></li>
                  <li class="page-item "><a class="page-link"href="#"><i class="bi bi-skip-end-fill"></i></a></li>
                  <li class="page-item "><a class="page-link"href="#"><i class="bi bi-fast-forward-fill"></i></a></li>
              </ul>
            </div>
            <hr>
            <div class="copyright">
                <div class="copy_logo ms-2">
                    조용민™
                </div>
                <div class="copy_info">
                    E-mail : whdydals0802@naver.com&nbsp;&nbsp;
                    Mobile : 02-1234-5678 &nbsp;&nbsp;
                    Address : 서울시 종로구 관철동 스타골드 503호 <br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    Copyright &copy; 2010 TJOEUN. All rights reserved.
                </div>  
            </div>
        </div>
    </div>
</body>
</html>