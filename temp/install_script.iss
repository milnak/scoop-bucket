;InnoSetupVersion=5.5.7

[Setup]
AppName=Trader's Little Helper
AppVerName=Trader's Little Helper 2.8.4
AppId=TradersLittleHelper
AppVersion=2.8.4
AppPublisher=Robert Hoffmann
AppPublisherURL=http://tlh.easytree.org/
DefaultDirName={pf}\Trader's Little Helper
DefaultGroupName=Trader's Little Helper
UninstallFilesDir={app}\Uninstall
OutputBaseFilename=tralih284185
Compression=lzma2
DisableDirPage=auto
DisableProgramGroupPage=auto
ChangesAssociations=yes
LicenseFile=embedded\License.rtf
WizardImageFile=embedded\WizardImage0.bmp
WizardSmallImageFile=embedded\WizardSmallImage0.bmp

[Files]
Source: "{tmp}\AboutInfo1.rtf"; DestDir: "{tmp}"; MinVersion: 0.0,5.01; Flags: deleteafterinstall dontcopy 
Source: "{tmp}\AboutInfo2.rtf"; DestDir: "{tmp}"; MinVersion: 0.0,5.01; Flags: deleteafterinstall dontcopy 
Source: "{tmp}\AboutInfo3.rtf"; DestDir: "{tmp}"; MinVersion: 0.0,5.01; Flags: deleteafterinstall dontcopy 
Source: "{tmp}\AboutInfo4.rtf"; DestDir: "{tmp}"; MinVersion: 0.0,5.01; Flags: deleteafterinstall dontcopy 
Source: "{app}\changelog.txt"; DestDir: "{app}"; MinVersion: 0.0,5.01; Flags: ignoreversion 
Source: "{app}\tralih.exe"; DestDir: "{app}"; MinVersion: 0.0,5.01; Flags: ignoreversion 
Source: "{app}\external.exe"; DestDir: "{app}"; Check: "UpdateFile(10)"; MinVersion: 0.0,5.01; Flags: ignoreversion 
Source: "{app}\CmdlineApps\aucdtect.exe"; DestDir: "{app}\CmdlineApps"; Check: "UpdateFile(1)"; MinVersion: 0.0,5.01; 
Source: "{app}\CmdlineApps\flac.exe"; DestDir: "{app}\CmdlineApps"; Check: "UpdateFile(2)"; MinVersion: 0.0,5.01; 
Source: "{app}\CmdlineApps\lame.exe"; DestDir: "{app}\CmdlineApps"; Check: "UpdateFile(3)"; MinVersion: 0.0,5.01; 
Source: "{app}\CmdlineApps\mac.exe"; DestDir: "{app}\CmdlineApps"; Check: "UpdateFile(4)"; MinVersion: 0.0,5.01; 
Source: "{app}\CmdlineApps\metaflac.exe"; DestDir: "{app}\CmdlineApps"; Check: "UpdateFile(5)"; MinVersion: 0.0,5.01; 
Source: "{app}\CmdlineApps\mkwcon.exe"; DestDir: "{app}\CmdlineApps"; Check: "UpdateFile(6)"; MinVersion: 0.0,5.01; 
Source: "{app}\CmdlineApps\mkwm4.drv"; DestDir: "{app}\CmdlineApps"; Check: "UpdateFile(7)"; MinVersion: 0.0,5.01; 
Source: "{app}\CmdlineApps\shntool.exe"; DestDir: "{app}\CmdlineApps"; Check: "UpdateFile(8)"; MinVersion: 0.0,5.01; 
Source: "{app}\CmdlineApps\shorten.exe"; DestDir: "{app}\CmdlineApps"; Check: "UpdateFile(9)"; MinVersion: 0.0,5.01; 
Source: "{userappdata}\Trader's Little Helper\tracker.lst"; DestDir: "{userappdata}\Trader's Little Helper"; Check: "UpdateSingleTrackerList"; MinVersion: 0.0,5.01; Flags: ignoreversion 

