import { NextRequest, NextResponse } from 'next/server';
import { getItemByCat } from '@/app/api/petstore';
export async function GET(request: NextRequest, { params }: { params: { cat: string } }) {
    const { cat } = params;
    const resp = await getItemByCat(cat);
    const data = await resp.json();
    return NextResponse.json(data);
}