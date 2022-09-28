CREATE TABLE tb_apo (
    apNo char PRIMARY KEY,
    MEMBERSHIP varchar2(10) NOT NULL,
    Journey nvarchar2(2) NOT NULL,
    stCity nvarchar2(20) NOT NULL,
    stDate Date NOT NULL,
    stTime date NOT NULL,
    edCity nvarchar2(20) NOT NULL,
    edDate Date NOT NULL,
    edTime date NOT NULL,
    sum_c_code number(2) NOT NULL,
    AP_id varchar2(20) NOT NULL,
    S_Number varchar2(4) NOT NULL,
    c_code char(4) NOT NULL,
    sumAm float NOT NULL,
    CoC char(4) NOT NULL
);

alter table tb_apo modify apNo  char(11);

INSERT INTO
    tb_apo (
        apNo,
        MEMBERSHIP,
        Journey,
        stCity,
        stDate,
        stTime,
        edCity,
        edDate,
        edTime,
        sum_c_code,
        AP_id,
        S_Number,
        c_code,
        sumAm,
        CoC
    )
VALUES
    (
        '20220831SC1',
        'KM001',
        '왕복',
        '인천',
        to_date('2022-08-31','yyyy-mm-dd'),
        to_date('10:30:00','hh:mi:ss'),
        '제주',
        to_date('2022-08-31','yyyy-mm-dd'),
        to_date('11:30:00','hh:mi:ss'),
        '1',
        'A380-800',
        'A33',
        'C001',
        '50000',
        'Card'
    );


CREATE TABLE TB_Airplane(
    AP_id varchar2(20) NOT NULL,
    AP_company varchar2(10) NOT NULL,
    AP_number varchar2(3) NOT NULL,
    AP_stnumber number(4) NOT NULL,
    PRIMARY KEY(AP_id)
);

INSERT INTO
    TB_Airplane(AP_id, AP_company, AP_number, AP_stnumber)
VALUES
    ('A380-800', 'Airbus', '6', 495);

INSERT INTO
    TB_Airplane(AP_id, AP_company, AP_number, AP_stnumber)
VALUES
    ('B747-400', 'Boeing', '1', 398);

INSERT INTO
    TB_Airplane(AP_id, AP_company, AP_number, AP_stnumber)
VALUES
    ('A350-900', 'Airbus', '13', 311);

INSERT INTO
    TB_Airplane(AP_id, AP_company, AP_number, AP_stnumber)
VALUES
    ('B777-200ER', 'Boeing', '9', 300);

INSERT INTO
    TB_Airplane(AP_id, AP_company, AP_number, AP_stnumber)
VALUES
    ('A330-300', 'Airbus', '15', 250);

INSERT INTO
    TB_Airplane(AP_id, AP_company, AP_number, AP_stnumber)
VALUES
    ('B767-300', 'Boeing', '1', 290);

INSERT INTO
    TB_Airplane(AP_id, AP_company, AP_number, AP_stnumber)
VALUES
    ('A321-neo', 'Airbus', '5', 180);

INSERT INTO
    TB_Airplane(AP_id, AP_company, AP_number, AP_stnumber)
VALUES
    ('A321-200', 'Airbus', '14', 174);

INSERT INTO
    TB_Airplane(AP_id, AP_company, AP_number, AP_stnumber)
VALUES
    ('A320-200', 'Airbus', '1', 159);
    
CREATE TABLE TB_Seatcode(
    P_number varchar2(5) NOT NULL,
    AP_id varchar2(20) NOT NULL,
    S_number varchar2(4) NOT NULL,
    S_gcode char(4) NOT NULL,
    PRIMARY KEY(P_number)
);

INSERT INTO
    TB_Seatcode(P_number, AP_id, S_number, S_gcode)
VALUES
    ('AA1J', 'A380-800', 'A1', 'J001');

INSERT INTO
    TB_Seatcode(P_number, AP_id, S_number, S_gcode)
VALUES
    ('AA7J', 'A380-800', 'A7', 'J003');

INSERT INTO
    TB_Seatcode(P_number, AP_id, S_number, S_gcode)
VALUES
    ('AA31J', 'A380-800', 'A31', 'J008');

INSERT INTO
    TB_Seatcode(P_number, AP_id, S_number, S_gcode)
VALUES
    ('AA33J', 'A380-800', 'A33', 'J007');

INSERT INTO
    TB_Seatcode(P_number, AP_id, S_number, S_gcode)
VALUES
    ('AA30J', 'A380-800', 'A30', 'J006');

INSERT INTO
    TB_Seatcode(P_number, AP_id, S_number, S_gcode)
