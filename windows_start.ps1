param (
    [string]$port = "8000",
    [switch]$strict = $false
)

Write-Host "Port value: $port" -ForegroundColor Cyan

$command = "mkdocs serve --dev-addr=127.0.0.1:$port"

if ($strict) {
    $command += " --strict"
}

if (Test-Path "./mkdocs.yml") {
    Write-Host "Running command: $command" -ForegroundColor Green
    Invoke-Expression $command
} else {
    Write-Host "Error: mkdocs.yml not found in the current directory" -ForegroundColor Red
}