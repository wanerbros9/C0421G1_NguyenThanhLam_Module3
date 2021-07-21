USE quanlysinhvien;

SELECT studentname
	FROM student WHERE StudentName LIKE 'h%';

SELECT * FROM class
	WHERE month(startdate)=12;
    
select * from `subject`
	WHERE Credit between 3 and 5;
    
update student set classid = 2 where studentname = 'hung';

select studentname, mark, subname
FROM student
		INNER join mark on student.StudentId = mark.StudentId
        inner join `subject` on `subject`.SubId = mark.SubId
ORDER BY Mark desc, StudentName asc