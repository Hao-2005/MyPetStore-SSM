package org.csu.petstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/catalog")
public class CatalogController
{
    @GetMapping("text")
    public String index()
    {
        return "catalog/commodity";
    }
}
