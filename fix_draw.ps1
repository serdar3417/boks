$path = "c:/Users/soec/Desktop/boks/index.html"
$c = Get-Content $path
$start = 575 # Line 576 in 0-indexed array = 575
$end = 593   # Line 594 in 0-indexed array = 593
# New logic to insert
$newLogic = @"
                // DRAW SPRITE
                if (currentImg && currentImg.complete && currentImg.naturalWidth > 0) {
                    ctx.save();
                    if (this.isCPU) { ctx.scale(-1, 1); }
                    const w = 240; const h = 320;
                    ctx.drawImage(currentImg, -w / 2, -h + 60, w, h);
                    ctx.restore();
                } else {
                    ctx.fillStyle = this.color;
                    ctx.fillRect(-40, -200, 80, 200);
                }
"@
# Replace
$c = $c[0..($start-1)] + $newLogic.Split("`r`n") + $c[($end+1)..($c.Count-1)]
$c | Set-Content $path
