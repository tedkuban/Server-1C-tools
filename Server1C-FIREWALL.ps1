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

$rule.Name = "Сервер 1С 1540 (port rule)"
$rule.LocalPorts = "1540,1541,1545,1560-1591"  # Не обязательно, если указываем службу
$fw.Rules.Add($rule)

$rule = New-Object -ComObject HNetCfg.FWRule
$rule.Protocol = 6 #NET_FW_IP_PROTOCOL_TCP
$rule.Enabled = $true
$rule.Profiles = 7 # All
$rule.Action = 1 # NET_FW_ACTION_ALLOW
$rule.EdgeTraversal = $false
$rule.Name = "Сервер 1С 2540 (port rule)"
$rule.LocalPorts = "2540,2541,2545,2560-2591"  # Не обязательно, если указываем службу
$fw.Rules.Add($rule)

$rule = New-Object -ComObject HNetCfg.FWRule
$rule.Protocol = 6 #NET_FW_IP_PROTOCOL_TCP
$rule.Enabled = $true
$rule.Profiles = 7 # All
$rule.Action = 1 # NET_FW_ACTION_ALLOW
$rule.EdgeTraversal = $false
$rule.Name = "Сервер 1С 3540 (port rule)"
$rule.LocalPorts = "3540,3541,3545,3560-3591"  # Не обязательно, если указываем службу
$fw.Rules.Add($rule)

$rule = New-Object -ComObject HNetCfg.FWRule
$rule.Protocol = 6 #NET_FW_IP_PROTOCOL_TCP
$rule.Enabled = $true
$rule.Profiles = 7 # All
$rule.Action = 1 # NET_FW_ACTION_ALLOW
$rule.EdgeTraversal = $false
$rule.Name = "Сервер 1С 4540 (port rule)"
$rule.LocalPorts = "4540,4541,4545,4560-4591"  # Не обязательно, если указываем службу
$fw.Rules.Add($rule)
