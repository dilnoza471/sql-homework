;WITH fibonacci AS (

    SELECT 1 AS n, 1 AS fib, 0 AS prev_fib
    UNION ALL
    SELECT n + 1,
           fib + prev_fib AS fib,
           fib AS prev_fib
    FROM fibonacci
    WHERE n + 1 <= 10
)
SELECT n, fib
FROM fibonacci
ORDER BY n;
