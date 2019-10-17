$fw = New-Object -ComObject HNetCfg.FWPolicy2

$rule = New-Object -ComObject HNetCfg.FWRule
#$rule.ApplicationName = "%ProgramFiles%\1cv8\current\bin\ragent.exe"
#$rule.ApplicationName = "%ProgramFiles%\1cv8\current\bin\rmngr.exe"
#$rule.ApplicationName = "%ProgramFiles%\1cv8\current\bin\rphost.exe"
#$rule.serviceName = "1C:Enterprise 8.3 Server Agent (x86-64)"
$rule.Protocol = 6 #NET_FW_IP_PROTOCOL_TCP
$rule.Enabled = $true
### $rule.Grouping = "@firewallapi.dll,-23255"
#$rule.Profiles = 3 # Domain, Private
#$rule.Profiles = 6 # Private, Public
#$rule.Profiles = 0 # None
#$rule.Profiles = $rule.Profiles + 1 # Domain
#$rule.Profiles = $rule.Profiles + 2 # Private
#$rule.Profiles = $rule.Profiles + 4 # Public
$rule.Profiles = 7 # All
$rule.Action = 1 # NET_FW_ACTION_ALLOW
$rule.EdgeTraversal = $false

$rule.Name = "Сервер 1С 3640 (port rule)"
$rule.LocalPorts = "3640,3641,3660-3691"  # Не обязательно, если указываем службу
$fw.Rules.Add($rule)

