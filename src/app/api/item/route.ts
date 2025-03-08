import { NextResponse } from 'next/server';
import { getItemById } from '@/app/api/petstore';

export async function GET() {
  const resp = await getItemById("EST-10");
  const data = await resp.json();
  return NextResponse.json(data);
}