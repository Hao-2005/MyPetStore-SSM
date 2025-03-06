import { ChartContainer} from "@/components/ui/chart";
import { Bar, BarChart, CartesianGrid, LabelList, XAxis, YAxis } from "recharts";
import { type ChartConfig } from "@/components/ui/chart";
import { ChartTooltip, ChartTooltipContent } from "@/components/ui/chart"
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card";

const chartConfig = {

} satisfies ChartConfig

export default function Chart({ data, from, to }: { data: Array<any>, from: string, to: string }) {
    const sell = data;
    return (
        <Card className="flex-1 max-h-screen overflow-auto">
            <CardHeader>
                <CardTitle>sells statistics</CardTitle>
                        <CardDescription>from {from} to { to}</CardDescription>
            </CardHeader>
            <CardContent>
                <ChartContainer config={chartConfig}>
                <BarChart
                    accessibilityLayer
                    data={sell}
                    layout="vertical"
                    margin={{
                    right: 16,
                    }}
                >
                    <CartesianGrid horizontal={false} />
                    <YAxis
                    dataKey="itemId"
                    type="category"
                    tickLine={false}
                    tickMargin={10}
                    axisLine={false}
                    hide
                    />
                    <XAxis dataKey="value" type="number" hide />
                    <ChartTooltip
                    cursor={false}
                    content={<ChartTooltipContent indicator="line" />}
                    />
                    <Bar
                    dataKey="value"
                    layout="vertical"
                    className="fill-slate-800"
                    radius={4}
                                    
                    >
                    <LabelList
                        dataKey="name"
                        position="insideLeft"
                        offset={8}
                        className="fill-blue-500 font-bold"
                        fontSize={15}
                    />
                    <LabelList
                        dataKey="value"
                        position="right"
                        offset={8}
                        className="fill-blue-500"
                        fontSize={12}
                    />
                    </Bar>
                    </BarChart>
                    </ChartContainer>
                </CardContent>
                {/* <CardFooter className="flex-col items-start gap-2 text-sm">
                    this is a footer
                </CardFooter> */}
            </Card>
    )
}