DECLARE @html_body VARCHAR(MAX);

;WITH tabl AS (
    SELECT 
        t.name AS table_name,
        ind.name AS index_name,
        ind.type_desc AS index_type,
        col.name AS column_name,
        typ.name AS column_type
    FROM 
        sys.tables t
    JOIN 
        sys.indexes ind ON t.object_id = ind.object_id
    LEFT JOIN 
        sys.index_columns ic ON ind.object_id = ic.object_id AND ind.index_id = ic.index_id
    LEFT JOIN 
        sys.columns col ON ic.object_id = col.object_id AND ic.column_id = col.column_id
    LEFT JOIN 
        sys.types typ ON col.user_type_id = typ.user_type_id
    WHERE 
        ind.name IS NOT NULL AND ind.type_desc <> 'HEAP'
)
SELECT @html_body = 
    '<table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>Table Name</th>
            <th>Index Name</th>
            <th>Index Type</th>
            <th>Column Name</th>
            <th>Column Type</th>
        </tr>' +
    CAST((
        SELECT 
            td = table_name, '',
            td = index_name, '',
            td = index_type, '',
            td = column_name, '',
            td = column_type
        FROM tabl
        FOR XML PATH('tr'), TYPE
    ) AS VARCHAR(MAX)) +
    '</table>';

-- send the HTML
exec msdb.dbo.sp_send_dbmail
@profile_name = 'sp_mail',
@recipients = 'd.eraliyeva@newuu.uz',
@subject = 'Test report from sql server',
@body = @html_body



