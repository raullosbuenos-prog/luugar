$ErrorActionPreference='Stop'
Add-Type -AssemblyName System.Drawing
$root=$PSScriptRoot
New-Item -ItemType Directory -Force "$root/posts" | Out-Null
$fonts=New-Object System.Drawing.Text.PrivateFontCollection
$fonts.AddFontFile("$root/fonts/Baruta-Black/RNS-B.ttf")
$brand=$fonts.Families[0]
$orange='#FF641F'; $ink='#20201E'; $cream='#FFF5E9'; $yellow='#FFD34F'
$logo=[Drawing.Image]::FromFile("$root/assets/luugar-logo.png")
$pin=[Drawing.Image]::FromFile("$root/assets/luugar-pin.png")
function Brush($c){ New-Object Drawing.SolidBrush ([Drawing.ColorTranslator]::FromHtml($c)) }
function Rect($x,$y,$w,$h,$c){$b=Brush $c; $script:g.FillRectangle($b,[single]$x,[single]$y,[single]$w,[single]$h);$b.Dispose()}
function Ellipse($x,$y,$w,$h,$c){$b=Brush $c;$script:g.FillEllipse($b,[single]$x,[single]$y,[single]$w,[single]$h);$b.Dispose()}
function Txt($s,$x,$y,$size,$c,$bold=$false){
 $fam=if($bold){$brand}else{[Drawing.FontFamily]::new('Arial')}
 $f=[Drawing.Font]::new($fam,[single]$size,[Drawing.FontStyle]::Regular,[Drawing.GraphicsUnit]::Pixel)
 $b=Brush $c
 $script:g.DrawString($s,$f,$b,[single]$x,[single]$y,[Drawing.StringFormat]::GenericTypographic)
 $f.Dispose();$b.Dispose()
}
function Head($lines,$y,$size,$c){foreach($s in $lines){Txt $s 68 $y $size $c $true;$y+=$size*1.06}}
function Body($lines,$y,$c){foreach($s in $lines){Txt $s 74 $y 33 $c;$y+=44}}
function Line($x1,$y1,$x2,$y2,$c,$width=3){$p=[Drawing.Pen]::new([Drawing.ColorTranslator]::FromHtml($c),$width);$g.DrawLine($p,[single]$x1,[single]$y1,[single]$x2,[single]$y2);$p.Dispose()}
function Pin($x,$y,$w){$g.DrawImage($pin,[single]$x,[single]$y,[single]$w,[single]($w*1.263))}
function Badge($text,$x,$y,$width,$bg,$fg){Rect $x $y $width 57 $bg;Txt $text ($x+19) ($y+13) 24 $fg}
function Route($y,$c){$p=[Drawing.Pen]::new([Drawing.ColorTranslator]::FromHtml($c),5);$p.DashPattern=@(1,3);$p.StartCap='Round';$p.EndCap='Round';$g.DrawBezier($p,0,$y,390,($y-240),650,($y+220),1080,($y-80));$p.Dispose()}
function Star($x,$y,$c){foreach($a in 0,45,90,135){$r=$a*[Math]::PI/180;Line ($x-32*[Math]::Cos($r)) ($y-32*[Math]::Sin($r)) ($x+32*[Math]::Cos($r)) ($y+32*[Math]::Sin($r)) $c 7}}
function Begin($n,$theme,$label){
 $script:bmp=[Drawing.Bitmap]::new(1080,1350)
 $script:g=[Drawing.Graphics]::FromImage($bmp);$g.SmoothingMode='AntiAlias';$g.TextRenderingHint='AntiAliasGridFit';$g.InterpolationMode='HighQualityBicubic'
 $script:dark=($theme -eq 'dark');$script:fg=if($dark){$cream}else{$ink}
 $bg=if($dark){$ink}elseif($theme -eq 'orange'){$orange}else{$cream}
 $g.Clear([Drawing.ColorTranslator]::FromHtml($bg))
 if($theme -eq 'orange'){$b=[Drawing.Drawing2D.LinearGradientBrush]::new([Drawing.Rectangle]::new(0,0,1080,1350),[Drawing.ColorTranslator]::FromHtml('#FFB839'),[Drawing.ColorTranslator]::FromHtml($orange),65);$g.FillRectangle($b,0,0,1080,1350);$b.Dispose()}
 if($theme -eq 'cream'){$g.DrawImage($logo,74,65,235,52)}else{Rect 68 54 264 78 $cream;$g.DrawImage($logo,83,67,234,52)}
 Txt $label 616 83 20 $fg
 Line 74 1237 1006 1237 $fg 2
 Txt 'SUA HISTÓRIA MERECE CONTAR.' 74 1267 20 $fg
 Txt ('LUUGAR / {0:00}' -f $n) 843 1267 20 $fg
}
function Save($n){$bmp.Save(('{0}/posts/{1:00}.png' -f $root,$n),[Drawing.Imaging.ImageFormat]::Png);$g.Dispose();$bmp.Dispose()}

