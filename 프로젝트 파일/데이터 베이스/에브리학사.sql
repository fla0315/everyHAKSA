/* 학부생 */
CREATE TABLE student (
	stu_no NUMBER NOT NULL, /* 학번 */
	COL VARCHAR2(200), /* 아이디 */
	pwd VARCHAR2(200), /* 비밀번호 */
	name VARCHAR2(200), /* 성명 */
	semester VARCHAR2(200), /* 학기 */
	major NUMBER, /* 전공 */
	credits NUMBER, /* 이수학점 */
	admission_date DATE, /* 입학일 */
	graduation_date DATE, /* 졸업일 */
	indentity_state CHAR(1), /* 본인인증상태 */
	minor NUMBER, /* 부전공 */
	indentity_code VARCHAR2(200), /* 본인인증코드 */
	change_date DATE, /* 비밀번호 변경일 */
	state VARCHAR2(200), /* 학적상태번호 */
	dept_no NUMBER /* 학과번호 */
);

COMMENT ON TABLE student IS '학부생';

COMMENT ON COLUMN student.stu_no IS '학번';

COMMENT ON COLUMN student.COL IS '아이디';

COMMENT ON COLUMN student.pwd IS '비밀번호';

COMMENT ON COLUMN student.name IS '성명';

COMMENT ON COLUMN student.semester IS '학기';

COMMENT ON COLUMN student.major IS '전공';

COMMENT ON COLUMN student.credits IS '이수학점';

COMMENT ON COLUMN student.admission_date IS '입학일';

COMMENT ON COLUMN student.graduation_date IS '졸업일';

COMMENT ON COLUMN student.indentity_state IS '본인인증상태';

COMMENT ON COLUMN student.minor IS '부전공';

COMMENT ON COLUMN student.indentity_code IS '본인인증코드';

COMMENT ON COLUMN student.change_date IS '비밀번호 변경일';

COMMENT ON COLUMN student.state IS '학적상태번호';

COMMENT ON COLUMN student.dept_no IS '학과번호';

CREATE UNIQUE INDEX PK_student
	ON student (
		stu_no ASC
	);

ALTER TABLE student
	ADD
		CONSTRAINT PK_student
		PRIMARY KEY (
			stu_no
		);

/* 장학금 수여 */
CREATE TABLE award (
	no NUMBER NOT NULL, /* 장학금수여번호 */
	stu_no NUMBER, /* 학번 */
	scholarship_no NUMBER, /* 장학금번호 */
	awarding_date DATE /* 수여일 */
);

COMMENT ON TABLE award IS '장학금 수여';

COMMENT ON COLUMN award.no IS '장학금수여번호';

COMMENT ON COLUMN award.stu_no IS '학번';

COMMENT ON COLUMN award.scholarship_no IS '장학금번호';

COMMENT ON COLUMN award.awarding_date IS '수여일';

CREATE UNIQUE INDEX PK_award
	ON award (
		no ASC
	);

ALTER TABLE award
	ADD
		CONSTRAINT PK_award
		PRIMARY KEY (
			no
		);

/* 장학금 */
CREATE TABLE scholarship (
	scholarship_no NUMBER NOT NULL, /* 장학금번호 */
	scholarship_type VARCHAR2(200), /* 장학금종류 */
	scholarship NUMBER /* 장학금 금액 */
);

COMMENT ON TABLE scholarship IS '장학금';

COMMENT ON COLUMN scholarship.scholarship_no IS '장학금번호';

COMMENT ON COLUMN scholarship.scholarship_type IS '장학금종류';

COMMENT ON COLUMN scholarship.scholarship IS '장학금 금액';

CREATE UNIQUE INDEX PK_scholarship
	ON scholarship (
		scholarship_no ASC
	);

ALTER TABLE scholarship
	ADD
		CONSTRAINT PK_scholarship
		PRIMARY KEY (
			scholarship_no
		);

/* 학적상태 */
CREATE TABLE student_state (
	state VARCHAR2(200) NOT NULL, /* 학적상태번호 */
	state_name VARCHAR2(200) /* 학적상태이름 */
);

COMMENT ON TABLE student_state IS '학적상태';

COMMENT ON COLUMN student_state.state IS '학적상태번호';

COMMENT ON COLUMN student_state.state_name IS '학적상태이름';

CREATE UNIQUE INDEX PK_student_state
	ON student_state (
		state ASC
	);

ALTER TABLE student_state
	ADD
		CONSTRAINT PK_student_state
		PRIMARY KEY (
			state
		);

/* 증명서발급 */
CREATE TABLE certification (
	no VARCHAR2(200) NOT NULL, /* 발급번호 */
	stu_no NUMBER, /* 학번 */
	qty NUMBER, /* 매수 */
	reg_date DATE, /* 발급일 */
	is_print CHAR(1), /* 출력여부 */
	certification_code <지정 되지 않음> /* 증명서코드 */
);

COMMENT ON TABLE certification IS '증명서발급';

COMMENT ON COLUMN certification.no IS '발급번호';

COMMENT ON COLUMN certification.stu_no IS '학번';

COMMENT ON COLUMN certification.qty IS '매수';

COMMENT ON COLUMN certification.reg_date IS '발급일';

COMMENT ON COLUMN certification.is_print IS '출력여부';

COMMENT ON COLUMN certification.certification_code IS '증명서코드';

CREATE UNIQUE INDEX PK_certification
	ON certification (
		no ASC
	);

ALTER TABLE certification
	ADD
		CONSTRAINT PK_certification
		PRIMARY KEY (
			no
		);

/* 등록금 */
CREATE TABLE tuition (
	no NUMBER NOT NULL, /* 등록금번호 */
	semester NUMBER, /* 학기 */
	tuition NUMBER, /* 금액 */
	deposit_state CHAR(1), /* 납부여부 */
	deposit_date DATE, /* 납부일 */
	stu_no NUMBER /* 학번 */
);

COMMENT ON TABLE tuition IS '등록금';

COMMENT ON COLUMN tuition.no IS '등록금번호';

COMMENT ON COLUMN tuition.semester IS '학기';

COMMENT ON COLUMN tuition.tuition IS '금액';

COMMENT ON COLUMN tuition.deposit_state IS '납부여부';

COMMENT ON COLUMN tuition.deposit_date IS '납부일';

COMMENT ON COLUMN tuition.stu_no IS '학번';

CREATE UNIQUE INDEX PK_tuition
	ON tuition (
		no ASC
	);

ALTER TABLE tuition
	ADD
		CONSTRAINT PK_tuition
		PRIMARY KEY (
			no
		);

