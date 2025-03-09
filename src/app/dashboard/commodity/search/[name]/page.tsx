'use client'
import { useEffect, useState } from "react"
import { Item } from "@/app/config";
import { Card, CardContent, CardHeader } from "@mui/material";
import {
  ColumnDef,
  flexRender,
  getCoreRowModel,
  useReactTable,
} from "@tanstack/react-table"
 
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"
import React from "react";
import Link from "next/link";
import { Merriweather } from "next/font/google"

const merriweather = Merriweather({
    subsets: ['latin'],
    weight: '400',
})
 

export default function SearchResult({ params }: { params: Promise<{ name: string }> }) {
    const [ name , setName] = useState("");
    const [data, setData] = useState<Item[]>([]);
    useEffect(() => {
        const search = async () => {
            const { name } = await params;
            setName(name);
            const resp = await fetch(`/api/search/${name}`);
            const data = await resp.json();
            setData(data);
        }
        search()
    }, []);

    if (!data) {
        return <div>Loading...</div>
    }

    const columns: ColumnDef<Item>[] = [
        {
            accessorKey: 'itemid',
            header: 'Item ID',
            cell: ({ row }) => {
                return (
                    <Link className="text-sky-500 underline" href={`/dashboard/commodity/${row.original.itemid}`}>
                        {row.original.itemid}
                    </Link>
                )
            }
        },
        {
            accessorKey: 'productName',
            header: 'Product Name',
        },
        {
            accessorKey: 'quantity',
            header: 'Quantity',
        },
        {
            accessorKey: 'status',
            header: 'Status',
        },
        {
            accessorKey: 'unitcost',
            header: "Unit Cost",
        },
        {
            accessorKey: 'listprice',
            header: "List Price",
        }
    ]
    interface DataTableProps<TData, TValue> {
        columns: ColumnDef<TData, TValue>[]
        data: TData[]
    }

    function DataTable<TData, TValue>({
        columns,
        data
    }: DataTableProps<TData, TValue>) {
        const table = useReactTable({
            data,
            columns,
            getCoreRowModel: getCoreRowModel(),
        })

        return (
            <div className="rounded-md border">
            <Table>
                <TableHeader>
                {table.getHeaderGroups().map((headerGroup) => (
                    <TableRow key={headerGroup.id}>
                    {headerGroup.headers.map((header) => {
                        return (
                        <TableHead key={header.id}>
                            {header.isPlaceholder
                            ? null
                            : flexRender(
                                header.column.columnDef.header,
                                header.getContext()
                                )}
                        </TableHead>
                        )
                    })}
                    </TableRow>
                ))}
                </TableHeader>
                <TableBody>
                {table.getRowModel().rows?.length ? (
                    table.getRowModel().rows.map((row) => (
                    <TableRow
                        key={row.id}
                        data-state={row.getIsSelected() && "selected"}
                    >
                        {row.getVisibleCells().map((cell) => (
                        <TableCell key={cell.id}>
                            {flexRender(cell.column.columnDef.cell, cell.getContext())}
                        </TableCell>
                        ))}
                    </TableRow>
                    ))
                ) : (
                    <TableRow>
                    <TableCell colSpan={columns.length} className="h-24 text-center">
                        No results.
                    </TableCell>
                    </TableRow>
                )}
                </TableBody>
            </Table>
            </div>
        )
        
    }

    return (
        <div>
            <Card>
                <CardContent className="bg-slate-200">
                    <p className={`${merriweather.className} text-sky-900 font-bold text-center text-3xl
                        mb-4`}>
                        search result for <span className="text-rose-400 underline italic">"{name}"</span>
                    </p>
                    <DataTable columns={columns} data={ data}></DataTable>
                </CardContent>
            </Card>
        </div>
    )
}