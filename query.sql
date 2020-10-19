SELECT * from fish;
SELECT * FROM FISH WHERE FIS_ADDR LIKE '홍천%' AND FIS_NUM IN(1); #홍천에서 잡은내용
SELECT * FROM FISH WHERE FIS_SPEC LIKE '쏘가리%'; #쏘가리 잡은곳
SELECT * FROM FISH WHERE FIS_SIZE IN(50); # 50사이즈가 잡힌곳
SELECT * FROM FISH WHERE FIS_ADDR LIKE '인제%' AND FIS_NUM BETWEEN 5 AND 30; #인제에서 5마리이상 30마리이하 잡힌내용
SELECT * FROM FISH WHERE FIS_SPEC LIKE '꺽지%' GROUP BY FIS_SPEC; #GROUP BY DISTICT(최대값,최솟값,평균등을 구하는 함수)
SELECT FIS_ADDR, FIS_NUM FROM FISH GROUP BY FIS_ADDR, FIS_NUM ORDER BY 2 DESC; #제일 많이 잡힌곳
SELECT FIS_ADDR, FIS_SIZE FROM FISH GROUP BY FIS_ADDR, FIS_SIZE ORDER BY 2 DESC; #제일 크게 잡힌 곳
SELECT FIS_ADDR, FIS_NUM, FIS_SIZE FROM FISH GROUP BY FIS_ADDR, FIS_NUM, FIS_SIZE ORDER BY 3 DESC; #제일 크게잡혔는데,몇마리 잡혔는지?
SELECT DISTINCT FIS_ADDR FROM FISH WHERE FIS_SPEC ='베스' ORDER BY 1; #베스가 잡힌곳, 중복제거
SELECT FIS_SPEC, FIS_NUM FROM FISH GROUP BY FIS_NUM ORDER BY 2 DESC; # 가장 많이 잡힌 어종
SELECT FIS_SPEC, FIS_SIZE FROM FISH GROUP BY FIS_SIZE ORDER BY 2 DESC; # 가장 크게 잡힌 어종
SELECT FIS_SPEC, FIS_SIZE, FIS_NUM, FIS_ADDR FROM FISH WHERE FIS_SIZE >=40 AND FIS_NUM >=10 ORDER BY 4 DESC; #크게 잡히면서 많이 잡은곳

#grant all on mysql.* to db_test@localhost

CREATE TABLE tidalcurrent (
	TIDAL_IDX INT NOT NULL,
	OBS_TIME DATETIME NULL DEFAULT NULL,
	current_direct FLOAT(12) NULL DEFAULT NULL,
	current_speed FLOAT(12) NULL DEFAULT NULL,
	OBS_POST_NAME VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	LAT FLOAT(12) NULL DEFAULT NULL,
	LON FLOAT(12) NULL DEFAULT NULL
)
ENGINE=INNODB DEFAULT CHARSET=utf8;

SELECT * FROM tidalcurrent;

CREATE TABLE wind (
	WIND_IDX INT 	NOT NULL,
	record_time DATETIME NULL DEFAULT NULL,
	wind_dir FLOAT(12) NULL DEFAULT NULL,
	wind_speed FLOAT(12) NULL DEFAULT NULL,
	OBS_POST_NAME VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	LAT FLOAT(12) NULL DEFAULT NULL,
	LON FLOAT(12) NULL DEFAULT NULL
)
ENGINE=INNODB DEFAULT CHARSET=UTF8;

#DROP TABLE wind;
SELECT * FROM wind;

CREATE TABLE wave (
	WH_IDX INT NOT NULL,
	record_time DATETIME NULL DEFAULT NULL,
	wave_height FLOAT(12) NULL DEFAULT NULL,
	OBS_POST_NAME VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	LAT FLOAT(12) NULL DEFAULT NULL,
	LON FLOAT(12) NULL DEFAULT NULL
)
ENGINE=INNODB DEFAULT CHARSET=UTF8;

