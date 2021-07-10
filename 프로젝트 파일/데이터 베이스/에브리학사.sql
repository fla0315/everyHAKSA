/* �кλ� */
CREATE TABLE student (
	stu_no NUMBER NOT NULL, /* �й� */
	COL VARCHAR2(200), /* ���̵� */
	pwd VARCHAR2(200), /* ��й�ȣ */
	name VARCHAR2(200), /* ���� */
	semester VARCHAR2(200), /* �б� */
	major NUMBER, /* ���� */
	credits NUMBER, /* �̼����� */
	admission_date DATE, /* ������ */
	graduation_date DATE, /* ������ */
	indentity_state CHAR(1), /* ������������ */
	minor NUMBER, /* ������ */
	indentity_code VARCHAR2(200), /* ���������ڵ� */
	change_date DATE, /* ��й�ȣ ������ */
	state VARCHAR2(200), /* �������¹�ȣ */
	dept_no NUMBER /* �а���ȣ */
);

COMMENT ON TABLE student IS '�кλ�';

COMMENT ON COLUMN student.stu_no IS '�й�';

COMMENT ON COLUMN student.COL IS '���̵�';

COMMENT ON COLUMN student.pwd IS '��й�ȣ';

COMMENT ON COLUMN student.name IS '����';

COMMENT ON COLUMN student.semester IS '�б�';

COMMENT ON COLUMN student.major IS '����';

COMMENT ON COLUMN student.credits IS '�̼�����';

COMMENT ON COLUMN student.admission_date IS '������';

COMMENT ON COLUMN student.graduation_date IS '������';

COMMENT ON COLUMN student.indentity_state IS '������������';

COMMENT ON COLUMN student.minor IS '������';

COMMENT ON COLUMN student.indentity_code IS '���������ڵ�';

COMMENT ON COLUMN student.change_date IS '��й�ȣ ������';

COMMENT ON COLUMN student.state IS '�������¹�ȣ';

COMMENT ON COLUMN student.dept_no IS '�а���ȣ';

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

/* ���б� ���� */
CREATE TABLE award (
	no NUMBER NOT NULL, /* ���бݼ�����ȣ */
	stu_no NUMBER, /* �й� */
	scholarship_no NUMBER, /* ���бݹ�ȣ */
	awarding_date DATE /* ������ */
);

COMMENT ON TABLE award IS '���б� ����';

COMMENT ON COLUMN award.no IS '���бݼ�����ȣ';

COMMENT ON COLUMN award.stu_no IS '�й�';

COMMENT ON COLUMN award.scholarship_no IS '���бݹ�ȣ';

COMMENT ON COLUMN award.awarding_date IS '������';

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

/* ���б� */
CREATE TABLE scholarship (
	scholarship_no NUMBER NOT NULL, /* ���бݹ�ȣ */
	scholarship_type VARCHAR2(200), /* ���б����� */
	scholarship NUMBER /* ���б� �ݾ� */
);

COMMENT ON TABLE scholarship IS '���б�';

COMMENT ON COLUMN scholarship.scholarship_no IS '���бݹ�ȣ';

COMMENT ON COLUMN scholarship.scholarship_type IS '���б�����';

COMMENT ON COLUMN scholarship.scholarship IS '���б� �ݾ�';

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

/* �������� */
CREATE TABLE student_state (
	state VARCHAR2(200) NOT NULL, /* �������¹�ȣ */
	state_name VARCHAR2(200) /* ���������̸� */
);

COMMENT ON TABLE student_state IS '��������';

COMMENT ON COLUMN student_state.state IS '�������¹�ȣ';

COMMENT ON COLUMN student_state.state_name IS '���������̸�';

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

/* �����߱� */
CREATE TABLE certification (
	no VARCHAR2(200) NOT NULL, /* �߱޹�ȣ */
	stu_no NUMBER, /* �й� */
	qty NUMBER, /* �ż� */
	reg_date DATE, /* �߱��� */
	is_print CHAR(1), /* ��¿��� */
	certification_code <���� ���� ����> /* �����ڵ� */
);

COMMENT ON TABLE certification IS '�����߱�';

COMMENT ON COLUMN certification.no IS '�߱޹�ȣ';

COMMENT ON COLUMN certification.stu_no IS '�й�';

COMMENT ON COLUMN certification.qty IS '�ż�';

COMMENT ON COLUMN certification.reg_date IS '�߱���';

COMMENT ON COLUMN certification.is_print IS '��¿���';

COMMENT ON COLUMN certification.certification_code IS '�����ڵ�';

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

/* ��ϱ� */
CREATE TABLE tuition (
	no NUMBER NOT NULL, /* ��ϱݹ�ȣ */
	semester NUMBER, /* �б� */
	tuition NUMBER, /* �ݾ� */
	deposit_state CHAR(1), /* ���ο��� */
	deposit_date DATE, /* ������ */
	stu_no NUMBER /* �й� */
);

