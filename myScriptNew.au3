Func GetDefaultBrowser()
    Local $regKey = "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice"
    Local $defaultBrowserProgId = RegRead($regKey, "ProgId")
    
    If @error Then
        Return "Unknown"
    EndIf
    
    Switch $defaultBrowserProgId
        Case "ChromeHTML"
            Return "Chrome"
        Case "FirefoxURL", "FirefoxHTML", "MozillaFirefox"
            Return "Firefox"
        Case "MSEdgeHTM"
            Return "Edge"
        Case Else
            Return "Unknown"
    EndSwitch
EndFunc



; Click download button based on the browser
Func ClickDownloadButton($browser, $isDefault)
    Switch $browser
        Case "Chrome"
            If $isDefault Then
                MouseClick("left", 300, 650) ; Coordinates for default Chrome
            Else
                MouseClick("left", 326, 740) ; Coordinates for non-default Chrome
            EndIf
        Case "Edge"
            MouseClick("left", 310, 640) ; coordinates for Edge
        Case "Firefox"
            MouseClick("left", 350, 680) ; coordinates for Firefox
        Case Else
            MsgBox(0, "Error", "Browser not supported!")
    EndSwitch
EndFunc


Local $defaultBrowser = GetDefaultBrowser()
If $defaultBrowser = "Unknown" Then
    $defaultBrowser = "Firefox"
EndIf

Local $selectedBrowser = InputBox("Browser Selection", "Enter the browser you want to use (Chrome, Firefox, Edge):")

If $selectedBrowser = "" Then
    MsgBox(0, "Error", "No browser selected.")
    Exit
EndIf

Local $isDefault = ($defaultBrowser = $selectedBrowser)


; Open selected browser
Select
    Case $selectedBrowser = "Chrome"
        Run('"C:\Program Files\Google\Chrome\Application\chrome.exe" --new-window --start-maximized https://pcapp.store/')
    Case $selectedBrowser = "Firefox"
        Run('"C:\Program Files\Mozilla Firefox\firefox.exe" -new-window https://pcapp.store/')
    Case $selectedBrowser = "Edge"
        Run('"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --new-window https://pcapp.store/')
    Case Else
        MsgBox(0, "Error", "Unsupported browser.")
        Exit
EndSelect


Sleep(7000)
ClickDownloadButton($selectedBrowser, $isDefault)


Sleep(5000)

Local $downloadsFolder = @UserProfileDir & "\Downloads"
Local $setupFilePath = $downloadsFolder & "\Setup.exe"


Run($setupFilePath)


Sleep(5500)
controlClick("PC App Store Setup", "", 1)