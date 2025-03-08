'use client'
import React, { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';

type Item = {
    itemid: string,
    productName: string,
    productid: string,
    quantity: number,
    description: string,
    listprice: number,
    supplier: number,
    status: string,
    attr1: string,
    attr2: string,
    attr3: string,
    attr4: string,
    attr5: string,
}
export default function Commodity() {
    const [data, setData] = useState<Item[]>([]);
    const rounter = useRouter();
    useEffect(() => {
        async function fetchData() {
            const resp = await fetch('/api/items');
            const nextData = await resp.json();
            setData(nextData);
        }
        fetchData();
    }, [])

    return (
        <div className="bg-white p-4 rounded-md shadow-md h-full">
            <div className="max-h-full overflow-y-auto">
                <table>
                    <thead className="sticky top-0 z-10 bg-black text-white">
                        <tr>
                            <th className="w-[150px] p-2">Item ID</th>
                            <th className="w-[150px]">Name</th>
                            <th className="w-[150px]">Product ID</th>
                            <th className="w-[150px]">Quantity</th>
                            <th className="w-[150px]">Price</th>
                            <th className="w-[150px]">Supplier</th>
                            <th className="w-[150px]">Status</th>
                            <th className="w-[150px]">Attribute</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        {data.map((item:Item, index:number) => (
                            <tr key={item.itemid}
                                >
                                {/* <td className="p-2 hover:underline cursor-pointer text-center"
                                    onClick={() => { rounter.push(`/dashboard/commodity/${item.itemid}`) }}>
                                    {item.itemid}</td> */}
                                <td className="hover:underline cursor-pointer">
                                    <Link href={{
                                        pathname: `/dashboard/commodity/${item.itemid}`,
                                    }}>{ item.itemid }</Link>
                                </td>
                                <td className="p-2 text-center">{item.productName}</td>
                                <td className="p-2 text-center">{item.productid}</td>
                                <td className="p-2 text-center">{item.quantity}</td>
                                <td className="p-2 text-center">{item.listprice}</td>
                                <td className="p-2 text-center">{item.supplier}</td>
                                <td className="p-2 text-center">{item.status}</td>
                                <td className="p-2 text-center">{item.attr1}</td>
                                <td><img src="http://localhost:8080/images/customerIcon.png" width={50} alt={ item.description} /></td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
    </div>
    )
}