VALUES
    ('AA71J', 'A380-800', 'A71', 'J009');

INSERT INTO
    TB_Seatcode(P_number, AP_id, S_number, S_gcode)
VALUES
    ('BA1J', 'B747-400', 'A1', 'J001');

INSERT INTO
    TB_Seatcode(P_number, AP_id, S_number, S_gcode)
VALUES
    ('BA7J', 'B747-400', 'A7', 'J004');

INSERT INTO
    TB_Seatcode(P_number, AP_id, S_number, S_gcode)
VALUES
    ('BA20J', 'B747-400', 'A20', 'J007');

INSERT INTO
    TB_Seatcode(P_number, AP_id, S_number, S_gcode)
VALUES
    ('BA21J', 'B747-400', 'A21', 'J008');

INSERT INTO
    TB_Seatcode(P_number, AP_id, S_number, S_gcode)
VALUES
    ('BA27J', 'B747-400', 'A27', 'J006');
    
CREATE TABLE tb_customer(
    c_no int PRIMARY KEY --일련번호
,
    apNo char(11) NOT NULL --예약번호
,
    
    c_code char(4) NOT NULL --구분코드
,
    c_div nvarchar2(15) NOT NULL --분류
);

INSERT INTO
    tb_customer(c_no, apNo, c_code, c_div)
VALUES
    (
        customer_seq.nextval,
        '20220831SC1',
        'c001',
        '일반'
    );

INSERT INTO
    tb_customer(c_no, apNo, c_code, c_div)
VALUES
    (
        customer_seq.nextval,
        '20220901GC5',
        'c001',
        '일반'
    );

INSERT INTO
    tb_customer(c_no, apNo, c_code, c_div)
VALUES
    (
        customer_seq.nextval,
        '20220901GC5',
        'c005',
        '유/소아 동반'
    );


CREATE TABLE TB_SeatClass(
    S_gcode char(4) NOT NULL,
    S_class varchar2(30) NOT NULL,
    S_cost int NOT NULL,
    CONSTRAINT TB_SeatClass_pk PRIMARY KEY (S_gcode)
);


INSERT INTO
    TB_SeatClass
VALUES
    ('J001', '비지니스 스위트', 377000);

INSERT INTO
    TB_SeatClass
VALUES
    ('J002', '로얄비지니스', 269500);

INSERT INTO
    TB_SeatClass
VALUES
    ('J003', '비지니스 스마티움', 210000);

INSERT INTO
    TB_SeatClass
VALUES
    ('J004', '비지니스', 168000);

INSERT INTO
    TB_SeatClass
VALUES
    ('J005', '이코노미 스마티움', 123500);

INSERT INTO
    TB_SeatClass
VALUES
    ('J006', '이코노미 레그룸', 80000);

INSERT INTO
    TB_SeatClass
VALUES
    ('J007', '이코노미', 50000);

INSERT INTO
    TB_SeatClass
VALUES
    ('J008', '프론트', 30000);

INSERT INTO
    TB_SeatClass
VALUES
    ('J009', '듀오', 30000);

INSERT INTO
    TB_SeatClass
VALUES
    ('J010', '반려동물 지정', 30000);
    
CREATE TABLE tb_member(
    membership varchar2(10) PRIMARY KEY --회원번호
,
    k_name varchar(50) NOT NULL --한글명
,
    e_name varchar(30) NOT NULL --영문명
,
    gender char(1) CHECK(gender IN ('W', 'M')) --성별
,
    nation varchar2(20) NOT NULL --국가
,
    g_id varchar(20) UNIQUE --아이디
,
    g_password varchar2(20) NOT NULL --비밀번호
,
    p_number varchar2(20) NOT NULL --휴대폰번호
,
    b_date date NOT NULL --생년월일
,
    addr varchar(50) --주소
,
    e_susin char(1) CHECK(e_susin IN ('Y', 'N')) --이벤트 수신
);


INSERT INTO
    tb_member(
        membership,
        k_name,
        e_name,
        gender,
        nation,
        g_id,
        g_password,
        p_number,
        b_date,
        addr,
        e_susin
    )
VALUES
    (
        'S-KM001',
        '김도훈',
        'Kimdohun',
        'M',
        'KOREA',
        'kd0001',
        'AA1234',
        '010-2342-5443',
        '1955.01.30',
        '서울시 서초구 신반포로 23길 21',
        'Y'
    );

INSERT INTO
    tb_member(
        membership,
        k_name,
        e_name,
        gender,
        nation,
        g_id,
        g_password,
        p_number,
        b_date,
        addr,
        e_susin
    )
