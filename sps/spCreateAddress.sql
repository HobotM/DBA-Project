use AMMTescoProject
GO
    create procedure dbo.spCreateAddress (
        @addLine1 varchar(50),
        @addLine2 varchar(50),
        @addLine3 varchar(50),
        @townCity varchar(50),
        @postcode varchar(10),
        @eveningPhone varchar(11),
        @daytimePhone varchar(11),
        @mobile varchar(11),
        @description varchar(50),
        @primaryAddress nchar(1)
    ) as begin;

insert into
    tblAddress(
        addLine1,
        addLine2,
        addLine3,
        townCity,
        postcode,
        eveningPhone,
        daytimePhone,
        mobile,
        description,
        primaryAddress
    )
values
    (
        @addLine1,
        @addLine2,
        @addLine3,
        @townCity,
        @postcode,
        @eveningPhone,
        @daytimePhone,
        @mobile,
        @description,
        @primaryAddress
    )
end;