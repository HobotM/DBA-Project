create table tmpCustomer
(
	id	int primary key identity (1, 1) not null,
	name varchar(10)
);

create table tmpEmail
(
    id	int primary key identity (1, 1) not null,
	custId int foreign key references tmpCustomer(id) on update cascade on delete cascade,
	name varchar(20)
);


use AMMTescoProject;

go
    create table tblCustomer (
        customerId int primary key identity (1, 1) not null,
        addressId int,
        fName varchar(50),
        lName varchar(50),
        emailId int,
        phoneNo varchar(11)
    );

go
    create table tblAddress (
        addressId int primary key identity (1, 1) not null,
        addLine1 varchar(50) not null,
        addLine2 varchar(50) not null,
        addLine3 varchar(50) not null,
        townCity varchar(50) not null,
        postcode varchar(10) not null,
        eveningPhone varchar(11) not null,
        daytimePhone varchar(11) not null,
        mobile varchar(11),
        description varchar(50) not null
    );

go
    create table tblCustomerEmail (
        emailId int primary key identity (1, 1) not null,
        customerId int not null references tblCustomer(customerId) on update cascade on delete cascade,
        email varchar(50)
    );

go
    create table tblCustomerLogin (
        loginId int primary key identity (1, 1) not null,
        customerId int not null references tblCustomer(customerId) on update no action on delete cascade,
        password varbinary(128),
        passwordLastChanged smalldatetime,
        lastLogin smallDateTime
    );

go
    create table tblClubCard (
        clubCardId int primary key identity (1, 1) not null,
        customerId int not null references tblCustomer(customerId) on update no action on delete cascade,
        balance int,
        creationDate smalldatetime not null
    );

go
    create table tblAltAddress (
        altAddressId int primary key identity (1, 1) not null,
        customerId int not null references tblCustomer(customerId) on update no action on delete cascade,
        addressId int not null references tblAddress(addressId) on update no action on delete cascade
    );

go
    create table tblDivision(
        divisionId int primary key identity (1, 1) not null,
        divisionName varchar(50)
    );

go
    create table tblRegion(
        regionId int primary key identity (1, 1) not null,
        divisionId int not null references tblDivision(divisionId) on update no action on delete no action,
        regionName varchar(50)
    );

go
    create table tblStaff (
        staffId int primary key identity (1, 1) not null,
        storeId int,
        addressId int references tblAddress(addressId) on update no action on delete no action,
        managerId int foreign key references tblStaff(staffId),
        fName varchar(50),
        lName varchar(50),
        fullName as (rtrim([fName] + ' ' + [lName])),
        gender nchar(2) null check (
            gender = 'M'
            OR gender = 'F'
            OR gender = 'NB'
        ) default 'NB',
        phone varchar(11),
        dob datetime,
        hireDate datetime,
        salary int,
        email varchar(50),
        NIN varchar(9),
        title varchar(50)
    );

go
    create table tblStore (
        storeId int primary key identity (1, 1) not null,
        regionId int not null references tblregion(regionId),
        addressId int not null references tblAddress(addressId),
        managerId int not null references tblStaff(staffId),
        name varchar(50) not null,
        type nchar(1) not null check (
            type = 'H'
            OR type = 'S'
            OR type = 'M'
        ) default 'M',
        phone varchar(11)
    );

go
    create table tblDepartment(
        departmentId int primary key identity (1, 1) not null,
        name varchar(20)
    );

go
    create table tblProduct (
        productId int primary key identity (1, 1) not null,
        departmentId int not null references tblDepartment(departmentId),
        SKU varchar(20) not null,
        price float not null,
        brand varchar(30) not null,
        description varchar(100),
        name varchar(30) not null,
        tagline varchar(50),
        discounted int not null check(
            discounted = 0
            OR discounted = 1
        ) default 0,
        weight float
    );

create table tblDeliverySlot (
    slotId int primary key identity (1, 1) not null,
    storeId int not null references tblStore(storeId),
    slotDateTime datetime not null,
    cost float not null,
    slotStatus nchar(1) not null check(
        slotStatus = 0
        OR slotStatus = 1
    ) default 0,
    isFlex nchar(1) not null check(
        isFlex = 0
        OR isFlex = 1
    ) default 0
);

go
    create table tblPickupSlot (
        slotId int primary key identity (1, 1) not null,
        storeId int not null references tblStore(storeId),
        slotDateTime datetime not null,
        cost float not null,
        slotStatus nchar(1) not null check(
            slotStatus = 0
            OR slotStatus = 1
        ) default 0,
    );

create table tblOrder (
    orderId int primary key identity (1, 1) not null,
    customerId int not null references tblCustomer(customerId),
    deliverySlotid int null references tblDeliverySlot(slotId),
    pickupSlotId int null references tblPickupSlot(slotId),
);

go
    create table tblTransaction(
        transactionId int primary key identity (1, 1) not null,
        orderId int not null,
        transactionStatus nchar(1) not null check(
            transactionStatus = 'P'
            OR transactionStatus = 'C'
            OR transactionStatus = 'C'
            OR transactionStatus = 'R'
        ) default 'P',
        transactionDate datetime not null,
        cardType nchar(2) not null,
        startDate date null,
        expiryDate date not null,
        amount float not null
    );

go
    create table tblOrder (
        orderId int primary key identity (1, 1) not null,
        customerId int references tblCustomer(customerId) not null,
        addressId int references tblAddress(addressId) not null,
        pickupSlot int references tblPickupSlot(slotId) null,
        deliverySlot int references tblDeliverySlot(slotId) null,
        creationDate smalldatetime not null,
        modifiedDate smalldatetime not null,
        grandTotal float not null default 0.0,
        itemCount int not null default 0,
        pointsEarned int not null default 0,
        fulfilmentInstructions varchar(100)
    );

go
    create table tblOrderItem (
        itemId int primary key identity (1, 1) not null,
        orderId int foreign key references tblOrder(orderId) not null,
        productId int foreign key references tblProduct(productId) not null,
        quantity int not null,
        price float not null,
        totalPrice as ([quantity] * [price])
    );

go
    create table tblDiscountedPrice(
        discountId int primary key identity (1, 1) not null,
        productId int references tblProduct(productId) not null,
        price float
    );

go
    create table tblProductReview (
        productReviewId int primary key identity (1, 1) not null,
        productId int references tblProduct(productId) not null,
        customerId int references tblCustomer(customerId) not null,
        bodyText varchar(1000) not null,
        headlineText varchar(50) not null,
        rating int check(
            rating >= 0
            AND rating <= 100
        )
    );

go
    create table tblDeliveryJob (
        jobId int primary key identity (1, 1) not null,
        orderId int foreign key references tblOrder(orderId) not null,
        routeId int not null,
        jobStatus nchar(1) check(
            jobstatus = 'P'
            OR jobStatus = 'C'
            OR jobStatus = 'X'
        )
    );

go
    create table tblDeliveryRoute (
        routeId int primary key identity (1, 1) not null,
        storeId int references tblStore(storeId) not null,
        staffId int references tblStaff(staffId) not null,
        jobCount int
    );

go