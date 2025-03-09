'use client'
import React, { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { Button } from '@/components/ui/button';
import { Tinos } from "next/font/google";

import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog"
import { Input } from '@/components/ui/input';

const tinos = Tinos({
    subsets: ['latin'],
    weight: '400'
})

type Item = {
    itemid: string,
    productName: string,
    productid: string,
    quantity: number,
    description: string,
    listprice: number,
    unitcost: number,
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

    function handleSubmit(e: any) {
        e.preventDefault();
        const keyword = e.target[0].value;
        rounter.push(`/dashboard/commodity/search/${keyword}`);
    }

    return (
        <div className="bg-white p-4 rounded-md shadow-md h-full flex gap-4">
            <div className="flex flex-col gap-2">
                <Dialog>
                    <DialogTrigger className='bg-black text-white p-4 rounded-md'>Search</DialogTrigger>
                    <DialogContent>
                        <DialogHeader>
                            <DialogTitle>Search</DialogTitle>
                            <form action="" onSubmit={handleSubmit}>
                                <Input placeholder='keyword of the pet'></Input>
                                <Button type="submit" className="mt-4">Search</Button>
                            </form>
                        </DialogHeader>
                    </DialogContent>
                </Dialog>
                <p
                    onClick={async () => {
                        fetch('/api/items').then((res) => res.json()).then((data) => {
                            setData(data);
                        });
                    }}
                    className={`${tinos.className} text-3xl hover:underline cursor-pointer`}>All
                </p>
                <p
                    onClick={async () => {
                        fetch('/api/items/cat/birds').then((res) => res.json()).then((data) => {
                            setData(data);
                        });
                    }}
                    className={`${tinos.className} text-3xl hover:underline cursor-pointer`}>Birds</p>
                <p  
                    onClick={async () => {
                        fetch('/api/items/cat/fish').then((res) => res.json()).then((data) => {
                            setData(data);
                        });
                    }}
                    className={`${tinos.className} text-3xl hover:underline cursor-pointer`}>Fish</p>
                <p
                    onClick={async () => {
                        fetch('/api/items/cat/dogs').then((res) => res.json()).then((data) => {
                            setData(data);
                        });
                    }}
                    className={`${tinos.className} text-3xl hover:underline cursor-pointer`}>Dogs</p>
                <p
                    onClick={async () => {
                        fetch('/api/items/cat/cats').then((res) => res.json()).then((data) => {
                            setData(data);
                        });
                    }}
                    className={`${tinos.className} text-3xl hover:underline cursor-pointer`}>Cats</p>
                <p
                    onClick={async () => {
                        fetch('/api/items/cat/reptiles').then((res) => res.json()).then((data) => {
                            setData(data);
                        });
                    }}
                    className={`${tinos.className} text-3xl hover:underline cursor-pointer`}>Reptiles</p>

            </div>
            <div className="flex-1 max-h-full overflow-y-auto">
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
                    <tbody className="bg-slate-200">
                        {data.map((item:Item, index:number) => (
                            <tr  key={item.itemid}
                                >
                                {/* <td className="p-2 hover:underline cursor-pointer text-center"
                                    onClick={() => { rounter.push(`/dashboard/commodity/${item.itemid}`) }}>
                                    {item.itemid}</td> */}
                                <td className="hover:underline cursor-pointer">
                                    <Link href={{
                                        pathname: `/dashboard/commodity/${item.itemid}`,
                                    }}>{ item.itemid }</Link>
                                </td>
                                <td className="p-4 text-center">{item.productName}</td>
                                <td className="text-center">{item.productid}</td>
                                <td className="text-center">{item.quantity}</td>
                                <td className="text-center">{item.listprice}</td>
                                <td className="text-center">{item.supplier}</td>
                                <td className="text-center">{item.status}</td>
                                <td className="text-center">{item.attr1}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
    </div>
    )
}