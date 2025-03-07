"use client"

import { zodResolver } from "@hookform/resolvers/zod"
import { useForm } from "react-hook-form"
import { z } from "zod"

import { Button } from "@/components/ui/button"
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form"
import { Input } from "@/components/ui/input"
import { springBoot } from "@/app/config"

const formSchema = z.object({
    username: z.string().min(2, {
        message: "Username must be at least 2 characters.",
    }),
    password: z.string().min(6, {
        message: "Password must be at least 6 characters."
    }),
    confirmPassword: z.string().min(6, {
        message: "Password must be at least 6 characters."
    }),
}).refine((data) => data.password === data.confirmPassword, {
    message: "Passwords don't match",
    path: ["confirmPassword"],
});

export default function RegisterForm() {
    const form = useForm<z.infer<typeof formSchema>>({
        resolver: zodResolver(formSchema),
        defaultValues: {
            username: "",
            password: "",
            confirmPassword: "",
        },
    });
     // 2. Define a submit handler.
    async function onSubmit(values: z.infer<typeof formSchema>) {
        // Do something with the form values.
        // ✅ This will be type-safe and validated.
        console.log(values)
        const username = values.username;
        const password = values.password;
        const confirmPassword = values.confirmPassword;
        const resp = await fetch(`${springBoot}/admin/register?username=${username}&password=${password}&confirmPassword=${confirmPassword}`);
        const data = await resp.json();
        if (resp.status === 200 && data.status === true) {
            window.location.href = "/";
            return;
        } else {
            alert("注册失败");
        }

    }
    return (
    <div className="w-full bg-rose-400 h-screen flex flex-col
        justify-center items-center shadow-lg bg-linear-to-r/shorter from-indigo-500 to-teal-400 to-indigo-500">
        <h1 className="text-white text-3xl mb-5 font-bold italic">Register</h1>
        <Form {...form}>
            <form onSubmit={form.handleSubmit(onSubmit)}
                className="space-y-8 bg-white w-1/4 p-4 rounded-lg">
                <FormField
                    control={form.control}
                    name="username"
                    render={({ field }) => (
                        <FormItem>
                        <FormLabel>Username</FormLabel>
                        <FormControl>
                            <Input placeholder="shadcn" {...field} />
                        </FormControl>
                        <FormDescription>
                            This is your public display name.
                        </FormDescription>
                        <FormMessage />
                        </FormItem>
                    )}
                />
                <FormField
                    control={form.control}
                    name="password"
                    render={({ field }) => (
                        <FormItem>
                        <FormLabel>Password</FormLabel>
                        <FormControl>
                            <Input placeholder="password" {...field} type="password"/>
                        </FormControl>
                        <FormDescription>
                            This is your password.
                        </FormDescription>
                        <FormMessage />
                        </FormItem>
                    )}
                />
                    <FormField
                    control={form.control}
                    name="confirmPassword"
                    render={({ field }) => (
                        <FormItem>
                        <FormLabel>Confirm your password</FormLabel>
                        <FormControl>
                            <Input placeholder="password" {...field} type="password"/>
                        </FormControl>
                        <FormDescription>
                            Type your password again.
                        </FormDescription>
                        <FormMessage />
                        </FormItem>
                    )}
                />
                <Button type="submit">Submit</Button>
            </form>
        </Form>         
    </div>
  )
}
