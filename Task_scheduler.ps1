$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument 'C:\Users\S.P.Harish\Desktop\Powershell\Ts_shell.ps1'

$trigger = New-ScheduledTaskTrigger -Daily -At 9am

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "psvideo" -description "The name is Harish."
