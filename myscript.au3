Func OpenBrowser($browser, $url)
    Switch $browser
        Case "Chrome"
            Run('"C:\Program Files\Google\Chrome\Application\chrome.exe" --new-window --start-maximized ' & $url)
        Case "Firefox"
            Run('"C:\Program Files\Mozilla Firefox\firefox.exe" -new-window ' & $url)
        Case "Edge"
            Run('"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" --new-window --start-maximized ' & $url)
        Case Else
            MsgBox(0, "Error", "Unsupported browser or browser not found.")
    EndSwitch
EndFunc


Local $browserChoice = InputBox("Browser Selection", "Enter the browser you want to use (Chrome, Firefox, Edge):")


If $browserChoice <> "" Then
    OpenBrowser($browserChoice, "https://pcapp.store/")
Else
    MsgBox(0, "Error", "No browser selected.")
EndIf


Sleep(3000)

MouseClick("left", 299, 661) 

Sleep(5000)

Local $downloadsFolder = @UserProfileDir & "\Downloads"
Local $setupFilePath = $downloadsFolder & "\Setup.exe"


Run($setupFilePath)


Sleep(5500)
controlClick("PC App Store Setup", "", 1)