COMMENT ON TABLE tuition IS '��ϱ�';

COMMENT ON COLUMN tuition.no IS '��ϱݹ�ȣ';

COMMENT ON COLUMN tuition.semester IS '�б�';

COMMENT ON COLUMN tuition.tuition IS '�ݾ�';

COMMENT ON COLUMN tuition.deposit_state IS '���ο���';

COMMENT ON COLUMN tuition.deposit_date IS '������';

COMMENT ON COLUMN tuition.stu_no IS '�й�';

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

/* ���� */
CREATE TABLE assignment (
	assign_no NUMBER, /* ������ȣ */
	stu_no NUMBER, /* �й� */
	file_name VARCHAR2(500), /* �����̸� */
	file_size NUMBER, /* ���ϻ����� */
	original_file_name VARCHAR2(500), /* ���������̸� */
	apply_date DATE /* ������ */
);

COMMENT ON TABLE assignment IS '����';

COMMENT ON COLUMN assignment.assign_no IS '������ȣ';

COMMENT ON COLUMN assignment.stu_no IS '�й�';

COMMENT ON COLUMN assignment.file_name IS '�����̸�';

COMMENT ON COLUMN assignment.file_size IS '���ϻ�����';

COMMENT ON COLUMN assignment.original_file_name IS '���������̸�';

COMMENT ON COLUMN assignment.apply_date IS '������';

/* �а� */
CREATE TABLE department (
	dept_no NUMBER NOT NULL, /* �а���ȣ */
	faculty_no NUMBER, /* �кι�ȣ */
	dept_name VARCHAR2(200) NOT NULL, /* �а��� */
	tel VARCHAR2(200), /* �繫����ȭ��ȣ */
	building_code VARCHAR2(200), /* �ǹ��ڵ� */
	total_credit NUMBER /* �����̼����� */
);

COMMENT ON TABLE department IS '�а�';

COMMENT ON COLUMN department.dept_no IS '�а���ȣ';

COMMENT ON COLUMN department.faculty_no IS '�кι�ȣ';

COMMENT ON COLUMN department.dept_name IS '�а���';

COMMENT ON COLUMN department.tel IS '�繫����ȭ��ȣ';

COMMENT ON COLUMN department.building_code IS '�ǹ��ڵ�';

COMMENT ON COLUMN department.total_credit IS '�����̼�����';

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

/* �к� */
CREATE TABLE faculty (
	faculty_no NUMBER NOT NULL, /* �кι�ȣ */
	faculty_name VARCHAR2(200) NOT NULL /* �к��̸� */
);

COMMENT ON TABLE faculty IS '�к�';

COMMENT ON COLUMN faculty.faculty_no IS '�кι�ȣ';

COMMENT ON COLUMN faculty.faculty_name IS '�к��̸�';

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

/* ���� */
CREATE TABLE professor (
	prof_no NUMBER NOT NULL, /* ������ȣ */
	position_no2 NUMBER, /* ��å��ȣ */
	dept_no NUMBER, /* �а���ȣ */
	prof_name VARCHAR2(200), /* ������ */
	prof_id VARCHAR2(200), /* ���̵� */
	prof_pwd VARCHAR2(200), /* ��й�ȣ */
	prof_email VARCHAR2(200), /* �̸��� */
	prof_start_date DATE, /* �ӿ��� */
	prof_end_date DATE, /* ������ */
	identity_state CHAR(1), /* ������������ */
	identity_code VARCHAR2(200), /* ���������ڵ� */
	change_date DATE /* ��й�ȣ ������ */
);

COMMENT ON TABLE professor IS '����';

COMMENT ON COLUMN professor.prof_no IS '������ȣ';

COMMENT ON COLUMN professor.position_no2 IS '��å��ȣ';

COMMENT ON COLUMN professor.dept_no IS '�а���ȣ';

COMMENT ON COLUMN professor.prof_name IS '������';

COMMENT ON COLUMN professor.prof_id IS '���̵�';

COMMENT ON COLUMN professor.prof_pwd IS '��й�ȣ';

COMMENT ON COLUMN professor.prof_email IS '�̸���';

COMMENT ON COLUMN professor.prof_start_date IS '�ӿ���';

COMMENT ON COLUMN professor.prof_end_date IS '������';

COMMENT ON COLUMN professor.identity_state IS '������������';

COMMENT ON COLUMN professor.identity_code IS '���������ڵ�';

COMMENT ON COLUMN professor.change_date IS '��й�ȣ ������';

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

/* ������ */
CREATE TABLE TABLE11 (
	COL VARCHAR2(200), /* �� �÷� */
	COL2 VARCHAR2(200), /* �� �÷�2 */
	COL3 VARCHAR2(200), /* �� �÷�3 */
	COL4 NUMBER, /* �� �÷�4 */
	COL5 NUMBER, /* �� �÷�5 */
	COL6 NUMBER, /* �� �÷�6 */
	COL7 NUMBER, /* �� �÷�7 */
	COL8 NUMBER, /* �� �÷�8 */
	COL9 NUMBER, /* �� �÷�9 */
	COL10 NUMBER, /* �� �÷�10 */
	COL11 NUMBER, /* �� �÷�11 */
	COL12 CLOB /* �� �÷�12 */
);

