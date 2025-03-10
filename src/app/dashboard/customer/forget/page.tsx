'use client'
import { springBoot } from "@/app/config";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { useState, useEffect } from "react"

export default function Forget() {

    const [data, setData] = useState([]);
    useEffect(() => {
        async function getData() {
            const res = await fetch(`${springBoot}/customer/findForget`)
            const data = await res.json();
            setData(data);
        }
        getData();
    }, []);

    return (
        <div>
            <Card className="bg-zinc-200">
                <table>
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Operation</th>
                        </tr>
                    </thead>
                    <tbody>
                        {
                            data.map((item: any, index:number) => (
                                <tr key={index}>
                                    <td><div className="text-center">{item}</div></td>
                                    <td>
                                        <div onClick={() => {
                                            const confirm = window.confirm("Are you sure you want to reset the password for this user?");
                                            if (confirm) {
                                                fetch(`${springBoot}/customer/resetPassword/${item}`)
                                                    .then(res => res.json())
                                                    .then(data => {
                                                    setData(data);
                                                    })
                                            }
                                        }} className="text-center">
                                            <Button className="cursor-pointer rounded-lg p-4 bg-sky-400 m-2 text-white">reset</Button>
                                        </div>
                                    </td>
                                </tr>
                            ))
                            
                        }
                    </tbody>
                </table>
            </Card>
        </div >
    )
}