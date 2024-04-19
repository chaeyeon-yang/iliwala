package com.hana.app.repository;

import com.hana.app.data.dto.One2oneDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface CustomerRepository extends HanaRepository<Integer, One2oneDto> {
}
