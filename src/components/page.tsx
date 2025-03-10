'use client'

import { useRef, useState } from "react"
import { springBoot } from "../app/config";

export default function ImgUpload({ image, productId }: { image: string, productId: string }) {
    const fileInputRef = useRef<HTMLInputElement | null>(null);
    const [imageUrl, setImageUrl] = useState(image);
    const [status, setStatus] = useState('upload');
    return (
        <div className="bg-zinc-200 pt-10 flex flex-col w-1/2 ">
            <h1 className="text-3xl font-bold text-center pt-10 capitalize">
                Change Image
            </h1>
            <div className="mt-10 flex justify-center">
                <img src={"http://localhost:8090"+imageUrl} alt="image for the pet" width={ 200 } />
            </div>
            <div className="p-10 flex justify-center">
                <input ref={fileInputRef} type="file" accept="image/*" className="hidden"
                    onChange={(e) => {
                        setStatus('uploading')
                        const file = e.target.files?.[0];
                        console.log(file);
                        const formData = new FormData();
                        formData.append('image', file!);
                        fetch('http://localhost:8090/api/image/upload', {
                            method: 'post',
                            body: formData
                        }).then(resp => resp.json()).then(data => {
                            fetch(`${springBoot}/commodity/changeProductImage?productId=${productId}&newImageUrl=${data.url}`)
                            
                            const nextImageUrl = data.url;
                            setImageUrl(nextImageUrl);
                        }).catch(error => {
                            console.log("error: ", error);
                        }).finally(() => {
                            setStatus("upload");
                        })
                  }}/>
                <button className="bg-blue-500 px-4 py-2 text-white rounded-sm
                    self-center font-semibold" onClick={() => { 
                        fileInputRef.current?.click();
                    }}>
                    {status}
                </button>
            </div>
        </div>
    )
}