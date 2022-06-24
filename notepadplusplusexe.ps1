# This needs to be set as the name of the 64-bit Notepad++ .exe file you upload
$saveFile = "filename.exe"

#Handle Exit Codes:
trap { $host.ui.WriteErrorLine($_.Exception); exit 90 }

###### Installing application on system ######
Try {
    $process = Start-Process -FilePath "$saveFile" -ArgumentList "/S" -Wait -PassThru -ErrorAction Stop
    Write-Output "Notepad++ Installation Finished..."
}
Catch { $Exception = $error[0].Exception.Message + "`nAt Line " + $error[0].InvocationInfo.ScriptLineNumber
        Write-Output $Exception
        exit 90
}
