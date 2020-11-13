# Remove Coretto and set up JDK 14, Extra Where-Object filter is to keep idempotency.
$path = $env:PATH
$path = (
    (
        $path.Split(';') | 
        Where-Object {$_ -ne 'C:\Program Files\Amazon Corretto\jdk1.8.0_222\bin'} |
        Where-Object {$_ -ne 'C:\Program Files\Java\jdk-14.0.1\bin'}
    ) + 'C:\Program Files\Java\jdk-14.0.1\bin'
) -join ';'
$env:PATH = $path
$env:JAVA_HOME = 'C:\Program Files\Java\jdk-14.0.1'

Push-Location -Path ".\dev-server"

java -Xms10G `
    -Xmx10G `
    -XX:+UseG1GC `
    -XX:+ParallelRefProcEnabled `
    -XX:MaxGCPauseMillis=200 `
    -XX:+UnlockExperimentalVMOptions `
    -XX:+DisableExplicitGC `
    -XX:+AlwaysPreTouch `
    -XX:G1NewSizePercent=30 `
    -XX:G1MaxNewSizePercent=40 `
    -XX:G1HeapRegionSize=8M `
    -XX:G1ReservePercent=20 `
    -XX:G1HeapWastePercent=5 `
    -XX:G1MixedGCCountTarget=4 `
    -XX:InitiatingHeapOccupancyPercent=15 `
    -XX:G1MixedGCLiveThresholdPercent=90 `
    -XX:G1RSetUpdatingPauseTimePercent=5 `
    -XX:SurvivorRatio=32 `
    -XX:+PerfDisableSharedMem `
    -XX:MaxTenuringThreshold=1 `
    -jar fabric-server-launch.jar

Pop-Location