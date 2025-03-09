'use client'
import { springBoot } from "@/app/config";
import { Card } from "@/components/ui/card";
import { useEffect, useState } from "react"
import { Bought, CanceledOrder } from "@/app/config";

export default function UserDetail({ params }: { params: Promise<{ id: string }> }) {

    const [data, setData] = useState<
        {
            interest: [],
            cancelingOrder: [],
            bought: Bought[],
            canceledOrder: CanceledOrder[],
        }>();
    useEffect(() => {
        async function getUserById() {
            const { id } = await params;
            const res = await fetch(`${springBoot}/customer/detail/${id}`)
            const data = await res.json();
            setData(data);
        }
        getUserById();
    })
    const { interest, cancelingOrder, bought, canceledOrder } = data || {};
    return (
        <div>
            <Card>
                <ol>
                    {
                        bought?.map((item: Bought, index: number) => (
                            <li key={index}>{item.name}</li>
                        ))
                    }
                </ol>
            </Card>
            <Card>
                <ol>
                    {
                        canceledOrder?.map((item: CanceledOrder, index: number) => (
                            <li key={index}>{item.orderId}</li>
                        ))
                    }
                </ol>
            </Card>
        </div>
    )
}