import { Pie, PieChart } from "recharts";

import {
  Card,
  CardContent,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import {
  ChartConfig,
  ChartContainer,
  ChartTooltip,
  ChartTooltipContent,
} from "@/components/ui/chart";

const chartConfig = {
    totalAmount: {
        label: "Total Amount",
    },
    totalSales: {
        label: "Total Sales",
    },
} satisfies ChartConfig;
export default function MyPieChart({ type, amount, data }: {type:string, amount:string, data:any}) {
    return (

        <Card className="flex-1 flex flex-col">
            <CardHeader className="items-center pb-0">
                    <CardTitle>Most {type} { amount } pets</CardTitle>
            </CardHeader>
            <CardContent className="flex-1 pb-0">
            <ChartContainer config={chartConfig} >
                <PieChart>
                    <ChartTooltip content={<ChartTooltipContent hideLabel />} />
                        <Pie dataKey={ type === 'popular'? "totalAmount" : "totalSales"} label nameKey="productName" data={data} />
                </PieChart>
            </ChartContainer>
            </CardContent>
        </Card>
    )
}