[Dirs]
Name: "{userappdata}\Trader's Little Helper"; Flags: uninsalwaysuninstall 

[Registry]
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann"; Check: "WriteToHKLM(1)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; Check: "WriteToHKLM(2)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "CurrentVersion"; ValueType: String; ValueData: "2.8.4.185"; Check: "WriteToHKLM(3)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\tralih.exe"; Check: "WriteToHKLM(11)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\tralih.exe"; ValueType: String; ValueData: "{app}\tralih.exe"; Check: "WriteToHKLM(12)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\tralih.exe"; ValueName: "Path"; ValueType: String; ValueData: "{app}"; Check: "WriteToHKLM(13)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\tralih.exe"; ValueName: "Dummy"; ValueType: String; Check: "WriteToHKLM(14)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann"; Check: "WriteToRegistry(1)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; Check: "WriteToRegistry(2)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "AddInfoChksumFile"; ValueType: Dword; ValueData: "$0"; Check: "WriteToRegistry(11)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "AddInfoFileDetailsLog"; ValueType: Dword; ValueData: "$0"; Check: "WriteToRegistry(12)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "AppendStrFixPad"; ValueType: Dword; ValueData: "$B"; Check: "WriteToRegistry(13)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "AppendStrStrip"; ValueType: Dword; ValueData: "$1"; Check: "WriteToRegistry(14)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "AutoSaveChksumFile"; ValueType: Dword; ValueData: "$0"; Check: "WriteToRegistry(15)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "ClearChksumFileList"; ValueType: Dword; ValueData: "$1"; Check: "WriteToRegistry(16)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "ClearFileList"; ValueType: Dword; ValueData: "$1"; Check: "WriteToRegistry(17)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "CompressionFmtSettings"; ValueType: Dword; ValueData: "$16A"; Check: "WriteToRegistry(18)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "ConfirmExit"; ValueType: Dword; ValueData: "$1"; Check: "WriteToRegistry(19)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "ConfirmFileOrderCreateCFP"; ValueType: Dword; ValueData: "$1"; Check: "WriteToRegistry(20)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "ConfirmFileOrderEncode"; ValueType: Dword; ValueData: "$1"; Check: "WriteToRegistry(21)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "ConfirmFileOrderFix"; ValueType: Dword; ValueData: "$1"; Check: "WriteToRegistry(22)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "ConfirmOverwriteFlacSrc"; ValueType: Dword; ValueData: "$1"; Check: "WriteToRegistry(23)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "CreateChksumFileAuto"; ValueType: Dword; ValueData: "$0"; Check: "WriteToRegistry(24)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "DetectMode"; ValueType: Dword; ValueData: "$8"; Check: "WriteToRegistry(26)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "DirAddFilesFrom"; ValueType: String; ValueData: "-1"; Check: "WriteToRegistry(27)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "DirTorrentFilesFrom"; ValueType: String; ValueData: "-1"; Check: "WriteToRegistry(28)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "DirTorrentFilesTo"; ValueType: String; ValueData: "-1"; Check: "WriteToRegistry(29)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "DirWriteFilesTo"; ValueType: String; ValueData: "-1"; Check: "WriteToRegistry(30)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "EncodingFmt"; ValueType: Dword; ValueData: "$2"; Check: "WriteToRegistry(31)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "ExclFromFileList"; ValueType: String; ValueData: ".db;.torrent"; Check: "WriteToRegistry(33)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "FixReEncodingLevel"; ValueType: Dword; ValueData: "$1A"; Check: "WriteToRegistry(34)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "FlacReEncodingLevel"; ValueType: Dword; ValueData: "$6"; Check: "WriteToRegistry(35)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "FmtToConvertTo"; ValueType: Dword; ValueData: "$2"; Check: "WriteToRegistry(37)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "InclPiecesOutOfPos"; ValueType: Dword; ValueData: "$0"; Check: "WriteToRegistry(39)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "InclSubfolders"; ValueType: Dword; ValueData: "$0"; Check: "WriteToRegistry(40)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "MP3EncodingModeSettings"; ValueType: Dword; ValueData: "$B98C80"; Check: "WriteToRegistry(42)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "PostEncodingTasks"; ValueType: Dword; ValueData: "$0"; Check: "WriteToRegistry(43)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "PostReEncodingTasks"; ValueType: Dword; ValueData: "$0"; Check: "WriteToRegistry(44)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "PrivateTorrent"; ValueType: Dword; ValueData: "$1"; Check: "WriteToRegistry(45)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "ShellIntegration"; ValueType: Dword; ValueData: "$0"; Check: "WriteToRegistry(46)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "SizeUnits"; ValueType: Dword; ValueData: "$0"; Check: "WriteToRegistry(47)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "StartupPage"; ValueType: Dword; ValueData: "$0"; Check: "WriteToRegistry(48)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "TorrentPropertiesPage"; ValueType: Dword; ValueData: "$1"; Check: "WriteToRegistry(49)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "Tracker"; ValueType: String; ValueData: "-1"; Check: "WriteToRegistry(50)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "TypeChksumFileCreate"; ValueType: Dword; ValueData: "$3"; Check: "WriteToRegistry(51)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "TypeChksumFileCreatePostEncoding"; ValueType: Dword; ValueData: "$5349"; Check: "WriteToRegistry (52)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "UTF8Encoding"; ValueType: Dword; ValueData: "$1"; Check: "WriteToRegistry(53)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "VerifyChksumFilesAuto"; ValueType: Dword; ValueData: "$0"; Check: "WriteToRegistry(54)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "WndPosSize"; ValueType: String; ValueData: "-1"; Check: "WriteToRegistry(55)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Robert Hoffmann\Trader's Little Helper"; ValueName: "Dummy"; ValueType: String; Check: "WriteToRegistry(99)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "SOFTWARE\Classes\Directory"; Tasks: shellintegration; Check: "WriteToRegistry(101)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "SOFTWARE\Classes\Directory\shell"; Tasks: shellintegration; Check: "WriteToRegistry(102)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "SOFTWARE\Classes\Directory\shell\tralih"; ValueType: String; ValueData: "Trader's Little Helper ..."; Tasks: shellintegration; Check: "WriteToRegistry(103)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "SOFTWARE\Classes\Directory\shell\tralih\command"; ValueType: String; ValueData: """{app}\tralih.exe"" /0 ""%1"""; Tasks: shellintegration; Check: "WriteToRegistry(104)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "SOFTWARE\Classes\Drive"; Tasks: shellintegration; Check: "WriteToRegistry(105)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "SOFTWARE\Classes\Drive\shell"; Tasks: shellintegration; Check: "WriteToRegistry(106)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "SOFTWARE\Classes\Drive\shell\tralih"; ValueType: String; ValueData: "Trader's Little Helper ..."; Tasks: shellintegration; Check: "WriteToRegistry(107)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "SOFTWARE\Classes\Drive\shell\tralih\command"; ValueType: String; ValueData: """{app}\tralih.exe"" /0 ""%1"""; Tasks: shellintegration; Check: "WriteToRegistry(108)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "SOFTWARE\Classes\Drive\shell\tralih\command"; ValueName: "Dummy"; ValueType: String; Tasks: shellintegration; Check: "WriteToRegistry(199)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\.cfp"; ValueType: String; ValueData: "cfpfile"; Tasks: shellintegration; Check: "AssocFileExtHKLM('.cfp','cfpfile',1)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\cfpfile"; ValueType: String; ValueData: "Composite MD5 Fingerprint File"; Tasks: shellintegration; Check: "AssocFileExtHKLM('cfpfile','Composite MD5 Fingerprint File',2)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\cfpfile\DefaultIcon"; ValueType: String; ValueData: "{app}\tralih.exe,5"; Tasks: shellintegration; Check: "AssocFileExtHKLM('cfpfile\DefaultIcon',ExpandConstant('{app}\tralih.exe,5'),3)"; MinVersion: 0.0,5.01; Flags: uninsclearvalue 
Root: HKLM; Subkey: "Software\Classes\cfpfile\shell"; ValueType: String; ValueData: "tralih"; Tasks: shellintegration; Check: "AssocFileExtHKLM('cfpfile\shell','tralih',4)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\Classes\cfpfile\shell\tralih"; ValueType: String; ValueData: "Trader's Little Helper ..."; Tasks: shellintegration; Check: "AssocFileExtHKLM('cfpfile\shell\tralih','Trader''s Little Helper ...',5)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\cfpfile\shell\tralih\command"; ValueType: String; ValueData: """{app}\tralih.exe"" /1 ""%1"""; Tasks: shellintegration; Check: "AssocFileExtHKLM('cfpfile\shell\tralih\command',ExpandConstant('{app}\tralih.exe'),6)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\.ffp"; ValueType: String; ValueData: "ffpfile"; Tasks: shellintegration; Check: "AssocFileExtHKLM('.ffp','ffpfile',1)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\ffpfile"; ValueType: String; ValueData: "FLAC Fingerprint File"; Tasks: shellintegration; Check: "AssocFileExtHKLM('ffpfile','FLAC Fingerprint File',2)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\ffpfile\DefaultIcon"; ValueType: String; ValueData: "{app}\tralih.exe,6"; Tasks: shellintegration; Check: "AssocFileExtHKLM('ffpfile\DefaultIcon',ExpandConstant('{app}\tralih.exe,6'),3)"; MinVersion: 0.0,5.01; Flags: uninsclearvalue 
Root: HKLM; Subkey: "Software\Classes\ffpfile\shell"; ValueType: String; ValueData: "tralih"; Tasks: shellintegration; Check: "AssocFileExtHKLM('ffpfile\shell','tralih',4)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\Classes\ffpfile\shell\tralih"; ValueType: String; ValueData: "Trader's Little Helper ..."; Tasks: shellintegration; Check: "AssocFileExtHKLM('ffpfile\shell\tralih','Trader''s Little Helper ...',5)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\ffpfile\shell\tralih\command"; ValueType: String; ValueData: """{app}\tralih.exe"" /1 ""%1"""; Tasks: shellintegration; Check: "AssocFileExtHKLM('ffpfile\shell\tralih\command',ExpandConstant('{app}\tralih.exe'),6)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\.md5"; ValueType: String; ValueData: "md5file"; Tasks: shellintegration; Check: "AssocFileExtHKLM('.md5','md5file',1)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\md5file"; ValueType: String; ValueData: "Wholefile MD5 Checksum File"; Tasks: shellintegration; Check: "AssocFileExtHKLM('md5file','Wholefile MD5 Checksum File',2)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\md5file\DefaultIcon"; ValueType: String; ValueData: "{app}\tralih.exe,7"; Tasks: shellintegration; Check: "AssocFileExtHKLM('md5file\DefaultIcon',ExpandConstant('{app}\tralih.exe,7'),3)"; MinVersion: 0.0,5.01; Flags: uninsclearvalue 
Root: HKLM; Subkey: "Software\Classes\md5file\shell"; ValueType: String; ValueData: "tralih"; Tasks: shellintegration; Check: "AssocFileExtHKLM('md5file\shell','tralih',4)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\Classes\md5file\shell\tralih"; ValueType: String; ValueData: "Trader's Little Helper ..."; Tasks: shellintegration; Check: "AssocFileExtHKLM('md5file\shell\tralih','Trader''s Little Helper ...',5)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\md5file\shell\tralih\command"; ValueType: String; ValueData: """{app}\tralih.exe"" /1 ""%1"""; Tasks: shellintegration; Check: "AssocFileExtHKLM('md5file\shell\tralih\command',ExpandConstant('{app}\tralih.exe'),6)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\.sfv"; ValueType: String; ValueData: "sfvfile"; Tasks: shellintegration; Check: "AssocFileExtHKLM('.sfv','sfvfile',1)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\sfvfile"; ValueType: String; ValueData: "SFV Checksum File"; Tasks: shellintegration; Check: "AssocFileExtHKLM('sfvfile','SFV Checksum File',2)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\sfvfile\DefaultIcon"; ValueType: String; ValueData: "{app}\tralih.exe,8"; Tasks: shellintegration; Check: "AssocFileExtHKLM('sfvfile\DefaultIcon',ExpandConstant('{app}\tralih.exe,8'),3)"; MinVersion: 0.0,5.01; Flags: uninsclearvalue 
Root: HKLM; Subkey: "Software\Classes\sfvfile\shell"; ValueType: String; ValueData: "tralih"; Tasks: shellintegration; Check: "AssocFileExtHKLM('sfvfile\shell','tralih',4)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\Classes\sfvfile\shell\tralih"; ValueType: String; ValueData: "Trader's Little Helper ..."; Tasks: shellintegration; Check: "AssocFileExtHKLM('sfvfile\shell\tralih','Trader''s Little Helper ...',5)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\sfvfile\shell\tralih\command"; ValueType: String; ValueData: """{app}\tralih.exe"" /1 ""%1"""; Tasks: shellintegration; Check: "AssocFileExtHKLM('sfvfile\shell\tralih\command',ExpandConstant('{app}\tralih.exe'),6)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\.st5"; ValueType: String; ValueData: "st5file"; Tasks: shellintegration; Check: "AssocFileExtHKLM('.st5','st5file',1)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\st5file"; ValueType: String; ValueData: "Shntool MD5 Fingerprint File"; Tasks: shellintegration; Check: "AssocFileExtHKLM('st5file','Shntool MD5 Fingerprint File',2)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\st5file\DefaultIcon"; ValueType: String; ValueData: "{app}\tralih.exe,9"; Tasks: shellintegration; Check: "AssocFileExtHKLM('st5file\DefaultIcon',ExpandConstant('{app}\tralih.exe,9'),3)"; MinVersion: 0.0,5.01; Flags: uninsclearvalue 
Root: HKLM; Subkey: "Software\Classes\st5file\shell"; ValueType: String; ValueData: "tralih"; Tasks: shellintegration; Check: "AssocFileExtHKLM('st5file\shell','tralih',4)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\Classes\st5file\shell\tralih"; ValueType: String; ValueData: "Trader's Little Helper ..."; Tasks: shellintegration; Check: "AssocFileExtHKLM('st5file\shell\tralih','Trader''s Little Helper ...',5)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\st5file\shell\tralih\command"; ValueType: String; ValueData: """{app}\tralih.exe"" /1 ""%1"""; Tasks: shellintegration; Check: "AssocFileExtHKLM('st5file\shell\tralih\command',ExpandConstant('{app}\tralih.exe'),6)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\.ape"; ValueType: String; ValueData: "apefile"; Tasks: shellintegration; Check: "AssocFileExtHKLM('.ape','apefile',1)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\apefile"; ValueType: String; ValueData: "Monkey's Audio"; Tasks: shellintegration; Check: "AssocFileExtHKLM('apefile','Monkey''s Audio',2)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\apefile\DefaultIcon"; ValueType: String; ValueData: "{app}\tralih.exe,1"; Tasks: shellintegration; Check: "AssocFileExtHKLM('apefile\DefaultIcon',ExpandConstant('{app}\tralih.exe,1'),3)"; MinVersion: 0.0,5.01; Flags: uninsclearvalue 
Root: HKLM; Subkey: "Software\Classes\apefile\shell"; ValueType: String; Tasks: shellintegration; Check: "AssocFileExtHKLM('apefile\shell','',4)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\Classes\apefile\shell\tralih"; ValueType: String; ValueData: "Trader's Little Helper ..."; Tasks: shellintegration; Check: "AssocFileExtHKLM('apefile\shell\tralih','Trader''s Little Helper ...',5)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\apefile\shell\tralih\command"; ValueType: String; ValueData: """{app}\tralih.exe"" /3 ""%1"""; Tasks: shellintegration; Check: "AssocFileExtHKLM('apefile\shell\tralih\command',ExpandConstant('{app}\tralih.exe'),8)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\.flac"; ValueType: String; ValueData: "flacfile"; Tasks: shellintegration; Check: "AssocFileExtHKLM('.flac','flacfile',1)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\flacfile"; ValueType: String; ValueData: "FLAC File"; Tasks: shellintegration; Check: "AssocFileExtHKLM('flacfile','FLAC File',2)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\flacfile\DefaultIcon"; ValueType: String; ValueData: "{app}\tralih.exe,2"; Tasks: shellintegration; Check: "AssocFileExtHKLM('flacfile\DefaultIcon',ExpandConstant('{app}\tralih.exe,2'),3)"; MinVersion: 0.0,5.01; Flags: uninsclearvalue 
Root: HKLM; Subkey: "Software\Classes\flacfile\shell"; ValueType: String; Tasks: shellintegration; Check: "AssocFileExtHKLM('flacfile\shell','',4)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\Classes\flacfile\shell\tralih"; ValueType: String; ValueData: "Trader's Little Helper ..."; Tasks: shellintegration; Check: "AssocFileExtHKLM('flacfile\shell\tralih','Trader''s Little Helper ...',5)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\flacfile\shell\tralih\command"; ValueType: String; ValueData: """{app}\tralih.exe"" /3 ""%1"""; Tasks: shellintegration; Check: "AssocFileExtHKLM('flacfile\shell\tralih\command',ExpandConstant('{app}\tralih.exe'),8)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\.mkw"; ValueType: String; ValueData: "mkwfile"; Tasks: shellintegration; Check: "AssocFileExtHKLM('.mkw','mkwfile',1)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\mkwfile"; ValueType: String; ValueData: "Compressed Audio (mkw)"; Tasks: shellintegration; Check: "AssocFileExtHKLM('mkwfile','Compressed Audio (mkw)',2)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\mkwfile\DefaultIcon"; ValueType: String; ValueData: "{app}\tralih.exe,3"; Tasks: shellintegration; Check: "AssocFileExtHKLM('mkwfile\DefaultIcon',ExpandConstant('{app}\tralih.exe,3'),3)"; MinVersion: 0.0,5.01; Flags: uninsclearvalue 
Root: HKLM; Subkey: "Software\Classes\mkwfile\shell"; ValueType: String; Tasks: shellintegration; Check: "AssocFileExtHKLM('mkwfile\shell','',4)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\Classes\mkwfile\shell\tralih"; ValueType: String; ValueData: "Trader's Little Helper ..."; Tasks: shellintegration; Check: "AssocFileExtHKLM('mkwfile\shell\tralih','Trader''s Little Helper ...',5)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\mkwfile\shell\tralih\command"; ValueType: String; ValueData: """{app}\tralih.exe"" /3 ""%1"""; Tasks: shellintegration; Check: "AssocFileExtHKLM('mkwfile\shell\tralih\command',ExpandConstant('{app}\tralih.exe'),8)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\.mp2"; ValueType: String; ValueData: "mpegfile"; Tasks: shellintegration; Check: "AssocFileExtHKLM('.mp2','mpegfile',1)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\mpegfile"; ValueType: String; ValueData: "MP2 Format Sound"; Tasks: shellintegration; Check: "AssocFileExtHKLM('mpegfile','MP2 Format Sound',2)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\mpegfile\shell"; ValueType: String; Tasks: shellintegration; Check: "AssocFileExtHKLM('mpegfile\shell','',4)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\Classes\mpegfile\shell\tralih"; ValueType: String; ValueData: "Trader's Little Helper ..."; Tasks: shellintegration; Check: "AssocFileExtHKLM('mpegfile\shell\tralih','Trader''s Little Helper ...',5)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\mpegfile\shell\tralih\command"; ValueType: String; ValueData: """{app}\tralih.exe"" /2 ""%1"""; Tasks: shellintegration; Check: "AssocFileExtHKLM('mpegfile\shell\tralih\command',ExpandConstant('{app}\tralih.exe'),7)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\.mp3"; ValueType: String; ValueData: "mp3file"; Tasks: shellintegration; Check: "AssocFileExtHKLM('.mp3','mp3file',1)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\mp3file"; ValueType: String; ValueData: "MP3 Format Sound"; Tasks: shellintegration; Check: "AssocFileExtHKLM('mp3file','MP3 Format Sound',2)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\mp3file\shell"; ValueType: String; Tasks: shellintegration; Check: "AssocFileExtHKLM('mp3file\shell','',4)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\Classes\mp3file\shell\tralih"; ValueType: String; ValueData: "Trader's Little Helper ..."; Tasks: shellintegration; Check: "AssocFileExtHKLM('mp3file\shell\tralih','Trader''s Little Helper ...',5)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\mp3file\shell\tralih\command"; ValueType: String; ValueData: """{app}\tralih.exe"" /2 ""%1"""; Tasks: shellintegration; Check: "AssocFileExtHKLM('mp3file\shell\tralih\command',ExpandConstant('{app}\tralih.exe'),7)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\.shn"; ValueType: String; ValueData: "shnfile"; Tasks: shellintegration; Check: "AssocFileExtHKLM('.shn','shnfile',1)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\shnfile"; ValueType: String; ValueData: "Compressed Audio (Shorten)"; Tasks: shellintegration; Check: "AssocFileExtHKLM('shnfile','Compressed Audio (Shorten)',2)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\shnfile\DefaultIcon"; ValueType: String; ValueData: "{app}\tralih.exe,4"; Tasks: shellintegration; Check: "AssocFileExtHKLM('shnfile\DefaultIcon',ExpandConstant('{app}\tralih.exe,4'),3)"; MinVersion: 0.0,5.01; Flags: uninsclearvalue 
Root: HKLM; Subkey: "Software\Classes\shnfile\shell"; ValueType: String; Tasks: shellintegration; Check: "AssocFileExtHKLM('shnfile\shell','',4)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\Classes\shnfile\shell\tralih"; ValueType: String; ValueData: "Trader's Little Helper ..."; Tasks: shellintegration; Check: "AssocFileExtHKLM('shnfile\shell\tralih','Trader''s Little Helper ...',5)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\shnfile\shell\tralih\command"; ValueType: String; ValueData: """{app}\tralih.exe"" /3 ""%1"""; Tasks: shellintegration; Check: "AssocFileExtHKLM('shnfile\shell\tralih\command',ExpandConstant('{app}\tralih.exe'),8)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\.wav"; ValueType: String; ValueData: "soundrec"; Tasks: shellintegration; Check: "AssocFileExtHKLM('.wav','soundrec',1)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\SoundRec"; ValueType: String; ValueData: "Wave Sound"; Tasks: shellintegration; Check: "AssocFileExtHKLM('SoundRec','Wave Sound',2)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\SoundRec\shell"; ValueType: String; Tasks: shellintegration; Check: "AssocFileExtHKLM('SoundRec\shell','',4)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\Classes\SoundRec\shell\tralih"; ValueType: String; ValueData: "Trader's Little Helper ..."; Tasks: shellintegration; Check: "AssocFileExtHKLM('SoundRec\shell\tralih','Trader''s Little Helper ...',5)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\SoundRec\shell\tralih\command"; ValueType: String; ValueData: """{app}\tralih.exe"" /4 ""%1"""; Tasks: shellintegration; Check: "AssocFileExtHKLM('SoundRec\shell\tralih\command',ExpandConstant('{app}\tralih.exe'),9)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\.torrent"; ValueType: String; ValueData: "torrentfile"; Tasks: shellintegration; Check: "AssocFileExtHKLM('.torrent','torrentfile',1)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\torrentfile"; ValueType: String; ValueData: "Torrent File"; Tasks: shellintegration; Check: "AssocFileExtHKLM('torrentfile','Torrent File',2)"; MinVersion: 0.0,5.01; 
Root: HKLM; Subkey: "Software\Classes\torrentfile\shell"; ValueType: String; Tasks: shellintegration; Check: "AssocFileExtHKLM('torrentfile\shell','',4)"; MinVersion: 0.0,5.01; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\Classes\torrentfile\shell\tralih"; ValueType: String; ValueData: "Trader's Little Helper ..."; Tasks: shellintegration; Check: "AssocFileExtHKLM('torrentfile\shell\tralih','Trader''s Little Helper ...',5)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\Classes\torrentfile\shell\tralih\command"; ValueType: String; ValueData: """{app}\tralih.exe"" /5 ""%1"""; Tasks: shellintegration; Check: "AssocFileExtHKLM('torrentfile\shell\tralih\command',ExpandConstant('{app}\tralih.exe'),10)"; MinVersion: 0.0,5.01; Flags: uninsdeletekey 

