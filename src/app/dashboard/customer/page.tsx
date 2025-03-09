'use client'
import { Card } from "@/components/ui/card";
import { springBoot, UserVo } from "@/app/config";
import { useEffect, useState } from "react";
import { Miriam_Libre } from "next/font/google";
import Link from "next/link";

const miriamLibre = Miriam_Libre({
    weight: '400',
    subsets: ['latin'],
})



export default function Customers() {
    const [users, setUsers] = useState<UserVo[]>([]);
    useEffect(() => {
        async function getAllUsers() {
            const res = await fetch(`${springBoot}/customer/findAll`)
            const data = await res.json();
            setUsers(data);
        }
        getAllUsers();
    }, [])

    return (
        <div className="flex gap-4">
            <div className="p-2 bg-sky-400 w-fit h-fit rounded-lg">
                <Link href="/dashboard/customer/forget" className={ `${miriamLibre.className} cursor-pointer hover:underline`}>Reset Password</Link>
            </div>
            <Card className="flex-1 bg-linear-to-bl from-violet-500 to-fuchsia-500">
                <table>
                    <thead>
                        <tr className="text-white">
                            <th>ID</th>
                            <th>Password</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        {
                            users.map((user: UserVo, index: number) => (
                                <tr key={index} className="text-white" style={{
                                    width: "100%",
                                    border: "1px solid white",
                                    backgroundColor: index % 2 === 0 ? "rgba(255, 255, 255, 0.1)" : "rgba(255, 255, 255, 0.2)"
                                }}>
                                    <td className="text-center underline" style={{
                                        padding: '10px'
                                    }}><Link href={`/dashboard/customer/detail/${user.userId}`}>{user.userId}</Link></td>
                                    <td className="text-center">{user.password}</td>
                                    <td className="text-center">{user.userEmail}</td>
                                </tr>
                            ))
                        }
                    </tbody>
                </table>
            </Card>
        </div>
    )
}