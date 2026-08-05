#This will prompt for a device login
Connect-mggraph -scopes approleassignment.readwrite.all

# this gets the SAMI of the logic app
$mi = get-mgserviceprincipal -filter "displayName eq 'logicAppName'"

#This line is literal, do not change the app id.
$graph = get-mgserviceprincipal -filter "appId eq '00000003-0000-0000-c000-000000000000'"

#Here we define the role that will be assigned to the logic app SAMI
$appRole = $graph.AppRoles | Where-Object {$_.Value -eq "Application.Read.All"}

New-MgServicePrincipalAppRoleAssignment -servicePrincipalId $mi.id -principalId $mi.id -resourceId $graph.id -appRoleId $appRole.id