/* 과제 */
CREATE TABLE assignment (
	assign_no NUMBER, /* 과제번호 */
	stu_no NUMBER, /* 학번 */
	file_name VARCHAR2(500), /* 파일이름 */
	file_size NUMBER, /* 파일사이즈 */
	original_file_name VARCHAR2(500), /* 원본파일이름 */
	apply_date DATE /* 제출일 */
);

COMMENT ON TABLE assignment IS '과제';

COMMENT ON COLUMN assignment.assign_no IS '과제번호';

COMMENT ON COLUMN assignment.stu_no IS '학번';

COMMENT ON COLUMN assignment.file_name IS '파일이름';

COMMENT ON COLUMN assignment.file_size IS '파일사이즈';

COMMENT ON COLUMN assignment.original_file_name IS '원본파일이름';

COMMENT ON COLUMN assignment.apply_date IS '제출일';

/* 학과 */
CREATE TABLE department (
	dept_no NUMBER NOT NULL, /* 학과번호 */
	faculty_no NUMBER, /* 학부번호 */
	dept_name VARCHAR2(200) NOT NULL, /* 학과명 */
	tel VARCHAR2(200), /* 사무실전화번호 */
	building_code VARCHAR2(200), /* 건물코드 */
	total_credit NUMBER /* 졸업이수학점 */
);

COMMENT ON TABLE department IS '학과';

COMMENT ON COLUMN department.dept_no IS '학과번호';

COMMENT ON COLUMN department.faculty_no IS '학부번호';

COMMENT ON COLUMN department.dept_name IS '학과명';

COMMENT ON COLUMN department.tel IS '사무실전화번호';

COMMENT ON COLUMN department.building_code IS '건물코드';

COMMENT ON COLUMN department.total_credit IS '졸업이수학점';

CREATE UNIQUE INDEX PK_department
	ON department (
		dept_no ASC
	);

ALTER TABLE department
	ADD
		CONSTRAINT PK_department
		PRIMARY KEY (
			dept_no
		);

/* 학부 */
CREATE TABLE faculty (
	faculty_no NUMBER NOT NULL, /* 학부번호 */
	faculty_name VARCHAR2(200) NOT NULL /* 학부이름 */
);

COMMENT ON TABLE faculty IS '학부';

COMMENT ON COLUMN faculty.faculty_no IS '학부번호';

COMMENT ON COLUMN faculty.faculty_name IS '학부이름';

CREATE UNIQUE INDEX PK_faculty
	ON faculty (
		faculty_no ASC
	);

ALTER TABLE faculty
	ADD
		CONSTRAINT PK_faculty
		PRIMARY KEY (
			faculty_no
		);

/* 교수 */
CREATE TABLE professor (
	prof_no NUMBER NOT NULL, /* 교수번호 */
	position_no2 NUMBER, /* 직책번호 */
	dept_no NUMBER, /* 학과번호 */
	prof_name VARCHAR2(200), /* 교수명 */
	prof_id VARCHAR2(200), /* 아이디 */
	prof_pwd VARCHAR2(200), /* 비밀번호 */
	prof_email VARCHAR2(200), /* 이메일 */
	prof_start_date DATE, /* 임용일 */
	prof_end_date DATE, /* 퇴직일 */
	identity_state CHAR(1), /* 본인인증상태 */
	identity_code VARCHAR2(200), /* 본인인증코드 */
	change_date DATE /* 비밀번호 변경일 */
);

COMMENT ON TABLE professor IS '교수';

COMMENT ON COLUMN professor.prof_no IS '교수번호';

COMMENT ON COLUMN professor.position_no2 IS '직책번호';

COMMENT ON COLUMN professor.dept_no IS '학과번호';

COMMENT ON COLUMN professor.prof_name IS '교수명';

COMMENT ON COLUMN professor.prof_id IS '아이디';

COMMENT ON COLUMN professor.prof_pwd IS '비밀번호';

COMMENT ON COLUMN professor.prof_email IS '이메일';

COMMENT ON COLUMN professor.prof_start_date IS '임용일';

COMMENT ON COLUMN professor.prof_end_date IS '퇴직일';

COMMENT ON COLUMN professor.identity_state IS '본인인증상태';

COMMENT ON COLUMN professor.identity_code IS '본인인증코드';

COMMENT ON COLUMN professor.change_date IS '비밀번호 변경일';

CREATE UNIQUE INDEX PK_professor
	ON professor (
		prof_no ASC
	);

ALTER TABLE professor
	ADD
		CONSTRAINT PK_professor
		PRIMARY KEY (
			prof_no
		);

/* 강의평가 */
CREATE TABLE TABLE11 (
	COL VARCHAR2(200), /* 새 컬럼 */
	COL2 VARCHAR2(200), /* 새 컬럼2 */
	COL3 VARCHAR2(200), /* 새 컬럼3 */
	COL4 NUMBER, /* 새 컬럼4 */
	COL5 NUMBER, /* 새 컬럼5 */
	COL6 NUMBER, /* 새 컬럼6 */
	COL7 NUMBER, /* 새 컬럼7 */
	COL8 NUMBER, /* 새 컬럼8 */
	COL9 NUMBER, /* 새 컬럼9 */
	COL10 NUMBER, /* 새 컬럼10 */
	COL11 NUMBER, /* 새 컬럼11 */
	COL12 CLOB /* 새 컬럼12 */
);

COMMENT ON TABLE TABLE11 IS '강의평가';

COMMENT ON COLUMN TABLE11.COL IS '새 컬럼';

COMMENT ON COLUMN TABLE11.COL2 IS '새 컬럼2';

COMMENT ON COLUMN TABLE11.COL3 IS '새 컬럼3';

COMMENT ON COLUMN TABLE11.COL4 IS '새 컬럼4';

COMMENT ON COLUMN TABLE11.COL5 IS '새 컬럼5';

COMMENT ON COLUMN TABLE11.COL6 IS '새 컬럼6';

COMMENT ON COLUMN TABLE11.COL7 IS '새 컬럼7';

COMMENT ON COLUMN TABLE11.COL8 IS '새 컬럼8';

COMMENT ON COLUMN TABLE11.COL9 IS '새 컬럼9';

COMMENT ON COLUMN TABLE11.COL10 IS '새 컬럼10';

COMMENT ON COLUMN TABLE11.COL11 IS '새 컬럼11';

COMMENT ON COLUMN TABLE11.COL12 IS '새 컬럼12';

/* 강의평가 */
CREATE TABLE subj_eval (
	open_sub_code VARCHAR2(200) NOT NULL, /* 개설교과과목코드 */
	stu_no NUMBER NOT NULL, /* 학번 */
	classification VARCHAR2(200) NOT NULL, /* 수강구분 */
	q1 NUMBER, /* 문항1 */
	q2 NUMBER, /* 문항2 */
	q3 NUMBER, /* 문항3 */
	q4 NUMBER, /* 문항4 */
	q5 NUMBER, /* 문항5 */
	content CLOB /* 평가내용 */
);

