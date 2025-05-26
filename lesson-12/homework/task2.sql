CREATE PROCEDURE GetAllProceduresAndFunctions
    @DatabaseName SYSNAME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @sql NVARCHAR(MAX);
    DECLARE @name SYSNAME;
    DECLARE @i INT = 1;
    DECLARE @count INT;

    -- Temporary table to store results
    IF OBJECT_ID('tempdb..#ProcedureInfo') IS NOT NULL DROP TABLE #ProcedureInfo;
    CREATE TABLE #ProcedureInfo (
        DatabaseName SYSNAME,
        SchemaName SYSNAME,
        ObjectName SYSNAME,
        ObjectType VARCHAR(20),
        ParameterName SYSNAME,
        DataType SYSNAME,
        MaxLength INT
    );

    -- Helper query to build metadata extraction for a given DB
    DECLARE @base_sql NVARCHAR(MAX) = '
    SELECT
        ''<DB_NAME>'' AS DatabaseName,
        s.name AS SchemaName,
        o.name AS ObjectName,
        CASE o.type
            WHEN ''P'' THEN ''Stored Procedure''
            WHEN ''FN'' THEN ''Scalar Function''
            WHEN ''IF'' THEN ''Inline Table Function''
            WHEN ''TF'' THEN ''Table Function''
            ELSE o.type
        END AS ObjectType,
        p.name AS ParameterName,
        t.name AS DataType,
        p.max_length AS MaxLength
    FROM <DB_NAME>.sys.objects o
    INNER JOIN <DB_NAME>.sys.schemas s ON o.schema_id = s.schema_id
    LEFT JOIN <DB_NAME>.sys.parameters p ON o.object_id = p.object_id
    LEFT JOIN <DB_NAME>.sys.types t ON p.user_type_id = t.user_type_id
    WHERE o.type IN (''P'', ''FN'', ''IF'', ''TF'')';

    IF @DatabaseName IS NOT NULL
    BEGIN
        -- Replace placeholder with actual DB name
        SET @sql = REPLACE(@base_sql, '<DB_NAME>', QUOTENAME(@DatabaseName));
        INSERT INTO #ProcedureInfo
        EXEC sp_executesql @sql;
    END
    ELSE
    BEGIN
        -- Get count of user databases (exclude system DBs)
        SELECT @count = COUNT(*) FROM sys.databases 
        WHERE name NOT IN ('master', 'tempdb', 'model', 'msdb');

        -- Loop through all user databases
        WHILE @i <= @count
        BEGIN
            ;WITH db_list AS (
                SELECT name, ROW_NUMBER() OVER (ORDER BY name) AS rn
                FROM sys.databases
                WHERE name NOT IN ('master', 'tempdb', 'model', 'msdb')
            )
            SELECT @name = name FROM db_list WHERE rn = @i;

            SET @sql = REPLACE(@base_sql, '<DB_NAME>', QUOTENAME(@name));
            INSERT INTO #ProcedureInfo
            EXEC sp_executesql @sql;

            SET @i = @i + 1;
        END
    END

    -- Final output
    SELECT * FROM #ProcedureInfo
    ORDER BY DatabaseName, SchemaName, ObjectName, ParameterName;
END;
