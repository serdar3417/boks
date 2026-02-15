$c = Get-Content "c:/Users/soec/Desktop/boks/index.html"
$n = $c[0..911] + $c[937..($c.Count-1)]
$n | Set-Content "c:/Users/soec/Desktop/boks/index.html"
