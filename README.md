# ServicePrincipalSecretNotification
This is a logic app to send a notification when service principal secrets are about to expire.


The process is as follows:

1) Create a logic app.
2) Enable System Assigned Managed Identity on the Logic App
3) Update the powershell script with your Logic App name
4) Run Powershell script to grant Logic App SAMI access to Graph (Global Admin needed for this).
5) Build out the Logic App with the json file.
6) Set hour to run, and how many days notification to get.
7) Assign an action (email / teams notify / etc) to the true condition of the logic app.