Begin 1 'orange' 'MANIFESTO / 01'
Head @('ALUUGAR','NÃO DEVIA','SER UM','PERRENGUE.') 213 111 $ink
Badge 'BORA MUDAR ESSA CONVERSA?' 74 739 550 $ink $cream
Body @('Seu histórico merece entrar na conversa.','A LUUGAR nasce pra construir','mais confiança na locação.') 854 $ink
Route 1135 $cream; Star 935 780 $cream
Save 1

Begin 2 'cream' 'PRA QUEM ALUUGA'
Head @('PAGOU.','CUIDOU.','CONTA, SIM.') 210 119 $ink
Rect 74 683 934 450 $orange
Txt 'O QUE VOCÊ JÁ CONSTRUIU' 103 719 24 $ink
foreach($row in @(@('01','Pagamentos em dia',792),@('02','Cuidado com o imóvel',891),@('03','Compromissos cumpridos',990))){Txt $row[0] 105 $row[2] 44 $cream $true;Txt $row[1] 213 ($row[2]+7) 33 $ink}
Txt 'Essa é a ideia por trás do Score LUUGAR.' 74 1165 28 $ink
Save 2

Begin 3 'dark' 'O QUE É A LUUGAR?'
Head @('SUA HISTÓRIA.','SEU PRÓXIMO','LUUGAR.') 215 99 $cream
Pin 665 683 290
Route 1050 $orange
Body @('Estamos criando um score','de locação para dar mais','visibilidade ao seu histórico.','Mais contexto. Mais confiança.') 716 $cream
Badge 'SCORE EM DESENVOLVIMENTO' 74 1120 548 $orange $ink
Save 3

Begin 4 'cream' 'A GENTE TÁ OUVINDO'
Head @('DESABAFE','AQUI.') 215 145 $orange
Rect 74 608 870 306 $ink
Txt '“Mais um documento?' 111 650 48 $cream $true
Txt 'Sério isso?”' 111 718 64 $cream $true
Txt 'Se identificou?' 112 834 29 $yellow
Body @('Qual foi o maior perrengue pra aluugar?','Conta nos comentários, sem expor','nomes ou dados pessoais.') 982 $ink
Star 932 517 $orange
Save 4

Begin 5 'orange' 'VIDA REAL / SEM FILTRO'
Head @('FIADOR NÃO','DÁ EM','ÁRVORE.') 211 119 $ink
Badge 'E A CAUÇÃO PESA NO BOLSO.' 74 662 618 $cream $ink
Body @('Seu bom histórico pode ajudar','a fortalecer essa conversa.','É por isso que estamos aqui.') 795 $ink
Route 1095 $cream
Txt 'Garantias e aprovação dependem de cada locação.' 74 1169 25 $ink
Save 5

Begin 6 'cream' 'COMO A GENTE PENSA'
Head @('CONFIANÇA','TEM QUE','FAZER SENTIDO.') 211 97 $ink
foreach($row in @(@('01','HISTÓRICO',699,'Informações relevantes da locação.'),@('02','VERIFICAÇÃO',851,'Dados que possam ser conferidos.'),@('03','CLAREZA',1003,'Critérios que você possa entender.'))){Ellipse 74 $row[2] 74 74 $orange;Txt $row[0] 87 ($row[2]+19) 30 $ink $true;Txt $row[1] 178 ($row[2]-2) 41 $ink $true;Txt $row[3] 180 ($row[2]+56) 28 $ink}
Save 6