VALUES
    (
        'S-KW001',
        '최다은',
        'Choeda-eun',
        'W',
        'KOREA',
        'ce1234',
        'BB5678',
        '010-5343-1234',
        '1955.01.30',
        '서울시 강남구 수청로 175번길 31',
        'Y'
    );

INSERT INTO
    tb_member(
        membership,
        k_name,
        e_name,
        gender,
        nation,
        g_id,
        g_password,
        p_number,
        b_date,
        addr,
        e_susin
    )
VALUES
    (
        'D-KM002',
        '김주완',
        'Kimjuwan',
        'M',
        'KOREA',
        'kj0002',
        'CC91011',
        '010-2542-4643',
        '1955.01.30',
        '경기도 수원시 대마도로 54번길 51',
        'N'
    );

INSERT INTO
    tb_member(
        membership,
        k_name,
        e_name,
        gender,
        nation,
        g_id,
        g_password,
        p_number,
        b_date,
        addr,
        e_susin
    )
VALUES
    (
        'P-KW002',
        '김민경',
        'Kimmingyeong',
        'W',
        'KOREA',
        'km1234',
        'DD121314',
        '010-6955-3214',
        '1955.01.30',
        '경기도 평양시 동무도로 35번길 33',
        'N'
    );

INSERT INTO
    tb_member(
        membership,
        k_name,
        e_name,
        gender,
        nation,
        g_id,
        g_password,
        p_number,
        b_date,
        addr,
        e_susin
    )
VALUES
    (
        'B-CM001',
        '김홍승',
        'Kimhongseung',
        'M',
        'CHINA',
        'kgs1234',
        'EE151617',
        '010-2454-6543',
        '1955.01.30',
        '부산광역시 동래구 국밥도로 31번길 32',
        'N'
    );
    
    CREATE TABLE tb_airport(
    g_code char(3) PRIMARY KEY -- 공항코드
,
    city_name nvarchar2(20) NOT NULL -- 도시명
,
    air_name nvarchar2(50) NOT NULL -- 공항명
,
    continent nvarchar2(20) NOT NULL -- 대륙구분
,
    g_contact nvarchar2(30) NOT NULL -- 연락처
,
    g_location nvarchar2(50) NOT NULL -- 위치
,
    a_photo nvarchar2(30) NOT NULL -- 공항사진
,
    web nvarchar2(50) NOT NULL -- 웹사이트
);

INSERT INTO
    tb_airport(
        g_code,
        city_name,
        air_name,
        continent,
        g_contact,
        g_location,
        a_photo,
        web
    )
VALUES
    (
        'ICN',
        '서울(인천)',
        '인천국제공항 제 1 여객터미널',
        '한국',
        '82-32-744-2000',
        '서울 시청 기준 서쪽으로 약 60km',
        'Incheon.png',
        'http://www.airport.kr/'
    );

INSERT INTO
    tb_airport(
        g_code,
        city_name,
        air_name,
        continent,
        g_contact,
        g_location,
        a_photo,
        web
    )
VALUES
    (
        'CJU',
        '제주)',
        '제주국제공항 청사 3층',
        '한국',
        '82-64-743-2626',
        '제주도청에서 2.5km 떨어짐',
        'Jeju.png',
        'https://www.airport.co.kr/jeju/index.do'
    );

INSERT INTO
    tb_airport(
        g_code,
        city_name,
        air_name,
        continent,
        g_contact,
        g_location,
        a_photo,
        web
    )
VALUES
    (
        'NGO',
        '나고야)',
        '중부국제공항 제1 여객터미널',
        '동북아시아',
        '81-569-38-0088',
        '나고야시내에서 48km',
        'Nagoya.png',
        'http://www.centrair.jp/'
    );
    
CREATE TABLE tb_event(
    e_code char(5) --게시코드
,
    e_index nvarchar2(40) --분류         
,
    e_title nvarchar2(40) --제목
,
    e_startdate date --이벤트 시작
,
    e_enddate date --이벤트 종료
,
    e_prizewinner varchar2(10) NULL --당첨자
,
    PRIMARY KEY(e_code)
);

INSERT INTO
    tb_event(
        e_code,
        e_index,
        e_title,
        e_startdate,
        e_enddate,
        e_prizewinner
    )
VALUES
    (
        'A1',
        '고객참여',
        '아시아나항공 이용하고 갤러리아백화점 우수고객 혜택도 누리세요.',
        '2022-08-12',
        '2022-12-31',
        'S-KM001'
    );

INSERT INTO
    tb_event(
        e_code,
        e_index,
        e_title,
        e_startdate,
        e_enddate,
        e_prizewinner
    )
