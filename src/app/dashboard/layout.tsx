'use client'
import Icon from '@mdi/react';
import {
    mdiDog,
    mdiAccountSupervisor,
    mdiOrderBoolDescendingVariant,
    mdiCreditCardRefundOutline,
     mdiSale
} from '@mdi/js';
import Link from 'next/link';
import clsx from 'clsx';
import { usePathname } from 'next/navigation';
import { Toaster } from "@/components/ui/sonner"

const links = [
    { name: "Commodity", href: "/dashboard", icon: <Icon path={mdiDog} size={2} /> },
    { name: "Customers", href: "/dashboard/customer", icon: <Icon path={mdiAccountSupervisor} size={2} /> },
    { name: "Orders", href: "/dashboard/orders", icon: <Icon path={mdiOrderBoolDescendingVariant} size={2} /> },
    { name: "Cancellations", href: "/dashboard/cancellations", icon: <Icon path={mdiCreditCardRefundOutline} size={2} /> },
    {name:"Sales", href:"/dashboard/sales", icon:<Icon path={mdiSale} size={2}/>},
]

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  const pathname = usePathname();
  return (
      <div className="flex h-screen bg-indigo-500">
          <div className="flex flex-col items-center justify-center 
            w-32 gap-8">
              {links.map((l, i) => (
                  <div key={ i} className="flex flex-col justify-center items-center">
                  <Link href={l.href}
                    className={clsx("hover:bg-indigo-400 hover:rounded-md p-2", {
                      "bg-indigo-400 rounded-md": l.href === pathname
                    })}>
                          {l.icon}</Link>
                      <p>{ l.name}</p>
                  </div>))
                  }
          </div>
          <div className="flex-1 bg-slate-100 rounded-4xl p-6 text-black">
            {children}  
          </div>
          <Toaster/>
      </div>
  );
}