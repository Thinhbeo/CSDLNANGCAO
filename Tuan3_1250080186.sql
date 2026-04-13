SQL> -- 1. B?ng COURSE (M“n h?c)
SQL> CREATE TABLE COURSE (
  2      CourseNo NUMBER(8,0) NOT NULL,
  3      Description VARCHAR2(50),
  4      Cost NUMBER(9,2),
  5      Prerequisite NUMBER(8,0),
  6      CreatedBy VARCHAR2(30) NOT NULL,
  7      CreatedDate DATE NOT NULL,
  8      ModifiedBy VARCHAR2(30) NOT NULL,
  9      ModifiedDate DATE NOT NULL,
 10      CONSTRAINT pk_course PRIMARY KEY (CourseNo)
 11  );

Table created.

SQL> 
SQL> -- 2. B?ng INSTRUCTOR (Gi o viˆn)
SQL> CREATE TABLE INSTRUCTOR (
  2      InstructorID NUMBER(8) NOT NULL,
  3      Salutation VARCHAR2(15),
  4      FirstName VARCHAR2(25),
  5      LastName VARCHAR2(25),
  6      Address VARCHAR2(50),
  7      Phone VARCHAR2(15),
  8      CreatedBy VARCHAR2(30) NOT NULL,
  9      CreatedDate DATE NOT NULL,
 10      ModifiedBy VARCHAR2(30) NOT NULL,
 11      ModifiedDate DATE NOT NULL,
 12      CONSTRAINT pk_instructor PRIMARY KEY (InstructorID)
 13  );

Table created.

SQL> 
SQL> -- 3. B?ng STUDENT (Sinh viˆn)
SQL> CREATE TABLE STUDENT (
  2      StudentID NUMBER(8,0) NOT NULL,
  3      Salutation VARCHAR2(15),
  4      FirstName VARCHAR2(25),
  5      LastName VARCHAR2(25) NOT NULL,
  6      Address VARCHAR2(50),
  7      Phone VARCHAR2(15),
  8      Employer VARCHAR2(50),
  9      RegistrationDate DATE NOT NULL,
 10      CreatedBy VARCHAR2(30) NOT NULL,
 11      CreatedDate DATE NOT NULL,
 12      ModifiedBy VARCHAR2(30) NOT NULL,
 13      ModifiedDate DATE NOT NULL,
 14      CONSTRAINT pk_student PRIMARY KEY (StudentID)
 15  );

Table created.

SQL> 
SQL> -- 4. B?ng CLASS (L?p h?c)
SQL> CREATE TABLE CLASS (
  2      ClassID NUMBER(8,0) NOT NULL,
  3      CourseNo NUMBER(8,0) NOT NULL,
  4      ClassNo NUMBER(3) NOT NULL,
  5      StartDateTime DATE,
  6      Location VARCHAR2(50),
  7      InstructorID NUMBER(8,0) NOT NULL,
  8      Capacity NUMBER(3,0),
  9      CreatedBy VARCHAR2(30) NOT NULL,
 10      CreatedDate DATE NOT NULL,
 11      ModifiedBy VARCHAR2(30) NOT NULL,
 12      ModifiedDate DATE NOT NULL,
 13      CONSTRAINT pk_class PRIMARY KEY (ClassID),
 14      CONSTRAINT fk_class_course FOREIGN KEY (CourseNo) REFERENCES COURSE(CourseNo),
 15      CONSTRAINT fk_class_instructor FOREIGN KEY (InstructorID) REFERENCES INSTRUCTOR(InstructorID)
 16  );

Table created.

SQL> 
SQL> -- 5. B?ng ENROLLMENT (Dang ky h?c)
SQL> CREATE TABLE ENROLLMENT (
  2      StudentID NUMBER(8,0) NOT NULL,
  3      ClassID NUMBER(8,0) NOT NULL,
  4      EnrollDate DATE NOT NULL,
  5      FinalGrade NUMBER(3,0),
  6      RegistrationDate DATE NOT NULL,
  7      CreatedBy VARCHAR2(30) NOT NULL,
  8      CreatedDate DATE NOT NULL,
  9      ModifiedBy VARCHAR2(30) NOT NULL,
 10      ModifiedDate DATE NOT NULL,
 11      CONSTRAINT pk_enrollment PRIMARY KEY (StudentID, ClassID),
 12      CONSTRAINT fk_enroll_student FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
 13      CONSTRAINT fk_enroll_class FOREIGN KEY (ClassID) REFERENCES CLASS(ClassID)
 14  );

Table created.

SQL> 
SQL> -- 6. B?ng GRADE (Di?m s?)
SQL> CREATE TABLE GRADE (
  2      StudentID NUMBER(8) NOT NULL,
  3      ClassID NUMBER(8) NOT NULL,
  4      Grade NUMBER(3) NOT NULL,
  5      Comments VARCHAR2(2000),
  6      CreatedBy VARCHAR2(30) NOT NULL,
  7      CreatedDate DATE NOT NULL,
  8      ModifiedBy VARCHAR2(30) NOT NULL,
  9      ModifiedDate DATE NOT NULL,
 10      CONSTRAINT pk_grade PRIMARY KEY (StudentID, ClassID),
 11      CONSTRAINT fk_grade_student FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID),
 12      CONSTRAINT fk_grade_class FOREIGN KEY (ClassID) REFERENCES CLASS(ClassID)
 13  );

