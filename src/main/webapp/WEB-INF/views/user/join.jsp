<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

    <!-- Bootstrap CSS File -->
    <link href="${pageContext.request.contextPath}/assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="${pageContext.request.contextPath}/assets/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <!-- Main Stylesheet File -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">


    <style type="text/css">
		body{
			padding: 10px;
		}
        .join-div {
            margin-top: 180px;
            max-width: 1000px;
            text-align: center;
        }

        .control-group {
            margin-top: 15px;
        }

        .btn-success {
            margin-top: 20px;
        }
        table{
        	border: none;
        }
        th{
        	text-align: center;
        }
        tr{
        	border: none;
        	border-top: solid 0.7px;
        
        	padding: 5px;
        	
        }
        h3{
        	padding: 10px;
        }
        
        .join-btn{
        	width: 150px;
        	height: 50px;
        	padding: 10px;
        }
        
    </style>

</head>

<body>
    <c:import url="/WEB-INF/views/includes/navigation.jsp" />
	
    <div class="container join-div">
        <h3>회원가입</h3>
         <div class="row">
            <table border="1" summary="" class="table">
            <caption>회원 기본정보</caption>
            <tbody>
                <tr>
                    <th scope="row">아이디 </th>
                    <td><input id="member_id" name="member_id" class="inputTypeText" placeholder="아이디" value="" type="text" />
                        <span id="idMsg"></span> (영문소문자/숫자, 4~16자)</td>
                </tr>
                <tr>
                    <th scope="row">비밀번호 </th>
                    <td><input id="passwd" name="passwd" autocomplete="off" placeholder="비밀번호" maxlength="16" value="" type="password" /> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</td>
                </tr>
                <tr>
                    <th scope="row">비밀번호 확인</th>

                    <td><input id="user_passwd_confirm" name="user_passwd_confirm" placeholder="비밀번호확인" value="" type="password" /></td>
                </tr>
                <tr>
                    <th scope="row">비밀번호 확인 질문</th>
                    <td><select id="hint" name="hint">
                            <option value="hint_01">기억에 남는 추억의 장소는?</option>
                            <option value="hint_02">자신의 인생 좌우명은?</option>
                            <option value="hint_03">자신의 보물 제1호는?</option>
                            <option value="hint_04">가장 기억에 남는 선생님 성함은?</option>
                            <option value="hint_05">타인이 모르는 자신만의 신체비밀이 있다면?</option>
                            <option value="hint_06">추억하고 싶은 날짜가 있다면?</option>
                            <option value="hint_07">받았던 선물 중 기억에 남는 독특한 선물은?</option>
                            <option value="hint_08">유년시절 가장 생각나는 친구 이름은?</option>
                            <option value="hint_09">인상 깊게 읽은 책 이름은?</option>
                            <option value="hint_10">읽은 책 중에서 좋아하는 구절이 있다면?</option>
                            <option value="hint_11">자신이 두번째로 존경하는 인물은?</option>
                            <option value="hint_12">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
                            <option value="hint_13">초등학교 때 기억에 남는 짝꿍 이름은?</option>
                            <option value="hint_14">다시 태어나면 되고 싶은 것은?</option>
                            <option value="hint_15">내가 좋아하는 캐릭터는?</option>
                        </select></td>
                </tr>
                <tr>
                    <th scope="row">비밀번호 확인 답변</th>

                    <td><input id="hint_answer" name="hint_answer" class="inputTypeText" placeholder="" value="" type="text" /></td>
                </tr>
                <tr class="displaynone">
                    <th scope="row">이름</th>
                    <td><input id="name_en" name="name_en" class="ec-member-name" placeholder="" maxlength="30" value="" type="text" /></td>
                </tr>
                <tr id="companyNoRow">
                    <th scope="row">사업자번호 </th>
                    <td id="companySsn"><input id="cssn" name="cssn"  class="inputTypeText" placeholder="" maxlength="20" value="" type="text" /></td>
                </tr>
                <tr id="nation">
                    <th>국적</th>
                    <td><select id="citizenship" name="citizenship">
                            <option value="" selected="selected">선택하세요</option>
                            <option value="AF">AFGHANISTAN</option>
                            <option value="AL">ALBANIA</option>
                            <option value="DZ">ALGERIA</option>
                            <option value="AS">AMERICAN SAMOA</option>
                            <option value="AD">ANDORRA</option>
                            <option value="AO">ANGOLA</option>
                            <option value="AI">ANGUILLA</option>
                            <option value="AQ">ANTARCTICA</option>
                            <option value="AG">ANTIGUA AND BARBUDA</option>
                            <option value="AR">ARGENTINA</option>
                            <option value="AM">ARMENIA</option>
                            <option value="AW">ARUBA</option>
                            <option value="AU">AUSTRALIA</option>
                            <option value="AT">AUSTRIA</option>
                            <option value="AZ">AZERBAIJAN</option>
                            <option value="BS">BAHAMAS</option>
                            <option value="BH">BAHRAIN</option>
                            <option value="BD">BANGLADESH</option>
                            <option value="BB">BARBADOS</option>
                            <option value="BE">BELGIUM</option>
                            <option value="BZ">BELIZE</option>
                            <option value="BJ">BENIN</option>
                            <option value="BM">BERMUDA</option>
                            <option value="BT">BHUTAN</option>
                            <option value="BO">BOLIVIA</option>
                            <option value="BA">BOSNIA HERCEGOVINA</option>
                            <option value="BW">BOTSWANA</option>
                            <option value="BV">BOUVET ISLAND</option>
                            <option value="BR">BRAZIL</option>
                            <option value="IO">BRITISH INDIAN OCEAN TERRITORY</option>
                            <option value="BN">BRUNEI DARUSSALAM</option>
                            <option value="BG">BULGARIA</option>
                            <option value="BF">BURKINA FASO</option>
                            <option value="BI">BURUNDI</option>
                            <option value="BY">BELARUS</option>
                            <option value="KH">CAMBODIA</option>
                            <option value="CM">CAMEROON</option>
                            <option value="CA">CANADA</option>
                            <option value="CV">CAPE VERDE</option>
                            <option value="KY">CAYMAN ISLANDS</option>
                            <option value="CF">CENTRAL AFRICAN REPUBLIC</option>
                            <option value="TD">CHAD</option>
                            <option value="CL">CHILE</option>
                            <option value="CN">CHINA</option>
                            <option value="CX">CHRISTMAS ISLAND</option>
                            <option value="CC">COCOS (KEELING) ISLANDS</option>
                            <option value="CO">COLOMBIA</option>
                            <option value="KM">COMOROS</option>
                            <option value="CG">CONGO</option>
                            <option value="CK">COOK ISLANDS</option>
                            <option value="CR">COSTA RICA</option>
                            <option value="CI">COTE D'IVOIRE</option>
                            <option value="HR">CROATIA</option>
                            <option value="CU">CUBA</option>
                            <option value="CY">CYPRUS</option>
                            <option value="CZ">CZECH REPUBLIC</option>
                            <option value="CS">CZECHOSLOVAKIA</option>
                            <option value="DK">DENMARK</option>
                            <option value="DJ">DJIBOUTI</option>
                            <option value="DM">DOMINICA</option>
                            <option value="DO">DOMINICAN REPUBLIC</option>
                            <option value="TP">EAST TIMOR</option>
                            <option value="EC">ECUADOR</option>
                            <option value="EG">EGYPT</option>
                            <option value="SV">EL SALVADOR</option>
                            <option value="GQ">EQUATORIAL GUINEA</option>
                            <option value="EE">ESTONIA</option>
                            <option value="ET">ETHIOPIA</option>
                            <option value="FK">FALKLAND ISLANDS</option>
                            <option value="FO">FAROE ISLANDS</option>
                            <option value="FJ">FIJI</option>
                            <option value="FI">FINLAND</option>
                            <option value="FR">FRANCE</option>
                            <option value="GF">FRENCH GUIANA</option>
                            <option value="PF">FRENCH POLYNESIA</option>
                            <option value="TF">FRENCH SOUTHERN TERRITORIES</option>
                            <option value="GA">GABON</option>
                            <option value="GM">GAMBIA</option>
                            <option value="GE">GEORGIA</option>
                            <option value="DE">GERMANY</option>
                            <option value="GH">GHANA</option>
                            <option value="GI">GIBRALTAR</option>
                            <option value="GR">GREECE</option>
                            <option value="GL">GREENLAND</option>
                            <option value="GD">GRENADA</option>
                            <option value="GP">GUADELOUPE</option>
                            <option value="GU">GUAM</option>
                            <option value="GT">GUATEMALA</option>
                            <option value="GN">GUINEA</option>
                            <option value="GW">GUINEA-BISSAU</option>
                            <option value="GY">GUYANA</option>
                            <option value="HT">HAITI</option>
                            <option value="HM">HEARD AND MC DONALD ISLANDS</option>
                            <option value="HN">HONDURAS</option>
                            <option value="HK">HONG KONG</option>
                            <option value="HU">HUNGARY</option>
                            <option value="IS">ICELAND</option>
                            <option value="IN">INDIA</option>
                            <option value="ID">INDONESIA</option>
                            <option value="IR">IRAN (ISLAMIC REPUBLIC OF)</option>
                            <option value="IQ">IRAQ</option>
                            <option value="IE">IRELAND</option>
                            <option value="IL">ISRAEL</option>
                            <option value="IT">ITALY</option>
                            <option value="JM">JAMAICA</option>
                            <option value="JP">JAPAN</option>
                            <option value="JO">JORDAN</option>
                            <option value="KZ">KAZAKHSTAN</option>
                            <option value="KE">KENYA</option>
                            <option value="KI">KIRIBATI</option>
                            <option value="KP">KOREA, DEMOCRATIC PEOPLE'S REPUBLIC
                                OF</option>
                            <option value="KR">KOREA, REPUBLIC OF</option>
                            <option value="XK">KOSOVO</option>
                            <option value="KW">KUWAIT</option>
                            <option value="KG">KYRGYZSTAN</option>
                            <option value="LA">LAO PEOPLE'S DEMOCRATIC REPUBLIC</option>
                            <option value="LV">LATVIA</option>
                            <option value="LB">LEBANON</option>
                            <option value="LS">LESOTHO</option>
                            <option value="LR">LIBERIA</option>
                            <option value="LY">LIBYAN ARAB JAMAHIRIYA</option>
                            <option value="LI">LIECHTENSTEIN</option>
                            <option value="LT">LITHUANIA</option>
                            <option value="LU">LUXEMBOURG</option>
                            <option value="MO">MACAU</option>
                            <option value="MG">MADAGASCAR</option>
                            <option value="MW">MALAWI</option>
                            <option value="MY">MALAYSIA</option>
                            <option value="MV">MALDIVES</option>
                            <option value="ML">MALI</option>
                            <option value="MT">MALTA</option>
                            <option value="MH">MARSHALL ISLANDS</option>
                            <option value="MQ">MARTINIQUE</option>
                            <option value="MR">MAURITANIA</option>
                            <option value="MU">MAURITIUS</option>
                            <option value="MX">MEXICO</option>
                            <option value="FM">MICRONESIA</option>
                            <option value="MD">MOLDOVA, REPUBLIC OF</option>
                            <option value="MC">MONACO</option>
                            <option value="MN">MONGOLIA</option>
                            <option value="ME">MONTENEGRO</option>
                            <option value="MS">MONTSERRAT</option>
                            <option value="MA">MOROCCO</option>
                            <option value="MZ">MOZAMBIQUE</option>
                            <option value="MM">MYANMAR</option>
                            <option value="NA">NAMIBIA</option>
                            <option value="NR">NAURU</option>
                            <option value="NP">NEPAL</option>
                            <option value="NL">NETHERLANDS</option>
                            <option value="AN">NETHERLANDS ANTILLES</option>
                            <option value="NT">NEUTRAL ZONE</option>
                            <option value="NC">NEW CALEDONIA</option>
                            <option value="NZ">NEW ZEALAND</option>
                            <option value="NI">NICARAGUA</option>
                            <option value="NE">NIGER</option>
                            <option value="NG">NIGERIA</option>
                            <option value="NU">NIUE</option>
                            <option value="NF">NORFOLK ISLAND</option>
                            <option value="MP">NORTHERN MARIANA ISLANDS</option>
                            <option value="NO">NORWAY</option>
                            <option value="OM">OMAN</option>
                            <option value="PK">PAKISTAN</option>
                            <option value="PW">PALAU</option>
                            <option value="PA">PANAMA</option>
                            <option value="PG">PAPUA NEW GUINEA</option>
                            <option value="PY">PARAGUAY</option>
                            <option value="PE">PERU</option>
                            <option value="PH">PHILIPPINES</option>
                            <option value="PN">PITCAIRN</option>
                            <option value="PL">POLAND</option>
                            <option value="PT">PORTUGAL</option>
                            <option value="PR">PUERTO RICO</option>
                            <option value="QA">QATAR</option>
                            <option value="RE">REUNION</option>
                            <option value="RO">ROMANIA</option>
                            <option value="RU">RUSSIAN FEDERATION</option>
                            <option value="RW">RWANDA</option>
                            <option value="SH">ST. HELENA</option>
                            <option value="KN">SAINT KITTS AND NEVIS</option>
                            <option value="LC">SAINT LUCIA</option>
                            <option value="PM">ST. PIERRE AND MIQUELON</option>
                            <option value="VC">SAINT VINCENT AND THE GRENADINES</option>
                            <option value="WS">SAMOA</option>
                            <option value="SM">SAN MARINO</option>
                            <option value="ST">SAO TOME AND PRINCIPE</option>
                            <option value="SA">SAUDI ARABIA</option>
                            <option value="RS">SERBIA</option>
                            <option value="SN">SENEGAL</option>
                            <option value="SC">SEYCHELLES</option>
                            <option value="SL">SIERRA LEONE</option>
                            <option value="SG">SINGAPORE</option>
                            <option value="SK">SLOVAKIA</option>
                            <option value="SI">SLOVENIA</option>
                            <option value="SB">SOLOMON ISLANDS</option>
                            <option value="SO">SOMALIA</option>
                            <option value="ZA">SOUTH AFRICA</option>
                            <option value="ES">SPAIN</option>
                            <option value="LK">SRI LANKA</option>
                            <option value="SD">SUDAN</option>
                            <option value="SR">SURINAME</option>
                            <option value="SJ">SVALBARD AND JAN MAYEN ISLANDS</option>
                            <option value="SZ">SWAZILAND</option>
                            <option value="SE">SWEDEN</option>
                            <option value="CH">SWITZERLAND</option>
                            <option value="SY">SYRIAN ARAB REPUBLIC</option>
                            <option value="TW">TAIWAN</option>
                            <option value="TJ">TAJIKISTAN</option>
                            <option value="TZ">TANZANIA, UNITED REPUBLIC OF</option>
                            <option value="TH">THAILAND</option>
                            <option value="TL">TIMOR-LESTE</option>
                            <option value="TG">TOGO</option>
                            <option value="TK">TOKELAU</option>
                            <option value="TO">TONGA</option>
                            <option value="TT">TRINIDAD AND TOBAGO</option>
                            <option value="TN">TUNISIA</option>
                            <option value="TR">TURKEY</option>
                            <option value="TM">TURKMENISTAN</option>
                            <option value="TC">TURKS AND CAICOS ISLANDS</option>
                            <option value="TV">TUVALU</option>
                            <option value="UG">UGANDA</option>
                            <option value="UA">UKRAINE</option>
                            <option value="AE">UNITED ARAB EMIRATES</option>
                            <option value="GB">UNITED KINGDOM</option>
                            <option value="US">UNITED STATES</option>
                            <option value="UM">UNITED STATES MINOR OUTLYING ISLANDS</option>
                            <option value="UY">URUGUAY</option>
                            <option value="SU">USSR</option>
                            <option value="UZ">UZBEKISTAN</option>
                            <option value="VU">VANUATU</option>
                            <option value="VA">VATICAN CITY STATE (HOLY SEE)</option>
                            <option value="VE">VENEZUELA</option>
                            <option value="VN">VIET NAM</option>
                            <option value="VG">VIRGIN ISLANDS (BRITISH)</option>
                            <option value="VI">VIRGIN ISLANDS (U.S.)</option>
                            <option value="WF">WALLIS AND FUTUNA ISLANDS</option>
                            <option value="EH">WESTERN SAHARA</option>
                            <option value="YE">YEMEN, REPUBLIC OF</option>
                            <option value="YU">YUGOSLAVIA</option>
                            <option value="ZR">ZAIRE</option>
                            <option value="ZM">ZAMBIA</option>
                            <option value="ZW">ZIMBABWE</option>
                        </select></td>
                </tr>
                <tr>
                    <th scope="row">주소
                    </th>
                    <td><input id="postcode1" name="postcode1" class="inputTypeText" placeholder="" readonly="readonly" maxlength="14" value="" type="text" /> <a href="#none" onclick="" id="postBtn">
                            <span class="btn02" style="height: 25px; line-height: 25px; vertical-align: top; padding: 0">우편번호</span></a><br />
                        <input id="addr1" name="addr1" class="inputTypeText" placeholder="" readonly="readonly" value="" type="text" /> 기본주소<br />
                        <input id="addr2" name="addr2" class="inputTypeText" placeholder="" value="" type="text" />
                        나머지주소</td>
                </tr>
                <tr>
                    <th scope="row">일반전화</th>
                    <td><select id="phone1" name="phone[]">
                            <option value="02">02</option>
                            <option value="031">031</option>
                            <option value="032">032</option>
                            <option value="033">033</option>
                            <option value="041">041</option>
                            <option value="042">042</option>
                            <option value="043">043</option>
                            <option value="044">044</option>
                            <option value="051">051</option>
                            <option value="052">052</option>
                            <option value="053">053</option>
                            <option value="054">054</option>
                            <option value="055">055</option>
                            <option value="061">061</option>
                            <option value="062">062</option>
                            <option value="063">063</option>
                            <option value="064">064</option>
                            <option value="0502">0502</option>
                            <option value="0503">0503</option>
                            <option value="0504">0504</option>
                            <option value="0505">0505</option>
                            <option value="0506">0506</option>
                            <option value="0507">0507</option>
                            <option value="070">070</option>
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="018">018</option>
                            <option value="019">019</option>
                        </select>-<input id="phone2" name="phone[]" maxlength="4" fw-filter="isNumber&isNumber" fw-label="일반전화" fw-alone="N" fw-msg="" value="" type="text" />-<input id="phone3" name="phone[]" maxlength="4" fw-filter="isNumber&isNumber" fw-label="일반전화" fw-alone="N" fw-msg="" value="" type="text" /></td>
                </tr>
                <tr>
                    <th scope="row">휴대전화
                        <!--<img src="/design1/kr/ico_required__.png" alt="필수" />-->
                    </th>
                    <td><select id="mobile1" name="mobile[]">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="018">018</option>
                            <option value="019">019</option>
                        </select>-<input id="mobile2" name="mobile[]" maxlength="4" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text" />-<input id="mobile3" name="mobile[]" maxlength="4" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text" /></td>
                </tr>
                <tr class="">
                    <th scope="row">SMS 수신여부 </th>
                    <td><label for=is_sms0><input id="is_sms0" name="is_sms" fw-filter="isFill" fw-label="is_sms" fw-msg="" class="ec-base-chk" value="T" type="checkbox" />동의함</label>
                        <p>
                            쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.<br />(※ 선택하지 않을 시 수신
                            미동의로 가입됩니다.)
                        </p>
                    </td>
                </tr>
                <tr>
                    <th scope="row">이메일 </th>
                    <td><input id="email1" name="email1" fw-filter="isFill" fw-label="이메일" fw-alone="N" fw-msg="" class="mailId" value="" type="text" />@<input id="email2" name="email2" fw-filter="isFill" fw-label="이메일" fw-alone="N" fw-msg="" class="mailAddress" readonly="readonly" value="" type="text" /><select id="email3" fw-filter="isFill" fw-label="이메일" fw-alone="N" fw-msg="">
                            <option value="" selected="selected">- 이메일 선택 -</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="nate.com">nate.com</option>
                            <option value="hotmail.com">hotmail.com</option>
                            <option value="yahoo.com">yahoo.com</option>
                            <option value="empas.com">empas.com</option>
                            <option value="korea.com">korea.com</option>
                            <option value="dreamwiz.com">dreamwiz.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="etc">직접입력</option>
                        </select></td>
                </tr>
                <tr class="">
                    <th scope="row">이메일 수신여부 </th>
                    <td><label for=is_news_mail0><input id="is_news_mail0" name="is_news_mail" fw-filter="isFill" fw-label="is_news_mail" fw-msg="" class="ec-base-chk" value="T" type="checkbox" />동의함</label>
                        <p>
                            쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.<br />(※ 선택하지 않을 시 수신
                            미동의로 가입됩니다.)
                        </p>
                    </td>
                </tr>
            </tbody>
        </table>
        </div>
        <div class="container">
        	<button type="submit" class="btn btn-success join-btn">가입하기</button>
        	<div>
        	</div>
        </div>
    </div>
    <div class=""> </div>
</body>