DROP TABLE wave;
SELECT * FROM wave;

CREATE TABLE tidelevel (
	TIDE_IDX INT NOT NULL,
	record_time DATETIME NULL DEFAULT NULL,
	tide_level FLOAT(12) NULL DEFAULT NULL,
	OBS_POST_NAME VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	LAT FLOAT(12) NULL DEFAULT NULL,
	LON FLOAT(12) NULL DEFAULT NULL
)
ENGINE=INNODB DEFAULT CHARSET=UTF8;

SELECT * FROM tidelevel;

CREATE TABLE temp (
	TEMP_IDX INT NOT NULL,
	record_time DATETIME NULL DEFAULT NULL,
	water_temp FLOAT(12) NULL DEFAULT NULL,
	OBS_POST_NAME VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	LAT FLOAT(12) NULL DEFAULT NULL,
	LON FLOAT(12) NULL DEFAULT NULL
)
ENGINE=INNODB DEFAULT CHARSET=UTF8;

SELECT * FROM temp;

CREATE TABLE tidalpre (
	tide_pre_IDX INT NOT NULL,
	tph_level INT NULL DEFAULT NULL,
	tph_time DATETIME NULL DEFAULT NULL,
	OBS_POST_NAME VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	LAT FLOAT(12) NULL DEFAULT NULL,
	LON FLOAT(12) NULL DEFAULT NULL,
	hl_code VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci'
)
ENGINE=INNODB DEFAULT CHARSET=UTF8;

#DROP TABLE tidalpre;

SELECT * FROM tidalpre;

CREATE TABLE asos (
	GND_DAILY_IDX INT NOT NULL,
	tm DATE NULL DEFAULT NULL,
	avgTa FLOAT(12)  NULL DEFAULT NULL,
	minTa FLOAT(12) NULL DEFAULT NULL,
	minTaHrmt FLOAT(12) NULL DEFAULT NULL,
	maxTa FLOAT(12) NULL DEFAULT NULL,
	maxTaHrmt FLOAT(12) NULL DEFAULT NULL,
	hr1MaxRn FLOAT(12) NULL DEFAULT NULL,
	hr1MaxRnHrmt FLOAT(12) NULL DEFAULT NULL,
	sumRn FLOAT(12) NULL DEFAULT NULL,
	maxWs FLOAT(12) NULL DEFAULT NULL,
	maxWsWd FLOAT(12) NULL DEFAULT NULL,
	maxWsHrmt FLOAT(12) NULL DEFAULT NULL,
	avgWs FLOAT(12) NULL DEFAULT NULL,
	maxWd FLOAT(12) NULL DEFAULT NULL,
	avgTd FLOAT(12) NULL DEFAULT NULL,
	minRhm FLOAT(12) NULL DEFAULT NULL,
	minRhmHrmt FLOAT(12) NULL DEFAULT NULL,
	avgRhm FLOAT(12) NULL DEFAULT NULL,
	ssumSsHr FLOAT(12) NULL DEFAULT NULL,
	hr1MaxIcsrHrmt FLOAT(12) NULL DEFAULT NULL,
	hr1MaxIcsr FLOAT(12) NULL DEFAULT NULL,
	sumGsr FLOAT(12) NULL DEFAULT NULL,
	sumfogdur FLOAT(12) NULL DEFAULT NULL,
	regld VARCHAR(30) NULL DEFAULT NULL COLLATE 'utf8_general_ci'
)
ENGINE=INNODB DEFAULT CHARSET=UTF8;

set @@global.sql_mode = "ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"

SELECT * FROM asos;

CREATE TABLE meteorological (
	STN_IDX INT NOT NULL,
	regld VARCHAR(10) NULL DEFAULT NULL,
	LAT FLOAT(12) NULL DEFAULT NULL,
	LON FLOAT(12) NULL DEFAULT NULL,
	regName VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci'
)
ENGINE=INNODB DEFAULT CHARSET=UTF8;

