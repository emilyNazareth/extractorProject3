CREATE PROCEDURE get_all_clients
AS
SELECT 
	[ID],
	[NAME],
	[LAST_NAME],
	[AGE],
	[LAST_UPDATE]
FROM [dbo].[CLIENT]

CREATE PROCEDURE get_all_sales
AS
SELECT 
	[ID],
	[ID_CLIENT],
	[DESCRIPTION],
	[TOTAL],
	[LAST_UPDATE]
FROM [dbo].[SALE]

CREATE PROCEDURE delete_all_clients
AS
DELETE FROM [dbo].[CLIENT]

CREATE PROCEDURE delete_all_sales
AS
DELETE FROM [dbo].[SALE]

CREATE PROCEDURE get_all_address_clients
AS
SELECT 
	[ID],	
    [ID_CLIENT],
    CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('ADDRESS', ADDRESS)) as ADDRESS,
	[ADDRESS_NAME],
	[LAST_UPDATE]	
FROM [dbo].[ADDRESS_CLIENT]

CREATE PROCEDURE get_all_phone_clients
AS
SELECT 
	[ID],	
    [ID_CLIENT],
    CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('NUMBER', NUMBER)) as NUMBER,	
	[LAST_UPDATE]	
FROM [dbo].[PHONE_CLIENT]

exec get_all_phone_clients
select * from [dbo].[PHONE_CLIENT]


SELECT * FROM [dbo].[EMAIL_CLIENT]




