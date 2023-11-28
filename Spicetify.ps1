
function MakeTopAndButtom
{
    $string = "# "
    for($i = 0; $i -lt $Host.UI.RawUI.BufferSize.Width - 4; $i++)
    {
        $string = $string + "-"
    }
    $string = $string + " #"

    return $string
}

function MakeSpaces
{
    $string = "# "
    for($i = 0; $i -lt $Host.UI.RawUI.BufferSize.Width - 4; $i++)
    {
        $string = $string + " "
    }
    $string = $string + " #"
    return $string
}

function CenterText
{
    param($Message)

    $string = "# "

    for($i = 0; $i -lt (([Math]::Max(0, $Host.UI.RawUI.BufferSize.Width / 2) - [Math]::Max(0, $Message.Length / 2))) - 4; $i++)
    {
        $string = $string + " "
    }

    $string = $string + $Message

    for($i = 0; $i -lt ($Host.UI.RawUI.BufferSize.Width - ((([Math]::Max(0, $Host.UI.RawUI.BufferSize.Width / 2) - [Math]::Max(0, $Message.Length / 2))) - 2 + $Message.Length)) - 2; $i++)
    {
        $string = $string + " "
    }

    $string = $string + " #"
    return $string

}

function LinesOfCodeInCorrentFolder
{
    return (gci -include *.ps1 -recurse | select-string .).Count
}

$MakeTopAndButtom = MakeTopAndButtom
$MakeSpaces = MakeSpaces
$lines = LinesOfCodeInCorrentFolder



# ----------------------------------------------------------------------------------
#
# Run
#
# ----------------------------------------------------------------------------------


do
 {
Clear
$MakeTopAndButtom
$MakeSpaces
$MakeSpaces
$MakeSpaces
$MakeSpaces	 
	 
CenterText "         :: Spiecify Installer by V_For_Volcano ::"
$MakeSpaces
CenterText " >[1] Per installare Spicetify "
CenterText "           >[2] Per installare Spicetify Marketplace "


$MakeSpaces
$MakeSpaces
$MakeSpaces
$MakeSpaces
$MakeTopAndButtom

' '
' '
  $selection = Read-Host "Digita un numero[1,2] " 
	 

     switch ($selection)
     {
         '1' {
             iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1 | iex
			 clear

         } '2' {
             iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.ps1 | iex
			 clear
         } 
     }
     pause
 }
 until ($selection -eq 'q')
 


Read-Host
