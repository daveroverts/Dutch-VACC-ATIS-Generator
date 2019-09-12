; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Dutch VACC ATIS Generator"
#define MyAppVersion GetFileVersion('Files\Dutch VACC - ATIS Generator.exe')
#define MyAppPublisher "Dutch VACC"
#define MyAppURL "http://www.dutchvacc.nl/"
#define MyAppExeName "Dutch VACC - ATIS Generator.exe"
#define FolderPath "\Dutch VACC\Dutch VACC ATIS Generator"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{C1B78CCE-F38E-4A8A-A919-DC8915EBB958}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}{#FolderPath}
DefaultGroupName={#FolderPath}
AllowNoIcons=true
OutputDir=C:\src\Dutch-VACC-ATIS-Generator\Installer
OutputBaseFilename=Dutch VACC ATIS Generator - Setup
Compression=lzma
SolidCompression=true
EnableDirDoesntExistWarning=true
AlwaysUsePersonalGroup=true

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}

[Files]
; MANUALS
Source: "Manuals\Handleiding ATC Operational Information.pdf"; DestDir: "{app}\manuals"; Flags: ignoreversion; Components: manuals
Source: "Manuals\Handleiding Dutch VACC ATIS Generator v2.pdf"; DestDir: "{app}\manuals"; Flags: ignoreversion; Components: manuals
; EXE
Source: "Files\Dutch VACC - ATIS Generator.exe"; DestDir: "{app}"; Flags: ignoreversion; Components: main
; DLLS
Source: "Files\NAudio.dll"; DestDir: "{app}"; Flags: ignoreversion uninsremovereadonly overwritereadonly; Attribs: readonly; Components: main\NAudio
Source: "Files\NAudio.WindowsMediaFormat.dll"; DestDir: "{app}"; Flags: ignoreversion uninsremovereadonly overwritereadonly; Attribs: readonly; Components: main\NAudio_WindowsMediaFormat
Source: "Files\Newtonsoft.Json.dll"; DestDir: "{app}"; Flags: ignoreversion uninsremovereadonly overwritereadonly; Attribs: readonly; Components: main\Newtonsoft_Json
Source: "Files\SimpleInjector.dll"; DestDir: "{app}"; Flags: ignoreversion uninsremovereadonly overwritereadonly; Attribs: readonly; Components: main\SimpleInjector
; ALERT SOUND
Source: "Files\alert.wav"; DestDir: "{app}/sounds"; Flags: ignoreversion; Components: main\alertsound
; ATIS MAIN FILES
Source: "Files\atis.wav"; DestDir: "{userdocs}\EuroScope\atis"; Flags: ignoreversion; Components: sounds
Source: "Files\atiseham.txt"; DestDir: "{userdocs}\EuroScope\atis"; Flags: ignoreversion; Components: sounds        
; ATIS SAMPLES
Source: "Files\Samples\eham1_0.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_1.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_1st_part.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_2.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_2nd_part.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_3.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_3rd_part.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_4.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_5.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_6.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_7.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_8.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_9.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_9_flat.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_a.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_and.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_b.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_bc.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_becoming.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_brakingaction.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_broken.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_c.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_callonly1.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_callonly2.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_callonly3.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_cavok.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_center.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_converging.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_cumulonimbus.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_d.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_damp.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_degrees.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_dewp.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_dme.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_drizzle.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_e.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_ehamarratis.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_ehamatis.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_ehamdepatis.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_ehbkatis.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_ehehatis.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_ehggatis.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_ehrdatis.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_endofinfo.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_f.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_feet.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_few.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_fog.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_fogpatches.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_freezing.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_g.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_good.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_gr.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_h.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_hail.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_haze.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_hp.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_hundred.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_i.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_independent.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_j.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_k.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_kilometers.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_knots.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_l.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_left.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_lessthan.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_light.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_lowqnh.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_lowvis.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_m.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_marktemperature.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_maximum.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_medium.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_meters.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_mifg.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_minimum.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_minus.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_mist.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_mlr.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_mr.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_mtr.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_n.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_na.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_nosig.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_nsc.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_nsw.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_o.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_opr.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_overcast.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_p.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_pause.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_percent.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_q.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_qnh.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_r.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_rain.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_right.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_rimeorfrost.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_runway.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_runwayconditions.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_rvronatc.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_s.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_scattered.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_shallow.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_showers.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_showersofrain.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_skyclear.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_slr.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_snow.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_snowgrains.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_softhail.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_str.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_t.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_talt.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_taxiwaysandaprons.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_tcu.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_temp.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_tempo.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_thousand.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_thunderstorms.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_tl.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_to.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_u.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_v.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_varbetween.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_variable.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_vcsh.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_vcts.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_vis.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_vor.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_vvis.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_w.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_weather.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_wind.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_x.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_y.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\eham1_z.wav"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples
Source: "Files\Samples\ehamsamples.txt"; DestDir: "{userdocs}\EuroScope\atis\samples"; Flags: ignoreversion; Components: sounds\Samples

