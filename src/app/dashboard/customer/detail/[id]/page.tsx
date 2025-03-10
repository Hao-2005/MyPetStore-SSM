'use client'
import { springBoot } from "@/app/config";
import { Card, CardHeader } from "@/components/ui/card";
import { useEffect, useState } from "react"
import { Bought, OrderVo, Interest } from "@/app/config";

export default function UserDetail({ params }: { params: Promise<{ id: string }> }) {
    const [option, setOption] = useState('interest');
    const [data, setData] = useState<
        {
            interest: [],
            cancelingOrder: OrderVo[],
            bought: Bought[],
            canceledOrder: OrderVo[],
            user: string,
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
    const { interest, cancelingOrder, bought, canceledOrder, user } = data || {};
    return (
        <div className="flex gap-4">
            <div className="flex flex-col gap-4">
                <div className="text-sky-900 w-fit aspect-square 
                    rounded-full bg-rose-200 p-3 flex items-center justify-center
                    font-bold">{user}</div>
                <div className="underline cursor-pointer" onClick={() => { setOption("interest") }}
                    style={{ fontFamily:'serif', color: option === 'interest' ? 'brown' : 'black' }}>Interest</div>
                <div className="underline cursor-pointer" onClick={() => { setOption("bought") }}
                    style={{fontFamily:'serif', color: option === 'bought' ? 'brown' : 'black' }}>Bought</div>
                <div className="underline cursor-pointer" onClick={() => { setOption("cancelled") }}
                    style={{fontFamily:'serif', color: option === 'cancelled' ? 'brown' : 'black' }}>Canceled Order</div>
                <div className="underline cursor-pointer" onClick={() => { setOption("cancelling") }}
                    style={{fontFamily:'serif', color: option === 'cancelling' ? 'brown' : 'black' }}>Canceling Order</div>
            </div>
            <div className="flex-1">
                {
                    option === 'interest' && (
                        <Card className="bg-zinc-200">
                            <CardHeader style={{
                                fontFamily:'serif', fontWeight:'bold', textAlign:'center', fontSize:'20px'
                            }}>Interest</CardHeader>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Views</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {
                                        interest?.map((item: Interest, index: number) => (
                                            <tr key={index} style={{
                                                padding: '10px',
                                            }}>
                                                <td><div className="text-center">{item.productId}</div></td>
                                                <td><div className="text-center">{item.viewCount}</div></td>   
                                            </tr>
                                        ))
                                    }
                                </tbody>
                            </table>
                        </Card>
                    )
                }
                {
                    option === 'bought' && (
                        <Card className="bg-zinc-200">
                            <CardHeader style={{
                                fontFamily:'serif', fontWeight:'bold', textAlign:'center', fontSize:'20px'
                            }}>Bought</CardHeader>
                            <table>
                                <thead>
                                    <tr>
                                        <th>ProductId</th>
                                        <th>CategoryId</th>
                                        <th>Name</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {
                                        bought?.map((item: Bought, index: number) => (
                                            <tr key={index} style={{
                                                padding: '10px',
                                            }}>
                                                <td><div className="text-center">{item.productId}</div></td>
                                                <td><div className="text-center">{item.categoryId}</div></td>
                                                <td><div className="text-center">{item.name}</div></td>   
                                            </tr>
                                        ))
                                    }
                                </tbody>
                            </table>
                        </Card>
                    )
                }
                { 
                    option === 'cancelled' && (
                        <Card className="bg-zinc-200">
                            <CardHeader style={{
                                fontFamily:'serif', fontWeight:'bold', textAlign:'center', fontSize:'20px'
                            }}>Canceled Order</CardHeader>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Order Date</th>
                                        <th>Item ID</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    {
                                        canceledOrder?.map((item: OrderVo, index: number) => (
                                            <tr key={index} style={{
                                                padding: '10px',
                                            }}>
                                                <td><div className="text-center">{item.orderId}</div></td>
                                                <td><div className="text-center">{item.orderDate}</div></td>
                                                <td><div className="text-center">{item.lineItems[0].itemId}</div></td>   
                                            </tr>
                                        ))
                                    }
                                </tbody>
                            </table>
                        </Card>
                    )
                }
                { 
                    option === 'cancelling' && (
                        <Card className="bg-zinc-200">
                            <CardHeader style={{
                                fontFamily:'serif', fontWeight:'bold', textAlign:'center', fontSize:'20px'
                            }}>Cancelling Order</CardHeader>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Order Date</th>
                                        <th>Item ID</th>
                                    </tr>

                                </thead>
                                <tbody>
                                    {
                                        cancelingOrder?.map((item: OrderVo, index: number) => (
                                            <tr key={index} style={{
                                                padding: '10px',
                                            }}>
                                                <td><div className="text-center">{item.orderId}</div></td>
                                                <td><div className="text-center">{item.orderDate}</div></td>
                                                <td><div className="text-center">{item.lineItems[0].itemId}</div></td>   
                                            </tr>
                                        ))
                                    }

                                </tbody>
                            </table>
                        </Card>
                    )
                }
            </div>
        </div>
    )
}