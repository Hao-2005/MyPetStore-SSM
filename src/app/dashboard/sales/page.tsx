'use client'
import { statistics } from "@/app/data"
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card";
import { format, set } from "date-fns"
import { Button } from "@/components/ui/button"
import { useState } from "react";
import Chart from "@/app/ui/chart";
import { DatePicker } from "@/app/ui/datePicker";


type Sell = {
    name: string,
    itemId: string,
    value: number
}

export default function Sells() {
    const [sell, setSell] = useState<Sell[]>([]);
    const [fromDate, setFromDate] = useState<Date>();
    const [toDate, setToDate] = useState<Date>();
    const [isSubmited, setIsSubmited] = useState(false);
    async function getSales() {
        setSell(statistics.data);
        if (Math.random() < 0.5) {
            setSell([{name:"test", itemId:"test", value: 100}, ...statistics.data])
        }
    }
    function handleSubmit() {
        alert("from " + fromDate + " to " + toDate)
        setIsSubmited(true);
        getSales();
    }
    
    return (
        <div className="flex gap-4 w-full h-sreen">
            <Card className="bg-slate-500 w-[500px]">
                <CardHeader className="text-white font-bold text-xl">
                    choose date to view statistics
                </CardHeader>
                <CardContent>
                    <DatePicker
                        label="from"
                        date={fromDate}
                        onDateChange={setFromDate}></DatePicker>
                    <DatePicker
                        label="to"
                        date={toDate}
                        onDateChange={setToDate}></DatePicker>
                    <br />
                    <Button onClick={handleSubmit} className="mt-4"
                        disabled={ fromDate && toDate ? false:true}>submit</Button>
                </CardContent>
            </Card>
            {isSubmited && (
                <Chart
                    data={sell}
                    from={format(fromDate!, "yyyy-MM-dd")}
                    to={format(toDate!, "yyyy-MM-dd")
                    }></Chart>
            )}
        </div>
    
    )
}