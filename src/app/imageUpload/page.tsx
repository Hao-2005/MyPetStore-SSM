'use client'

import { useRef } from "react"
import Image from "next/image";

export default function Home() {
    const fileInputRef = useRef<HTMLInputElement | null>(null);
    return (
        <div className="bg-zinc-200 h-screen pt-10 flex flex-col">
            <h1 className="text-3xl font-bold text-center pt-10 capitalize">
                Create your gallery
            </h1>
            <div className="flex flex-wrap gap-1 p-5 bg-black w-[650px] min-h-[300px]
              mx-auto mt-6 mb-10 rounded-md shadow-sm">
                <img src="http://localhost:8080/images/petIcon.png" alt="peticon" />
                <img src="http://localhost:8080/images/personIcon.png" alt="peticon" />
                <img src="http://localhost:8080/images/returnIcon.png" alt="peticon" />
                <img src="http://localhost:8080/images/searchIcon.png" alt="peticon" />
                <img src="http://localhost:8080/images/customerIcon.png" alt="peticon" />
                <img src="http://localhost:8080/images/orderIcon.png" alt="peticon" />
                {/* <Image src="http://localhost:8080/images/saleIcon.png" alt="peticon" width={100} height={ 100} />   */}
            </div>
            <div className="flex justify-center">
                <input ref={fileInputRef} type="file" accept="image/*" className="hidden"
                    onChange={(e) => {
                        const file = e.target.files?.[0];
                        console.log(file);
                  }}/>
                <button className="bg-blue-500 px-4 py-2 text-white rounded-sm
                self-center font-semibold" onClick={() => { 
                    fileInputRef.current?.click();
                }}>
                    upload
                </button>
            </div>
        </div>
    )
}