Table created.

SQL> 
SQL> 
SQL> 
SQL> -- 1. B?NG COURSE
SQL> INSERT INTO COURSE VALUES (10, 'H? Qu?n tr? Co s? d? li?u', 1500, NULL, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);

1 row created.

SQL> INSERT INTO COURSE VALUES (20, 'L?p trnh Java Co b?n', 1200, NULL, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);

1 row created.

SQL> INSERT INTO COURSE VALUES (30, 'C?u tr£c d? li?u & Gi?i thu?t', 1300, 20, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);
Enter value for gi: INSERT INTO COURSE VALUES (40, 'Ph t tri?n ?ng d?ng Web', 1000, NULL, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);
old   1: INSERT INTO COURSE VALUES (30, 'C?u tr£c d? li?u & Gi?i thu?t', 1300, 20, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE)
new   1: INSERT INTO COURSE VALUES (30, 'C?u tr£c d? li?u INSERT INTO COURSE VALUES (40, 'Ph t tri?n ?ng d?ng Web', 1000, NULL, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);?i thu?t', 1300, 20, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE)
INSERT INTO COURSE VALUES (30, 'C?u tr£c d? li?u INSERT INTO COURSE VALUES (40, 'Ph t tri?n ?ng d?ng Web', 1000, NULL, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);?i thu?t', 1300, 20, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE)
                                                                                  *
ERROR at line 1:
ORA-00917: missing comma 


SQL> INSERT INTO COURSE VALUES (50, 'H?c m y Co b?n', 2000, 10, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);

1 row created.

SQL> 
SQL> -- 2. B?NG INSTRUCTOR
SQL> INSERT INTO INSTRUCTOR VALUES (1, 'Th?y', 'Nguy?n', 'Tu?n', 'Qu?n 1, TP.HCM', '0901111111', 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);

1 row created.

SQL> INSERT INTO INSTRUCTOR VALUES (2, 'C“', 'Tr?n', 'Mai', 'Qu?n 2, TP.HCM', '0902222222', 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);

1 row created.

SQL> INSERT INTO INSTRUCTOR VALUES (3, 'Th?y', 'Lˆ', 'H—ng', 'Qu?n 3, TP.HCM', '0903333333', 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);

1 row created.

SQL> INSERT INTO INSTRUCTOR VALUES (4, 'C“', 'Ph?m', 'Lan', 'Qu?n 4, TP.HCM', '0904444444', 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);

1 row created.

SQL> INSERT INTO INSTRUCTOR VALUES (5, 'Th?y', 'H?', 'Kiˆn', 'Qu?n 5, TP.HCM', '0905555555', 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);

1 row created.

SQL> 
SQL> -- 3. B?NG STUDENT
SQL> INSERT INTO STUDENT VALUES (101, 'Nam', 'Nguy?n Lˆ', 'Th?nh', 'Q. Bnh Th?nh, TP.HCM', '0911000101', 'VNG Corporation', SYSDATE, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);

1 row created.

SQL> INSERT INTO STUDENT VALUES (102, 'Nam', 'H? Anh', 'Khoa', 'Q. G• V?p, TP.HCM', '0912000102', 'FPT Software', SYSDATE, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);

1 row created.

SQL> INSERT INTO STUDENT VALUES (103, 'Nam', 'Lˆ Van', 'Tƒn', 'Qu?n 12, TP.HCM', '0913000103', 'CMC Global', SYSDATE, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);

1 row created.

SQL> INSERT INTO STUDENT VALUES (104, 'N?', 'Nguy?n Ho…ng', 'Ngƒn', 'Qu?n 7, TP.HCM', '0914000104', NULL, SYSDATE, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);

1 row created.

SQL> INSERT INTO STUDENT VALUES (105, 'Nam', 'Tr?n Quy', 'B?o', 'Qu?n 9, TP.HCM', '0915000105', NULL, SYSDATE, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);

1 row created.

SQL> 
SQL> -- 4. B?NG CLASS
SQL> INSERT INTO CLASS VALUES (1001, 10, 1, SYSDATE, 'Ph•ng A101', 1, 30, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE); -- Th?y Tu?n d?y
  2  INSERT INTO CLASS VALUES (1002, 20, 1, SYSDATE, 'Ph•ng A102', 1, 30, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE); -- Th?y Tu?n d?y
  3  INSERT INTO CLASS VALUES (1003, 30, 1, SYSDATE, 'Ph•ng A103', 1, 30, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE); -- Th?y Tu?n d?y
  4  INSERT INTO CLASS VALUES (1004, 40, 1, SYSDATE, 'Ph•ng A104', 1, 30, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE); -- Th?y Tu?n d?y
  5  INSERT INTO CLASS VALUES (1005, 50, 1, SYSDATE, 'Ph•ng A105', 1, 30, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE); -- Th?y Tu?n d?y
  6  INSERT INTO CLASS VALUES (1006, 10, 2, SYSDATE, 'Ph•ng B201', 2, 30, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE); -- C“ Mai d?y
  7  