COMMENT ON TABLE subj_eval IS '강의평가';

COMMENT ON COLUMN subj_eval.open_sub_code IS '개설교과과목코드';

COMMENT ON COLUMN subj_eval.stu_no IS '학번';

COMMENT ON COLUMN subj_eval.classification IS '수강구분';

COMMENT ON COLUMN subj_eval.q1 IS '문항1';

COMMENT ON COLUMN subj_eval.q2 IS '문항2';

COMMENT ON COLUMN subj_eval.q3 IS '문항3';

COMMENT ON COLUMN subj_eval.q4 IS '문항4';

COMMENT ON COLUMN subj_eval.q5 IS '문항5';

COMMENT ON COLUMN subj_eval.content IS '평가내용';

CREATE UNIQUE INDEX PK_subj_eval
	ON subj_eval (
		open_sub_code ASC,
		stu_no ASC,
		classification ASC
	);

ALTER TABLE subj_eval
	ADD
		CONSTRAINT PK_subj_eval
		PRIMARY KEY (
			open_sub_code,
			stu_no,
			classification
		);

/* 수강신청 */
CREATE TABLE registration (
	open_sub_code VARCHAR2(200) NOT NULL, /* 개설교과과목코드 */
	stu_no NUMBER NOT NULL, /* 학번 */
	classification VARCHAR2(200) NOT NULL, /* 수강구분 */
	reg_date DATE, /* 수강일자 */
	score NUMBER, /* 성적 */
	lecture_eval_flag CHAR(1) /* 강의평가완료여부 */
);

COMMENT ON TABLE registration IS '수강신청';

COMMENT ON COLUMN registration.open_sub_code IS '개설교과과목코드';

COMMENT ON COLUMN registration.stu_no IS '학번';

COMMENT ON COLUMN registration.classification IS '수강구분';

COMMENT ON COLUMN registration.reg_date IS '수강일자';

COMMENT ON COLUMN registration.score IS '성적';

COMMENT ON COLUMN registration.lecture_eval_flag IS '강의평가완료여부';

CREATE UNIQUE INDEX PK_registration
	ON registration (
		open_sub_code ASC,
		stu_no ASC,
		classification ASC
	);

ALTER TABLE registration
	ADD
		CONSTRAINT PK_registration
		PRIMARY KEY (
			open_sub_code,
			stu_no,
			classification
		);

/* 성적 */
CREATE TABLE evaluation (
	sub_code VARCHAR2(200), /* 개설교과과목코드 */
	stu_no NUMBER, /* 학번 */
	classification VARCHAR2(200), /* 수강구분 */
	midterm NUMBER, /* 중간고사 */
	finals NUMBER, /* 기말고사 */
	assignmemt NUMBER, /* 과제 */
	attendance NUMBER, /* 출석 */
	etc NUMBER, /* 기타 */
	total_grade NUMBER, /* 총점 */
	reg_date DATE, /* 입력날짜 */
	edit_date DATE /* 수정날짜 */
);

COMMENT ON TABLE evaluation IS '성적';

COMMENT ON COLUMN evaluation.sub_code IS '개설교과과목코드';

COMMENT ON COLUMN evaluation.stu_no IS '학번';

COMMENT ON COLUMN evaluation.classification IS '수강구분';

COMMENT ON COLUMN evaluation.midterm IS '중간고사';

COMMENT ON COLUMN evaluation.finals IS '기말고사';

COMMENT ON COLUMN evaluation.assignmemt IS '과제';

COMMENT ON COLUMN evaluation.attendance IS '출석';

COMMENT ON COLUMN evaluation.etc IS '기타';

COMMENT ON COLUMN evaluation.total_grade IS '총점';

COMMENT ON COLUMN evaluation.reg_date IS '입력날짜';

COMMENT ON COLUMN evaluation.edit_date IS '수정날짜';

/* 개설교과과정 */
CREATE TABLE open_subj (
	open_sub_code VARCHAR2(200) NOT NULL, /* 개설교과과목코드 */
	open_date DATE, /* 개설일자 */
	close_date DATE, /* 폐지일자 */
	prof_no NUMBER, /* 교수번호 */
	subj_code VARCHAR2(200) /* 과목코드 */
);

COMMENT ON TABLE open_subj IS '개설교과과정';

COMMENT ON COLUMN open_subj.open_sub_code IS '개설교과과목코드';

COMMENT ON COLUMN open_subj.open_date IS '개설일자';

COMMENT ON COLUMN open_subj.close_date IS '폐지일자';

COMMENT ON COLUMN open_subj.prof_no IS '교수번호';

COMMENT ON COLUMN open_subj.subj_code IS '과목코드';

CREATE UNIQUE INDEX PK_open_subj
	ON open_subj (
		open_sub_code ASC
	);

ALTER TABLE open_subj
	ADD
		CONSTRAINT PK_open_subj
		PRIMARY KEY (
			open_sub_code
		);

/* 과제등록 */
CREATE TABLE distribute_assign (
	assign_no NUMBER NOT NULL, /* 과제번호 */
	open_sub_code VARCHAR2(200), /* 개설교과과목코드 */
	assign_name VARCHAR2(200), /* 과제명 */
	reg_date DATE /* 등록일 */
);

COMMENT ON TABLE distribute_assign IS '과제등록';

COMMENT ON COLUMN distribute_assign.assign_no IS '과제번호';

COMMENT ON COLUMN distribute_assign.open_sub_code IS '개설교과과목코드';

COMMENT ON COLUMN distribute_assign.assign_name IS '과제명';

COMMENT ON COLUMN distribute_assign.reg_date IS '등록일';

CREATE UNIQUE INDEX PK_distribute_assign
	ON distribute_assign (
		assign_no ASC
	);

ALTER TABLE distribute_assign
	ADD
		CONSTRAINT PK_distribute_assign
		PRIMARY KEY (
			assign_no
		);

/* 강의계획 */
CREATE TABLE syllabus (
	open_sub_code VARCHAR2(200), /* 개설교과과목코드 */
	syllabus VARCHAR2(200), /* 강의계획서 */
	theory_time NUMBER, /* 이론시간 */
	training_time NUMBER /* 실습시간 */
);

COMMENT ON TABLE syllabus IS '강의계획';

COMMENT ON COLUMN syllabus.open_sub_code IS '개설교과과목코드';

COMMENT ON COLUMN syllabus.syllabus IS '강의계획서';

COMMENT ON COLUMN syllabus.theory_time IS '이론시간';

COMMENT ON COLUMN syllabus.training_time IS '실습시간';

/* 요약시간표 */
CREATE TABLE regi_timetable (
	open_sub_code VARCHAR2(200), /* 개설교과과목코드 */
	short_name VARCHAR2(200) /* 요약명 */
);