[Icons]
Name: "{group}\Trader's Little Helper"; Filename: "{app}\tralih.exe"; MinVersion: 0.0,5.01; 
Name: "{group}\Change Log"; Filename: "{app}\changelog.txt"; MinVersion: 0.0,5.01; 
Name: "{group}\Uninstall"; Filename: "{uninstallexe}"; MinVersion: 0.0,5.01; 
Name: "{commondesktop}\Trader's Little Helper"; Filename: "{app}\tralih.exe"; Tasks: desktopicon; MinVersion: 0.0,5.01; 

[Tasks]
Name: "shellintegration"; Description: "Integrate TLH into Windows Explorer &context menus"; Check: "ShellIntegration"; MinVersion: 0.0,5.01; 
Name: "shellintegration"; Description: "Integrate TLH into Windows Explorer &context menus"; Check: "not ShellIntegration"; MinVersion: 0.0,5.01; 
Name: "dragdrop"; Description: "Enable TLH to accept files/folders &dropped from Windows Explorer"; Check: "DragDrop"; MinVersion: 0.0,5.01; 
Name: "dragdrop"; Description: "Enable TLH to accept files/folders &dropped from Windows Explorer"; Check: "not DragDrop"; MinVersion: 0.0,5.01; 
Name: "desktopicon"; Description: "Create desktop &icon"; Check: "DesktopIcon"; MinVersion: 0.0,5.01; 
Name: "desktopicon"; Description: "Create desktop &icon"; Check: "not DesktopIcon"; MinVersion: 0.0,5.01; 

[CustomMessages]
default.NameAndVersion=%1 version %2
default.AdditionalIcons=Additional shortcuts:
default.CreateDesktopIcon=Create a &desktop shortcut
default.CreateQuickLaunchIcon=Create a &Quick Launch shortcut
default.ProgramOnTheWeb=%1 on the Web
default.UninstallProgram=Uninstall %1
default.LaunchProgram=Launch %1
default.AssocFileExtension=&Associate %1 with the %2 file extension
default.AssocingFileExtension=Associating %1 with the %2 file extension...
default.AutoStartProgramGroupDescription=Startup:
default.AutoStartProgram=Automatically start %1
default.AddonHostProgramNotFound=%1 could not be located in the folder you selected.%n%nDo you want to continue anyway?
ApplicationName=Trader's Little Helper
ApplicationVersionName=Trader's Little Helper 2.8.4
NewInstall=This will install Trader's Little Helper 2.8.4 on your computer.
Upgrade=This will upgrade the installed version of Trader's Little Helper on your computer to version 2.8.4.
Recommendation=%n%nIt is recommended that you close all other applications before continuing.

[Languages]
; These files are stubs
; To achieve better results after recompilation, use the real language files
Name: "default"; MessagesFile: "embedded\default.isl"; 
