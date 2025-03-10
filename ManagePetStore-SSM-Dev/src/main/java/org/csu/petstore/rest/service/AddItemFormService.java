package org.csu.petstore.rest.service;

import org.csu.petstore.rest.entity.AddItemForm;
import org.csu.petstore.rest.persistence.AddItemFormMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddItemFormService {

    private AddItemFormMapper addItemFormMapper;

    @Autowired
    public AddItemFormService(AddItemFormMapper addItemFormMapper) {
        this.addItemFormMapper = addItemFormMapper;
    }

    public int insertItem(AddItemForm addItemForm) {
        return addItemFormMapper.insertItem(addItemForm);
    }

    public int insertInventory(AddItemForm addItemForm) {
        return addItemFormMapper.insertInventory(addItemForm);
    }

    public int insertProduct(AddItemForm addItemForm) {
        return addItemFormMapper.insertProduct(addItemForm);
    }
}
