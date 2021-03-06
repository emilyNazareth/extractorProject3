USE extractorProject

Create PROCEDURE get_all_clients
AS
SELECT 
	[NAME],
	[LAST_NAME],
	[AGE],
	[LAST_UPDATE]
FROM [dbo].[CLIENT]

CREATE PROCEDURE get_all_sales
AS
SELECT 
	[ID_CLIENT],
	[DESCRIPTION],
	[TOTAL],
	[LAST_UPDATE]
FROM [dbo].[SALE]

CREATE PROCEDURE get_all_address_clients
AS
SELECT 	
    [ID_CLIENT],
    CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('ADDRESS', ADDRESS)) as ADDRESS,
	[ADDRESS_NAME],
	[LAST_UPDATE]	
FROM [dbo].[ADDRESS_CLIENT]

CREATE PROCEDURE get_all_phone_clients
AS
SELECT 
    [ID_CLIENT],
    CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('NUMBER', NUMBER)) as NUMBER,	
	[LAST_UPDATE]	
FROM [dbo].[PHONE_CLIENT]

CREATE PROCEDURE get_all_credit_cards
AS
SELECT 
    CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('CARD_NUMBER', CARD_NUMBER)) as CARD_NUMBER,	
	CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('CVV', CVV)) as CVV,
	[ID_CLIENT],
	CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('EXPIRATION', EXPIRATION)) as EXPIRATION,	
	[LAST_UPDATE]	
FROM [dbo].[CREDIT_CARD]

CREATE PROCEDURE get_all_email_clients
AS
SELECT 
	[ID_CLIENT],
    CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('EMAIL', EMAIL)) as EMAIL,	
	[LAST_UPDATE]	
FROM [dbo].[EMAIL_CLIENT]




---PROCEDURE WITH PARAMETERS
CREATE PROCEDURE get_all_clients_by_date
@init_date date,
@final_date date
AS
SELECT 
	ID,
	[NAME],
	[LAST_NAME],
	[AGE],
	[LAST_UPDATE]
FROM [dbo].[CLIENT] 
WHERE [LAST_UPDATE] >= @init_date AND
	  [LAST_UPDATE] <= @final_date





CREATE PROCEDURE get_all_sales_by_date
@init_date date,
@final_date date
AS
SELECT 
	[ID_CLIENT],
	[DESCRIPTION],
	[TOTAL],
	[LAST_UPDATE]
FROM [dbo].[SALE]
WHERE [LAST_UPDATE] >= @init_date AND
	  [LAST_UPDATE] <= @final_date



CREATE PROCEDURE delete_all_clients
@init_date date,
@final_date date
AS
DELETE FROM [dbo].[CLIENT]
WHERE [LAST_UPDATE] >= @init_date AND
	  [LAST_UPDATE] <= @final_date


CREATE PROCEDURE delete_all_sales
@init_date date,
@final_date date
AS
DELETE FROM [dbo].[SALE]
WHERE [LAST_UPDATE] >= @init_date AND
	  [LAST_UPDATE] <= @final_date

CREATE PROCEDURE delete_all_credits_card
@init_date date,
@final_date date
AS
DELETE FROM [dbo].[CREDIT_CARD]
WHERE [LAST_UPDATE] >= @init_date AND
	  [LAST_UPDATE] <= @final_date


CREATE PROCEDURE get_all_address_clients_by_date
@init_date date,
@final_date date
AS
SELECT 	
    [ID_CLIENT],
    CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('ADDRESS', ADDRESS)) as ADDRESS,
	[ADDRESS_NAME],
	[LAST_UPDATE]	
FROM [dbo].[ADDRESS_CLIENT]
WHERE [LAST_UPDATE] >= @init_date AND
	  [LAST_UPDATE] <= @final_date



CREATE PROCEDURE get_all_phone_clients_by_date
@init_date date,
@final_date date
AS
SELECT 
    [ID_CLIENT],
    CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('NUMBER', NUMBER)) as NUMBER,	
	[LAST_UPDATE]	
FROM [dbo].[PHONE_CLIENT]
WHERE [LAST_UPDATE] >= @init_date AND
	  [LAST_UPDATE] <= @final_date




CREATE PROCEDURE get_all_credit_cards_by_date
@init_date date,
@final_date date
AS
SELECT 
    CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('CARD_NUMBER', CARD_NUMBER)) as CARD_NUMBER,	
	CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('CVV', CVV)) as CVV,
	[ID_CLIENT],
	CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('EXPIRATION', EXPIRATION)) as EXPIRATION,	
	[LAST_UPDATE]	
FROM [dbo].[CREDIT_CARD]
WHERE [LAST_UPDATE] >= @init_date AND
	  [LAST_UPDATE] <= @final_date



CREATE PROCEDURE get_all_email_clients_by_clients
@init_date date,
@final_date date
AS
SELECT 
	[ID_CLIENT],
    CONVERT(VARCHAR(MAX), DECRYPTBYPASSPHRASE('EMAIL', EMAIL)) as EMAIL,	
	[LAST_UPDATE]	
FROM [dbo].[EMAIL_CLIENT]
WHERE [LAST_UPDATE] >= @init_date AND
	  [LAST_UPDATE] <= @final_date




