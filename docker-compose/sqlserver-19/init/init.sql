USE [master];
GO

IF NOT EXISTS (SELECT * FROM sys.sql_logins WHERE name = 'admin')
BEGIN
    CREATE LOGIN [admin] WITH PASSWORD = 'admin', CHECK_POLICY = OFF;
    ALTER SERVER ROLE [sysadmin] ADD MEMBER [admin];
END
GO