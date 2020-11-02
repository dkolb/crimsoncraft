Push-Location .\dev-server

$7z = "C:\Program Files\7-Zip\7z.exe"

# Options
# -r causes recursion to be the default
# -xr0@'..\excludelist.txt'
#   -x == exclude
#   r0 == recursively exclude ONLY when there's a wild card in the exclusion.
#   @'..\excludeslist.txt' == exclude using the excludes list file.  One pattern per line.

# Execute command
& $7z a ..\upgrade_package.zip '*' -r -xr0@'..\excludelist.txt'

Pop-Location