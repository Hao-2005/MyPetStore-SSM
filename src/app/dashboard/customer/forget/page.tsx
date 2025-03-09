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
            <Card>
                <ol>
                    {
                        data.map((item: any, index:number) => (
                            <li key={index}>
                                {item}
                                <div>
                                    <Button onClick={() => {
                                        fetch(`${springBoot}/customer/resetPassword/${item}`)
                                            .then(res => res.json())
                                            .then(data => {
                                                setData(data);
                                            }).catch((err) => {
                                                alert("fail: "+ err.message);
                                            })
                                    } }>reset</Button>
                                </div>
                            </li>
                        ))
                    }
                </ol>
            </Card>
        </div >
    )
}