SQL> -- 5. B?NG ENROLLMENT
SQL> INSERT INTO ENROLLMENT VALUES (101, 1001, SYSDATE, 95, SYSDATE, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE); -- 95 -> A
  2  INSERT INTO ENROLLMENT VALUES (101, 1002, SYSDATE, 85, SYSDATE, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE); -- 85 -> B
  3  INSERT INTO ENROLLMENT VALUES (101, 1003, SYSDATE, 75, SYSDATE, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE); -- 75 -> C
  4  INSERT INTO ENROLLMENT VALUES (102, 1001, SYSDATE, 65, SYSDATE, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE); -- 65 -> D
  5  INSERT INTO ENROLLMENT VALUES (102, 1002, SYSDATE, 45, SYSDATE, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE); -- 45 -> F
  6  INSERT INTO ENROLLMENT VALUES (103, 1006, SYSDATE, NULL, SYSDATE, 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE); -- Chua c¢ di?m
  7  
SQL> 
SQL> -- 6. B?NG GRADE
SQL> INSERT INTO GRADE VALUES (101, 1001, 95, 'Xu?t s?c, tu duy logic r?t t?t', 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);
INSERT INTO GRADE VALUES (101, 1001, 95, 'Xu?t s?c, tu duy logic r?t t?t', 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE)
*
ERROR at line 1:
ORA-02291: integrity constraint (HR.FK_GRADE_CLASS) violated - parent key not 
found 


SQL> INSERT INTO GRADE VALUES (101, 1002, 85, 'Gi?i, n?m v?ng ly thuy?t', 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);
INSERT INTO GRADE VALUES (101, 1002, 85, 'Gi?i, n?m v?ng ly thuy?t', 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE)
*
ERROR at line 1:
ORA-02291: integrity constraint (HR.FK_GRADE_CLASS) violated - parent key not 
found 


SQL> INSERT INTO GRADE VALUES (101, 1003, 75, 'Kh , c?n rŠn luy?n thˆm k? nang th?c h…nh', 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);
INSERT INTO GRADE VALUES (101, 1003, 75, 'Kh , c?n rŠn luy?n thˆm k? nang th?c h…nh', 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE)
*
ERROR at line 1:
ORA-02291: integrity constraint (HR.FK_GRADE_CLASS) violated - parent key not 
found 


SQL> INSERT INTO GRADE VALUES (102, 1001, 65, 'Trung bnh, n?m du?c ki?n th?c co b?n', 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);
INSERT INTO GRADE VALUES (102, 1001, 65, 'Trung bnh, n?m du?c ki?n th?c co b?n', 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE)
*
ERROR at line 1:
ORA-02291: integrity constraint (HR.FK_GRADE_CLASS) violated - parent key not 
found 


SQL> INSERT INTO GRADE VALUES (102, 1002, 45, 'Y?u, c?n “n t?p l?i to…n b? chuong trnh', 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE);
INSERT INTO GRADE VALUES (102, 1002, 45, 'Y?u, c?n “n t?p l?i to…n b? chuong trnh', 'SYSTEM', SYSDATE, 'SYSTEM', SYSDATE)
*
ERROR at line 1:
ORA-02291: integrity constraint (HR.FK_GRADE_CLASS) violated - parent key not 
found 


SQL> 
SQL> COMMIT;

Commit complete.

SQL> 
SQL> SHOW USER;
USER is "HR"
SQL> CREATE TABLE Cau1 (
  2      ID NUMBER,
  3      NAME VARCHAR2(20)
  4  );

Table created.

SQL> 
SQL> CREATE SEQUENCE Cau1Seq
  2  START WITH 5
  3  INCREMENT BY 5;

Sequence created.

