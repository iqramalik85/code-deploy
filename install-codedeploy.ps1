# Install CodeDeploy agent
$url = "https://aws-codedeploy-${Env:AWS_REGION}.s3.${Env:AWS_REGION}.amazonaws.com/latest/codedeploy-agent.msi"
$output = "C:\temp\codedeploy-agent.msi"

Invoke-WebRequest -Uri $url -OutFile $output
Start-Process msiexec.exe -ArgumentList "/i $output /quiet" -NoNewWindow -Wait

# Start CodeDeploy agent
Start-Service -Name codedeployagent

# Set CodeDeploy agent to start automatically on boot
Set-Service -Name codedeployagent -StartupType Automatic