#DROP TABLE meteorological;

SELECT * from meteorological;

CREATE TABLE discharge (
	FLUX_IDX INT NOT NULL,
	OBS_YMD DATE NULL DEFAULT NULL,
	OBS_STHM TIME NULL DEFAULT NULL,
	AVG_WL FLOAT(12) NULL DEFAULT NULL,
	RIV_WITH FLOAT(12) NULL DEFAULT NULL,
	C_ARE FLOAT(12) NULL DEFAULT NULL,
	W_SPD FLOAT(12) NULL DEFAULT NULL,
	FLW FLOAT(12) NULL DEFAULT NULL,
	OBS_WAY VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	WL_OBS_CD VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci'
)
ENGINE=INNODB DEFAULT CHARSET=UTF8;

DROP TABLE discharge;
SELECT * FROM discharge;

CREATE TABLE waterweather (
	WE_HR_IDX INT NOT NULL,
	ymdh DATETIME NULL DEFAULT NULL,
	ta FLOAT(12) NULL DEFAULT NULL,
	hm FLOAT(12) NULL DEFAULT NULL,
	td FLOAT(12) NULL DEFAULT NULL,
	ps FLOAT(12) NULL DEFAULT NULL,
	ws FLOAT(12) NULL DEFAULT NULL,
	sihr1 FLOAT(12) NULL DEFAULT NULL,
	catot FLOAT(12) NULL DEFAULT NULL,
	sdtot FLOAT(12) NULL DEFAULT NULL,
	sshr1 FLOAT(12) NULL DEFAULT NULL,
	obscd_time INT NULL DEFAULT NULL
)
ENGINE=INNODB DEFAULT CHARSET=UTF8;

SELECT * FROM waterweather;
#DROP TABLE weathertime;

SELECT * FROM asos;

CREATE TABLE seapost(
	OBS_POST_IDX INT NOT NULL,
	OBS_POST_ID VARCHAR(10) NULL DEFAULT NULL,
	DATA_TYPE VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	OBS_POST_NAME VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	LON FLOAT(12) NULL DEFAULT NULL,
	LAT FLOAT(12) NULL DEFAULT NULL,
	OBS_OBJECT VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci'
)
ENGINE=INNODB DEFAULT CHARSET=UTF8;

SELECT * FROM seapost;

