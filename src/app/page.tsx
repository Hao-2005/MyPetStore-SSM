'use client'

import Image from "next/image";
import { FormEvent } from "react";
import { springBoot } from "./config";
import Link from "next/link";

export default function Home() {
  return (
    <div className="h-screen w-screen flex flex-row">
      
      <div className="flex flex-col w-128 bg-gradient-to-r from-indigo-500 from-10% via-sky-500 via-30% to-emerald-500 to-90%  text-white p-6">
        <div className="flex font-family-serif text-2xl italic font-bold
        justify-center" style ={{fontFamily:"Big Shoulders Inline"}}>
          Login to Manage the Petstore
        </div>
        <div className="flex-1 text-black w-1/2
          self-center
          flex flex-col justify-center">
          <form action="" method="get" onSubmit={(e) => { handleSubmit(e) }}
            className="flex flex-col gap-4 bg-white p-4 rounded-md
            ">
            <div>
              <label htmlFor="username">name</label>
              <input type="text" id="username" name="username" required
                placeholder="username" className="border-2 p-2 w-full rounded-md" />
            </div>
            <div>
              <label htmlFor="password">name</label>
              <input type="password" id="password" name="password" placeholder="password"
                className="border-2 p-2 w-full rounded-md"/>
            </div>
            <div>
              <input type="submit" value="Login"
                className="bg-sky-400 w-full p-2 text-white 
                hover:bg-sky-300 font-bold cursor-pointer
                shadow-md shadow-blue-500/50
                " />
            </div>
            <div>
              <Link href="/register" className="text-blue-500">Register Now</Link>
            </div>
          </form>
        </div>
      </div>
      
      <div className="flex-1 bg-rose-300 text-white
      bg-[url(/images/parrot-hero.jpg)] bg-cover bg-center
      flex flex-col justify-center items-center" style={{fontFamily: "Playfair Display"}}>
        <p className="font-bold text-4xl w-1/2 bg-black/50 p-5
          ">"Paws, Claws, and Efficiency:
          <span className="underline italic"> Streamline </span>
          Your Pet Store Management Today!"</p>
      </div>
    </div>
  );
}

async function handleSubmit(e: FormEvent<HTMLFormElement>) {
  e.preventDefault();
  const formData = new FormData(e.target as HTMLFormElement);
  const username = formData.get("username");
  const password = formData.get("password");
  const url = `${springBoot}/admin/login?username=${username}&password=${password}`;
  console.log(url);
  const res = await fetch(url);
  const data = await res.json();
  if (data.status === true) {
    localStorage.setItem("username", username as string);
    window.location.href = "/dashboard";
  } else {
    alert("登录失败");
  }
}