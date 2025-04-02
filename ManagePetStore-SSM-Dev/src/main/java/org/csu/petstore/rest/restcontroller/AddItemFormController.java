package org.csu.petstore.rest.restcontroller;

import org.csu.petstore.rest.entity.AddItemForm;
import org.csu.petstore.rest.service.AddItemFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/addItemForm")
public class AddItemFormController {

    private final AddItemFormService addItemFormService;

    @Autowired
    public AddItemFormController(AddItemFormService addItemFormService) {
        this.addItemFormService = addItemFormService;
    }

    @PostMapping("/insertItem")
    public int insertItem(
            @RequestBody AddItemForm addItemForm) {
        return addItemFormService.insertItem(addItemForm);
    }

    @PostMapping("/insertInventory")
    public int insertInventory(
            @RequestBody AddItemForm addItemForm) {
        return addItemFormService.insertInventory(addItemForm);
    }

    @PostMapping("/insertProduct")
    public int insertProduct(
            @RequestBody AddItemForm addItemForm) {
        return addItemFormService.insertProduct(addItemForm);
    }
}
