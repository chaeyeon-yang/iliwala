package com.hana.app.service;

import com.hana.app.data.dto.One2oneDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.CustomerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustomerService implements HanaService<Integer, One2oneDto> {

    final CustomerRepository customerRepository;
    @Override
    public int add(One2oneDto one2oneDto) throws Exception {
        return customerRepository.insert(one2oneDto);
    }

    @Override
    public int del(Integer integer) throws Exception {
        return 0;
    }

    @Override
    public int modify(One2oneDto one2oneDto) throws Exception {
        return 0;
    }

    @Override
    public One2oneDto get(Integer integer) throws Exception {
        return null;
    }

    @Override
    public List<One2oneDto> get() throws Exception {
        return null;
    }
}
