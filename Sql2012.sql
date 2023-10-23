
--spaces task
DECLARE @inputString NVARCHAR(MAX) = ' My    string here   !';
SET @inputString = REPLACE(@inputString, '  ', ' \7'); 
SET @inputString = REPLACE(@inputString, '\7 ', '\7');
SET @inputString = REPLACE(@inputString, '\7', '');
SELECT @inputString AS result;

--spaces task v2
DECLARE @inputString2 NVARCHAR(MAX) = ' My    string here   !';
SET @inputString2 = REPLACE(REPLACE(REPLACE(@inputString2, '  ', ' \7'),'\7 ', '\7'),'\7', '')
SELECT @inputString2 AS result2

--quotes task
with A as (--пример исходных данных
  select *
    from (values ('"Предприятие ""Завод имени кого-то"""'),
                 ('"Кафе ""Классное"" ООО"'),
                 ('"""Инжиниринг какой-то"""'),
                 ('"Школ""а №22"'),
                 ('Школа №22')
         ) as t  (s)
)
select s, --выводим оригинальную строку
	REPLACE(s, '"', '\7'),
	REPLACE(REPLACE(s, '"', '\7'),'\7\7', '"'),
	REPLACE(REPLACE(REPLACE(s, '"', '\7'),'\7\7', '"'),'\7', '')
  from A;

--zeroes task

DECLARE @x varchar(20) = '0000004520090';
SELECT LTRIM(@x, '0') AS trimmed;

DECLARE @x1 varchar(20) = '0000004520090';
SELECT CAST(@x1 AS int) AS trimmed;

--date task

DECLARE @date1 Date = '20090101', @date2 Date = '20070102';

SELECT 
	CASE
		WHEN MONTH(@date1) - MONTH(@date2) >= 0 
		THEN 
			CASE
				WHEN DAY(@date1) - DAY(@date2) >= 0
				THEN YEAR(@date1) - YEAR(@date2)
				WHEN DAY(@date1) - DAY(@date2) < 0
				THEN YEAR(@date1) - YEAR(@date2)-1
			END
		WHEN MONTH(@date1) - MONTH(@date2) < 0 
		THEN YEAR(@date1) - YEAR(@date2) - 1
	END as full_years