COMMENT ON TABLE regi_timetable IS '요약시간표';

COMMENT ON COLUMN regi_timetable.open_sub_code IS '개설교과과목코드';

COMMENT ON COLUMN regi_timetable.short_name IS '요약명';

/* 교수직책 */
CREATE TABLE prof_position (
	position_no NUMBER NOT NULL, /* 직책번호 */
	position_name VARCHAR2(200) /* 직책명 */
);

COMMENT ON TABLE prof_position IS '교수직책';

COMMENT ON COLUMN prof_position.position_no IS '직책번호';

COMMENT ON COLUMN prof_position.position_name IS '직책명';

CREATE UNIQUE INDEX PK_prof_position
	ON prof_position (
		position_no ASC
	);

ALTER TABLE prof_position
	ADD
		CONSTRAINT PK_prof_position
		PRIMARY KEY (
			position_no
		);

/* 건물 */
CREATE TABLE building (
	building_code VARCHAR2(200) NOT NULL, /* 건물코드 */
	building_name VARCHAR2(200), /* 건물명 */
	detail VARCHAR2(200) /* 상세위치 */
);

COMMENT ON TABLE building IS '건물';

COMMENT ON COLUMN building.building_code IS '건물코드';

COMMENT ON COLUMN building.building_name IS '건물명';

COMMENT ON COLUMN building.detail IS '상세위치';

CREATE UNIQUE INDEX PK_building
	ON building (
		building_code ASC
	);

ALTER TABLE building
	ADD
		CONSTRAINT PK_building
		PRIMARY KEY (
			building_code
		);

/* 과목 */
CREATE TABLE subject (
	subj_code VARCHAR2(200) NOT NULL, /* 과목코드 */
	prof_no NUMBER, /* 교수번호 */
	type_code VARCHAR2(200), /* 구분코드 */
	subj_name VARCHAR2(200), /* 과목명 */
	explanation CLOB, /* 과목설명 */
	credit NUMBER, /* 이수학점 */
	personnel NUMBER /* 인원 */
);

COMMENT ON TABLE subject IS '과목';

COMMENT ON COLUMN subject.subj_code IS '과목코드';

COMMENT ON COLUMN subject.prof_no IS '교수번호';

COMMENT ON COLUMN subject.type_code IS '구분코드';

COMMENT ON COLUMN subject.subj_name IS '과목명';

COMMENT ON COLUMN subject.explanation IS '과목설명';

COMMENT ON COLUMN subject.credit IS '이수학점';

COMMENT ON COLUMN subject.personnel IS '인원';

CREATE UNIQUE INDEX PK_subject
	ON subject (
		subj_code ASC
	);

ALTER TABLE subject
	ADD
		CONSTRAINT PK_subject
		PRIMARY KEY (
			subj_code
		);

/* 이수구분 */
CREATE TABLE subj_type (
	type_code VARCHAR2(200) NOT NULL, /* 구분코드 */
	type VARCHAR2(200) /* 이수구분 */
);

COMMENT ON TABLE subj_type IS '이수구분';

COMMENT ON COLUMN subj_type.type_code IS '구분코드';

COMMENT ON COLUMN subj_type.type IS '이수구분';

CREATE UNIQUE INDEX PK_subj_type
	ON subj_type (
		type_code ASC
	);

ALTER TABLE subj_type
	ADD
		CONSTRAINT PK_subj_type
		PRIMARY KEY (
			type_code
		);

/* 하단정보 */
CREATE TABLE footer (
	company_name VARCHAR2(200), /* 회사명 */
	tel VARCHAR2(200), /* 전화번호 */
	zipcode VARCHAR2(200), /* 우편번호 */
	address1 VARCHAR2(200), /* 주소1 */
	address2 VARCHAR2(200), /* 주소2 */
	policy CLOB, /* 개인정보처리방침 */
	start_year VARCHAR2(200) /* 설립연도 */
);

COMMENT ON TABLE footer IS '하단정보';

COMMENT ON COLUMN footer.company_name IS '회사명';

COMMENT ON COLUMN footer.tel IS '전화번호';

COMMENT ON COLUMN footer.zipcode IS '우편번호';

COMMENT ON COLUMN footer.address1 IS '주소1';

COMMENT ON COLUMN footer.address2 IS '주소2';

COMMENT ON COLUMN footer.policy IS '개인정보처리방침';

COMMENT ON COLUMN footer.start_year IS '설립연도';

/* 은행 */
CREATE TABLE bank (
	bank_code VARCHAR2(200) NOT NULL, /* 은행코드 */
	bank_name VARCHAR2(200) /* 은행명 */
);

COMMENT ON TABLE bank IS '은행';

COMMENT ON COLUMN bank.bank_code IS '은행코드';

COMMENT ON COLUMN bank.bank_name IS '은행명';

CREATE UNIQUE INDEX PK_bank
	ON bank (
		bank_code ASC
	);

ALTER TABLE bank
	ADD
		CONSTRAINT PK_bank
		PRIMARY KEY (
			bank_code
		);

/* 계좌정보 */
CREATE TABLE account_info (
	bank_code VARCHAR2(200), /* 은행코드 */
	official_no VARCHAR2(200), /* 관계자번호 */
	account_no VARCHAR2(200), /* 계좌번호 */
	account_name VARCHAR2(200) /* 예금주명 */
);

COMMENT ON TABLE account_info IS '계좌정보';

COMMENT ON COLUMN account_info.bank_code IS '은행코드';

COMMENT ON COLUMN account_info.official_no IS '관계자번호';

COMMENT ON COLUMN account_info.account_no IS '계좌번호';

COMMENT ON COLUMN account_info.account_name IS '예금주명';

/* 관계자 상세정보 */
CREATE TABLE official_info (
	official_no NUMBER NOT NULL, /* 관계자번호 */
	hp1 VARCHAR2(200), /* 핸드폰1 */
	hp2 VARCHAR2(200), /* 핸드폰2 */
	email1 VARCHAR2(200), /* 이메일1 */
	email2 VARCHAR2(200), /* 이메일2 */
	zipcode VARCHAR2(200), /* 우편번호 */
	address VARCHAR2(200), /* 주소 */
	addr_detail VARCHAR2(200), /* 주소상세 */
	jumin VARCHAR2(200), /* 주민번호 */
	gender VARCHAR2(200), /* 성별 */
	image_url VARCHAR2(200) /* 사진 */
);

COMMENT ON TABLE official_info IS '관계자 상세정보';

COMMENT ON COLUMN official_info.official_no IS '관계자번호';

COMMENT ON COLUMN official_info.hp1 IS '핸드폰1';

COMMENT ON COLUMN official_info.hp2 IS '핸드폰2';

