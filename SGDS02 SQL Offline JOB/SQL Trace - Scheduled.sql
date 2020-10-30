USE [msdb]
GO

/****** Object:  Job [SQL Trace  - Scheduled]    Script Date: 10/30/2020 9:52:52 AM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 10/30/2020 9:52:52 AM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'SQL Trace  - Scheduled', 
		@enabled=0, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Run SQL Trace  for 2 Hours starting at scheduled Time', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'BSI\Admin.ali', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Run Trace Script]    Script Date: 10/30/2020 9:52:52 AM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Run Trace Script', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'/****************************************************/
/* Created by: SQL Server 2008 R2 Profiler          */
/* Date: 04/01/2013  11:54:53 AM         */
/****************************************************/


-- Create a Queue
declare @rc int
declare @TraceID int
declare @maxfilesize bigint
declare @DateTime datetime

set @DateTime = dateadd(hh,2,getdate())
set @maxfilesize = 50

-- Please replace the text InsertFileNameHere, with an appropriate
-- filename prefixed by a path, e.g., c:\MyFolder\MyTrace. The .trc extension
-- will be appended to the filename automatically. If you are writing from
-- remote server to local drive, please use UNC path and make sure server has
-- write access to your network share

exec @rc = sp_trace_create @TraceID output, 0, N''E:\Ali - Temp\TraceOutput'', @maxfilesize, @Datetime
if (@rc != 0) goto error

-- Client side File and Table cannot be scripted

