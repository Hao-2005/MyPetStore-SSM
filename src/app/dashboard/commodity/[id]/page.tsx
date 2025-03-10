'use client'
import { useParams } from 'next/navigation';
import React, { useEffect, useState } from 'react';
import { springBoot, type Item as ItemType } from '@/app/config'
import { Button, Card } from '@mui/material';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import ImgUpload from '@/components/page';

function parseDescription(raw: string) {
    return {
        image: raw.match(/<image\s+src="(.*?)"/)?.[1] || '',
        text: raw.split('>')[1]?.trim() || ''
    };
}
export default function Item() {
    const params = useParams();
    const { id } = params;
    const [data, setData] = useState<ItemType | null>(null);
    const [loading, setLoading] = useState(false); // 添加 loading 状态管理
    const [error, setError] = useState<Error | string | null>(null); // 添加 error 状态管理
    const [selectedAttr, setSelectedAttr] = useState<string>('attr1'); // 默认选择 attr1
    
    useEffect(() => {
        async function fetchData() {
            try {
                const resp = await fetch(`/api/items/${id}`);
                const nextData = (await resp.json())[0];
                console.log(nextData);
                setData(nextData);
            } catch (error) {
                setError(error instanceof Error ? error : new Error(String(error)));
            } finally {
                setLoading(false);
            }
        }

        fetchData();
    }, [id]);

    if (loading) {
        return <div>Loading...</div>;
    }
    if (error) {
        return <div>Error: {String(error)}</div>;
    }
    if (!data) return <div>Not Found</div>;

    const attrFields = Object.keys(data).filter((key) => key.startsWith('attr'));
    let { image, text } = parseDescription(data.description);
    if (image[0] != '/') {
        image = image.slice(2);
    }

    function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
        e.preventDefault();
        const formData = new FormData(e.target as HTMLFormElement);
        const itemVo = {
            itemId: formData.get("itemId"),
            listPrice: formData.get("listprice"),
            unitCost: formData.get("unitcost"),
            status: formData.get("status"),
            attribute1: formData.get("attr1"),
            attribute2: formData.get("attr2"),
            attribute3: formData.get("attr3"),
            attribute4: formData.get("attr4"),
            productId: formData.get("productid"),
            quantity: formData.get("quantity"),
        }
        console.log(itemVo);
        fetch(`${springBoot}/commodity/updateItem`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(itemVo),
        }).then(resp => resp.json()).then(data => {
            if (data.status === "success") {
                //toast.success("修改成功");
                alert("商品信息修改成功");
            }
        }).catch(err => {
            alert("商品信息修改失败");
        });
        fetch(`${springBoot}/commodity/modifyStock/${itemVo.itemId}/${itemVo.quantity}`)
            .then(resp => resp.json()).then(data => {
                alert(data.message);
            }).catch(err => {
                alert("库存信息修改失败");
            });
    }

    return (
        <div className='flex'> 
            <Card className="p-4">
                <form action="" className="flex  gap-4 w-fit" onSubmit={handleSubmit}>
                    <div className="flex flex-col gap-2">
                        <div className="flex flex-col gap-2">
                            <Label htmlFor="itemId">item ID</Label>
                            <Input name='itemId' id="itemId" type="text" defaultValue={data.itemid} readOnly></Input>
                        </div>
                        <div className="flex flex-col gap-2">
                            <Label htmlFor="productid">Product ID</Label>
                            <Input type="text" id="productid" name="productid" defaultValue={data.productid} readOnly />
                        </div>
                        <div className="flex flex-col gap-2">
                            <Label htmlFor="productName">Product Name</Label>
                            <Input name="productName" id="productName"
                                type="text" defaultValue={data.productName} ></Input>
                        </div>
                        <div className="flex flex-col gap-2">
                            <Label htmlFor="quantity">Quantity</Label>
                            <Input type="text" id="quantity" name="quantity" defaultValue={data.quantity} />
                        </div>
                        <div className="flex flex-col gap-2">
                            <Label htmlFor="listprice">List Price</Label>
                            <Input type="text" id="listprice" name="listprice" defaultValue={data.listprice} />
                        </div>
                        <div className="flex flex-col gap-2">
                            <Label htmlFor="unitcost">Unit Cost</Label>
                            <Input type="text" id="unitcost" name="unitcost" defaultValue={data.unitcost} />
                        </div>
                    </div>
                    <div className="flex flex-col gap-2">
                        <div className="flex flex-col gap-2">
                            <Label htmlFor="supplier">Supplier</Label>
                            <Input type="text" id="supplier" name="supplier" defaultValue={data.supplier} />
                        </div>
                        <div className="flex flex-col gap-2">
                            <Label htmlFor="status">Status</Label>
                            <Input type="text" id="status" name="status" defaultValue={data.status} />
                        </div>
                        <div className="flex flex-col gap-2">
                            <Label htmlFor="attrSelect">Select Attribute</Label>
                            <select className="border-2 rounded-md p-2"
                                id="attrSelect" value={selectedAttr} onChange={(e) => setSelectedAttr(e.target.value)} >
                                {attrFields.map(attr => (
                                    <option key={attr} value={attr}>{attr}</option>
                                ))}
                            </select>
                        </div>
                        {attrFields.map(attr => (
                            <div key={attr} className={`flex flex-col gap-2 ${selectedAttr !== attr ? 'hidden' : ''}`}>
                                <Label htmlFor={attr}>{attr}</Label>
                                <Input type="text" id={attr} name={attr} defaultValue={data[attr as keyof ItemType]} />
                            </div>
                        ))}
                        <div className="bg-lime-100 w-fit rounded-md">
                            <Button type="submit">Update</Button>
                        </div>
                    </div>
                </form>
            </Card>
            <ImgUpload image={image} productId={ data.productid}></ImgUpload>
         </div>
    )
}