SQL> 
SQL> SET SERVEROUTPUT ON;
SQL> 
SQL> DECLARE
  2      v_name VARCHAR2(50);
  3      v_id NUMBER;
  4  BEGIN
  5      -- [d] Them sinh vien dang ki nhieu mon nhat
  6      SELECT firstname || ' ' || lastname
  7      INTO v_name
  8      FROM student
  9      WHERE studentid = (
 10          SELECT studentid FROM enrollment
 11          GROUP BY studentid
 12          HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM enrollment GROUP BY studentid)
 13          FETCH FIRST 1 ROWS ONLY
 14      );
 15  
 16      INSERT INTO Cau1 (ID, NAME)
 17      VALUES (Cau1Seq.NEXTVAL, v_name);
 18      SAVEPOINT sp_a; -- Savepoint A
 19  
 20      -- [e] Them sinh vien dang ki it mon nhat
 21      SELECT firstname || ' ' || lastname
 22      INTO v_name
 23      FROM student
 24      WHERE studentid = (
 25          SELECT studentid FROM enrollment
 26          GROUP BY studentid
 27          HAVING COUNT(*) = (SELECT MIN(COUNT(*)) FROM enrollment GROUP BY studentid)
 28          FETCH FIRST 1 ROWS ONLY
 29      );
 30  
 31      INSERT INTO Cau1 (ID, NAME)
 32      VALUES (Cau1Seq.NEXTVAL, v_name);
 33      SAVEPOINT sp_b; -- Savepoint B
 34  
 35      -- [f] Them giao vien day nhieu lop nhat
 36      SELECT i.firstname || ' ' || i.lastname
 37      INTO v_name
 38      FROM instructor i
 39      WHERE i.instructorid = (
 40          SELECT instructorid FROM class
 41          GROUP BY instructorid
 42          HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM class GROUP BY instructorid)
 43          FETCH FIRST 1 ROWS ONLY
 44      );
 45  
 46      INSERT INTO Cau1 (ID, NAME)
 47      VALUES (Cau1Seq.NEXTVAL, v_name);
 48      SAVEPOINT sp_c; -- Savepoint C
 49  
 50      -- [g] SELECT INTO: lay ID cua giao vien vua them vao bien v_id
 51      SELECT ID INTO v_id
 52      FROM Cau1
 53      WHERE NAME = v_name;
 54  
 55      DBMS_OUTPUT.PUT_LINE('ID giao vien nhieu lop: ' || v_id);
 56  
 57      -- [h] Rollback giao vien nhieu lop (ve Savepoint B)
 58      ROLLBACK TO sp_b;
 59  
 60      -- [i] Them giao vien it lop nhat, dung v_id da luu
 61      SELECT i.firstname || ' ' || i.lastname
 62      INTO v_name
 63      FROM instructor i
 64      WHERE i.instructorid = (
 65          SELECT instructorid FROM class
 66          GROUP BY instructorid
 67          HAVING COUNT(*) = (SELECT MIN(COUNT(*)) FROM class GROUP BY instructorid)
 68          FETCH FIRST 1 ROWS ONLY
 69      );
 70  
 71      INSERT INTO Cau1 (ID, NAME)
 72      VALUES (v_id, v_name); -- Dung v_id (khong phai sequence)
 73  
 74      -- [j] Them lai giao vien nhieu lop, dung sequence
 75      SELECT i.firstname || ' ' || i.lastname
 76      INTO v_name
 77      FROM instructor i
 78      WHERE i.instructorid = (
 79          SELECT instructorid FROM class
 80          GROUP BY instructorid
 81          HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM class GROUP BY instructorid)
 82          FETCH FIRST 1 ROWS ONLY
 83      );
 84  
 85      INSERT INTO Cau1 (ID, NAME)
 86      VALUES (Cau1Seq.NEXTVAL, v_name); -- Dung sequence
 87  
 88      COMMIT;
 89      DBMS_OUTPUT.PUT_LINE('Hoan tat! Kiem tra: SELECT * FROM Cau1;');
 90  
 91  EXCEPTION
 92      WHEN NO_DATA_FOUND THEN
 93          DBMS_OUTPUT.PUT_LINE('Loi: Khong tim thay du lieu!');
 94          ROLLBACK;
 95      WHEN OTHERS THEN
 96          DBMS_OUTPUT.PUT_LINE('Loi: ' || SQLERRM);
 97          ROLLBACK;
 98  END;
 99  /
Loi: Khong tim thay du lieu!                                                    

PL/SQL procedure successfully completed.

SQL> 
SQL> SET SERVEROUTPUT ON;
SQL> 
SQL> DECLARE
  2      v_sid NUMBER := 101;
  3  
  4      v_fname VARCHAR2(25) := 'Bi Bo Qua';
  5      v_lname VARCHAR2(25) := 'Bi Bo Qua';
  6      v_addr VARCHAR2(50) := 'TPHCM';
  7  
  8      v_found VARCHAR2(50);
  9      v_classes NUMBER;
 10  BEGIN
 11  
 12      SELECT firstname || ' ' || lastname
 13      INTO v_found
 14      FROM student
 15      WHERE studentid = v_sid;
 16  
 17      SELECT COUNT(*)
 18      INTO v_classes
 19      FROM enrollment
 20      WHERE studentid = v_sid;
 21  
 22      DBMS_OUTPUT.PUT_LINE('Ho ten: ' || v_found);
 23      DBMS_OUTPUT.PUT_LINE('So lop dang hoc: ' || v_classes);
 24  
 25  EXCEPTION
 26      WHEN NO_DATA_FOUND THEN
 27          DBMS_OUTPUT.PUT_LINE('Sinh vien chua ton tai. Dang them moi...');
 28          INSERT INTO student (studentid, firstname, lastname, address,
 29                               registrationdate, createdby, createddate,
 30                               modifiedby, modifieddate)
 31          VALUES (v_sid, v_fname, v_lname, v_addr,
 32                  SYSDATE, USER, SYSDATE, USER, SYSDATE);
 33          COMMIT;
 34          DBMS_OUTPUT.PUT_LINE('Da them sinh vien moi: ' || v_fname || ' ' || v_lname);
 35  END;
 36  /
Ho ten: Nguy?n Lˆ Th?nh                                                         
So lop dang hoc: 0                                                              

PL/SQL procedure successfully completed.

