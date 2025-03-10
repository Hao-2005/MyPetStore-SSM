import { NextRequest, NextResponse } from 'next/server';
import { getItemByCat } from '@/app/api/petstore';
export async function GET(request: NextRequest, { params }: { params: Promise<{ cat: string }> }) {
    const { cat } = await params;
    const resp = await getItemByCat(cat);
    const data = await resp.json();
    return NextResponse.json(data);
}