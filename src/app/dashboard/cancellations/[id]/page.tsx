'use client'
import { springBoot } from "@/app/config";
import { useParams } from "next/navigation";
import { useState } from "react";
import { useEffect } from "react"
import { ReturnOrder, OrderVo } from "@/app/config";import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
 "@/app/config"

type ReturnOrderVo = {
    returnOrder: ReturnOrder,
    orderVo: OrderVo,
}

type Data = {
    imageBase64: string,
    returnOrderVo: ReturnOrderVo,
}

export default function Refund() {
    const { id } = useParams();
    const [data, setData] = useState<Data>();

    useEffect(() => {
        async function fectchData() {
            const resp = await fetch(`${springBoot}/refund/detail/${id}`);
            const nextData = await resp.json();
            setData(nextData);
        }
        fectchData();
    }, [])
    const { imageBase64, returnOrderVo } = data || {};
    const { orderVo, returnOrder } = returnOrderVo || {};
    async function handleAgree() {
        const resp = await fetch(`${springBoot}/refund/process/${id}/true`);
        const data = await resp.json();
        alert(data.msg);
    }
    async function handleDisagree() {
        const resp = await fetch(`${springBoot}/refund/process/${id}/false`);
        const data = await resp.json();
        alert(data.msg);
    }
    return (
            <div className="grid grid-cols-2 gap-4">
                <Card className="bg-linear-to-r from-cyan-500 to-blue-500 text-white" >
                    <CardTitle className="text-center">Refund Order # {id} of {orderVo?.userId }</CardTitle>
                    <CardHeader className="text-center italic">{ orderVo?.orderDate}</CardHeader>
                    <CardContent className="flex justify-center">
                    <table>
                        <tbody>
                            <tr>
                                <th>Reason</th>
                                <td>{ returnOrder?.reason}</td>
                            </tr>
                            <tr>
                                <th className="w-1/3">Description</th>
                                <td className="p-4">{ returnOrder?.descn}</td>
                            </tr>
                        </tbody>
                    </table>
                    <img src={imageBase64} alt={ `picture for order ${returnOrder?.orderId}`} />
                    </CardContent>
                    <div className="flex justify-center mt-4 gap-3 ">
                            <Button className="cursor-pointer" onClick={handleAgree}>Agree</Button>
                            <Button className="cursor-pointer" onClick={handleDisagree}>Disagree</Button>
                    </div>
                </Card>
                <Card className="bg-linear-to-r from-cyan-500 to-blue-500 text-white">
                    <CardTitle className="text-center">Payment Details</CardTitle>
                <table>
                    <tbody>
                        <tr>
                            <th>Card Type</th>
                            <td>{ orderVo?.cardType}</td>
                        </tr>
                        <tr>
                            <th>Card Number</th>
                            <td>{ orderVo?.creditCard}</td>
                        </tr>
                        <tr>
                            <th>Expire Date</th>
                            <td>{ orderVo?.expiryDate}</td>
                        </tr>
                    </tbody>
                    </table>
                </Card>
                <Card className="bg-linear-to-r from-cyan-500 to-blue-500 text-white">
                    <CardTitle className="text-center">Bill Address</CardTitle>
                <table>
                    <tbody>
                        <tr>
                            <th>First name</th>
                            <td>{orderVo?.billToFirstName}</td>
                            <th>City</th>
                            <td>{ orderVo?.billCity}</td>
                        </tr>
                        <tr>
                            <th>Last name</th>
                            <td>{orderVo?.billToLastName}</td>
                            <th>State</th>
                            <td>{ orderVo?.billState}</td>
                        </tr>
                        <tr>
                            <th>Addr 1</th>
                            <td>{orderVo?.billAddress1}</td>
                            <th>Zip</th>
                            <td>{ orderVo?.billZip}</td>
                        </tr>
                        <tr>
                            <th>Addr 2</th>
                            <td>{orderVo?.billAddress2}</td>
                            <th>Country</th>
                            <td>{orderVo?.billCountry}</td>
                        </tr>
                    </tbody>
                    </table>
                </Card>
                <Card className="bg-linear-to-r from-cyan-500 to-blue-500 text-white">
                    <CardTitle className="text-center">Shipping Address</CardTitle>
                <table>
                    <tbody>
                        <tr>
                            <th>First name</th>
                            <td>{orderVo?.shipToFirstName}</td>
                            <th>City</th>
                            <td>{ orderVo?.shipCity}</td>
                        </tr>
                        <tr>
                            <th>Last name</th>
                            <td>{orderVo?.shipToLastName}</td>
                            <th>State</th>
                            <td>{ orderVo?.shipState}</td>
                        </tr>
                        <tr>
                            <th>Addr 1</th>
                            <td>{orderVo?.shipAddress1}</td>
                            <th>Zip</th>
                            <td>{ orderVo?.shipZip}</td>
                        </tr>
                        <tr>
                            <th>Addr 2</th>
                            <td>{orderVo?.shipAddress2}</td>
                            <th>Country</th>
                            <td>{orderVo?.shipCountry}</td>
                        </tr>
                        <tr>
                            <th>Courier</th>
                            <td>{orderVo?.courier}</td>
                            <th>Status</th>
                            <td>{ orderVo?.status}</td>
                        </tr>
                    </tbody>
                    </table>
                </Card>
            </div>
    )

}