-- Set the events
declare @on bit
set @on = 1
exec sp_trace_setevent @TraceID, 14, 1, @on
exec sp_trace_setevent @TraceID, 14, 9, @on
exec sp_trace_setevent @TraceID, 14, 6, @on
exec sp_trace_setevent @TraceID, 14, 10, @on
exec sp_trace_setevent @TraceID, 14, 14, @on
exec sp_trace_setevent @TraceID, 14, 11, @on
exec sp_trace_setevent @TraceID, 14, 12, @on
exec sp_trace_setevent @TraceID, 15, 15, @on
exec sp_trace_setevent @TraceID, 15, 16, @on
exec sp_trace_setevent @TraceID, 15, 9, @on
exec sp_trace_setevent @TraceID, 15, 17, @on
exec sp_trace_setevent @TraceID, 15, 6, @on
exec sp_trace_setevent @TraceID, 15, 10, @on
exec sp_trace_setevent @TraceID, 15, 14, @on
exec sp_trace_setevent @TraceID, 15, 18, @on
exec sp_trace_setevent @TraceID, 15, 11, @on
exec sp_trace_setevent @TraceID, 15, 12, @on
exec sp_trace_setevent @TraceID, 15, 13, @on
exec sp_trace_setevent @TraceID, 17, 1, @on
exec sp_trace_setevent @TraceID, 17, 9, @on
exec sp_trace_setevent @TraceID, 17, 6, @on
exec sp_trace_setevent @TraceID, 17, 10, @on
exec sp_trace_setevent @TraceID, 17, 14, @on
exec sp_trace_setevent @TraceID, 17, 11, @on
exec sp_trace_setevent @TraceID, 17, 12, @on
exec sp_trace_setevent @TraceID, 10, 15, @on
exec sp_trace_setevent @TraceID, 10, 16, @on
exec sp_trace_setevent @TraceID, 10, 9, @on
exec sp_trace_setevent @TraceID, 10, 17, @on
exec sp_trace_setevent @TraceID, 10, 2, @on
exec sp_trace_setevent @TraceID, 10, 10, @on
exec sp_trace_setevent @TraceID, 10, 18, @on
exec sp_trace_setevent @TraceID, 10, 11, @on
exec sp_trace_setevent @TraceID, 10, 12, @on
exec sp_trace_setevent @TraceID, 10, 13, @on
exec sp_trace_setevent @TraceID, 10, 6, @on
exec sp_trace_setevent @TraceID, 10, 14, @on
exec sp_trace_setevent @TraceID, 72, 7, @on
exec sp_trace_setevent @TraceID, 72, 8, @on
exec sp_trace_setevent @TraceID, 72, 64, @on
exec sp_trace_setevent @TraceID, 72, 9, @on
exec sp_trace_setevent @TraceID, 72, 33, @on
exec sp_trace_setevent @TraceID, 72, 41, @on
exec sp_trace_setevent @TraceID, 72, 49, @on
exec sp_trace_setevent @TraceID, 72, 6, @on
exec sp_trace_setevent @TraceID, 72, 10, @on
exec sp_trace_setevent @TraceID, 72, 14, @on
exec sp_trace_setevent @TraceID, 72, 26, @on
exec sp_trace_setevent @TraceID, 72, 50, @on
exec sp_trace_setevent @TraceID, 72, 66, @on
exec sp_trace_setevent @TraceID, 72, 3, @on
exec sp_trace_setevent @TraceID, 72, 11, @on
exec sp_trace_setevent @TraceID, 72, 35, @on
exec sp_trace_setevent @TraceID, 72, 51, @on
exec sp_trace_setevent @TraceID, 72, 4, @on
exec sp_trace_setevent @TraceID, 72, 12, @on
exec sp_trace_setevent @TraceID, 72, 60, @on
exec sp_trace_setevent @TraceID, 12, 15, @on
exec sp_trace_setevent @TraceID, 12, 16, @on
exec sp_trace_setevent @TraceID, 12, 1, @on
exec sp_trace_setevent @TraceID, 12, 9, @on
exec sp_trace_setevent @TraceID, 12, 17, @on
exec sp_trace_setevent @TraceID, 12, 6, @on
exec sp_trace_setevent @TraceID, 12, 10, @on
exec sp_trace_setevent @TraceID, 12, 14, @on
exec sp_trace_setevent @TraceID, 12, 18, @on
exec sp_trace_setevent @TraceID, 12, 11, @on
exec sp_trace_setevent @TraceID, 12, 12, @on
exec sp_trace_setevent @TraceID, 12, 13, @on
exec sp_trace_setevent @TraceID, 13, 1, @on
exec sp_trace_setevent @TraceID, 13, 9, @on
exec sp_trace_setevent @TraceID, 13, 6, @on
exec sp_trace_setevent @TraceID, 13, 10, @on
exec sp_trace_setevent @TraceID, 13, 14, @on
exec sp_trace_setevent @TraceID, 13, 11, @on
exec sp_trace_setevent @TraceID, 13, 12, @on
exec sp_trace_setevent @TraceID, 50, 7, @on
exec sp_trace_setevent @TraceID, 50, 15, @on
exec sp_trace_setevent @TraceID, 50, 8, @on
exec sp_trace_setevent @TraceID, 50, 64, @on
exec sp_trace_setevent @TraceID, 50, 1, @on
exec sp_trace_setevent @TraceID, 50, 9, @on
exec sp_trace_setevent @TraceID, 50, 25, @on
exec sp_trace_setevent @TraceID, 50, 41, @on
exec sp_trace_setevent @TraceID, 50, 49, @on
exec sp_trace_setevent @TraceID, 50, 6, @on
exec sp_trace_setevent @TraceID, 50, 10, @on
exec sp_trace_setevent @TraceID, 50, 14, @on
exec sp_trace_setevent @TraceID, 50, 26, @on
exec sp_trace_setevent @TraceID, 50, 34, @on
exec sp_trace_setevent @TraceID, 50, 50, @on
exec sp_trace_setevent @TraceID, 50, 66, @on
exec sp_trace_setevent @TraceID, 50, 3, @on
exec sp_trace_setevent @TraceID, 50, 11, @on
exec sp_trace_setevent @TraceID, 50, 35, @on
exec sp_trace_setevent @TraceID, 50, 51, @on
exec sp_trace_setevent @TraceID, 50, 4, @on
exec sp_trace_setevent @TraceID, 50, 12, @on
exec sp_trace_setevent @TraceID, 50, 60, @on
exec sp_trace_setevent @TraceID, 50, 13, @on
exec sp_trace_setevent @TraceID, 50, 21, @on


-- Set the Filters
declare @intfilter int
declare @bigintfilter bigint

exec sp_trace_setfilter @TraceID, 10, 0, 7, N''SQL Server Profiler - 189c4863-60ad-46a5-8f95-fbf6b253d1d8''
-- Set the trace status to start
exec sp_trace_setstatus @TraceID, 1

-- display trace id for future references
select TraceID=@TraceID
goto finish

error: 
select ErrorCode=@rc

finish: 
go
', 
		@database_name=N'210', 
		@flags=4
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'3 PM / AM Daily', 
		@enabled=0, 
		@freq_type=8, 
		@freq_interval=127, 
		@freq_subday_type=8, 
		@freq_subday_interval=12, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=1, 
		@active_start_date=20130401, 
		@active_end_date=20130430, 
		@active_start_time=30000, 
		@active_end_time=235959, 
		@schedule_uid=N'5c2180d4-01c1-4ca7-b955-cfe3d6f6a46c'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


