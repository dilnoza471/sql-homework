
declare @sql_cmd varchar(max) = '
select 
	TABLE_CATALOG as DatabaseName,
	TABLE_SCHEMA as SchemaName,
	TABLE_NAME as TableName,
	COLUMN_NAME as ColumnName,
	concat(
		DATA_TYPE,''(''+ 
			case when cast(CHARACTER_MAXIMUM_LENGTH as varchar) = ''-1''
			then ''max''
			else cast(CHARACTER_MAXIMUM_LENGTH as varchar) end
		+'')''
	) as DataType
from '


declare @name varchar(255);
declare @i int = 1;
declare @count int;
select @count = count(1)
from sys.databases where name not in ('master', 'tempdb', 'model', 'msdb')
drop table if exists #temp;
create table #temp(
	DatabaseName varchar(255),
	SchemaName varchar(255),
	TableName varchar(255),
	ColumnName varchar(255),
	DataType varchar(255)

)

while @i < @count
begin
	;with cte as (
		select name, ROW_NUMBER() OVER(order BY name) as rn
		from sys.databases where name not in ('master', 'tempdb', 'model', 'msdb')
	)
	select @name=name from cte
	where rn = @i;
	SET @sql_cmd = '
    SELECT 
        ''' + @name + ''' AS DatabaseName,
        TABLE_SCHEMA AS SchemaName,
        TABLE_NAME AS TableName,
        COLUMN_NAME AS ColumnName,
        CONCAT(
            DATA_TYPE, 
            ''('' + 
                CASE 
                    WHEN CHARACTER_MAXIMUM_LENGTH = -1 THEN ''max''
                    WHEN CHARACTER_MAXIMUM_LENGTH IS NULL THEN ''''
                    ELSE CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR)
                END + 
            '')''
        ) AS DataType
    FROM [' + @name + '].INFORMATION_SCHEMA.COLUMNS;
    ';
	insert into #temp
	exec(@sql_cmd);


	set @i = @i + 1;

end
select * from #temp;

