package org.csu.petstore.rest.service;

import org.csu.petstore.rest.entity.SellSummary;
import org.csu.petstore.rest.persistence.SellsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SellService {


    private SellsMapper sellsMapper;

    @Autowired
    public SellService(SellsMapper sellsMapper) {
        this.sellsMapper = sellsMapper;
    }

    public List<SellSummary> getSellSummariesBetweenDates(String startDate, String endDate) {
        return sellsMapper.getSellSummariesBetweenDates(startDate, endDate);
    }
}
