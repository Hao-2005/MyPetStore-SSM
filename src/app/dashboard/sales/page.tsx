import { statistics} from "@/app/data"
export default function Sales() {
    const from = statistics.from;
    const to = statistics.to;
    const data = statistics.data;
    return (
        <div>
            <h1>sells</h1>
            <p>from: {from}</p>
            <p>to: { to}</p>
            {data.map((item: Sell, index) => (<div key={index}>
                <p>{item.itemId}</p>
                <p>{item.name}</p>
                <p>{item.value}</p>
                <hr />
            </div>))}
        </div>
    )
}

type Statistic = {
    from: string,
    to: string,
    data: Sell[]
}

type Sell = {
    name: string,
    itemId: string,
    value: number
}