'use client'
import { useEffect, useState } from "react"
import { OrderVo, springBoot } from "@/app/config"
import { Button } from "@/components/ui/button"

import {
    Row,
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
import Link from "next/link"

export default function Orders() {
    const [orders, setOrders] = useState<OrderVo[]>([]);
    const [option, setOption] = useState("All");
    const columns: ColumnDef<OrderVo>[] = [
  {
    accessorKey: "orderId",
    header: "Order ID",
  },
  {
    accessorKey: "orderDate",
    header: "Order Date",
  },
  {
    accessorKey: "userId",
    header: "User ID",
  },
  {
    accessorKey: "status",
    header: "Status",
      },
  //如果是待处理，则显示处理按钮
  ...(option === 'Pending' ? [
    {
      id: "action",
      header: "Action",
      cell: ({ row }: {row:Row<OrderVo>}) => (
                    <Button
                        variant="outline"
                        size="sm"
                        onClick={() => {
                          const confirm = window.confirm(`确认处理订单吗？${row.original.orderId}`);
                          if (confirm) {
                            fetch(`${springBoot}/order/handle/${row.original.orderId}`);
                            fetch(`${springBoot}/order/pending`)
                              .then(resp => resp.json())
                              .then(nextData => {
                                setOrders(nextData);
                              })
                          }
                        }}
                    >
                        处理
                    </Button>
      ),
    }
  ] : [])
];

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
    <div className="rounded-md border p-4">
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
    useEffect(() => {
        async function fetchOrders() {
            const resp = await fetch(`${springBoot}/order/all`);
            const nextData = await resp.json();
            setOrders(nextData);
        }

        fetchOrders();
    }, [])


    return (
        <div className="flex bg-stone-200 p-4 h-full gap-4">
            <div className="flex flex-col gap-4">
                <div onClick={() => {
                    fetch(`${springBoot}/order/all`)
                        .then(resp => resp.json())
                        .then(nextData => {
                            setOrders(nextData);
                            setOption("All");
                        })
                }}
                    className="bg-sky-400 p-2 rounded-md hover:bg-sky-200 cursor-pointer"
                    style={{
                        fontFamily: 'serif',
                        transition: 'background-color 0.3s ease-in-out',
                }}>All</div>
                <div onClick={() => {
                    fetch(`${springBoot}/order/pending`)
                        .then(resp => resp.json())
                        .then(nextData => {
                            setOrders(nextData);
                            setOption("Pending")
                        })
                }}
                    className="bg-sky-400 p-2 rounded-md hover:bg-sky-300 cursor-pointer"
                    style={{
                        fontFamily: 'serif',
                        transition: 'background-color 0.3s ease-in-out',
                }}>待处理</div>
                <div onClick={() => {
                    fetch(`${springBoot}/order/done`)
                        .then(resp => resp.json())
                        .then(nextData => {
                            setOrders(nextData);
                            setOption("Done");
                        })
                }}
                    className="bg-sky-400 p-2 rounded-md hover:bg-sky-300 cursor-pointer"
                    style={{
                        fontFamily: 'serif',
                        transition: 'background-color 0.3s ease-in-out',
                }}>已完成</div>
                <div
                    onClick={() => {
                        fetch(`${springBoot}/order/cancelling`)
                            .then(resp => resp.json())
                            .then(nextData => {
                                setOrders(nextData) 
                                setOption("Cancelling");;
                            })
                    }}
                    className="bg-sky-400 p-2 rounded-md hover:bg-sky-300 cursor-pointer"
                    style={{
                        fontFamily: 'serif',
                        transition: 'background-color 0.3s ease-in-out',
                }}>待取消</div>
                <div
                    onClick={() => {
                        fetch(`${springBoot}/order/cancelled`)
                            .then(resp => resp.json())
                            .then(nextData => {
                                setOrders(nextData) 
                                setOption("Cancelled");
                            })
                    }}
                    className="bg-sky-400 p-2 rounded-md hover:bg-sky-200 cursor-pointer"
                    style={{
                        fontFamily: 'serif',
                        transition: 'background-color 0.3s ease-in-out',
                }}>已取消</div>
            </div>
            <div className="flex-1">
                <h1 className="text-center text-2xl mb-4" style={{
                    fontFamily: 'serif',
                    fontWeight: 'bold',
                }}>{ option }</h1>
                <DataTable columns={columns} data={orders}></DataTable>
            </div>
        </div>
    )
}