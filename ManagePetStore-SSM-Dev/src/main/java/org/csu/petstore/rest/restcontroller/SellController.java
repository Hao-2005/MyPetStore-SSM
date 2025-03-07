package org.csu.petstore.rest.restcontroller;

import org.csu.petstore.rest.entity.SellSummary;
import org.csu.petstore.rest.service.SellService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/sells")
public class SellController {

    private SellService sellService;

    @Autowired
    public SellController(SellService sellService) {
        this.sellService = sellService;
    }

    @GetMapping("/getSellSummaryBetweenDates")
    public List<SellSummary> getSellSummaryBetweenDates(
            @RequestParam(name="startDate") String startDate,
            @RequestParam(name="endDate") String endDate) {
        return sellService.getSellSummariesBetweenDates(startDate, endDate);
    }
}