VALUES
    (
        'B1   ',
        '항공권구매   ',
        '럭셔리한 그곳, 다시 가는 푸껫. 하와이',
        '2022-08-09',
        '2022-09-30',
        'S-KW001'
    );

INSERT INTO
    tb_event(
        e_code,
        e_index,
        e_title,
        e_startdate,
        e_enddate,
        e_prizewinner
    )
VALUES
    (
        'C1',
        '마일리지혜택',
        '자동차보험료 확인하고 500마일리지 받자!',
        '2022-08-30   ',
        '2022-12-31',
        'D-KM002'
    );
    
CREATE TABLE tb_eventnoticeboard(
    en_No char(2) --일련번호
,
    e_code char(2) --게시코드  
,
    e_title nvarchar2(40) --제목
,
    membership varchar2(10) --신청자
);

alter table tb_eventnoticeboard rename column membership to MEMBERSHIP;

INSERT INTO
    tb_eventnoticeboard(en_No, e_code, e_title, membership)
VALUES
    (
        '1',
        'A1',
        '아시아나항공 이용하고 갤러리아백화점 우수고객 혜택도 누리세요.',
        'S-KM001'
    );

INSERT INTO
    tb_eventnoticeboard(en_No, e_code, e_title, membership)
VALUES
    (
        '2',
        'A1',
        '아시아나항공 이용하고 갤러리아백화점 우수고객 혜택도 누리세요.',
        'S-KW001'
    );

INSERT INTO
    tb_eventnoticeboard(en_No, e_code, e_title, membership)
VALUES
    (
        '3',
        'A1',
        '아시아나항공 이용하고 갤러리아백화점 우수고객 혜택도 누리세요.',
        'D-KM002'
    );
    
CREATE TABLE tb_notice(
    n_code char(10) --게시코드
,
    n_index nvarchar2(30) --분류
,
    n_title nvarchar2(50) --제목
,
    n_content nvarchar2(60) --내용
,
    n_count char(10) --조회수
,
    n_date date --당첨자
);


INSERT INTO
    tb_notice(
        n_code,
        n_index,
        n_title,
        n_content,
        n_count,
        n_date
    )
VALUES
    (
        '00001',
        '아시아나 소식',
        '한국 출발 국제선 항공권 환불 위약금 및 재발행 수수료 변경 안내   ',
        '국제선 환불 위약금 및 재발행 수수료 변경에 관하여 아래와 같이 안내 드립니다.',
        '   2,094   ',
        '2022-08-25'
    );

INSERT INTO
    tb_notice(
        n_code,
        n_index,
        n_title,
        n_content,
        n_count,
        n_date
    )
VALUES
    (
        '00002   ',
        '유류할증료   ',
        '2022년 9월 한국출발 국제선 유류할증료   ',
        '2022년 9월 한국출발 국제선 유류할증료',
        '7,537   ',
        '2022-08-16'
    );

INSERT INTO
    tb_notice(
        n_code,
        n_index,
        n_title,
        n_content,
        n_count,
        n_date
    )
VALUES
    (
        '00003',
        '아시아나 클럽',
        '   KT CLIP(클립) 멤버십 서비스 종료 안내',
        '   KT CLIP(클립) 멤버십 서비스 종료 안내',
        '1,033   ',
        '2021-05-11'
    );
    
    commit;
    
SELECT *
FROM
    tb_notice,
    TB_AIRPORT
    INNER JOIN (
        (
            TB_MEMBER
            INNER JOIN (
                tb_event
                INNER JOIN tb_eventnoticeboard ON tb_event.e_code = tb_eventnoticeboard.e_code
            ) ON (TB_MEMBER.MEMBERSHIP = tb_event.e_prizewinner)
            AND (
                TB_MEMBER.MEMBERSHIP = tb_eventnoticeboard.MEMBERSHIP
            )
        )
        INNER JOIN (
            TB_SeatClass
            INNER JOIN (
                (
                    (
                        TB_Airplane
                        INNER JOIN tb_apo ON TB_Airplane.AP_id = tb_apo.AP_id
                    )
                    INNER JOIN tb_customer ON (tb_customer.c_code = tb_apo.c_code)
                    AND (tb_apo.apNo = tb_customer.apNo)
                )
                INNER JOIN TB_Seatcode ON TB_Airplane.AP_id = TB_Seatcode.AP_id
            ) ON TB_SeatClass.S_gcode = TB_Seatcode.S_gcode
        ) ON TB_MEMBER.MEMBERSHIP = tb_apo.MEMBERSHIP
    ) ON (TB_AIRPORT.CITY_NAME = tb_apo.stCity)
    AND (TB_AIRPORT.CITY_NAME = tb_apo.edCity);