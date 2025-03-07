'use client'
// import { statistics } from "@/app/data"
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card";
import { format, set } from "date-fns"
import { Button } from "@/components/ui/button"
import { useState } from "react";
import Chart from "@/app/ui/chart";
import { DatePicker } from "@/app/ui/datePicker";
import { springBoot } from "@/app/config";
import { toast } from "sonner";


type Sell = {
    itemId: string,
    productName: string,
    totalAmount: string,
    totalSales: string,
}

export default function Sells() {
    const [sell, setSell] = useState<Sell[]>([]);
    const [fromDate, setFromDate] = useState<Date>();
    const [toDate, setToDate] = useState<Date>();
    const [isSubmited, setIsSubmited] = useState(false);
    async function getSales() {
        const url = `${springBoot}/sells/getSellSummaryBetweenDates?startDate=${format(fromDate!, "yyyy-MM-dd")}&endDate=${format(toDate!, "yyyy-MM-dd")}`;
        console.log(url);
        const res = await fetch(url);
        const summary = await res.json();
        console.log(summary);
        setSell(summary);
        
    }
    function handleSubmit() {
        toast("you submitted!", {
            description: "from " + fromDate + " to " + toDate,
            action: {
                label: "undo",
                onClick: () => {
                    console.log("undo");
                }
            }
        })
        setIsSubmited(true);
        getSales();
    }
    
    return (
        <div className="flex gap-4 w-full h-sreen">
            <Card className="bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500 w-[500px]">
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