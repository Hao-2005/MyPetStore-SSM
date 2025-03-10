package org.csu.petstore.rest.persistence;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.csu.petstore.rest.entity.AddItemForm;

@Mapper
public interface AddItemFormMapper {
    @Insert(
            """
            INSERT INTO  item 
            (itemid, productid, listprice, unitcost, supplier, status, attr1, attr2, attr3, attr4, attr5)
            """)
    int insertItem(AddItemForm addItemForm);

    @Insert(
            """
            INSERT INTO  inventory 
            (itemid, qty)
            VALUES 
            (#{itemid}, #{qty})
            """)
    int insertInventory(AddItemForm addItemForm);

    @Insert(
            """
            INSERT INTO  product 
            (productid, category, name, descn)
            """)
    int insertProduct(AddItemForm addItemForm);
}
