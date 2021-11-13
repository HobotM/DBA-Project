Use [AMMTescoProject];

GO
    CREATE PROCEDURE spCreateStaff (
        @fName varchar(50),
        @lName varchar(50),
        @gender nchar(2),
        @phone varchar(11),
        @dob datetime,
        @salary int,
        @email varchar(50),
        @NIN varchar(9),
        @title varchar(50),
        @addLine1 varchar(50),
        @addLine2 varchar(50),
        @addLine3 varchar(50),
        @townCity varchar(50),
        @postcode varchar(10),
        @mobile varchar(11),
        @storeId int
    ) as begin;

declare @newStaffId int
insert into
    dbo.tblStaff(
        fName,
        lName,
        gender,
        phone,
        dob,
        salary,
        email,
        NIN,
        title
    )
values
(
        @fName,
        @lName,
        @gender,
        @phone,
        @dob,
        @salary,
        @email,
        @NIN,
        @title
    )
select
    @newStaffId = scope_identity()
insert into
    dbo.tblAddress(
        addLine1,
        addLine2,
        addLine3,
        townCity,
        postcode,
        mobile,
        storeId
    )
values
    (
        @addLine1,
        @addLine2,
        @addLine3,
        @townCity,
        @postcode,
        @mobile,
        @storeId
    )
end;