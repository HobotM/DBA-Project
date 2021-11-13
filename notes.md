basket
    eggs    2
    milk    2
    bread   1
    sugar   1
    tea     1

CREATING THE ORDER
* create the order items
    - loop? data structure?
    - with the right price
        - check if discounted/not discounted
- get the total items in the order
    - get total items where ordereitems.orderid = order.orderid 
        => 5
- calculate the order grand total
    - += the cost of each item (that we just worked out)
- calculate the points earned
    - using some formula that we can figure out
* create the transaction
    - using the above data
* create the job

---

adding multiple basket items to order items

- in c#, get a list of all order items
    - iterate through the list and create an order item _with_ the order id
    - each order items gets its own UID, but the order ID is always the same
    - application layer takes care of multiple order items
- all _we_ need to do is add a single order item as part of an SP
- once that process is complete in C# the SP can finish filling in the rest of the data
    - creating the transaction data etc.


---

LEARN
- scripts, so we can call them
- procedures returning values, so we can use them
- calculation, so we can derive data (e.g. grand total)