--- students table ---
CREATE INDEX "students_id" ON "students"("id") ;

---courses table---
CREATE INDEX "courses_department_number_semester" ON
"courses"("department","number","semester") ;
CREATE INDEX "courses_title_semester" ON "courses"("title","semester") ;

--enrollments table--
CREATE INDEX "enrollments_student_id" ON "enrollments"("student_id") ;
CREATE INDEX "enrollments_course_id" ON "enrollments"("course_id") ;

---satisfies table---
CREATE INDEX "satisfies_course_id" ON "satisfies"("course_id") ;
CREATE INDEX "satisfies_requirements_id" ON "satisfies"("requirements_id") ;

---students and enrollments---
CREATE INDEX "enrollments_student_id_course_id"
ON "enrollments"("students_id","course_id") ;

---courses and enrollments---
CREATE INDEX "enrollments_course_id_student_id"
ON "enrollments"("course_id","student_id") ;

---courses and satisfies---
CREATE INDEX "satisfies_course_id_requirements_id"
ON "satisfies"("course_id","requirements_id") ;

---requirements and satisfies---
CREATE INDEX "satisfies_requirement_id_course_id"
ON "satisfies"("requirement_id","course_id") ;
