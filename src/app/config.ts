export const springBoot = "http://localhost:8080/api"

export const colors = ["#f87171", "#fca5a5", "#fcd34d", "#fde047", "#bef264", "#86efac", "#5eead4", "#93c5fd", "#fda4af"]

export type ReturnOrder = {
    orderId: string,
    reason: string,
    descn: string,
    image: string,
    status: string,
}

export type OrderVo = {
    orderId: number,
    userId: string,
    orderDate: string,
    shipAddress1: string,
    shipAddress2: string,
    shipCity: string,
    shipState: string,
    shipZip: string,
    shipCountry: string,
    billAddress1: string,
    billAddress2: string,
    billCity: string,
    billState: string,
    billZip: string,
    billCountry: string,
    courier: string,
    totalPrice: number,
    billToFirstName: string,
    billToLastName: string,
    shipToFirstName: string,
    shipToLastName: string,
    creditCard: string,
    expiryDate: string,
    cardType: string,
    locale: string,
    status: string,
    lineItems: [LineItem]
}

export type LineItem = {
    orderId: number,
    lineNumber: number,
    itemId: string,
    quantity: number,
    unitPrice: number
}

export type Item = {
    itemid: string,
    productName: string,
    productid: string,
    quantity: number,
    description: string,
    listprice: number,
    supplier: number,
    status: string,
    attr1: string,
    attr2: string,
    attr3: string,
    attr4: string,
    attr5: string,
}