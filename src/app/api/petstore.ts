
import mysql from 'mysql2/promise'
import { NextResponse } from 'next/server'

const connectionParams = {
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '123456',
    database: 'mypetstore-ssm',
}

export async function getAllItems() {
    try { 
        const connection = await mysql.createConnection(connectionParams);
        const query =
        `SELECT
            itemid, name AS productName,
            item.productid, qty AS quantity,
            descn AS description, listprice,
            supplier, status,
            attr1, attr2, attr3, attr4, attr5
        FROM item
        NATURAL JOIN inventory
        JOIN product ON item.productid = product.productid`
        const [results] = await connection.execute(query);
        connection.end();

        return NextResponse.json(results);
    } catch (error) {
        const response = {
            error: (error as Error).message,
            returnedStatus: 200,
        }
        return NextResponse.json(response, { status: 200 });
    }
    
}


export async function getItemById(id: string) {
    try { 
        const connection = await mysql.createConnection(connectionParams);
        const query =
        `SELECT
            itemid, name AS productName,
            item.productid, qty AS quantity,
            descn AS description, listprice,
            supplier, status,
            attr1, attr2, attr3, attr4, attr5
        FROM item
        NATURAL JOIN inventory
        JOIN product ON item.productid = product.productid
        WHERE itemid = ${id}`
        const [results] = await connection.execute(query);
        connection.end();

        return NextResponse.json(results);
    } catch (error) {
        const response = {
            error: (error as Error).message,
            returnedStatus: 200,
        }
        return NextResponse.json(response, { status: 200 });
    }
}