SQL> 
SQL> 
SQL> SET SERVEROUTPUT ON;
SQL> 
SQL> DECLARE
  2      v_sid NUMBER := 999;
  3  
  4      v_fname VARCHAR2(25) := 'Nguyen';
  5      v_lname VARCHAR2(25) := 'Van Test';
  6      v_addr VARCHAR2(50) := 'Da Nang';
  7  
  8      v_found VARCHAR2(50);
  9      v_classes NUMBER;
 10  BEGIN
 11      DBMS_OUTPUT.PUT_LINE('--- TEST CASE 2: Kiem tra SV Chua Ton Tai (Ma ' || v_sid || ') ---');
 12  
 13      SELECT firstname || ' ' || lastname
 14      INTO v_found
 15      FROM student
 16      WHERE studentid = v_sid;
 17  
 18      SELECT COUNT(*)
 19      INTO v_classes
 20      FROM enrollment
 21      WHERE studentid = v_sid;
 22  
 23      DBMS_OUTPUT.PUT_LINE('Ho ten: ' || v_found);
 24      DBMS_OUTPUT.PUT_LINE('So lop dang hoc: ' || v_classes);
 25  
 26  EXCEPTION
 27      WHEN NO_DATA_FOUND THEN
 28          DBMS_OUTPUT.PUT_LINE('Sinh vien chua ton tai. Dang them moi...');
 29          INSERT INTO student (studentid, firstname, lastname, address,
 30                               registrationdate, createdby, createddate,
 31                               modifiedby, modifieddate)
 32          VALUES (v_sid, v_fname, v_lname, v_addr,
 33                  SYSDATE, USER, SYSDATE, USER, SYSDATE);
 34          COMMIT;
 35          DBMS_OUTPUT.PUT_LINE('Da them sinh vien moi: ' || v_fname || ' ' || v_lname);
 36  END;
 37  /
--- TEST CASE 2: Kiem tra SV Chua Ton Tai (Ma 999) ---                          
Sinh vien chua ton tai. Dang them moi...                                        
Da them sinh vien moi: Nguyen Van Test                                          

PL/SQL procedure successfully completed.

SQL> SET SERVEROUTPUT ON;
SQL> 
SQL> DECLARE
  2  v_instructor_id NUMBER := &ma_giao_vien;
  3  v_so_lop NUMBER;
  4  BEGIN
  5  -- Dem so lop giao vien dang day
  6      SELECT COUNT(*)
  7      INTO v_so_lop
  8      FROM class
  9      WHERE instructorid = v_instructor_id;
 10  
 11  -- Phan nhanh theo ket qua
 12      IF v_so_lop >= 5 THEN
 13      DBMS_OUTPUT.PUT_LINE('Giao vien nay nen nghi ngoi!');
 14      ELSE
 15      DBMS_OUTPUT.PUT_LINE('So lop giao vien dang day: ' || v_so_lop);
 16      END IF;
 17  
 18  EXCEPTION
 19  WHEN NO_DATA_FOUND THEN
 20  DBMS_OUTPUT.PUT_LINE('Khong tim thay giao vien co ma: ' ||
 21  v_instructor_id);
 22  END;
 23  /
Enter value for ma_giao_vien: 
old   2: v_instructor_id NUMBER := &ma_giao_vien;
new   2: v_instructor_id NUMBER := ;
v_instructor_id NUMBER := ;
                          *
