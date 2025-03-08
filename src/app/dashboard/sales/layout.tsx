// npm install @mui/x-date-pickers --legacy-peer-deps
// npm install dayjs --legacy-peer-deps
// npm install @mui/material @emotion/react @emotion/styled --legacy-peer-deps
'use client'
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card";
import { format} from "date-fns"
import { Button } from "@/components/ui/button"
import { useState } from "react";
import { Input } from "@/components/ui/input";
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import { DatePicker } from '@mui/x-date-pickers/DatePicker';
import dayjs from 'dayjs';
import { useRouter } from 'next/navigation';

export default function Layout({ children }
    : { children: React.ReactNode }) {
    const [fromDate, setFromDate] = useState('');
    const [toDate, setToDate] = useState('');
    const [year, setYear] = useState<string>("");
    const [amount, setAmount] = useState<string>("");
    const router = useRouter();
    
    function handleSubmit() {
        // 避免刷新页面，使用客户端路由(next/navigation中的useRouter钩子)来实现
        router.push(`/dashboard/sales/betweenDatesSummary/${format(fromDate!, "yyyy-MM-dd")}/${format(toDate!, "yyyy-MM-dd")}`);
    }

    function handleYearSubmit() {
        if (year) {
            router.push(`/dashboard/sales/monthly/${year}`);
        }
    }

    function handlePopularSubmit() {
        if (amount) {
           router.push(`/dashboard/sales/popular/${amount}`);
        }
    }
    function handleProfitableSubmit() {
        if (amount) {
            router.push(`/dashboard/sales/profitable/${amount}`);
        }
    }
    function handleFromDateChange(date: dayjs.Dayjs | null) {
        if (date) {
            const formatedDate = date.format("YYYY-MM-DD");
            setFromDate(formatedDate);
        }
        
    }
    function handleToDateChange(date: dayjs.Dayjs | null) {
        if (date) {
            const formatedDate = date.format("YYYY-MM-DD");
            setToDate(formatedDate);
        }
    }

    return (
        <div className="flex gap-4">
           <Card className="bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500 w-[500px] ">
                <CardContent>
                    <div className="border-b-4 border-dashed border-white-500 p-4">
                        <p className="text-white font-bold text-xl">choose date to view statistics</p>
                        <p className="text-white text-xl italic">from</p>
                        <LocalizationProvider dateAdapter={AdapterDayjs}>
                            <DatePicker onChange={handleFromDateChange} className="bg-white rounded-md p-2"/>
                        </LocalizationProvider>
                        <p className="text-white text-xl italic">to</p>
                        <LocalizationProvider dateAdapter={AdapterDayjs}>
                              <DatePicker onChange={handleToDateChange} className="bg-white rounded-md p-2" />
                        </LocalizationProvider>
                        <br />
                        <Button onClick={handleSubmit} className="mt-4"
                            disabled={fromDate && toDate ? false : true}>submit</Button>
                    </div>
                    <div className="p-4 border-b-4 border-dashed border-white-500">
                        <p className="text-white font-bold text-xl">choose a year to view monthly statistics</p>
                        <Input placeholder="year" className="mt-5 p-2 bg-white" onChange={(e)=>setYear(e.target.value)}></Input>
                        <Button className="mt-4" onClick={handleYearSubmit} disabled={ year === ''}>submit</Button>
                    </div>
                    <div className="p-4">
                        <p className="text-white font-bold text-xl">Most popular/profitable</p>
                        <Input placeholder="amount" className="mt-5 p-2 bg-white" onChange={(e)=>setAmount(e.target.value)}></Input>
                        <Button className="mt-4" onClick={handlePopularSubmit} disabled={amount === ''}>see popular ones</Button>
                        <Button className="mt-4 ml-4" onClick={handleProfitableSubmit} disabled={amount === ''} >see profitable ones</Button>
                    </div>
                </CardContent>
            </Card>
            { children }
        </div>
    )
}