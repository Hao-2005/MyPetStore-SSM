// app/api/items/route.ts
import { NextResponse } from 'next/server';
import { getAllItems } from '@/app/api/petstore';

export async function GET() {
  const resp = await getAllItems();
  const data = await resp.json();
  return NextResponse.json(data);
}