<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, user.UserDAO " %>
    
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../css/BlackLaundry.css" />
<body>
    <div class="container-k">
        <div class="mainbox">
            <div class="left-mainbox">
                <p>Premium laundry service</p>
                <h1>세탁의 당신 <br> BLACK LAUNDRY </h1>
                <p>명품 전문 케어 센터인 EzenAcademy Center에서 <br> 각 파트별 전문 마스터들이 맞춤 관리하는 케어 서비스 BLACK LAUNDRY 입니다.</p>
            	<a href="../reservation/BlackReservation.jsp">예약하기</a>
            </div>
            <div class="right-mainbox">
                <img src="../img/black1.jpg" alt="black1">
            </div>
        </div>

        <!-- /맨 위 박스 -->

        <div class="three-box">
            <div class="first-box">
                <img src="../img/one2.jpg" alt="one">
                <div class="overlay">BLAKC LAUNDRY CENTER의 <br> 전문 마스터가 직접 관리</div>
            </div>
            <div class="second-box">
                <img src="../img/two.jpg" alt="two">
                <div class="overlay">세탁 전문 연구기관 <br> LAUDNRY XXTX <br> 센터</div>
            </div>
            <div class="third-box">
                <img src="../img/three.jpg" alt="three">
                <div class="overlay">원단부터 장식까지 <br> 세심한 관리 프로세스</div>
            </div>
        </div>

         <!-- /아래 3개 박스 -->
        <div class="process">
            <div class="process-title">
                <p>BLACK LAUNDRY Process</p>
                <h1><i class="fa-solid fa-quote-left"></i>블랙런드리 명품 의류 세탁과정<i class="fa-solid fa-quote-right"></i></h1>
                <p>꼼꼼하게 검품하고, 단추, 장식이 손상되지 않게 보호하는 작업을 거칩니다.</p>
                <p>옷 특성에 맞춰 세탁, 건조를 진행하고 세심한 다림질로 마무리하여 고객님께 전달됩니다.</p>
            </div>
            <div class="row-k">
                <div class="left-process">
                    <img src="../img/process1.jpg" alt="">
                </div>
                <div class="right-process">
                    <h1>01 검품</h1>
                    <span>파손, 오염, 장식 등을</span> <br>
                    <span>꼼꼼하게 확인하고 사진 촬영합니다.</span> <br>
                    <span>파손 위험이 있는 장식은 싸개로 감싸 보호합니다.</span>
                </div>
            </div>
            <div class="row-k">
                <div class="left-process">
                    <h1>02 전처리</h1>
                    <span>소재 및 오염을 파악하여</span> <br>
                    <span>오염을 제거하고 세탁물 손상을 보호합니다.</span> <br>
                </div>
                <div class="right-process">
                    <img src="../img/process2.jpg" alt="">
                </div>
            </div>
            <div class="row-k">
                <div class="left-process">
                    <img src="../img/process3.jpg" alt="">
                </div>
                <div class="right-process">
                    <h1>03 세탁</h1>
                    <span>원단, 옷의 특성에 맞춰 세탁합니다.</span> <br>
                    <span>물세탁과 드라이가 금지된 제품은</span> <br>
                    <span>고객 동의 후 수작업으로 세탁합니다.</span>
                </div>
            </div>
            <div class="row-k">
                <div class="left-process">
                    <h1>04 건조</h1>
                    <span>옷감의 소재와 품목에 맞는</span> <br>
                    <span>최적의 환경에서 건조를 진행합니다.</span> <br>
                </div>
                <div class="right-process">
                    <img src="../img/process4.jpg" alt="">
                </div>
            </div>
            <div class="row-k">
                <div class="left-process">
                    <img src="../img/process5.jpg" alt="">
                </div>
                <div class="right-process">
                    <h1>05 다림질</h1>
                    <span>전체 주름을 편 후, 스틈다리미로 겉감과 안감까지</span> <br>
                    <span>꼼꼼히 부분별로 나눠서 다림질합니다.</span> <br>
                    <p>*다림질 전, 검수를 통해 보완이 필요한 경우 케어를 진행합니다.</p>
                </div>
            </div>
            <div class="row-k">
                <div class="left-process">
                    <h1>06 포장</h1>
                    <span>블랙런드리 의류 전용 포장지로 깔끔하게 포장합니다.</span> <br>
                </div>
                <div class="right-process">
                    <img src="../img/process6.jpg" alt="">
                </div>
            </div>
        </div>

        <!-- /process -->

        <div class="duration">
            <p>Duration of time</p>
            <h1><i class="fa-solid fa-quote-left"></i>소요 기간<i class="fa-solid fa-quote-right"></i></h1>
            <span>평균적으로 약 9~12일 소요되며</span> <br>
            <span>오염이 심한 세탁물이거나, 세탁물이 많이 접수되는 4~5월에는</span> <br>
            <span>더 오래 걸릴 수 있습니다.</span>
        </div>

        <!-- /duration -->

        <div class="price">
            <div class="price-title">
                <p>BLACK LABEL price</p>
                <h1><i class="fa-solid fa-quote-left"></i>요금 안내<i class="fa-solid fa-quote-right"></i></h1>
             </div>
             <table>
                <tr>
                    <th>상품</th>
                    <th>가격</th>
                </tr>
                <tr>
                    <td>생활</td>
                    <td>50,000원</td>
                </tr>
                <tr>
                    <td>이불</td>
                    <td>100,000원</td>
                </tr>
                <tr>
                    <td>셔츠</td>
                    <td>25,000원</td>
                </tr>
                <tr>
                    <td>드라이</td>
                    <td>80,000원</td>
                </tr>
                <tr>
                    <td>개별 클리닝</td>
                    <td>90,000원</td>
                </tr>
            </table>
        </div>

        <div class="warning">
            <h1>※주의사항</h1>
            <p>- 원단 특성상 <span>문제가 발생하지 않는 선에서 안전하게 세탁</span> 을 진행하기 때문에 오염이 완벽하게 제거되지 않을 수 있습니다.</p>
            <p>- <span>오염이 심한 의류는 반드시 별도로 포장해서 접수해주세요.</span></p>
            <p>세탁 기준 요금으로 <span>고난도 오염 등의 개별, 특수처리</span>가 필요한 서비스 발생시 <span>비용이 추가</span>될 수 있습니다.</p>
        </div>
    </div>

<jsp:include page="../include/footer.jsp"></jsp:include>