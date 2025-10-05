# Test script for API key functionality

Write-Host "Testing API endpoints..." -ForegroundColor Green

# Test 1: Health endpoint (should work without API key)
Write-Host "`n1. Testing health endpoint (no API key required):" -ForegroundColor Yellow
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/health" -Method GET
    Write-Host "SUCCESS: $($response | ConvertTo-Json)" -ForegroundColor Green
} catch {
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
}

# Test 2: Protected endpoint without API key (should fail)
Write-Host "`n2. Testing protected endpoint without API key:" -ForegroundColor Yellow
try {
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/test" -Method GET
    Write-Host "UNEXPECTED SUCCESS: $($response | ConvertTo-Json)" -ForegroundColor Red
} catch {
    Write-Host "EXPECTED ERROR: $($_.Exception.Message)" -ForegroundColor Green
}

# Test 3: Protected endpoint with API key (should work)
Write-Host "`n3. Testing protected endpoint with API key:" -ForegroundColor Yellow
try {
    $headers = @{"x-api-key"="your-secret-api-key-here-12345"}
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/test" -Method GET -Headers $headers
    Write-Host "SUCCESS: $($response | ConvertTo-Json)" -ForegroundColor Green
} catch {
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
}

# Test 4: POST endpoint with API key
Write-Host "`n4. Testing POST endpoint with API key:" -ForegroundColor Yellow
try {
    $headers = @{"x-api-key"="your-secret-api-key-here-12345"}
    $body = @{message="Hello from test"; data="test data"} | ConvertTo-Json
    $response = Invoke-RestMethod -Uri "http://localhost:3000/api/test" -Method POST -Headers $headers -Body $body -ContentType "application/json"
    Write-Host "SUCCESS: $($response | ConvertTo-Json)" -ForegroundColor Green
} catch {
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`nTest completed!" -ForegroundColor Green