COMMENT ON COLUMN official_info.email1 IS '이메일1';

COMMENT ON COLUMN official_info.email2 IS '이메일2';

COMMENT ON COLUMN official_info.zipcode IS '우편번호';

COMMENT ON COLUMN official_info.address IS '주소';

COMMENT ON COLUMN official_info.addr_detail IS '주소상세';

COMMENT ON COLUMN official_info.jumin IS '주민번호';

COMMENT ON COLUMN official_info.gender IS '성별';

COMMENT ON COLUMN official_info.image_url IS '사진';

CREATE UNIQUE INDEX PK_official_info
	ON official_info (
		official_no ASC
	);

ALTER TABLE official_info
	ADD
		CONSTRAINT PK_official_info
		PRIMARY KEY (
			official_no
		);

/* 쪽지 발신함 */
CREATE TABLE outbox (
	msg_no NUMBER NOT NULL, /* 쪽지번호 */
	official_no VARCHAR2(200), /* 발신인 번호 */
	contents CLOB, /* 내용 */
	send_date DATE, /* 발송일 */
	official_name VARCHAR2(200), /* 발신인명 */
	del_flag CHAR(1) /* 삭제여부 */
);

COMMENT ON TABLE outbox IS '쪽지 발신함';

COMMENT ON COLUMN outbox.msg_no IS '쪽지번호';

COMMENT ON COLUMN outbox.official_no IS '발신인 번호';

COMMENT ON COLUMN outbox.contents IS '내용';

COMMENT ON COLUMN outbox.send_date IS '발송일';

COMMENT ON COLUMN outbox.official_name IS '발신인명';

COMMENT ON COLUMN outbox.del_flag IS '삭제여부';

CREATE UNIQUE INDEX PK_outbox
	ON outbox (
		msg_no ASC
	);

ALTER TABLE outbox
	ADD
		CONSTRAINT PK_outbox
		PRIMARY KEY (
			msg_no
		);

/* 쪽지 수신함 */
CREATE TABLE inbox (
	no NUMBER NOT NULL, /* 번호 */
	official_no VARCHAR2(200), /* 수신인번호 */
	read_date DATE, /* 읽은 날짜 */
	keep_flag CHAR(1), /* 보관여부 */
	msg_no NUMBER /* 쪽지번호 */
);

COMMENT ON TABLE inbox IS '쪽지 수신함';

COMMENT ON COLUMN inbox.no IS '번호';

COMMENT ON COLUMN inbox.official_no IS '수신인번호';

COMMENT ON COLUMN inbox.read_date IS '읽은 날짜';

COMMENT ON COLUMN inbox.keep_flag IS '보관여부';

COMMENT ON COLUMN inbox.msg_no IS '쪽지번호';

CREATE UNIQUE INDEX PK_inbox
	ON inbox (
		no ASC
	);

ALTER TABLE inbox
	ADD
		CONSTRAINT PK_inbox
		PRIMARY KEY (
			no
		);

/* 강의실 */
CREATE TABLE classroom (
	classroom_code VARCHAR2(200) NOT NULL, /* 강의실코드 */
	classroom_name VARCHAR2(200), /* 강의실명 */
	building_code VARCHAR2(200) /* 건물코드 */
);

COMMENT ON TABLE classroom IS '강의실';

COMMENT ON COLUMN classroom.classroom_code IS '강의실코드';

COMMENT ON COLUMN classroom.classroom_name IS '강의실명';

COMMENT ON COLUMN classroom.building_code IS '건물코드';

CREATE UNIQUE INDEX PK_classroom
	ON classroom (
		classroom_code ASC
	);

ALTER TABLE classroom
	ADD
		CONSTRAINT PK_classroom
		PRIMARY KEY (
			classroom_code
		);

/* 강의시간표 */
CREATE TABLE subj_time (
	lecture_time_no NUMBER NOT NULL, /* 강의시간표코드 */
	open_sub_code VARCHAR2(200), /* 개설교과과목코드 */
	classroom_code VARCHAR2(200), /* 강의실코드 */
	timetable_code VARCHAR2(200) /* 시간기준코드 */
);

COMMENT ON TABLE subj_time IS '강의시간표';

COMMENT ON COLUMN subj_time.lecture_time_no IS '강의시간표코드';

COMMENT ON COLUMN subj_time.open_sub_code IS '개설교과과목코드';

COMMENT ON COLUMN subj_time.classroom_code IS '강의실코드';

COMMENT ON COLUMN subj_time.timetable_code IS '시간기준코드';

CREATE UNIQUE INDEX PK_subj_time
	ON subj_time (
		lecture_time_no ASC
	);

ALTER TABLE subj_time
	ADD
		CONSTRAINT PK_subj_time
		PRIMARY KEY (
			lecture_time_no
		);

/* 즐겨찾기 */
CREATE TABLE bookmark (
	no NUMBER NOT NULL, /* 번호 */
	official_no VARCHAR2(200), /* 관계자번호 */
	name VARCHAR2(200), /* 북마크명 */
	url VARCHAR2(200) /* 북마크주소 */
);

COMMENT ON TABLE bookmark IS '즐겨찾기';

COMMENT ON COLUMN bookmark.no IS '번호';

COMMENT ON COLUMN bookmark.official_no IS '관계자번호';

COMMENT ON COLUMN bookmark.name IS '북마크명';

COMMENT ON COLUMN bookmark.url IS '북마크주소';

CREATE UNIQUE INDEX PK_bookmark
	ON bookmark (
		no ASC
	);

ALTER TABLE bookmark
	ADD
		CONSTRAINT PK_bookmark
		PRIMARY KEY (
			no
		);

/* 기본시간표 */
CREATE TABLE timetable (
	timetable_code VARCHAR2(200) NOT NULL, /* 시간기준코드 */
	timetable_name VARCHAR2(200), /* 표시교시명 */
	day VARCHAR2(200), /* 요일 */
	period NUMBER, /* 교시 */
	short_name VARCHAR2(200) /* 요약교시명 */
);

COMMENT ON TABLE timetable IS '기본시간표';

COMMENT ON COLUMN timetable.timetable_code IS '시간기준코드';

COMMENT ON COLUMN timetable.timetable_name IS '표시교시명';

COMMENT ON COLUMN timetable.day IS '요일';

COMMENT ON COLUMN timetable.period IS '교시';

COMMENT ON COLUMN timetable.short_name IS '요약교시명';

CREATE UNIQUE INDEX PK_timetable
	ON timetable (
		timetable_code ASC
	);

ALTER TABLE timetable
	ADD
		CONSTRAINT PK_timetable
		PRIMARY KEY (
			timetable_code
		);

