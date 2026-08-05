Connect-mggraph -scopes approleassignment.readwrite.all     ##This will prompt for a device login

 

$mi = get-mgserviceprincipal -filter "displayName eq 'logicAppName'"    ## this gets the SAMI of the logic app

 

$graph = get-mgserviceprincipal -filter "appId eq '00000003-0000-0000-c000-000000000000'"    ##This line is literal, do not change the app id.

 

$appRole = $graph.AppRoles | Where-Object {$_.Value -eq "Application.Read.All"}    ##Here we define the role that will be assigned to the logic app SAMI

 

New-MgServicePrincipalAppRoleAssignment -servicePrincipalId $mi.id -principalId $mi.id -resourceId $graph.id -appRoleId $appRole.id
