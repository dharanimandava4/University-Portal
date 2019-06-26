package com.dharani.university.repositories;

import org.springframework.data.repository.CrudRepository;

import com.dharani.university.pojo.Department;

public interface DepartmentRepository extends CrudRepository<Department, Integer> {

}
