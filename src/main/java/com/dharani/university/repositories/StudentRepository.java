package com.dharani.university.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.dharani.university.pojo.Student;

public interface StudentRepository extends CrudRepository<Student, Integer> {
	public List<Student> findByDepartmentId(Integer departmentId);
}
