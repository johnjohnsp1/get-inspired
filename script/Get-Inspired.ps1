# -------------------------------------------------  Author        :   Laure Kamalandua  ------------------------------------------------- #
# -------------------------------------------------  Contact       :   laure.kamalandua@gmail.com  --------------------------------------- #
# -------------------------------------------------  Version       :   1 ----------------------------------------------------------------- #
# -------------------------------------------------  Description   :   Fetches a random inspirational quote ------------------------------ #

function Get-Inspired() {
    $APIurl = 'http://www.forismatic.com/api/1.0/'
    $client = New-Object System.Net.WebClient
    $client.Headers.Add("Content-Type", "application/x-www-form-urlencoded")
    $client.Encoding = [System.Text.Encoding]::UTF8
    [xml]$quote = $client.UploadString($apiUrl, 'method=getQuote&lang=en&format=xml')
    $quoteFull = $quote.forismatic.quote.quotetext +"- " + $quote.forismatic.quote.quoteauthor
    $quoteAuthor = $quote.forismatic.quote.quoteauthor
    $quoteChars = $quoteFull.Length
    $quoteArray = $quoteFull.Split()
    $quoteWords = ($quoteFull | Measure-Object -Word).Words
    $splitIndex = ($quoteWords/2)
    $splitWord = $quoteArray[$splitIndex]
    $splitWordFloor = [math]::floor($splitIndex)
    $correctIndex = $quoteFull.LastIndexOf($splitWord)
    if ($quoteChars -gt 66 -AND $quoteChars -lt 180){
        $finalQuote = $quoteFull.Insert($correctIndex, "       `r`n" + '       ')
        "`r`n" + '       ' + '*' * $correctIndex +"`r`n"
        Write-Host '      ' $finalQuote -ForegroundColor Yellow
        "`r`n" + '       ' + '*' * $correctIndex + "`r`n"
        break
    } elseif ($quoteChars -gt 0 -AND $quoteChars -lt 65) {
        "`r`n" + '       ' + '*' * $quoteChars +"`r`n"
        Write-Host '      ' $quoteFull -ForegroundColor Yellow
        "`r`n" + '       ' + '*' * $quoteChars + "`r`n"
        break
    } else {
        "`r`n" + '       ' + '*' * $quoteChars +"`r`n"
        Write-Host '      ' $quoteFull -ForegroundColor Yellow
        "`r`n" + '       ' + '*' * $quoteChars + "`r`n"
        break
    }
}

Get-Inspired