COMMENT ON TABLE TABLE11 IS '������';

COMMENT ON COLUMN TABLE11.COL IS '�� �÷�';

COMMENT ON COLUMN TABLE11.COL2 IS '�� �÷�2';

COMMENT ON COLUMN TABLE11.COL3 IS '�� �÷�3';

COMMENT ON COLUMN TABLE11.COL4 IS '�� �÷�4';

COMMENT ON COLUMN TABLE11.COL5 IS '�� �÷�5';

COMMENT ON COLUMN TABLE11.COL6 IS '�� �÷�6';

COMMENT ON COLUMN TABLE11.COL7 IS '�� �÷�7';

COMMENT ON COLUMN TABLE11.COL8 IS '�� �÷�8';

COMMENT ON COLUMN TABLE11.COL9 IS '�� �÷�9';

COMMENT ON COLUMN TABLE11.COL10 IS '�� �÷�10';

COMMENT ON COLUMN TABLE11.COL11 IS '�� �÷�11';

COMMENT ON COLUMN TABLE11.COL12 IS '�� �÷�12';

/* ������ */
CREATE TABLE subj_eval (
	open_sub_code VARCHAR2(200) NOT NULL, /* �������������ڵ� */
	stu_no NUMBER NOT NULL, /* �й� */
	classification VARCHAR2(200) NOT NULL, /* �������� */
	q1 NUMBER, /* ����1 */
	q2 NUMBER, /* ����2 */
	q3 NUMBER, /* ����3 */
	q4 NUMBER, /* ����4 */
	q5 NUMBER, /* ����5 */
	content CLOB /* �򰡳��� */
);

COMMENT ON TABLE subj_eval IS '������';

COMMENT ON COLUMN subj_eval.open_sub_code IS '�������������ڵ�';

COMMENT ON COLUMN subj_eval.stu_no IS '�й�';

COMMENT ON COLUMN subj_eval.classification IS '��������';

COMMENT ON COLUMN subj_eval.q1 IS '����1';

COMMENT ON COLUMN subj_eval.q2 IS '����2';

COMMENT ON COLUMN subj_eval.q3 IS '����3';

COMMENT ON COLUMN subj_eval.q4 IS '����4';

COMMENT ON COLUMN subj_eval.q5 IS '����5';

COMMENT ON COLUMN subj_eval.content IS '�򰡳���';

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

/* ������û */
CREATE TABLE registration (
	open_sub_code VARCHAR2(200) NOT NULL, /* �������������ڵ� */
	stu_no NUMBER NOT NULL, /* �й� */
	classification VARCHAR2(200) NOT NULL, /* �������� */
	reg_date DATE, /* �������� */
	score NUMBER, /* ���� */
	lecture_eval_flag CHAR(1) /* �����򰡿ϷῩ�� */
);

COMMENT ON TABLE registration IS '������û';

COMMENT ON COLUMN registration.open_sub_code IS '�������������ڵ�';

COMMENT ON COLUMN registration.stu_no IS '�й�';

COMMENT ON COLUMN registration.classification IS '��������';

COMMENT ON COLUMN registration.reg_date IS '��������';

COMMENT ON COLUMN registration.score IS '����';

COMMENT ON COLUMN registration.lecture_eval_flag IS '�����򰡿ϷῩ��';

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

/* ���� */
CREATE TABLE evaluation (
	sub_code VARCHAR2(200), /* �������������ڵ� */
	stu_no NUMBER, /* �й� */
	classification VARCHAR2(200), /* �������� */
	midterm NUMBER, /* �߰���� */
	finals NUMBER, /* �⸻��� */
	assignmemt NUMBER, /* ���� */
	attendance NUMBER, /* �⼮ */
	etc NUMBER, /* ��Ÿ */
	total_grade NUMBER, /* ���� */
	reg_date DATE, /* �Է³�¥ */
	edit_date DATE /* ������¥ */
);

COMMENT ON TABLE evaluation IS '����';

COMMENT ON COLUMN evaluation.sub_code IS '�������������ڵ�';

COMMENT ON COLUMN evaluation.stu_no IS '�й�';

COMMENT ON COLUMN evaluation.classification IS '��������';

COMMENT ON COLUMN evaluation.midterm IS '�߰����';

COMMENT ON COLUMN evaluation.finals IS '�⸻���';

COMMENT ON COLUMN evaluation.assignmemt IS '����';

COMMENT ON COLUMN evaluation.attendance IS '�⼮';

COMMENT ON COLUMN evaluation.etc IS '��Ÿ';

