'use client'
import { springBoot } from "@/app/config";
import { useEffect, useState } from "react";
import { LXGW_WenKai_Mono_TC } from "next/font/google"
import Link from "next/link";
import { ReturnOrder, OrderVo } from '@/app/config'
import {
  Table,
  TableHeader,
  TableBody,
  TableColumn,
  TableRow,
  TableCell,
} from "@heroui/table";
import React from "react";

const geistSans = LXGW_WenKai_Mono_TC({
    weight: '400',
    subsets: ['latin'],
    display: 'swap',
    variable: '--font-geist-sans',
})

type Data = {
    returnOrder: ReturnOrder,
    orderVo: OrderVo,
}[]

export default function Cancellations() {
    const [data, setData] = useState<Data>([]);
    useEffect(() => {
        async function fetchData() {
            const resp = await fetch(`${springBoot}/refund/all`);
            const nextData = await resp.json();
            setData(nextData);
        }
        fetchData();
    }, [data])
    if (!data || data.length === 0) {
        return <div>Loading...</div>
    }

    function showStatus(status: string) {
        return status === 'W' ? 'Return Under Review' : status === 'N' ? 'Return Request Agreed' : "Return Request Refused"
    }
    function showStatusColor(status: string) {
        return status === 'W' ? 'text-yellow-500' : status === 'N' ? 'text-green-500' : "text-red-500"
    }
    function showStatusOperation({ status, orderId } : OrderVo) {
        return status === 'N' ? (<p>N\A</p>) : (<Link className="underline" href={`/dashboard/cancellations/${orderId}`}>details</Link>);
    }


    return (
        <Table isStriped isHeaderSticky>
                <TableHeader>
                    <TableColumn>Order ID</TableColumn>
                    <TableColumn>Order Date</TableColumn>
                    <TableColumn>Total Price</TableColumn>
                    <TableColumn>User</TableColumn>
                    <TableColumn>Status</TableColumn>
                    <TableColumn>Operation</TableColumn>
                </TableHeader>
                <TableBody items={data}>
                    {
                        (item) => (
                            <TableRow key={item.orderVo.orderId}>
                                <TableCell className="text-center">{item.orderVo.orderId}</TableCell>
                                <TableCell className="text-center">{item.orderVo.orderDate}</TableCell>
                                <TableCell className="text-center">{item.orderVo.totalPrice}</TableCell>
                                <TableCell className="text-center">{item.orderVo.userId}</TableCell>
                                <TableCell className={`text-center ${showStatusColor(item.orderVo.status)}`}>{showStatus(item.orderVo.status)}</TableCell>
                                <TableCell className="text-center">{ showStatusOperation(item.orderVo)}</TableCell>
                            </TableRow>
                        )
                    }
                </TableBody>
            </Table>
    )
}