#DROP TABLE seapost;
INSERT INTO seapost(OBS_POST_IDX, OBS_POST_ID, DATA_TYPE, OBS_POST_NAME, LON, LAT, OBS_OBJECT)
VALUES
(1,'DT_0019','조위관측소','가덕도',128.810833,35.024167,"조위,수온,염분,기온,기압,풍속,풍향"),
(2,'DT_0032','조위관측소','강화대교',126.522222222222,37.7319444444444,"조위,기압" ),
(3,'DT_0031','조위관측소','거문도',127.308889,34.028333,"조위,수온,염분,기압,풍속,풍향"   ),
(4,'DT_0029','조위관측소','거제도',128.699167,34.801389,"조위,수온,염분,기온,기압,풍속,풍향"),
(5,'DT_0058','조위관측소','경인항',126.601111,37.560833,"조위,기온,기압,풍속,풍향"      ),
(6,'DT_0026','조위관측소','고흥발포',127.342778,34.481111,"조위,수온,염분,기온,기압,풍속,풍향"),
(7,'DT_0049','조위관측소','광양',127.754836,34.903672,"조위,기압"                ),
(8,'DT_0018','조위관측소','군산',126.563056,35.975556,"조위,수온,염분,기온,기압,풍속,풍향" ),
(9,'DT_0038','조위관측소','굴업도',125.995,37.194444,"조위,기압"                  ),
(10,'DT_0017','조위관측소','대산',126.352778,37.0075,"조위,수온,기온,기압,풍속,풍향"      ),
(11,'DT_0057','조위관측소','동해항',129.143889,37.494722,"조위,기온,기압,풍속,풍향"      ),
(12,'DT_0062','조위관측소','마산',128.576389,35.1975,"조위,수온,기온,기압,풍속,풍향"      ),
(13,'DT_0023','조위관측소','모슬포',126.251111,33.214444,"조위,수온,염분,기온,기압,풍속,풍향"),
(14,'DT_0007','조위관측소','목포',126.375556,34.779722,"조위,수온,염분,기온,기압,풍속,풍향" ),
(15,'DT_0006','조위관측소','묵호',129.116389,37.550278,"조위,수온,염분,기온,기압,풍속,풍향" ),
(16,'DT_0025','조위관측소','보령',126.486111,36.406389,"조위,수온,염분,기압,풍속,풍향"    ),
(17,'DT_0005','조위관측소','부산',129.035278,35.096389,"조위,수온,염분,기온,기압,풍속,풍향" ),
(18,'DT_0056','조위관측소','부산항신항',128.786944,35.0775,"조위,기온,기압,풍속,풍향"      ),
(19,'DT_0061','조위관측소','삼천포',128.069722,34.924167,"조위,수온,염분,기온,기압,풍속,풍향"),
(20,'DT_0010','조위관측소','서귀포',126.561667,33.24,"조위,수온,염분,기온,기압,풍속,풍향"    ),
(21,'DT_0051','조위관측소','서천마량',126.495277777778,36.1288888888889,"조위,기온,기압,풍속,풍향"),
(22,'DT_0022','조위관측소','성산포',126.927778,33.474722,"조위,수온,염분,기온,기압,풍속,풍향"),
(23,'DT_0012','조위관측소','속초',128.594167,38.207222,"조위,수온,염분,기온,기압,풍속,풍향" ),
(24,'DT_0008','조위관측소','안산',126.647222,37.192222,"조위,수온,염분,기온,기압,풍속,풍향" ),
(25,'DT_0034','조위관측소','안흥',126.132222,36.673611,"조위,기온,풍속,풍향"          ),
(26,'DT_0037','조위관측소','어청도',125.984722,36.117222,"조위,수온,염분,기온,기압,풍속,풍향"),
(27,'DT_0016','조위관측소','여수',127.765556,34.747222,"조위,수온,염분,기온,기압,풍속,풍향" ),
(28,'DT_0003','조위관측소','영광',126.420556,35.426111,"조위,기온,기압,풍속,풍향"       ),
(29,'DT_0044','조위관측소','영종대교',126.584444444444,37.5455555555556,"조위,기압" ),
(30,'DT_0043','조위관측소','영흥도',126.428611111111,37.2386111111111,"조위,기온,기압,풍속,풍향"),
(31,'DT_0027','조위관측소','완도',126.759722,34.315556,"조위,수온,염분,기온,기압,풍속,풍향" ),
(32,'DT_0013','조위관측소','울릉도',130.913611,37.491389,"조위,수온,염분,기온,기압,풍속,풍향"),
(33,'DT_0020','조위관측소','울산',129.387222,35.501944,"조위,수온,염분,기온,기압,풍속,풍향" ),
(34,'DT_0030','조위관측소','위도',126.301667,35.618056,"조위,기온,기압,풍속,풍향"       ),
(35,'DT_0001','조위관측소','인천',126.592222,37.451944,"조위,수온,염분,기온,기압,풍속,풍향" ),
(36,'DT_0052','조위관측소','인천송도',126.586111111111,37.3380555555556,"조위,기온,기압,풍속,풍향"),
(37,'DT_0024','조위관측소','장항',126.6875,36.006944,"조위,기온,기압,풍속,풍향"         ),
(38,'DT_0004','조위관측소','제주',126.543056,33.5275,"조위,수온,염분,기온,기압,풍속,풍향"   ),
(39,'DT_0028','조위관측소','진도',126.308611,34.377778,"조위,수온,염분,기온,기압,풍속,풍향" ),
(40,'DT_0021','조위관측소','추자도',126.300278,33.961944,"조위,수온,염분,기온,기압,풍속,풍향"),
(41,'DT_0050','조위관측소','태안',126.238888888889,36.9130555555556,"조위,기온,기압,풍속,풍향"),
(42,'DT_0014','조위관측소','통영',128.434722,34.827778,"조위,수온,염분,기온,기압,풍속,풍향" ),
(43,'DT_0002','조위관측소','평택',126.822778,36.966944,"조위,수온,기온,기압,풍속,풍향"    ),
(44,'DT_0901','조위관측소','포항',129.374499,36.051581,"조위,수온,염분,기온,기압,풍속,풍향" ),
(45,'DT_0011','조위관측소','후포',129.453056,36.6775,"조위,수온,염분,기온,기압,풍속,풍향"   ),
(46,'DT_0035','조위관측소','흑산도',125.435556,34.684167,"조위,수온,염분,기온,기압"      ),
(47,'DT_0042','해양관측소','교본초',128.306388888889,34.7047222222222,"기온,기압,풍속,풍향"),
(48,'DT_0041','해양관측소','복사초',126.168333333333,34.0983333333333,"조위,기온,기압,풍속,풍향,파고"),
(49,'DT_0039','해양관측소','왕돌초',129.7325,36.7191666666667,"조위,기압,풍속,풍향,파고" ),
(50,'IE_0060','해양과학기지','이어도',125.182222222222,32.1227777777778,"조위,기온,기압,풍속,풍향,파고"),
(51,'IE_0062','해양과학기지','옹진소청초',124.738056,37.423056,"조위,수온,기온,기압,풍속,풍향,파고"),
(52,'IE_0061','해양과학기지','신안가거초',124.592778,33.941944,"조위,기온,기압,풍속,풍향,파고"),
(53,'TW_0089','해양관측부이','경포대해수욕장',128.931889,37.808972,"수온,기온,기압,풍속,풍향,파고"),
(54,'HB_0007','해양관측부이','한수원_온양',129.425,37.019444,"실시간제공데이터 항목 없음"       ),
(55,'HB_0008','해양관측부이','한수원_덕천',129.404167,37.1,"실시간제공데이터 항목 없음"         ),
(56,'HB_0009','해양관측부이','한수원_나곡',129.395833,37.119167,"실시간제공데이터 항목 없음"    ),
(57,'TW_0079','해양관측부이','상왕등도',126.19425,35.652472,"수온,파고,유속,유향"        ),
(58,'TW_0080','해양관측부이','우이도',125.802777777778,34.5430555555556,"수온,기온,기압,풍속,풍향,파고,유속,유향"),
(59,'TW_0081','해양관측부이','생일도',126.960277,34.258722,"수온,기온,기압,풍속,풍향,파고,유속,유향"),
(60,'TW_0082','해양관측부이','태안항',126.270222,37.006722,"수온,유속,유향"           ),
(61,'TW_0083','해양관측부이','여수항',127.808055,34.794722,"수온,유속,유향"           ),
(62,'TW_0084','해양관측부이','통영항',128.46,34.773333,"수온,유속,유향"               ),
(63,'TW_0092','해양관측부이','임랑해수욕장',129.2925,35.3025,"수온,기온,기압,풍속,풍향,파고,유속,유향"),
(64,'SF_0001','해양관측부이','부산항',129.08525,35.09175,"수온,유속,유향"             ),
(65,'TW_0078','해양관측부이','완도항',126.763194,34.325083,"수온,유속,유향"           ),
(66,'TW_0087','해양관측부이','부산항',129.08525,35.09175,"수온,유속,유향"             ),
(67,'TW_0090','해양관측부이','송정해수욕장',129.219444,35.164722,"수온,기압,풍속,풍향,파고,유속,유향"),
(68,'TW_0074','해양관측부이','광양항',127.792777,34.859722,"수온,유속,유향"           ),
(69,'HB_0001','해양관측부이','한수원_기장',129.23525,35.182444,"실시간제공데이터 항목 없음"     ),
(70,'HB_0002','해양관측부이','한수원_고리',129.314722,35.3185,"실시간제공데이터 항목 없음"      ),
(71,'HB_0003','해양관측부이','한수원_진하',129.368056,35.384722,"수온,유속,유향"        ),
(72,'HB_0004','해양관측부이','한수원_정자',129.495,35.634722,"실시간제공데이터 항목 없음"       ),
(73,'HB_0005','해양관측부이','한수원_신월성',129.495,35.717778,"실시간제공데이터 항목 없음"      ),
(74,'HB_0006','해양관측부이','한수원_양포',129.547222,35.865833,"실시간제공데이터 항목 없음"    ),
(75,'TW_0062','해양관측부이','해운대해수욕장',129.170166,35.148972,"실시간제공데이터 항목 없음"   ),
(76,'TW_0069','해양관측부이','대천해수욕장',126.457805,36.274111,"수온,기온,기압,풍속,풍향,파고,유속,유향"),
(77,'TW_0070','해양관측부이','평택당진항',126.540833,37.136666,"수온,유속,유향"         ),
(78,'TW_0072','해양관측부이','군산항',126.50875,35.984166,"수온,유속,유향"            ),
(79,'TW_0077','해양관측부이','경인항',126.592083,37.523388,"수온,유속,유향"           ),
(80,'TW_0075','해양관측부이','중문해수욕장',126.409555,33.2345,"실시간제공데이터 항목 없음"      ),
(81,'TW_0076','해양관측부이','인천항',126.533055,37.389444,"수온,유속,유향"           ),
(82,'TW_0088','해양관측부이','감천항',129.003083,35.052805,"수온,유속,유향"           ),
(83,'TW_0085','해양관측부이','마산항',128.631833,35.103194,"수온"                   ),
(84,'TW_0091','해양관측부이','낙산해수욕장',128.650556,38.1225,"수온,기온,기압,풍속,풍향,파고,유속,유향"),
(85,'TW_0086','해양관측부이','부산항신항',128.76175,35.043777,"수온,유속,유향"          ),
(86,'SF_0005','해양관측부이','군산항',126.50875,35.984166,"수온,유속,유향"            ),
(87,'TW_0093','해양관측부이','속초해수욕장',128.631389,38.198611,"수온,기온,기압,풍속,풍향,파고,유속,유향"),
(88,'KG_0021','해양관측부이','제주남부',126.965861,32.090416,"수온,파고,유속,유향"       ),
(89,'KG_0024','해양관측부이','대한해협',129.12125,34.919,"수온,기온,기압,풍속,풍향,파고,유속,유향"),
(90,'KG_0025','해양관측부이','남해동부',128.419027,34.222472,"수온,파고,유속,유향"       ),
(91,'KG_0028','해양관측부이','제주해협',126.5905,33.7001111111111,"유속,유향"        ),
(92,'KG_0101','해양관측부이','울릉도북동',131.552583,38.007361,"수온,기온,기압,풍속,풍향,파고,유속,유향"),
(93,'KG_0102','해양관측부이','울릉도북서',130.601194,37.742722,"수온,기온,기압,풍속,풍향,파고,유속,유향");

CREATE TABLE waterpost(
	OBS_IDX INT NOT NULL,
	BBSN_NM VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	OBS_CD INT NULL DEFAULT NULL,
	OBS_NM VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	OBS_CLS_YN VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	OBS_KND VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	SBSN_CD INT NULL DEFAULT NULL,
	MNG_ORG VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	LON FLOAT(12) NULL DEFAULT NULL,
	LAT FLOAT(12) NULL DEFAULT NULL
)
ENGINE=INNODB DEFAULT CHARSET=UTF8;

SELECT * FROM waterpost;