COMMENT ON COLUMN evaluation.total_grade IS '����';

COMMENT ON COLUMN evaluation.reg_date IS '�Է³�¥';

COMMENT ON COLUMN evaluation.edit_date IS '������¥';

/* ������������ */
CREATE TABLE open_subj (
	open_sub_code VARCHAR2(200) NOT NULL, /* �������������ڵ� */
	open_date DATE, /* �������� */
	close_date DATE, /* �������� */
	prof_no NUMBER, /* ������ȣ */
	subj_code VARCHAR2(200) /* �����ڵ� */
);

COMMENT ON TABLE open_subj IS '������������';

COMMENT ON COLUMN open_subj.open_sub_code IS '�������������ڵ�';

COMMENT ON COLUMN open_subj.open_date IS '��������';

COMMENT ON COLUMN open_subj.close_date IS '��������';

COMMENT ON COLUMN open_subj.prof_no IS '������ȣ';

COMMENT ON COLUMN open_subj.subj_code IS '�����ڵ�';

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

/* ������� */
CREATE TABLE distribute_assign (
	assign_no NUMBER NOT NULL, /* ������ȣ */
	open_sub_code VARCHAR2(200), /* �������������ڵ� */
	assign_name VARCHAR2(200), /* ������ */
	reg_date DATE /* ����� */
);

COMMENT ON TABLE distribute_assign IS '�������';

COMMENT ON COLUMN distribute_assign.assign_no IS '������ȣ';

COMMENT ON COLUMN distribute_assign.open_sub_code IS '�������������ڵ�';

COMMENT ON COLUMN distribute_assign.assign_name IS '������';

COMMENT ON COLUMN distribute_assign.reg_date IS '�����';

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

/* ���ǰ�ȹ */
CREATE TABLE syllabus (
	open_sub_code VARCHAR2(200), /* �������������ڵ� */
	syllabus VARCHAR2(200), /* ���ǰ�ȹ�� */
	theory_time NUMBER, /* �̷нð� */
	training_time NUMBER /* �ǽ��ð� */
);

COMMENT ON TABLE syllabus IS '���ǰ�ȹ';

COMMENT ON COLUMN syllabus.open_sub_code IS '�������������ڵ�';

COMMENT ON COLUMN syllabus.syllabus IS '���ǰ�ȹ��';

COMMENT ON COLUMN syllabus.theory_time IS '�̷нð�';

COMMENT ON COLUMN syllabus.training_time IS '�ǽ��ð�';

/* ���ð�ǥ */
CREATE TABLE regi_timetable (
	open_sub_code VARCHAR2(200), /* �������������ڵ� */
	short_name VARCHAR2(200) /* ���� */
);

COMMENT ON TABLE regi_timetable IS '���ð�ǥ';

COMMENT ON COLUMN regi_timetable.open_sub_code IS '�������������ڵ�';

COMMENT ON COLUMN regi_timetable.short_name IS '����';

/* ������å */
CREATE TABLE prof_position (
	position_no NUMBER NOT NULL, /* ��å��ȣ */
	position_name VARCHAR2(200) /* ��å�� */
);

COMMENT ON TABLE prof_position IS '������å';

COMMENT ON COLUMN prof_position.position_no IS '��å��ȣ';

COMMENT ON COLUMN prof_position.position_name IS '��å��';

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

/* �ǹ� */
CREATE TABLE building (
	building_code VARCHAR2(200) NOT NULL, /* �ǹ��ڵ� */
	building_name VARCHAR2(200), /* �ǹ��� */
	detail VARCHAR2(200) /* ����ġ */
);

COMMENT ON TABLE building IS '�ǹ�';

COMMENT ON COLUMN building.building_code IS '�ǹ��ڵ�';

COMMENT ON COLUMN building.building_name IS '�ǹ���';

COMMENT ON COLUMN building.detail IS '����ġ';

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

/* ���� */
CREATE TABLE subject (
	subj_code VARCHAR2(200) NOT NULL, /* �����ڵ� */
	prof_no NUMBER, /* ������ȣ */
	type_code VARCHAR2(200), /* �����ڵ� */
	subj_name VARCHAR2(200), /* ����� */
	explanation CLOB, /* ���񼳸� */
	credit NUMBER, /* �̼����� */
	personnel NUMBER /* �ο� */
);

COMMENT ON TABLE subject IS '����';

COMMENT ON COLUMN subject.subj_code IS '�����ڵ�';

COMMENT ON COLUMN subject.prof_no IS '������ȣ';

COMMENT ON COLUMN subject.type_code IS '�����ڵ�';

COMMENT ON COLUMN subject.subj_name IS '�����';

COMMENT ON COLUMN subject.explanation IS '���񼳸�';

COMMENT ON COLUMN subject.credit IS '�̼�����';

COMMENT ON COLUMN subject.personnel IS '�ο�';

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