/* 게시판 */
CREATE TABLE board (
	bd_code NUMBER NOT NULL, /* 게시판코드 */
	auth_code NUMBER, /* 권한코드 */
	category_code NUMBER, /* 카테고리 코드 */
	bd_name VARCHAR2(200), /* 게시판 이름 */
	reg_date DATE, /* 게시판 등록일 */
	edit_date DATE, /* 게시판 수정일 */
	bd_order NUMBER, /* 게시판 순서 */
	usage CHAR(1), /* 사용여부 */
	is_reply CHAR(1), /* 댓글여부 */
	is_comment CHAR(1), /* 답글여부 */
	is_private CHAR(1), /* 비공개여부 */
	is_upload CHAR(1), /* 업로드 가능 여부 */
	max_upfile NUMBER, /* 업로드 가능 개수 */
	max_filesize NUMBER /* 업로드 가능 파일 사이즈 */
);

COMMENT ON TABLE board IS '게시판';

COMMENT ON COLUMN board.bd_code IS '게시판코드';

COMMENT ON COLUMN board.auth_code IS '권한코드';

COMMENT ON COLUMN board.category_code IS '카테고리 코드';

COMMENT ON COLUMN board.bd_name IS '게시판 이름';

COMMENT ON COLUMN board.reg_date IS '게시판 등록일';

COMMENT ON COLUMN board.edit_date IS '게시판 수정일';

COMMENT ON COLUMN board.bd_order IS '게시판 순서';

COMMENT ON COLUMN board.usage IS '사용여부';

COMMENT ON COLUMN board.is_reply IS '댓글여부';

COMMENT ON COLUMN board.is_comment IS '답글여부';

COMMENT ON COLUMN board.is_private IS '비공개여부';

COMMENT ON COLUMN board.is_upload IS '업로드 가능 여부';

COMMENT ON COLUMN board.max_upfile IS '업로드 가능 개수';

COMMENT ON COLUMN board.max_filesize IS '업로드 가능 파일 사이즈';

CREATE UNIQUE INDEX PK_board
	ON board (
		bd_code ASC
	);

ALTER TABLE board
	ADD
		CONSTRAINT PK_board
		PRIMARY KEY (
			bd_code
		);

/* 카테고리 */
CREATE TABLE category (
	category_code NUMBER NOT NULL, /* 카테고리 코드 */
	category_name VARCHAR2(200), /* 카테고리 명 */
	usage CHAR(1), /* 사용여부 */
	reg_date DATE /* 등록일 */
);

COMMENT ON TABLE category IS '카테고리';

COMMENT ON COLUMN category.category_code IS '카테고리 코드';

COMMENT ON COLUMN category.category_name IS '카테고리 명';

COMMENT ON COLUMN category.usage IS '사용여부';

COMMENT ON COLUMN category.reg_date IS '등록일';

CREATE UNIQUE INDEX PK_category
	ON category (
		category_code ASC
	);

ALTER TABLE category
	ADD
		CONSTRAINT PK_category
		PRIMARY KEY (
			category_code
		);

/* 권한 */
CREATE TABLE authority (
	auth_code NUMBER NOT NULL, /* 권한코드 */
	auth_name VARCHAR2(200), /* 권한명 */
	auth_desc VARCHAR2(200), /* 설명 */
	reg_date DATE /* 등록일 */
);

COMMENT ON TABLE authority IS '권한';

COMMENT ON COLUMN authority.auth_code IS '권한코드';

COMMENT ON COLUMN authority.auth_name IS '권한명';

COMMENT ON COLUMN authority.auth_desc IS '설명';

COMMENT ON COLUMN authority.reg_date IS '등록일';

CREATE UNIQUE INDEX PK_authority
	ON authority (
		auth_code ASC
	);

ALTER TABLE authority
	ADD
		CONSTRAINT PK_authority
		PRIMARY KEY (
			auth_code
		);

/* 임직원 */
CREATE TABLE employee (
	emp_no NUMBER NOT NULL, /* 임직원번호 */
	emp_id VARCHAR2(200), /* 임직원아이디 */
	emp_name VARCHAR2(200), /* 임직원명 */
	pwd VARCHAR2(200), /* 비밀번호 */
	start_date DATE, /* 입사일 */
	resignation_date DATE, /* 퇴사일 */
	identity_state CHAR(1), /* 본인인증상태 */
	dep_code NUMBER, /* 부서코드 */
	position_code NUMBER, /* 직책코드 */
	auth_code NUMBER /* 권한코드 */
);

COMMENT ON TABLE employee IS '임직원';

COMMENT ON COLUMN employee.emp_no IS '임직원번호';

COMMENT ON COLUMN employee.emp_id IS '임직원아이디';

COMMENT ON COLUMN employee.emp_name IS '임직원명';

COMMENT ON COLUMN employee.pwd IS '비밀번호';

COMMENT ON COLUMN employee.start_date IS '입사일';

COMMENT ON COLUMN employee.resignation_date IS '퇴사일';

COMMENT ON COLUMN employee.identity_state IS '본인인증상태';

COMMENT ON COLUMN employee.dep_code IS '부서코드';

COMMENT ON COLUMN employee.position_code IS '직책코드';

COMMENT ON COLUMN employee.auth_code IS '권한코드';

CREATE UNIQUE INDEX PK_employee
	ON employee (
		emp_no ASC
	);

ALTER TABLE employee
	ADD
		CONSTRAINT PK_employee
		PRIMARY KEY (
			emp_no
		);

/* 부서 */
CREATE TABLE emp_depart (
	dep_code NUMBER NOT NULL, /* 부서코드 */
	dep_name VARCHAR2(200) /* 부서명 */
);

COMMENT ON TABLE emp_depart IS '부서';

COMMENT ON COLUMN emp_depart.dep_code IS '부서코드';

COMMENT ON COLUMN emp_depart.dep_name IS '부서명';

CREATE UNIQUE INDEX PK_emp_depart
	ON emp_depart (
		dep_code ASC
	);

ALTER TABLE emp_depart
	ADD
		CONSTRAINT PK_emp_depart
		PRIMARY KEY (
			dep_code
		);

/* 임직원 직책 */
CREATE TABLE emp_position (
	position_code NUMBER NOT NULL, /* 직책코드 */
	position_name VARCHAR2(200) /* 직책명 */
);

COMMENT ON TABLE emp_position IS '임직원 직책';

COMMENT ON COLUMN emp_position.position_code IS '직책코드';

COMMENT ON COLUMN emp_position.position_name IS '직책명';

CREATE UNIQUE INDEX PK_emp_position
	ON emp_position (
		position_code ASC
	);

ALTER TABLE emp_position
	ADD
		CONSTRAINT PK_emp_position
		PRIMARY KEY (
			position_code
		);

