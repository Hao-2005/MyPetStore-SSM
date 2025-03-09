'use client'
import React, { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { Button } from '@/components/ui/button';
import { Tinos } from "next/font/google";

import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog"
import { Input } from '@/components/ui/input';

import {
    ColumnDef,
    flexRender,
    getCoreRowModel,
    useReactTable,
    getPaginationRowModel,
} from "@tanstack/react-table"
 
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"

export const columns: ColumnDef<Item>[] = [
    {
        accessorKey: "itemid",
        header: "Item ID",
        cell: ({ row }) => {
            return (
                <Link className="text-sky-500 underline" href={`/dashboard/commodity/${row.original.itemid}`}>
                    {row.original.itemid}
                </Link>
            )
        },
    },
    {
        accessorKey: "productName",
        header: "Name",
    },
    {
        accessorKey: "productid",
        header: "Product ID",
    },
    {
        accessorKey: "quantity",
        header: "Quantity",
    },
    {
        accessorKey: "listprice",
        header: "Price",
    },
    {
        accessorKey: "supplier",
        header: "Supplier",
    },
    {
        accessorKey: "status",
        header: "Status",
    },
    {
        accessorKey: "attr1",
        header: "Attribute",
    }
]

interface DataTableProps<TData, TValue> {
  columns: ColumnDef<TData, TValue>[]
  data: TData[]
}

function DataTable<TData, TValue>({
  columns,
  data,
}: DataTableProps<TData, TValue>) {
  const table = useReactTable({
      data,
      columns,
      getCoreRowModel: getCoreRowModel(),
      getPaginationRowModel: getPaginationRowModel(),
  })
 
  return (
    <div className="rounded-md border p-4 bg-stone-200">
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
          <div className="flex items-center justify-end space-x-2 py-4">
        <Button
          variant="outline"
          size="sm"
          onClick={() => table.previousPage()}
          disabled={!table.getCanPreviousPage()}
        >
          Previous
        </Button>
        <Button
          variant="outline"
          size="sm"
          onClick={() => table.nextPage()}
          disabled={!table.getCanNextPage()}
        >
          Next
        </Button>
      </div>
    </div>
  )
}

const tinos = Tinos({
    subsets: ['latin'],
    weight: '400'
})

type Item = {
    itemid: string,
    productName: string,
    productid: string,
    quantity: number,
    description: string,
    listprice: number,
    unitcost: number,
    supplier: number,
    status: string,
    attr1: string,
    attr2: string,
    attr3: string,
    attr4: string,
    attr5: string,
}
export default function Commodity() {
    const [data, setData] = useState<Item[]>([]);
    const [option, setOption] = useState('All');
    const rounter = useRouter();
    useEffect(() => {
        async function fetchData() {
            const resp = await fetch('/api/items');
            const nextData = await resp.json();
            setData(nextData);
        }
        fetchData();
    }, [])

    function handleSubmit(e: any) {
        e.preventDefault();
        const keyword = e.target[0].value;
        rounter.push(`/dashboard/commodity/search/${keyword}`);
    }

    return (
        <div className="bg-white p-4 rounded-md shadow-md h-full flex gap-4">
            <div className="flex flex-col gap-2">
                <Dialog>
                    <DialogTrigger className='bg-black text-white p-4 rounded-md'>Search</DialogTrigger>
                    <DialogContent>
                        <DialogHeader>
                            <DialogTitle>Search</DialogTitle>
                            <form action="" onSubmit={handleSubmit}>
                                <Input placeholder='keyword of the pet'></Input>
                                <Button type="submit" className="mt-4">Search</Button>
                            </form>
                        </DialogHeader>
                    </DialogContent>
                </Dialog>
                <p
                    onClick={async () => {
                        fetch('/api/items').then((res) => res.json()).then((data) => {
                            setData(data);
                            setOption('All');
                        });
                    }}
                    className={`${tinos.className} text-3xl hover:underline cursor-pointer`}>All
                </p>
                <p
                    onClick={async () => {
                        fetch('/api/items/cat/birds').then((res) => res.json()).then((data) => {
                            setData(data);
                            setOption('Birds');
                        });
                    }}
                    className={`${tinos.className} text-3xl hover:underline cursor-pointer`}>Birds</p>
                <p  
                    onClick={async () => {
                        fetch('/api/items/cat/fish').then((res) => res.json()).then((data) => {
                            setData(data);
                            setOption('Fish');
                        });
                    }}
                    className={`${tinos.className} text-3xl hover:underline cursor-pointer`}>Fish</p>
                <p
                    onClick={async () => {
                        fetch('/api/items/cat/dogs').then((res) => res.json()).then((data) => {
                            setData(data);
                            setOption('Dogs');
                        });
                    }}
                    className={`${tinos.className} text-3xl hover:underline cursor-pointer`}>Dogs</p>
                <p
                    onClick={async () => {
                        fetch('/api/items/cat/cats').then((res) => res.json()).then((data) => {
                            setData(data);
                            setOption('Cats');
                        });
                    }}
                    className={`${tinos.className} text-3xl hover:underline cursor-pointer`}>Cats</p>
                <p
                    onClick={async () => {
                        fetch('/api/items/cat/reptiles').then((res) => res.json()).then((data) => {
                            setData(data);
                            setOption('Reptiles');
                        });
                    }}
                    className={`${tinos.className} text-3xl hover:underline cursor-pointer`}>Reptiles</p>

            </div>
            <div className="flex-1 max-h-full overflow-y-auto">
                <h1 style={{
                    fontFamily: 'Tinos',
                    fontSize: '2rem',
                    textAlign: 'center',
                }}>{ option}</h1>
                <DataTable columns={columns} data={data}></DataTable>
            </div>
    </div>
    )
}