/* �̼����� */
CREATE TABLE subj_type (
	type_code VARCHAR2(200) NOT NULL, /* �����ڵ� */
	type VARCHAR2(200) /* �̼����� */
);

COMMENT ON TABLE subj_type IS '�̼�����';

COMMENT ON COLUMN subj_type.type_code IS '�����ڵ�';

COMMENT ON COLUMN subj_type.type IS '�̼�����';

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

/* �ϴ����� */
CREATE TABLE footer (
	company_name VARCHAR2(200), /* ȸ��� */
	tel VARCHAR2(200), /* ��ȭ��ȣ */
	zipcode VARCHAR2(200), /* �����ȣ */
	address1 VARCHAR2(200), /* �ּ�1 */
	address2 VARCHAR2(200), /* �ּ�2 */
	policy CLOB, /* ��������ó����ħ */
	start_year VARCHAR2(200) /* �������� */
);

COMMENT ON TABLE footer IS '�ϴ�����';

COMMENT ON COLUMN footer.company_name IS 'ȸ���';

COMMENT ON COLUMN footer.tel IS '��ȭ��ȣ';

COMMENT ON COLUMN footer.zipcode IS '�����ȣ';

COMMENT ON COLUMN footer.address1 IS '�ּ�1';

COMMENT ON COLUMN footer.address2 IS '�ּ�2';

COMMENT ON COLUMN footer.policy IS '��������ó����ħ';

COMMENT ON COLUMN footer.start_year IS '��������';

/* ���� */
CREATE TABLE bank (
	bank_code VARCHAR2(200) NOT NULL, /* �����ڵ� */
	bank_name VARCHAR2(200) /* ����� */
);

COMMENT ON TABLE bank IS '����';

COMMENT ON COLUMN bank.bank_code IS '�����ڵ�';

COMMENT ON COLUMN bank.bank_name IS '�����';

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

/* �������� */
CREATE TABLE account_info (
	bank_code VARCHAR2(200), /* �����ڵ� */
	official_no VARCHAR2(200), /* �����ڹ�ȣ */
	account_no VARCHAR2(200), /* ���¹�ȣ */
	account_name VARCHAR2(200) /* �����ָ� */
);

COMMENT ON TABLE account_info IS '��������';

COMMENT ON COLUMN account_info.bank_code IS '�����ڵ�';

COMMENT ON COLUMN account_info.official_no IS '�����ڹ�ȣ';

COMMENT ON COLUMN account_info.account_no IS '���¹�ȣ';

COMMENT ON COLUMN account_info.account_name IS '�����ָ�';

/* ������ ������ */
CREATE TABLE official_info (
	official_no NUMBER NOT NULL, /* �����ڹ�ȣ */
	hp1 VARCHAR2(200), /* �ڵ���1 */
	hp2 VARCHAR2(200), /* �ڵ���2 */
	email1 VARCHAR2(200), /* �̸���1 */
	email2 VARCHAR2(200), /* �̸���2 */
	zipcode VARCHAR2(200), /* �����ȣ */
	address VARCHAR2(200), /* �ּ� */
	addr_detail VARCHAR2(200), /* �ּһ� */
	jumin VARCHAR2(200), /* �ֹι�ȣ */
	gender VARCHAR2(200), /* ���� */
	image_url VARCHAR2(200) /* ���� */
);

COMMENT ON TABLE official_info IS '������ ������';

COMMENT ON COLUMN official_info.official_no IS '�����ڹ�ȣ';

COMMENT ON COLUMN official_info.hp1 IS '�ڵ���1';

COMMENT ON COLUMN official_info.hp2 IS '�ڵ���2';

COMMENT ON COLUMN official_info.email1 IS '�̸���1';

COMMENT ON COLUMN official_info.email2 IS '�̸���2';

COMMENT ON COLUMN official_info.zipcode IS '�����ȣ';

COMMENT ON COLUMN official_info.address IS '�ּ�';

COMMENT ON COLUMN official_info.addr_detail IS '�ּһ�';

COMMENT ON COLUMN official_info.jumin IS '�ֹι�ȣ';

COMMENT ON COLUMN official_info.gender IS '����';

COMMENT ON COLUMN official_info.image_url IS '����';

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

/* ���� �߽��� */
CREATE TABLE outbox (
	msg_no NUMBER NOT NULL, /* ������ȣ */
	official_no VARCHAR2(200), /* �߽��� ��ȣ */
	contents CLOB, /* ���� */
	send_date DATE, /* �߼��� */
	official_name VARCHAR2(200), /* �߽��θ� */
	del_flag CHAR(1) /* �������� */
);

COMMENT ON TABLE outbox IS '���� �߽���';

COMMENT ON COLUMN outbox.msg_no IS '������ȣ';

COMMENT ON COLUMN outbox.official_no IS '�߽��� ��ȣ';

COMMENT ON COLUMN outbox.contents IS '����';

COMMENT ON COLUMN outbox.send_date IS '�߼���';

