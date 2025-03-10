import { getItemByName } from '@/app/api/petstore'
import { NextRequest, NextResponse } from 'next/server';

export async function GET(request: NextRequest, { params }: { params: Promise<{ name: string }> }) {
    const { name } = await params;
    const resp = await getItemByName(name);
    const data = await resp.json();
    return NextResponse.json(data);
}