[Icons]
Name: {group}\{#MyAppName}; Filename: {app}\{#MyAppExeName}
Name: {group}\Handleiding ATC Operational Information.pdf; Filename: {app}\manuals\Handleiding ATC Operational Information.pdf
Name: {group}\Handleiding Dutch VACC ATIS Generator v2.pdf; Filename: {app}\manuals\Handleiding Dutch VACC ATIS Generator v2.pdf
Name: {commondesktop}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Flags: nowait postinstall skipifsilent; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"
Filename: "{app}\manuals\Handleiding Dutch VACC ATIS Generator v2.pdf"; Flags: shellexec runasoriginaluser

[Components]
Name: main; Description: Dutch VACC - ATIS Generator.exe; Types: full compact custom; Flags: fixed
Name: main\alertsound; Description: alert.wav; Types: full compact custom; Flags: fixed
Name: main\NAudio; Description: NAudio.dll; Types: full compact custom; Flags: fixed
Name: main\NAudio_WindowsMediaFormat; Description: NAudio.WindowsMediaFormat.dll; Types: full compact custom; Flags: fixed
Name: main\Newtonsoft_Json; Description: Newtonsoft.Json.dll; Types: full compact custom; Flags: fixed
Name: main\SimpleInjector; Description: SimpleInjector.dll; Types: full compact custom; Flags: fixed
Name: sounds; Description: ATIS Sound Files; Types: full compact custom; Flags: fixed
Name: sounds\Samples; Description: ATIS Samples; Types: full compact custom; Flags: fixed
Name: manuals; Description: Manuals; Types: full compact custom; Flags: fixed

[UninstallDelete]
Type: files; Name: "{app}\settings.ini"
Type: dirifempty; Name: "{userdocs}\EuroScope\atis\samples\"

[InstallDelete]
Type: files; Name: "{userdocs}\EuroScope\atis\atiseham.txt"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_0.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_1.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_1st_part.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_2.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_2nd_part.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_3.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_3rd_part.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_4.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_5.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_6.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_7.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_8.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_9.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_9_flat.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_a.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_and.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_b.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_bc.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_becoming.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_brakingaction.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_broken.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_c.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_callonly1.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_callonly2.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_callonly3.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_cavok.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_center.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_converging.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_cumulonimbus.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_d.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_damp.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_degrees.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_dewp.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_dme.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_drizzle.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_e.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_ehamarratis.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_ehamatis.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_ehamdepatis.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_ehbkatis.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_ehehatis.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_ehggatis.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_ehrdatis.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_endofinfo.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_f.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_feet.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_few.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_fog.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_fogpatches.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_freezing.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_g.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_good.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_gr.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_h.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_hail.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_haze.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_hp.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_hundred.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_i.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_independent.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_j.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_k.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_kilometers.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_knots.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_l.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_left.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_lessthan.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_light.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_lowqnh.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_lowvis.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_m.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_marktemperature.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_maximum.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_medium.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_meters.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_mifg.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_minimum.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_minus.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_mist.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_mlr.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_mr.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_mtr.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_n.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_na.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_nosig.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_nsc.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_nsw.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_o.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_opr.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_overcast.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_p.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_pause.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_percent.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_q.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_qnh.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_r.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_rain.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_right.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_rimeorfrost.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_runway.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_runwayconditions.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_rvronatc.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_s.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_scattered.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_shallow.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_showers.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_showersofrain.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_skyclear.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_slr.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_snow.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_snowgrains.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_softhail.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_str.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_t.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_talt.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_taxiwaysandaprons.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_tcu.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_temp.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_tempo.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_thousand.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_thunderstorms.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_tl.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_to.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_u.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_v.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_varbetween.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_variable.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_vcsh.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_vcts.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_vis.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_vor.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_vvis.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_w.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_weather.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_wind.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_x.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_y.wav"
Type: files; Name: "{userdocs}\EuroScope\atis\eham1_z.wav"