COMMENT ON COLUMN outbox.official_name IS '�߽��θ�';

COMMENT ON COLUMN outbox.del_flag IS '��������';

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

/* ���� ������ */
CREATE TABLE inbox (
	no NUMBER NOT NULL, /* ��ȣ */
	official_no VARCHAR2(200), /* �����ι�ȣ */
	read_date DATE, /* ���� ��¥ */
	keep_flag CHAR(1), /* �������� */
	msg_no NUMBER /* ������ȣ */
);

COMMENT ON TABLE inbox IS '���� ������';

COMMENT ON COLUMN inbox.no IS '��ȣ';

COMMENT ON COLUMN inbox.official_no IS '�����ι�ȣ';

COMMENT ON COLUMN inbox.read_date IS '���� ��¥';

COMMENT ON COLUMN inbox.keep_flag IS '��������';

COMMENT ON COLUMN inbox.msg_no IS '������ȣ';

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

/* ���ǽ� */
CREATE TABLE classroom (
	classroom_code VARCHAR2(200) NOT NULL, /* ���ǽ��ڵ� */
	classroom_name VARCHAR2(200), /* ���ǽǸ� */
	building_code VARCHAR2(200) /* �ǹ��ڵ� */
);

COMMENT ON TABLE classroom IS '���ǽ�';

COMMENT ON COLUMN classroom.classroom_code IS '���ǽ��ڵ�';

COMMENT ON COLUMN classroom.classroom_name IS '���ǽǸ�';

COMMENT ON COLUMN classroom.building_code IS '�ǹ��ڵ�';

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

/* ���ǽð�ǥ */
CREATE TABLE subj_time (
	lecture_time_no NUMBER NOT NULL, /* ���ǽð�ǥ�ڵ� */
	open_sub_code VARCHAR2(200), /* �������������ڵ� */
	classroom_code VARCHAR2(200), /* ���ǽ��ڵ� */
	timetable_code VARCHAR2(200) /* �ð������ڵ� */
);

COMMENT ON TABLE subj_time IS '���ǽð�ǥ';

COMMENT ON COLUMN subj_time.lecture_time_no IS '���ǽð�ǥ�ڵ�';

COMMENT ON COLUMN subj_time.open_sub_code IS '�������������ڵ�';

COMMENT ON COLUMN subj_time.classroom_code IS '���ǽ��ڵ�';

COMMENT ON COLUMN subj_time.timetable_code IS '�ð������ڵ�';

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

/* ���ã�� */
CREATE TABLE bookmark (
	no NUMBER NOT NULL, /* ��ȣ */
	official_no VARCHAR2(200), /* �����ڹ�ȣ */
	name VARCHAR2(200), /* �ϸ�ũ�� */
	url VARCHAR2(200) /* �ϸ�ũ�ּ� */
);

COMMENT ON TABLE bookmark IS '���ã��';

COMMENT ON COLUMN bookmark.no IS '��ȣ';

COMMENT ON COLUMN bookmark.official_no IS '�����ڹ�ȣ';

COMMENT ON COLUMN bookmark.name IS '�ϸ�ũ��';

COMMENT ON COLUMN bookmark.url IS '�ϸ�ũ�ּ�';

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

/* �⺻�ð�ǥ */
CREATE TABLE timetable (
	timetable_code VARCHAR2(200) NOT NULL, /* �ð������ڵ� */
	timetable_name VARCHAR2(200), /* ǥ�ñ��ø� */
	day VARCHAR2(200), /* ���� */
	period NUMBER, /* ���� */
	short_name VARCHAR2(200) /* ��౳�ø� */
);

COMMENT ON TABLE timetable IS '�⺻�ð�ǥ';

COMMENT ON COLUMN timetable.timetable_code IS '�ð������ڵ�';

COMMENT ON COLUMN timetable.timetable_name IS 'ǥ�ñ��ø�';

COMMENT ON COLUMN timetable.day IS '����';

COMMENT ON COLUMN timetable.period IS '����';

COMMENT ON COLUMN timetable.short_name IS '��౳�ø�';

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

/* �Խ��� */
CREATE TABLE board (
	bd_code NUMBER NOT NULL, /* �Խ����ڵ� */
	auth_code NUMBER, /* �����ڵ� */
	category_code NUMBER, /* ī�װ� �ڵ� */
	bd_name VARCHAR2(200), /* �Խ��� �̸� */
	reg_date DATE, /* �Խ��� ����� */
	edit_date DATE, /* �Խ��� ������ */
	bd_order NUMBER, /* �Խ��� ���� */
	usage CHAR(1), /* ��뿩�� */
	is_reply CHAR(1), /* ��ۿ��� */
	is_comment CHAR(1), /* ��ۿ��� */
	is_private CHAR(1), /* ��������� */
	is_upload CHAR(1), /* ���ε� ���� ���� */
	max_upfile NUMBER, /* ���ε� ���� ���� */
	max_filesize NUMBER /* ���ε� ���� ���� ������ */
);

