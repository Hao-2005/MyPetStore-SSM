"use client"
import { springBoot } from "@/app/config"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { ChartContainer, ChartTooltip, ChartTooltipContent } from "@/components/ui/chart";
import { CartesianGrid, Line, LineChart, XAxis } from "recharts";
import { useEffect, useState } from "react";
import { useParams } from "next/navigation";


const chartConfig = {
    totalSales: {
        label: "Total Sales",
        color: "hsl(var(--chart-1))"
    }
}
export default function Monthely() {
    const params = useParams();
    const { year } = params;
    const [saleData, setSaleDate] = useState([]);
    useEffect(() => {
        async function getMonthlySalesByYear() {
            const res = await fetch(`${springBoot}/sells/getMonthlySalesByYear?year=${year}`)
            const data = await res.json();
            setSaleDate(data);
            return data;
        }
        getMonthlySalesByYear();
    }, [year]);

    
    

    return (
        <Card className="flex-1">
            <CardHeader>
                <CardTitle>Monthly Sales in {year}</CardTitle>
                { saleData.length > 0 || <div className="text-rose-500 ">No data found</div>}
            </CardHeader>
            <CardContent>
                <ChartContainer
                    config={chartConfig}
                    className="aspect-auto h-[250px] w-full">
                    <LineChart
                        accessibilityLayer
                        data={saleData}
                        margin={{
                            left: 12,
                            right: 12,
                        }}>
                        <CartesianGrid vertical={false} />
                        <XAxis
                            dataKey="month"
                            tickLine={false}
                            axisLine={false}
                            tickMargin={4}
                            tickFormatter={(value) =>  value.substring(5, value.length) } />
                            <Line dataKey="totalSales" type="monotone"></Line>
                            <ChartTooltip
                                content={
                                    <ChartTooltipContent className="w-[150px]" />
                            }/>  
                        </LineChart>
                </ChartContainer>
            </CardContent>
        </Card>
    )
}