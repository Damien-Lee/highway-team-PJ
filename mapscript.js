var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(36.928647, 127.167764), // 지도의 중심좌표
        level: 11 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도에 추가된 지도타입정보를 가지고 있을 변수입니다
var currentTypeId;

// 버튼이 클릭되면 호출되는 함수입니다
function setOverlayMapTypeId(maptype) {
    var changeMaptype;
    
    // maptype에 따라 지도에 추가할 지도타입을 결정합니다
    if (maptype == 'TRAFFIC') {
        
        // 교통정보 지도타입
        changeMaptype = kakao.maps.MapTypeId.TRAFFIC;     
        
    } else if (maptype == 'ROADMAP') {

        // 로드뷰 도로정보 지도타입
        changeMaptype = kakao.maps.MapTypeId.ROADMAP;

    }
    
    // 이미 등록된 지도 타입이 있으면 제거합니다
    if (currentTypeId) {
        map.removeOverlayMapTypeId(currentTypeId);    
    }
    
    // maptype에 해당하는 지도타입을 지도에 추가합니다
    map.addOverlayMapTypeId(changeMaptype);
    
    // 지도에 추가된 타입정보를 갱신합니다
    currentTypeId = changeMaptype;        
}


// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다
var positions = [
    {
        content: '<div>서울 만남의 광장 부산방향</div>',
        latlng: new kakao.maps.LatLng(37.460379, 127.041943)
    },
    {
        content: '<div>청주휴게소 서울방향</div>',
        latlng: new kakao.maps.LatLng(36.716009, 127.349549)
    },
    {
        content: '<div>옥산휴게소 부산방향</div>',
        latlng: new kakao.maps.LatLng(36.657951, 127.369754)
    },
    {
        content: '<div>죽암휴게소 서울방향</div>',
        latlng: new kakao.maps.LatLng(36.496771, 127.430678)
    },
        {
        content: '<div>죽암휴게소 부산방향</div>',
        latlng: new kakao.maps.LatLng(36.486778, 127.429278)
    },
        {
        content: '<div>신탄진휴게소 서울방향</div>',
        latlng: new kakao.maps.LatLng(36.426770, 127.418507)
    },
        {
        content: '<div>죽전휴게소 서울방향</div>',
        latlng: new kakao.maps.LatLng(37.332380, 127.104787)
    },
        {
        content: '<div>기흥휴게소 부산방향</div>',
        latlng: new kakao.maps.LatLng(37.234963, 127.104573)
    },
        {
        content: '<div>안성휴게소 서울방향</div>',
        latlng: new kakao.maps.LatLng(37.076830, 127.132447)
    },
        {
        content: '<div>입장휴게소 서울방향</div>',
        latlng: new kakao.maps.LatLng(36.942983, 127.192452)
    },
        {
        content: '<div>망향휴게소 부산방향</div>',
        latlng: new kakao.maps.LatLng(36.855373, 127.180890)
    },
        {
        content: '<div>천안휴게소 서울방향</div>',
        latlng: new kakao.maps.LatLng(36.787832, 127.173438)
    },
        {
        content: '<div>천안휴게소 부산방향</div>',
        latlng: new kakao.maps.LatLng(36.730251, 127.263871)
    }
];
var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다
    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    positions ; // 마커가 표시될 위치입니다

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커의 위치
        image: markerImage, // 마커이미지 설정
        clickable: true
    });

    // 마커에 표시할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        location.href="http://www.naver.com"; });
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

// select
function sitemove(){
    msg=$('#site').val+"이메일을 정확히 하세요"
    alert(msg);
}