/* 게시글 */
CREATE TABLE post (
	post_no NUMBER NOT NULL, /* 게시글번호 */
	bd_code NUMBER, /* 게시판코드 */
	writer_code NUMBER, /* 작성자코드 */
	title VARCHAR2(200), /* 제목 */
	contents CLOB, /* 내용 */
	reg_date DATE, /* 등록일 */
	read_count NUMBER, /* 조회수 */
	del_flag CHAR(1), /* 삭제여부 */
	group_no NUMBER, /* 원본글번호 */
	sort_no NUMBER, /* 정렬번호 */
	step NUMBER, /* 차수 */
	edit_date DATE, /* 수정일 */
	is_private CHAR(1) /* 비밀글여부 */
);

COMMENT ON TABLE post IS '게시글';

COMMENT ON COLUMN post.post_no IS '게시글번호';

COMMENT ON COLUMN post.bd_code IS '게시판코드';

COMMENT ON COLUMN post.writer_code IS '작성자코드';

COMMENT ON COLUMN post.title IS '제목';

COMMENT ON COLUMN post.contents IS '내용';

COMMENT ON COLUMN post.reg_date IS '등록일';

COMMENT ON COLUMN post.read_count IS '조회수';

COMMENT ON COLUMN post.del_flag IS '삭제여부';

COMMENT ON COLUMN post.group_no IS '원본글번호';

COMMENT ON COLUMN post.sort_no IS '정렬번호';

COMMENT ON COLUMN post.step IS '차수';

COMMENT ON COLUMN post.edit_date IS '수정일';

COMMENT ON COLUMN post.is_private IS '비밀글여부';

CREATE UNIQUE INDEX PK_post
	ON post (
		post_no ASC
	);

ALTER TABLE post
	ADD
		CONSTRAINT PK_post
		PRIMARY KEY (
			post_no
		);

/* 댓글 */
CREATE TABLE reply (
	reply_no NUMBER NOT NULL, /* 댓글번호 */
	writer_code NUMBER, /* 댓글작성자 */
	post_no NUMBER, /* 게시글번호 */
	contents CLOB, /* 내용 */
	reg_date DATE, /* 등록일 */
	del_flag CHAR(1) /* 삭제여부 */
);

COMMENT ON TABLE reply IS '댓글';

COMMENT ON COLUMN reply.reply_no IS '댓글번호';

COMMENT ON COLUMN reply.writer_code IS '댓글작성자';

COMMENT ON COLUMN reply.post_no IS '게시글번호';

COMMENT ON COLUMN reply.contents IS '내용';

COMMENT ON COLUMN reply.reg_date IS '등록일';

COMMENT ON COLUMN reply.del_flag IS '삭제여부';

CREATE UNIQUE INDEX PK_reply
	ON reply (
		reply_no ASC
	);

ALTER TABLE reply
	ADD
		CONSTRAINT PK_reply
		PRIMARY KEY (
			reply_no
		);

/* 대댓글 */
CREATE TABLE rereply (
	rereply_no NUMBER NOT NULL, /* 대댓글번호 */
	writer_code NUMBER, /* 대댓글작성자 */
	reply_no NUMBER, /* 댓글번호 */
	reg_date DATE, /* 등록일 */
	contents CLOB, /* 내용 */
	del_flag CHAR(1) /* 삭제여부 */
);

COMMENT ON TABLE rereply IS '대댓글';

COMMENT ON COLUMN rereply.rereply_no IS '대댓글번호';

COMMENT ON COLUMN rereply.writer_code IS '대댓글작성자';

COMMENT ON COLUMN rereply.reply_no IS '댓글번호';

COMMENT ON COLUMN rereply.reg_date IS '등록일';

COMMENT ON COLUMN rereply.contents IS '내용';

COMMENT ON COLUMN rereply.del_flag IS '삭제여부';

CREATE UNIQUE INDEX PK_rereply
	ON rereply (
		rereply_no ASC
	);

ALTER TABLE rereply
	ADD
		CONSTRAINT PK_rereply
		PRIMARY KEY (
			rereply_no
		);

/* 파일 */
CREATE TABLE file (
	no NUMBER NOT NULL, /* 고유번호 */
	post_no NUMBER, /* 게시글번호 */
	file_name VARCHAR2(200), /* 파일명 */
	file_size NUMBER, /* 파일크기 */
	original_file_name VARCHAR2(200), /* 원본파일명 */
	down_count NUMBER, /* 다운로드수 */
	upfile_date DATE /* 업로드 날짜 */
);

COMMENT ON TABLE file IS '파일';

COMMENT ON COLUMN file.no IS '고유번호';

COMMENT ON COLUMN file.post_no IS '게시글번호';

COMMENT ON COLUMN file.file_name IS '파일명';

COMMENT ON COLUMN file.file_size IS '파일크기';

COMMENT ON COLUMN file.original_file_name IS '원본파일명';

COMMENT ON COLUMN file.down_count IS '다운로드수';

COMMENT ON COLUMN file.upfile_date IS '업로드 날짜';

CREATE UNIQUE INDEX PK_file
	ON file (
		no ASC
	);

ALTER TABLE file
	ADD
		CONSTRAINT PK_file
		PRIMARY KEY (
			no
		);

/* 증명서 종류 */
CREATE TABLE certification_type (
	certification_code <지정 되지 않음> NOT NULL, /* 증명서코드 */
	certification_name <지정 되지 않음> /* 증명서이름 */
);

COMMENT ON TABLE certification_type IS '증명서 종류';

COMMENT ON COLUMN certification_type.certification_code IS '증명서코드';

COMMENT ON COLUMN certification_type.certification_name IS '증명서이름';

CREATE UNIQUE INDEX PK_certification_type
	ON certification_type (
		certification_code ASC
	);

ALTER TABLE certification_type
	ADD
		CONSTRAINT PK_certification_type
		PRIMARY KEY (
			certification_code
		);

/* 새 테이블 */
CREATE TABLE TABLE (
);

COMMENT ON TABLE TABLE IS '새 테이블';

ALTER TABLE student
	ADD
		CONSTRAINT FK_student_state_TO_student
		FOREIGN KEY (
			state
		)
		REFERENCES student_state (
			state
		);

ALTER TABLE student
	ADD
		CONSTRAINT FK_department_TO_student
		FOREIGN KEY (
			dept_no
		)
		REFERENCES department (
			dept_no
		);

ALTER TABLE award
	ADD
		CONSTRAINT FK_student_TO_award
		FOREIGN KEY (
			stu_no
		)
		REFERENCES student (
			stu_no
		);

ALTER TABLE award
	ADD
		CONSTRAINT FK_scholarship_TO_award
		FOREIGN KEY (
			scholarship_no
		)
		REFERENCES scholarship (
			scholarship_no
		);

