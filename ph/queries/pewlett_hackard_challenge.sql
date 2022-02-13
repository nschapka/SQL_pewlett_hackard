select em.emp_no,
	em.first_name,
	em.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
into retirement_titles
from employees as em
left join titles as ti
on em.emp_no = ti.emp_no
where (birth_date between '1952-01-01' and '1955-12-31');

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO retirement_unique_titles
FROM retirement_titles as rt
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT COUNT(rut.title), rut.title
into retirement_by_title
FROM retirement_unique_titles as rut
group by rut.title
order by count(rut.title) desc;

SELECT distinct on (e.emp_no) e.first_name,
	e.last_name,
	e.emp_no,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_info
FROM employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
left join titles as ti
on e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
order by emp_no;