COMMENT ON TABLE board IS '�Խ���';

COMMENT ON COLUMN board.bd_code IS '�Խ����ڵ�';

COMMENT ON COLUMN board.auth_code IS '�����ڵ�';

COMMENT ON COLUMN board.category_code IS 'ī�װ� �ڵ�';

COMMENT ON COLUMN board.bd_name IS '�Խ��� �̸�';

COMMENT ON COLUMN board.reg_date IS '�Խ��� �����';

COMMENT ON COLUMN board.edit_date IS '�Խ��� ������';

COMMENT ON COLUMN board.bd_order IS '�Խ��� ����';

COMMENT ON COLUMN board.usage IS '��뿩��';

COMMENT ON COLUMN board.is_reply IS '��ۿ���';

COMMENT ON COLUMN board.is_comment IS '��ۿ���';

COMMENT ON COLUMN board.is_private IS '���������';

COMMENT ON COLUMN board.is_upload IS '���ε� ���� ����';

COMMENT ON COLUMN board.max_upfile IS '���ε� ���� ����';

COMMENT ON COLUMN board.max_filesize IS '���ε� ���� ���� ������';

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

/* ī�װ� */
CREATE TABLE category (
	category_code NUMBER NOT NULL, /* ī�װ� �ڵ� */
	category_name VARCHAR2(200), /* ī�װ� �� */
	usage CHAR(1), /* ��뿩�� */
	reg_date DATE /* ����� */
);

COMMENT ON TABLE category IS 'ī�װ�';

COMMENT ON COLUMN category.category_code IS 'ī�װ� �ڵ�';

COMMENT ON COLUMN category.category_name IS 'ī�װ� ��';

COMMENT ON COLUMN category.usage IS '��뿩��';

COMMENT ON COLUMN category.reg_date IS '�����';

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

/* ���� */
CREATE TABLE authority (
	auth_code NUMBER NOT NULL, /* �����ڵ� */
	auth_name VARCHAR2(200), /* ���Ѹ� */
	auth_desc VARCHAR2(200), /* ���� */
	reg_date DATE /* ����� */
);

COMMENT ON TABLE authority IS '����';

COMMENT ON COLUMN authority.auth_code IS '�����ڵ�';

COMMENT ON COLUMN authority.auth_name IS '���Ѹ�';

COMMENT ON COLUMN authority.auth_desc IS '����';

COMMENT ON COLUMN authority.reg_date IS '�����';

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

/* ������ */
CREATE TABLE employee (
	emp_no NUMBER NOT NULL, /* ��������ȣ */
	emp_id VARCHAR2(200), /* ���������̵� */
	emp_name VARCHAR2(200), /* �������� */
	pwd VARCHAR2(200), /* ��й�ȣ */
	start_date DATE, /* �Ի��� */
	resignation_date DATE, /* ����� */
	identity_state CHAR(1), /* ������������ */
	dep_code NUMBER, /* �μ��ڵ� */
	position_code NUMBER, /* ��å�ڵ� */
	auth_code NUMBER /* �����ڵ� */
);

COMMENT ON TABLE employee IS '������';

COMMENT ON COLUMN employee.emp_no IS '��������ȣ';

COMMENT ON COLUMN employee.emp_id IS '���������̵�';

COMMENT ON COLUMN employee.emp_name IS '��������';

COMMENT ON COLUMN employee.pwd IS '��й�ȣ';

COMMENT ON COLUMN employee.start_date IS '�Ի���';

COMMENT ON COLUMN employee.resignation_date IS '�����';

COMMENT ON COLUMN employee.identity_state IS '������������';

COMMENT ON COLUMN employee.dep_code IS '�μ��ڵ�';

COMMENT ON COLUMN employee.position_code IS '��å�ڵ�';

COMMENT ON COLUMN employee.auth_code IS '�����ڵ�';

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

/* �μ� */
CREATE TABLE emp_depart (
	dep_code NUMBER NOT NULL, /* �μ��ڵ� */
	dep_name VARCHAR2(200) /* �μ��� */
);

COMMENT ON TABLE emp_depart IS '�μ�';

COMMENT ON COLUMN emp_depart.dep_code IS '�μ��ڵ�';

COMMENT ON COLUMN emp_depart.dep_name IS '�μ���';

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

/* ������ ��å */
CREATE TABLE emp_position (
	position_code NUMBER NOT NULL, /* ��å�ڵ� */
	position_name VARCHAR2(200) /* ��å�� */
);

COMMENT ON TABLE emp_position IS '������ ��å';

COMMENT ON COLUMN emp_position.position_code IS '��å�ڵ�';

COMMENT ON COLUMN emp_position.position_name IS '��å��';

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

