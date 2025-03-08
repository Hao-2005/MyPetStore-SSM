'use client'
import { springBoot } from "@/app/config";
import Chart from "@/app/ui/chart";
import { useParams } from "next/navigation";
import { useEffect, useState } from "react";

export default function SalesSummary() {
    const params = useParams<{ from: string; to: string }>()
    const { from = "", to = "" } = params;
    const [summary, setSummary] = useState([]);
    useEffect(() => {
        async function getData() {
            const url = `${springBoot}/sells/getSellSummaryBetweenDates?startDate=${from}&endDate=${to}`;
            const res = await fetch(url);
            const data = await res.json();
            setSummary(data);
        }
        getData();
    }, [from, to]);

    return (
        <>
            <Chart data={summary} from={from} to={to} />
        </>
    )
}