package com.hana.app.service;

import com.hana.app.data.dto.One2oneDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.One2OneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class One2OneService implements HanaService<Integer, One2oneDto> {

    final One2OneRepository one2OneRepository;
    @Override
    public int add(One2oneDto one2oneDto) throws Exception {
        return one2OneRepository.insert(one2oneDto);
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
