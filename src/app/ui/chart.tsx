import { ChartContainer, ChartLegend, ChartLegendContent} from "@/components/ui/chart";
import { Bar, BarChart, CartesianGrid, LabelList, XAxis, YAxis } from "recharts";
import { type ChartConfig } from "@/components/ui/chart";
import { ChartTooltip, ChartTooltipContent } from "@/components/ui/chart"
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card";

const chartConfig = {
    itemId: {
        label: "Item Id"
    },
    totalAmount: {
        label: "Amount",
        color: "#d6d3d1"
    },
    totalSales: {
        label: "Sales",
        color: "#fff"
    },


} satisfies ChartConfig

export default function Chart({ data, from, to }: { data: Array<any>, from: string, to: string }) {
    const sell = data;
    return (
        <Card className="flex-1">
            <CardHeader>
                <CardTitle>sells statistics</CardTitle>
                <CardDescription>from {from} to { to}</CardDescription>
            </CardHeader>
            <CardContent>
                <ChartContainer config={chartConfig} className="max-h-[300px] voerflow-auto">
                    <BarChart
                        accessibilityLayer
                        data={sell}
                        layout="vertical">
                        <CartesianGrid horizontal={false} />
                        <YAxis
                            dataKey="productName"
                            type="category"
                            tickLine={false}
                            axisLine={false}
                            tickFormatter={(value) => value.slice(0, 3)} />
                        <XAxis dataKey="totalAmount" type="number" hide />
                        <ChartTooltip content={<ChartTooltipContent nameKey="totalAmount" />} />
                        <ChartLegend content={<ChartLegendContent />} />
                        <Bar
                            dataKey="totalAmount"
                            layout="vertical"
                            fill="#fb923c"
                            radius={4}>
                        </Bar>
                            
                    </BarChart>
                </ChartContainer>
                
                <ChartContainer config={chartConfig} className="max-h-[300px] voerflow-auto">
                    <BarChart
                        accessibilityLayer
                        data={sell}
                        layout="vertical">
                        <CartesianGrid horizontal={false} />
                        <YAxis
                            dataKey="productName"
                            type="category"
                            axisLine={false}
                            tickLine={false}
                            tickFormatter={(value) => value.slice(0, 3)} />
                        <XAxis dataKey="totalSales" type="number" hide />
                        <ChartTooltip content={<ChartTooltipContent nameKey="totalSales" />} />
                        <ChartLegend content={<ChartLegendContent />} />
                        <Bar dataKey="totalSales" layout="vertical"
                            fill="#a3e635"
                            radius={4}></Bar>
                    </BarChart>
                </ChartContainer>
            </CardContent>
        </Card>
    )
}