ALTER TABLE certification
	ADD
		CONSTRAINT FK_student_TO_certification
		FOREIGN KEY (
			stu_no
		)
		REFERENCES student (
			stu_no
		);

ALTER TABLE certification
	ADD
		CONSTRAINT FK_certification_type_TO_certification
		FOREIGN KEY (
			certification_code
		)
		REFERENCES certification_type (
			certification_code
		);

ALTER TABLE tuition
	ADD
		CONSTRAINT FK_student_TO_tuition
		FOREIGN KEY (
			stu_no
		)
		REFERENCES student (
			stu_no
		);

ALTER TABLE assignment
	ADD
		CONSTRAINT FK_student_TO_assignment
		FOREIGN KEY (
			stu_no
		)
		REFERENCES student (
			stu_no
		);

ALTER TABLE assignment
	ADD
		CONSTRAINT FK_distribute_assign_TO_assignment
		FOREIGN KEY (
			assign_no
		)
		REFERENCES distribute_assign (
			assign_no
		);

ALTER TABLE department
	ADD
		CONSTRAINT FK_faculty_TO_department
		FOREIGN KEY (
			faculty_no
		)
		REFERENCES faculty (
			faculty_no
		);

ALTER TABLE department
	ADD
		CONSTRAINT FK_building_TO_department
		FOREIGN KEY (
			building_code
		)
		REFERENCES building (
			building_code
		);

ALTER TABLE professor
	ADD
		CONSTRAINT FK_department_TO_professor
		FOREIGN KEY (
			dept_no
		)
		REFERENCES department (
			dept_no
		);

ALTER TABLE professor
	ADD
		CONSTRAINT FK_prof_position_TO_professor
		FOREIGN KEY (
			position_no2
		)
		REFERENCES prof_position (
			position_no
		);

ALTER TABLE subj_eval
	ADD
		CONSTRAINT FK_registration_TO_subj_eval
		FOREIGN KEY (
			open_sub_code,
			stu_no,
			classification
		)
		REFERENCES registration (
			open_sub_code,
			stu_no,
			classification
		);

ALTER TABLE registration
	ADD
		CONSTRAINT FK_open_subj_TO_registration
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subj (
			open_sub_code
		);

ALTER TABLE registration
	ADD
		CONSTRAINT FK_student_TO_registration
		FOREIGN KEY (
			stu_no
		)
		REFERENCES student (
			stu_no
		);

ALTER TABLE evaluation
	ADD
		CONSTRAINT FK_registration_TO_evaluation
		FOREIGN KEY (
			sub_code,
			stu_no,
			classification
		)
		REFERENCES registration (
			open_sub_code,
			stu_no,
			classification
		);

ALTER TABLE open_subj
	ADD
		CONSTRAINT FK_professor_TO_open_subj
		FOREIGN KEY (
			prof_no
		)
		REFERENCES professor (
			prof_no
		);

ALTER TABLE open_subj
	ADD
		CONSTRAINT FK_subject_TO_open_subj
		FOREIGN KEY (
			subj_code
		)
		REFERENCES subject (
			subj_code
		);

ALTER TABLE distribute_assign
	ADD
		CONSTRAINT FK_open_subj_TO_distribute_assign
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subj (
			open_sub_code
		);

ALTER TABLE syllabus
	ADD
		CONSTRAINT FK_open_subj_TO_syllabus
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subj (
			open_sub_code
		);

ALTER TABLE regi_timetable
	ADD
		CONSTRAINT FK_open_subj_TO_regi_timetable
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subj (
			open_sub_code
		);

ALTER TABLE subject
	ADD
		CONSTRAINT FK_professor_TO_subject
		FOREIGN KEY (
			prof_no
		)
		REFERENCES professor (
			prof_no
		);

ALTER TABLE subject
	ADD
		CONSTRAINT FK_subj_type_TO_subject
		FOREIGN KEY (
			type_code
		)
		REFERENCES subj_type (
			type_code
		);

ALTER TABLE account_info
	ADD
		CONSTRAINT FK_bank_TO_account_info
		FOREIGN KEY (
			bank_code
		)
		REFERENCES bank (
			bank_code
		);

ALTER TABLE inbox
	ADD
		CONSTRAINT FK_outbox_TO_inbox
		FOREIGN KEY (
			msg_no
		)
		REFERENCES outbox (
			msg_no
		);

ALTER TABLE classroom
	ADD
		CONSTRAINT FK_building_TO_classroom
		FOREIGN KEY (
			building_code
		)
		REFERENCES building (
			building_code
		);

ALTER TABLE subj_time
	ADD
		CONSTRAINT FK_classroom_TO_subj_time
		FOREIGN KEY (
			classroom_code
		)
		REFERENCES classroom (
			classroom_code
		);

ALTER TABLE subj_time
	ADD
		CONSTRAINT FK_timetable_TO_subj_time
		FOREIGN KEY (
			timetable_code
		)
		REFERENCES timetable (
			timetable_code
		);

ALTER TABLE subj_time
	ADD
		CONSTRAINT FK_open_subj_TO_subj_time
		FOREIGN KEY (
			open_sub_code
		)
		REFERENCES open_subj (
			open_sub_code
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_category_TO_board
		FOREIGN KEY (
			category_code
		)
		REFERENCES category (
			category_code
		);

ALTER TABLE board
	ADD
		CONSTRAINT FK_authority_TO_board
		FOREIGN KEY (
			auth_code
		)
		REFERENCES authority (
			auth_code
		);

ALTER TABLE employee
	ADD
		CONSTRAINT FK_authority_TO_employee
		FOREIGN KEY (
			auth_code
		)
		REFERENCES authority (
			auth_code
		);

ALTER TABLE employee
	ADD
		CONSTRAINT FK_emp_depart_TO_employee
		FOREIGN KEY (
			dep_code
		)
		REFERENCES emp_depart (
			dep_code
		);

ALTER TABLE employee
	ADD
		CONSTRAINT FK_emp_position_TO_employee
		FOREIGN KEY (
			position_code
		)
		REFERENCES emp_position (
			position_code
		);

ALTER TABLE post
	ADD
		CONSTRAINT FK_board_TO_post
		FOREIGN KEY (
			bd_code
		)
		REFERENCES board (
			bd_code
		);

ALTER TABLE reply
	ADD
		CONSTRAINT FK_post_TO_reply
		FOREIGN KEY (
			post_no
		)
		REFERENCES post (
			post_no
		);

ALTER TABLE rereply
	ADD
		CONSTRAINT FK_reply_TO_rereply
		FOREIGN KEY (
			reply_no
		)
		REFERENCES reply (
			reply_no
		);

ALTER TABLE file
	ADD
		CONSTRAINT FK_post_TO_file
		FOREIGN KEY (
			post_no
		)
		REFERENCES post (
			post_no
		);