/* �Խñ� */
CREATE TABLE post (
	post_no NUMBER NOT NULL, /* �Խñ۹�ȣ */
	bd_code NUMBER, /* �Խ����ڵ� */
	writer_code NUMBER, /* �ۼ����ڵ� */
	title VARCHAR2(200), /* ���� */
	contents CLOB, /* ���� */
	reg_date DATE, /* ����� */
	read_count NUMBER, /* ��ȸ�� */
	del_flag CHAR(1), /* �������� */
	group_no NUMBER, /* �����۹�ȣ */
	sort_no NUMBER, /* ���Ĺ�ȣ */
	step NUMBER, /* ���� */
	edit_date DATE, /* ������ */
	is_private CHAR(1) /* ��бۿ��� */
);

COMMENT ON TABLE post IS '�Խñ�';

COMMENT ON COLUMN post.post_no IS '�Խñ۹�ȣ';

COMMENT ON COLUMN post.bd_code IS '�Խ����ڵ�';

COMMENT ON COLUMN post.writer_code IS '�ۼ����ڵ�';

COMMENT ON COLUMN post.title IS '����';

COMMENT ON COLUMN post.contents IS '����';

COMMENT ON COLUMN post.reg_date IS '�����';

COMMENT ON COLUMN post.read_count IS '��ȸ��';

COMMENT ON COLUMN post.del_flag IS '��������';

COMMENT ON COLUMN post.group_no IS '�����۹�ȣ';

COMMENT ON COLUMN post.sort_no IS '���Ĺ�ȣ';

COMMENT ON COLUMN post.step IS '����';

COMMENT ON COLUMN post.edit_date IS '������';

COMMENT ON COLUMN post.is_private IS '��бۿ���';

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

/* ��� */
CREATE TABLE reply (
	reply_no NUMBER NOT NULL, /* ��۹�ȣ */
	writer_code NUMBER, /* ����ۼ��� */
	post_no NUMBER, /* �Խñ۹�ȣ */
	contents CLOB, /* ���� */
	reg_date DATE, /* ����� */
	del_flag CHAR(1) /* �������� */
);

COMMENT ON TABLE reply IS '���';

COMMENT ON COLUMN reply.reply_no IS '��۹�ȣ';

COMMENT ON COLUMN reply.writer_code IS '����ۼ���';

COMMENT ON COLUMN reply.post_no IS '�Խñ۹�ȣ';

COMMENT ON COLUMN reply.contents IS '����';

COMMENT ON COLUMN reply.reg_date IS '�����';

COMMENT ON COLUMN reply.del_flag IS '��������';

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

/* ���� */
CREATE TABLE rereply (
	rereply_no NUMBER NOT NULL, /* ���۹�ȣ */
	writer_code NUMBER, /* �����ۼ��� */
	reply_no NUMBER, /* ��۹�ȣ */
	reg_date DATE, /* ����� */
	contents CLOB, /* ���� */
	del_flag CHAR(1) /* �������� */
);

COMMENT ON TABLE rereply IS '����';

COMMENT ON COLUMN rereply.rereply_no IS '���۹�ȣ';

COMMENT ON COLUMN rereply.writer_code IS '�����ۼ���';

COMMENT ON COLUMN rereply.reply_no IS '��۹�ȣ';

COMMENT ON COLUMN rereply.reg_date IS '�����';

COMMENT ON COLUMN rereply.contents IS '����';

COMMENT ON COLUMN rereply.del_flag IS '��������';

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

/* ���� */
CREATE TABLE file (
	no NUMBER NOT NULL, /* ������ȣ */
	post_no NUMBER, /* �Խñ۹�ȣ */
	file_name VARCHAR2(200), /* ���ϸ� */
	file_size NUMBER, /* ����ũ�� */
	original_file_name VARCHAR2(200), /* �������ϸ� */
	down_count NUMBER, /* �ٿ�ε�� */
	upfile_date DATE /* ���ε� ��¥ */
);

COMMENT ON TABLE file IS '����';

COMMENT ON COLUMN file.no IS '������ȣ';

COMMENT ON COLUMN file.post_no IS '�Խñ۹�ȣ';

COMMENT ON COLUMN file.file_name IS '���ϸ�';

COMMENT ON COLUMN file.file_size IS '����ũ��';

COMMENT ON COLUMN file.original_file_name IS '�������ϸ�';

COMMENT ON COLUMN file.down_count IS '�ٿ�ε��';

COMMENT ON COLUMN file.upfile_date IS '���ε� ��¥';

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

/* ���� ���� */
CREATE TABLE certification_type (
	certification_code <���� ���� ����> NOT NULL, /* �����ڵ� */
	certification_name <���� ���� ����> /* �����̸� */
);

COMMENT ON TABLE certification_type IS '���� ����';

COMMENT ON COLUMN certification_type.certification_code IS '�����ڵ�';

COMMENT ON COLUMN certification_type.certification_name IS '�����̸�';

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

/* �� ���̺� */
CREATE TABLE TABLE (
);

COMMENT ON TABLE TABLE IS '�� ���̺�';

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