Begin 7 'dark' 'ALÔ, IMOBILIÁRIA'
Head @('MENOS','ACHISMO.','MAIS','HISTÓRICO.') 210 119 $cream
Badge 'CONFIANÇA PROS DOIS LADOS.' 74 821 626 $orange $ink
Body @('A proposta: dar mais contexto à análise','com pagamentos, cuidado com o imóvel','e compromissos documentados.') 947 $cream
Star 937 1140 $orange
Save 7

Begin 8 'cream' 'CRITÉRIO > RÓTULO'
Head @('GENTE NÃO','CABE NUM','RÓTULO.') 213 121 $ink
Rect 74 705 934 120 $orange
Txt 'O CONTEXTO IMPORTA.' 101 735 54 $ink $true
Body @('A ideia é avaliar fatos da locação,','com critérios claros e espaço','para corrigir ou contestar dados.','Um número não conta tudo.') 898 $ink
Save 8

Begin 9 'orange' 'PARCERIA DE VERDADE'
Head @('BOM PRA','QUEM MORA.','BOM PRA','QUEM ALUUGA.') 211 99 $ink
Route 912 $cream
Body @('Mais visibilidade para bons históricos.','Mais contexto para imobiliárias.','Mais diálogo para todo mundo.') 1012 $ink
Save 9

Begin 10 'cream' 'TRANSPARÊNCIA PRIMEIRO'
Head @('SEM','PROMESSA','MÁGICA.') 211 130 $orange
Badge 'COM UMA IDEIA QUE FAZ SENTIDO.' 74 712 680 $ink $cream
Body @('O Score LUUGAR está em construção.','Não garante aprovação nem dispensa','automática de fiador ou caução.','Queremos que sua história conte mais.') 859 $ink
Star 937 1140 $orange
Save 10

Begin 11 'orange' 'DE GALERA PRA GALERA'
$photo=[Drawing.Image]::FromFile("$root/assets/campanha-amigos.png")
$g.DrawImage($photo,0,0,1080,1350);$photo.Dispose()
Rect 68 54 264 78 $cream;$g.DrawImage($logo,83,67,234,52)
Txt 'DE GALERA PRA GALERA' 616 83 20 $cream
Head @('BORA FAZER','DIFERENTE?') 182 105 $cream
Badge 'ESSA MUDANÇA TAMBÉM É SUA.' 74 1124 650 $ink $cream
Rect 0 1237 1080 113 $ink
Txt 'SEGUE A LUUGAR. VEM JUNTO.' 74 1270 24 $cream
Txt 'LUUGAR / 11' 843 1270 20 $cream
Save 11

Begin 12 'dark' 'CHEGOU NO SEU LUUGAR'
Head @('EU ESPERO','QUE ESSE','LUUGAR','SEJA SEU.') 210 111 $cream
Pin 774 833 195
Body @('Uma nova conversa sobre aluugar.','Feita com você, desde o começo.') 924 $cream
Badge 'ACOMPANHE OS PRÓXIMOS PASSOS.' 74 1120 673 $orange $ink
Save 12

$grid=[Drawing.Bitmap]::new(1116,1880);$gg=[Drawing.Graphics]::FromImage($grid);$gg.Clear([Drawing.ColorTranslator]::FromHtml('#E8E2D9'));$gg.InterpolationMode='HighQualityBicubic'
$titleFont=[Drawing.Font]::new('Arial',23,[Drawing.FontStyle]::Bold);$brush=Brush $ink;$gg.DrawString('LUUGAR / PRIMEIRAS 12 PUBLICAÇÕES',$titleFont,$brush,18,18)
for($i=0;$i -lt 12;$i++){$n=12-$i;$im=[Drawing.Image]::FromFile(('{0}/posts/{1:00}.png' -f $root,$n));$gg.DrawImage($im,[int](12+($i%3)*368),[int](72+[Math]::Floor($i/3)*451),360,450);$im.Dispose()}
$grid.Save("$root/grid.jpg",[Drawing.Imaging.ImageFormat]::Jpeg);$gg.Dispose();$grid.Dispose();$brush.Dispose();$titleFont.Dispose();$logo.Dispose();$pin.Dispose();$fonts.Dispose()
Write-Output '12 artes e grid exportados.'
