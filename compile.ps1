Write-Host "Menyiapkan environment TinyTeX..."
$env:Path += ";$env:APPDATA\TinyTeX\bin\windows"

for ($i=1; $i -le 5; $i++) {
    Write-Host "Mulai kompilasi tahap $i... " -NoNewline
    $output = xelatex -interaction=nonstopmode main.tex 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[GAGAL]" -ForegroundColor Red
        Write-Host "`n=== LOG ERROR ===" -ForegroundColor Yellow
        Write-Host $output
        exit
    }
    Write-Host "[OK]" -ForegroundColor Green
}

# Pembersihan
Write-Host "Membersihkan file cache sementara... " -NoNewline
$cacheExtensions = @("*.aux", "*.log", "*.out", "*.toc", "*.lof", "*.lot", "*.fls", "*.fdb_latexmk", "*.synctex.gz", "*.bbl", "*.blg")

foreach ($ext in $cacheExtensions) {
    Get-ChildItem -Path . -Filter $ext -Recurse -ErrorAction SilentlyContinue | Remove-Item -Force
}
Write-Host "[OK]" -ForegroundColor Green

Write-Host "`n✨ Kompilasi berhasil! File main.pdf sudah terbarui." -ForegroundColor Cyan