ERROR at line 2:
ORA-06550: line 2, column 27: 
PLS-00103: Encountered the symbol ";" when expecting one of the following: 
( - + case mod new not null <an identifier> 
<a double-quoted delimited-identifier> <a bind variable> 
continue avg count current exists max min prior sql stddev 
sum variance execute forall merge time timestamp interval 
date <a string literal with character set specification> 
<a number> <a single-quoted SQL string> pipe 
<an alternatively-quoted string literal with character set specification> 
<an alternatively 


SQL> SET SERVEROUTPUT ON;
SQL> 
SQL> DECLARE
  2  v_sid NUMBER := &ma_sinh_vien;
  3  v_cid NUMBER := &ma_lop;
  4  v_score NUMBER;
  5  v_grade VARCHAR2(2);
  6  v_check NUMBER;
  7  BEGIN
  8  -- Kiem tra sinh vien ton tai
  9  SELECT COUNT(*) INTO v_check
 10  FROM student WHERE studentid = v_sid;
 11  
 12  IF v_check = 0 THEN
 13  DBMS_OUTPUT.PUT_LINE('Loi: Ma sinh vien ' || v_sid || ' khong ton tai!');
 14  RETURN;
 15  END IF;
 16  
 17  -- Kiem tra lop ton tai
 18  SELECT COUNT(*) INTO v_check
 19  FROM class WHERE classid = v_cid;
 20  IF v_check = 0 THEN
 21  DBMS_OUTPUT.PUT_LINE('Loi: Ma lop ' || v_cid || ' khong ton tai!');
 22  RETURN;
 23  END IF;
 24  
 25  -- Lay diem cua sinh vien trong lop
 26  SELECT finalgrade
 27  INTO v_score
 28  FROM enrollment
 29  WHERE studentid = v_sid AND classid = v_cid;
 30  
 31  -- Quy doi diem so sang diem chu bang CASE
 32  CASE
 33  WHEN v_score >= 90 THEN v_grade := 'A';
 34  WHEN v_score >= 80 THEN v_grade := 'B';
 35  WHEN v_score >= 70 THEN v_grade := 'C';
 36  WHEN v_score >= 50 THEN v_grade := 'D';
 37  ELSE v_grade := 'F';
 38  END CASE;
 39  
 40  DBMS_OUTPUT.PUT_LINE('Diem so: ' || v_score || ' -> Diem chu: ' ||
 41  v_grade);
 42  
 43  EXCEPTION
 44  WHEN NO_DATA_FOUND THEN
 45  DBMS_OUTPUT.PUT_LINE('Sinh vien chua dang ky lop nay hoac chua co diem!');
 46  END;
 47  /
Enter value for ma_sinh_vien: 
old   2: v_sid NUMBER := &ma_sinh_vien;
new   2: v_sid NUMBER := ;
Enter value for ma_lop: SET SERVEROUTPUT ON;
old   3: v_cid NUMBER := &ma_lop;
new   3: v_cid NUMBER := SET SERVEROUTPUT ON;;
v_sid NUMBER := ;
                *
ERROR at line 2:
ORA-06550: line 2, column 17: 
PLS-00103: Encountered the symbol ";" when expecting one of the following: 
( - + case mod new not null <an identifier> 
<a double-quoted delimited-identifier> <a bind variable> 
continue avg count current exists max min prior sql stddev 
sum variance execute forall merge time timestamp interval 
date <a string literal with character set specification> 
<a number> <a single-quoted SQL string> pipe 
<an alternatively-quoted string literal with character set specification> 
<an alternatively 


SQL> 
SQL> DECLARE
  2  -- Cursor 1: Duyet tung mon hoc
  3  CURSOR cur_course IS
  4  SELECT courseno, description
  5  FROM course
  6  ORDER BY courseno;
  7  
  8  -- Cursor 2: Lay lop hoc cua mot mon (co doi so)
  9  CURSOR cur_class (p_courseno NUMBER) IS
 10  SELECT c.classno,
 11  COUNT(e.studentid) AS so_sv
 12  FROM class c
 13  LEFT JOIN enrollment e ON c.classid = e.classid
 14  WHERE c.courseno = p_courseno
 15  GROUP BY c.classno
 16  ORDER BY c.classno;
 17  v_courseno course.courseno%TYPE;
 18  v_desc course.description%TYPE;
 19  v_classno class.classno%TYPE;
 20  v_count NUMBER;
 21  BEGIN
 22  -- Duyet cursor ngoai: tung mon hoc
 23  OPEN cur_course;
 24  LOOP
 25  FETCH cur_course INTO v_courseno, v_desc;
 26  EXIT WHEN cur_course%NOTFOUND;
 27  -- In ten mon hoc
 28  DBMS_OUTPUT.PUT_LINE(v_courseno || ' ' || v_desc);
 29  -- Mo cursor trong voi doi so la ma mon hoc hien tai
 30  OPEN cur_class(v_courseno);
 31  LOOP
 32  FETCH cur_class INTO v_classno, v_count;
 33  EXIT WHEN cur_class%NOTFOUND;
 34  DBMS_OUTPUT.PUT_LINE('Lop: ' || v_classno ||
 35  
 36  ' co so luong sinh vien dang ki: ' ||
 37  
 38  v_count);
 39  END LOOP;
 40  CLOSE cur_class;
 41  END LOOP;
 42  CLOSE cur_course;
 43  EXCEPTION
 44  WHEN OTHERS THEN
 45  IF cur_course%ISOPEN THEN CLOSE cur_course; END IF;
 46  IF cur_class%ISOPEN THEN CLOSE cur_class; END IF;
 47  DBMS_OUTPUT.PUT_LINE('Loi: ' || SQLERRM);
 48  END;
 49  /
10 H? Qu?n tr? Co s? d? li?u                                                    
20 L?p trnh Java Co b?n                                                        
50 H?c m y Co b?n                                                               

PL/SQL procedure successfully completed.

SQL> 
SQL> CREATE OR REPLACE PROCEDURE find_sname
  2  (i_student_id IN student.studentid%TYPE,
  3  o_first_name OUT student.firstname%TYPE,
  4  o_last_name OUT student.lastname%TYPE)
  5  IS
  6  BEGIN
  7  SELECT firstname, lastname
  8  INTO o_first_name, o_last_name
  9  FROM student
 10  WHERE studentid = i_student_id;
 11  
 12  EXCEPTION
 13  WHEN NO_DATA_FOUND THEN
 14  o_first_name := NULL;
 15  o_last_name := NULL;
 16  DBMS_OUTPUT.PUT_LINE('Khong tim thay sinh vien ID: ' ||
 17  i_student_id);
 18  END find_sname;
 19  /

Procedure created.

SQL> 
SQL> CREATE OR REPLACE PROCEDURE print_student_name
  2  (i_student_id IN student.studentid%TYPE)
  3  IS
  4  v_first student.firstname%TYPE;
  5  v_last student.lastname%TYPE;
  6  BEGIN
  7  -- Goi thu tuc find_sname da co san
  8  find_sname(i_student_id, v_first, v_last);
  9  
 10  IF v_first IS NOT NULL OR v_last IS NOT NULL THEN
 11  DBMS_OUTPUT.PUT_LINE('Ho ten sinh vien: ' || v_first || ' ' ||
 12  v_last);
 13  END IF;
 14  END print_student_name;
 15  /

Procedure created.

SQL> 
SQL> 
SQL> BEGIN
  2  print_student_name(101);
  3  END;
  4  /
Ho ten sinh vien: Nguy?n Lˆ Th?nh                                               

PL/SQL procedure successfully completed.

SQL> 
SQL> CREATE OR REPLACE PROCEDURE Discount
  2  IS
  3  BEGIN
  4  FOR rec IN (
  5  SELECT c.courseno, c.description, c.cost
  6  FROM course c
  7  WHERE (SELECT COUNT(*) FROM enrollment e
  8  JOIN class cl ON e.classid = cl.classid
  9  WHERE cl.courseno = c.courseno) > 15
 10  ) LOOP
 11  -- Giam gia 5%
 12  UPDATE course
 13  SET cost = cost * 0.95
 14  WHERE courseno = rec.courseno;
 15  
 16  DBMS_OUTPUT.PUT_LINE('Da giam gia mon hoc: ' || rec.description
 17  || ' | Gia cu: ' || rec.cost
 18  || ' | Gia moi: ' || ROUND(rec.cost * 0.95, 2));
 19  
 20  END LOOP;
 21  
 22  COMMIT;
 23  DBMS_OUTPUT.PUT_LINE('Hoan tat giam gia.');
 24  EXCEPTION
 25  WHEN OTHERS THEN
 26  ROLLBACK;
 27  DBMS_OUTPUT.PUT_LINE('Loi: ' || SQLERRM);
 28  END Discount;
 29  /

Procedure created.

SQL> 
SQL> -- Goi thu tuc:
SQL> BEGIN Discount;
  2  END;
  3  
  4  
  5  CREATE OR REPLACE FUNCTION Total_cost_for_student
  6  (p_student_id IN student.studentid%TYPE)
  7  RETURN NUMBER
  8  IS
  9  v_total NUMBER;
 10  v_check NUMBER;
 11  BEGIN
 12  -- Kiem tra sinh vien co ton tai khong
 13  SELECT COUNT(*) INTO v_check
 14  FROM student WHERE studentid = p_student_id;
 15  
 16  IF v_check = 0 THEN
 17  RETURN NULL; -- Sinh vien khong ton tai
 18  END IF;
 19  
 20  -- Tinh tong chi phi: sum(cost cua tung mon da dang ky)
 21  SELECT NVL(SUM(co.cost), 0)
 22  INTO v_total
 23  FROM enrollment e
 24  JOIN class cl ON e.classid = cl.classid
 25  JOIN course co ON cl.courseno = co.courseno
 26  WHERE e.studentid = p_student_id;
 27  
 28  RETURN v_total;
 29  
 30  EXCEPTION
 31  WHEN OTHERS THEN
 32  RETURN NULL;
 33  END Total_cost_for_student;
 34  /
CREATE OR REPLACE FUNCTION Total_cost_for_student
*
ERROR at line 5:
ORA-06550: line 5, column 1: 
PLS-00103: Encountered the symbol "CREATE"  


SQL> 
SQL> -- Goi ham de kiem tra:
SQL> SELECT Total_cost_for_student(101) AS "Tong chi phi" FROM DUAL;
SELECT Total_cost_for_student(101) AS "Tong chi phi" FROM DUAL
       *
ERROR at line 1:
ORA-00904: "TOTAL_COST_FOR_STUDENT": invalid identifier 


SQL> 
SQL> -- Hoac trong PL/SQL:
SQL> BEGIN
  2  DBMS_OUTPUT.PUT_LINE('Tong chi phi: ' || Total_cost_for_student(101));
  3  END;
  4  /
DBMS_OUTPUT.PUT_LINE('Tong chi phi: ' || Total_cost_for_student(101));
                                         *
ERROR at line 2:
ORA-06550: line 2, column 42: 
PLS-00201: identifier 'TOTAL_COST_FOR_STUDENT' must be declared 
ORA-06550: line 2, column 1: 
PL/SQL: Statement ignored 


SQL> 
SQL> -- 1. Trigger cho b?ng COURSE
SQL> CREATE OR REPLACE TRIGGER trg_course_audit
  2  BEFORE INSERT OR UPDATE ON course
  3  FOR EACH ROW
  4  BEGIN
  5      IF INSERTING THEN
  6          :NEW.CreatedBy := USER;
  7          :NEW.CreatedDate := SYSDATE;
  8      END IF;
  9      :NEW.ModifiedBy := USER;
 10      :NEW.ModifiedDate := SYSDATE;
 11  END trg_course_audit;
 12  /

Trigger created.

SQL> 
SQL> -- 2. Trigger cho b?ng CLASS
SQL> CREATE OR REPLACE TRIGGER trg_class_audit
  2  BEFORE INSERT OR UPDATE ON class
  3  FOR EACH ROW
  4  BEGIN
  5      IF INSERTING THEN
  6          :NEW.CreatedBy := USER;
  7          :NEW.CreatedDate := SYSDATE;
  8      END IF;
  9      :NEW.ModifiedBy := USER;
 10      :NEW.ModifiedDate := SYSDATE;
 11  END trg_class_audit;
 12  /

Trigger created.

SQL> 
SQL> -- 3. Trigger cho b?ng STUDENT
SQL> CREATE OR REPLACE TRIGGER trg_student_audit
  2  BEFORE INSERT OR UPDATE ON student
  3  FOR EACH ROW
  4  BEGIN
  5      IF INSERTING THEN
  6          :NEW.CreatedBy := USER;
  7          :NEW.CreatedDate := SYSDATE;
  8      END IF;
  9      :NEW.ModifiedBy := USER;
 10      :NEW.ModifiedDate := SYSDATE;
 11  END trg_student_audit;
 12  /

Trigger created.

SQL> 
SQL> -- 4. Trigger cho b?ng ENROLLMENT
SQL> CREATE OR REPLACE TRIGGER trg_enrollment_audit
  2  BEFORE INSERT OR UPDATE ON enrollment
  3  FOR EACH ROW
  4  BEGIN
  5      IF INSERTING THEN
  6          :NEW.CreatedBy := USER;
  7          :NEW.CreatedDate := SYSDATE;
  8      END IF;
  9      :NEW.ModifiedBy := USER;
 10      :NEW.ModifiedDate := SYSDATE;
 11  END trg_enrollment_audit;
 12  /

Trigger created.

SQL> 
SQL> -- 5. Trigger cho b?ng INSTRUCTOR
SQL> CREATE OR REPLACE TRIGGER trg_instructor_audit
  2  BEFORE INSERT OR UPDATE ON instructor
  3  FOR EACH ROW
  4  BEGIN
  5      IF INSERTING THEN
  6          :NEW.CreatedBy := USER;
  7          :NEW.CreatedDate := SYSDATE;
  8      END IF;
  9      :NEW.ModifiedBy := USER;
 10      :NEW.ModifiedDate := SYSDATE;
 11  END trg_instructor_audit;
 12  /

Trigger created.

SQL> 
SQL> -- 6. Trigger cho b?ng GRADE
SQL> CREATE OR REPLACE TRIGGER trg_grade_audit
  2  BEFORE INSERT OR UPDATE ON grade
  3  FOR EACH ROW
  4  BEGIN
  5      IF INSERTING THEN
  6          :NEW.CreatedBy := USER;
  7          :NEW.CreatedDate := SYSDATE;
  8      END IF;
  9      :NEW.ModifiedBy := USER;
 10      :NEW.ModifiedDate := SYSDATE;
 11  END trg_grade_audit;
 12  /

Trigger created.

SQL> 
SQL> INSERT INTO INSTRUCTOR (InstructorID, Salutation, FirstName, LastName, Address, Phone)
  2  VALUES (99, 'Th?y', 'Test', 'Trigger', 'TPHCM', '0999888777');

1 row created.

SQL> 
SQL> SELECT InstructorID, FirstName, LastName, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate
  2  FROM INSTRUCTOR
  3  WHERE InstructorID = 99;

INSTRUCTORID FIRSTNAME                 LASTNAME                                 
------------ ------------------------- -------------------------                
CREATEDBY                      CREATEDDA MODIFIEDBY                             
------------------------------ --------- ------------------------------         
MODIFIEDD                                                                       
---------                                                                       
          99 Test                      Trigger                                  
HR                             13-APR-26 HR                                     
13-APR-26                                                                       
                                                                                

SQL> 
SQL> UPDATE INSTRUCTOR SET FirstName = 'Test Update' WHERE InstructorID = 99;

1 row updated.

SQL> 
SQL> SELECT InstructorID, FirstName, LastName, CreatedBy, CreatedDate, ModifiedBy, ModifiedDate
  2  FROM INSTRUCTOR
  3  WHERE InstructorID = 99;

INSTRUCTORID FIRSTNAME                 LASTNAME                                 
------------ ------------------------- -------------------------                
CREATEDBY                      CREATEDDA MODIFIEDBY                             
------------------------------ --------- ------------------------------         
MODIFIEDD                                                                       
---------                                                                       
          99 Test Update               Trigger                                  
HR                             13-APR-26 HR                                     
13-APR-26                                                                       
                                                                                

SQL> 
SQL> 
SQL> 
SQL> CREATE OR REPLACE TRIGGER trg_max_enrollment
  2  BEFORE INSERT ON enrollment
  3  FOR EACH ROW
  4  DECLARE
  5  v_so_lop NUMBER;
  6  BEGIN
  7  -- Dem so lop sinh vien nay dang dang ky
  8  SELECT COUNT(*)
  9  INTO v_so_lop
 10  FROM enrollment
 11  WHERE studentid = :NEW.studentid;
 12  
 13  -- Neu da co 3 lop tro len thi tu choi
 14  IF v_so_lop >= 3 THEN
 15  RAISE_APPLICATION_ERROR(
 16  -20001,
 17  'Sinh vien ' || :NEW.studentid ||
 18  ' da dang ky du 3 lop! Khong the dang ky them.'
 19  );
 20  END IF;
 21  END trg_max_enrollment;
 22  /

Trigger created.

SQL> 
SQL> -- Kiem tra trigger:
SQL> -- Gia su sinh vien 101 da co 3 lop, thu them lop thu 4:
SQL> INSERT INTO enrollment (studentid, classid, enrolldate, createdby,
  2  createddate, modifiedby, modifieddate)
  3  VALUES (101, 999, SYSDATE, USER, SYSDATE, USER, SYSDATE);
INSERT INTO enrollment (studentid, classid, enrolldate, createdby,
*
ERROR at line 1:
ORA-01400: cannot insert NULL into ("HR"."ENROLLMENT"."REGISTRATIONDATE") 


SQL> -- -> Oracle se bao loi ORA-20001
SQL> SPOOL OFF
