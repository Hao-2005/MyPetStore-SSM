import { NextRequest, NextResponse } from 'next/server';
import { getItemById } from '@/app/api/petstore';
export async function GET(request: NextRequest, { params }: { params: Promise<{ id: string }> }) {
    const { id } = await params;
    const resp = await getItemById(id);
    const data = await resp.json();
    return NextResponse.json(data);
}