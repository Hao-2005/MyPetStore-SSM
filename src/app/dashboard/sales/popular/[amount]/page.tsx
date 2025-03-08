'use client';
import { colors } from "@/app/config";
import { springBoot } from "@/app/config";
import { useEffect, useState } from "react";
import { useParams } from "next/navigation";
import MyPieChart from "@/app/ui/piechart";

interface DataEntry {
  itemId: string;
  productName: string;
  totalAmount: number;
  totalSales: number;
  month: null;
}

export default function Component() {
    const { amount } = useParams();
    const [data, setData] = useState<DataEntry[]>([]);

  useEffect(() => {
      async function fetchData() {
            const res = await fetch(`${springBoot}/sells/getHistoricalPopularItem?amount=${amount}`);
            const fetchData = await res.json();
            console.log('Fetched data:', fetchData);
            const nextData = fetchData.map((item: DataEntry, index: number) => ({
                ...item,
                fill: colors[index % colors.length]
            }));
            setData(nextData);
    }
    fetchData();
  }, [amount]);
    const validAmount = Array.isArray(amount) ? amount[0] || '1' : amount || '1';

  return (
      <MyPieChart type="popular" amount={validAmount} data={data}></MyPieChart>
  );
}