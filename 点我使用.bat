@echo off
:start
title 补全资源中...
mode con cols=140 lines=30
set name=Resources
set soft=Application
if exist %soft% (echo 存在Application文件夹!) else (echo 不存在Application文件夹!正在创建!&md Application)
if exist %soft% (echo 存在Application文件夹!) else (echo 不存在Application文件夹!正在创建!&md Application)
if exist %soft% (echo 存在Resources文件夹!) else (echo 不存在Resources文件夹!正在补全!&goto install)
if exist %soft% (echo 存在Resources文件夹!) else (echo 不存在Resources文件夹!正在补全!&goto install)
taskkill /f /IM adb.exe
cls & goto check
:install
title 下载资源ing...
if exist Resources\adb\adb.exe (echo 存在Resources文件夹!) else (echo 不存在Resources文件夹!正在重新下载!)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Resources.zip)&(7z.exe x Resources.zip | FIND "ing archive")&(del Resources.zip)
if exist Resources\adb\adb.exe (echo 存在Resources文件夹!) else (echo 不存在Resources文件夹!正在重新下载!)&(wget -q --show-progress https://mirror.ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Resources.zip)&(7z.exe x Resources.zip | FIND "ing archive")&(del Resources.zip)
path = Resources
cls & goto start
:check
title 检索资源ing...
setlocal enabledelayedexpansion
if exist %name%\stats\cpu.txt (echo 检测框架完整!) else (echo 检测框架不完整!正在重新下载!)&(goto install)
if exist %name%\adb\adb.exe (echo adb包完整!) else (echo adb不完整!正在重新下载!)&(goto install)
if exist %name%\apk\aapt.exe (echo aapt存在!) else (echo aapt不存在!正在重新下载!)&(goto install)
for /f "tokens=*" %%Y in (%name%\stats\Config.txt) do (
    set Config=%%Y
    if "!Config!"=="ADBMODE0" cls & goto main
    if "!Config!"=="ADBMODE1" cls & goto main2
)
:main
title 初始化...
path = %path%;.\resources\adb;
set ANDROID_ADB_SERVER_PORT=5037

echo ===================================== 欢迎使用 W.Tools 工具箱!==================================================
echo =                                                                                                             =
echo =                  当前工具箱ADB模式:!Config!(0为5037,1为24986)                                               =
echo =                  请检查设备是否连接上了电脑!如果下行没有显示设备请先连接!(显示unauthorized是未授权,请先在设备同意再进行下一步操作!)        =
echo =                  如果遇到ADB端口被占用请进入工具箱设置并切换ADBMODE1                                        =
echo =                                                                                                             =
echo ==============================================================================================================
adb devices
pause
cls & goto input
:main2
title 初始化...
set ANDROID_ADB_SERVER_PORT=24986
echo ===================================== 欢迎使用 W.Tools 工具箱!==================================================
echo =                                                                                                             =
echo =                  当前工具箱ADB模式:!Config!(0为5037,1为24986)                                               =
echo =                  请检查设备是否连接上了电脑!如果下行没有显示设备请先连接!(显示unauthorized是未授权,请先在设备同意再进行下一步操作!)        =
echo =                  如果遇到ADB端口被占用请进入工具箱设置并切换ADBMODE0                                        =
echo =                                                                                                             =
echo ==============================================================================================================
adb devices
pause
cls & goto input
:input
setlocal enabledelayedexpansion
for /f "tokens=*" %%o in (%name%\stats\model.txt) do (
    set model=%%o
    set "model=!*:设备未授权或未连接!"
    echo !model!>>$
    move $ %name%\stats\model.txt
)
for /f "tokens=*" %%p in (%name%\stats\sys.txt) do (
    set sys=%%p
    set "sys=!*:设备未授权或未连接!"
    echo !sys!>>$
    move $ %name%\stats\sys.txt
)
for /f "tokens=*" %%u in (%name%\stats\devices.txt) do (
    set devices=%%u
    set "devices=!*:设备未连接!"
    echo !devices!>>$
    move $ %name%\stats\devices.txt
)
for /f "tokens=*" %%s in (%name%\stats\stats.txt) do (
    set stats=%%s
    set "stats=!*:设备未连接!"
    echo !stats!>>$
    move $ %name%\stats\stats.txt
)
for /f "tokens=2" %%i in (%name%\stats\ba.txt) do (
    set ba=%%i
)
cls
adb shell dumpsys battery | find "level">%name%\stats\ba.txt
adb devices >%name%\stats\devices.txt
adb devices >%name%\stats\stats.txt
adb shell getprop ro.product.model >%name%\stats\model.txt
adb shell getprop ro.build.version.release >%name%\stats\sys.txt
for /f "tokens=1" %%o in (%name%\stats\model.txt) do (
    set model=%%o
)
for /f "tokens=1" %%p in (%name%\stats\sys.txt) do (
    set sys=%%p
)
for /f "skip=1 tokens=1" %%z in (%name%\stats\devices.txt) do (
    set devices=%%z
)
for /f "skip=1 tokens=2" %%x in (%name%\stats\stats.txt) do (
    set stats=%%x
    if "!stats!"==" " (set "stats=!stats:*=设备未连接到ADB或没有响应!")&(echo !stats!>>$)&(move $ %name%\stats\stats.txt)
    if "!stats!"=="device" (set "stats=!stats:device=连接成功!")&(echo !stats!>>$)&(move $ %name%\stats\stats.txt)
    if "!stats!"=="unauthorized" (set "stats=!stats:unauthorized=设备未授权!")&(echo !stats!>>$)&(move $ %name%\stats\stats.txt)
    if "!stats!"=="offline" (set "stats=!stats:offline=设备未连接到ADB或没有响应!")&(echo !stats!>>$)&(move $ %name%\stats\stats.txt)
)
cls
title W.Tools工具箱V1.2.6(BY:不爱酒的I9先生、LIPiston)
echo ====================  W.Tools工具箱V1.2.6   BY:不爱酒的I9先生、LIPiston  ================
echo =                                                                                       =              
echo =           [1]软件管理                                            [2]设备管理          =              已连接设备:!devices!
echo =                                                                                       =              设备型号:!model!
echo =                                                                                       =              安卓版本:!sys!
echo =                                                                                       =              设备电量:!ba!             
echo =           [3]功能管理                                            [4]工具箱管理        =              连接状态:!stats!
echo =                                                                                       =
echo ==========================[Re]初始化工具箱  [Q]关闭工具箱================================
set /p "num=请输入数字然后按下回车键：
if "%num%"=="1" cls & goto soft
if "%num%"=="2" cls & goto device
if "%num%"=="3" cls & goto tool
if "%num%"=="4" cls & goto manage
if "%num%"=="Q" cls & goto Exit
if "%num%"=="q" cls & goto Exit
if "%num%"=="Re" cls & goto Re
echo. & echo 不能输入除了1-4,Q和Re之外的其他字符！ & pause>nul & cls & goto input
:soft
echo                                             ============================================================
echo                                             =      [1]安装日常软件             [4]禁用/启用软件        =
echo                                             =      [2]安装自定义软件           [5]提取当前应用         =
echo                                             =      [3]卸载软件                                         =
echo                                             ============================================================
set /p "num=请输入数字然后按下回车键,输入Q返回：
if "%num%"=="Q" cls & goto input
if "%num%"=="1" cls & goto is
if "%num%"=="2" cls & goto 7
if "%num%"=="3" cls & goto 8
if "%num%"=="4" cls & goto 9
if "%num%"=="5" cls & goto 10
:is
echo                                             ================================================================
echo                                             =      [1]安装网易云音乐             [4]安装QQ(手表版)         =
echo                                             =      [2]安装搜狗输入法             [5]安装VA框架             =
echo                                             =      [3]安装第三方桌面(Lawnchair)  [6]导入腕上哔哩与腕上视频 =
echo                                             ================================================================
set /p "num=请输入数字然后按下回车键,输入Q返回：
if "%num%"=="Q" cls & goto soft
if "%num%"=="1" cls & goto 1
if "%num%"=="2" cls & goto a2
if "%num%"=="3" cls & goto b4
if "%num%"=="4" cls & goto b2
if "%num%"=="5" cls & goto 3
if "%num%"=="6" cls & goto bv
:device
echo                                             ============================================================
echo                                             =      [1]调整DPI                                          =
echo                                             =      [2]查看设备状态                                     =
echo                                             =      [3]添加铃声                                         =
echo                                             ============================================================
set /p "num=请输入数字然后按下回车键,输入Q返回：
if "%num%"=="Q" cls & goto input
if "%num%"=="1" cls & goto 5
if "%num%"=="2" cls & goto 6
if "%num%"=="3" cls & goto 11
:tool
echo                                             ============================================================
echo                                             =      [1]ADB命令行模式                                    =
echo                                             =      [2]Scrcpy投屏                                      =
echo                                             =      [3]文本输入                                         =
echo                                             ============================================================
set /p "num=请输入数字然后按下回车键,输入Q返回：
if "%num%"=="Q" cls & goto input
if "%num%"=="1" cls & goto 4
if "%num%"=="2" cls & goto 21
if "%num%"=="3" cls & goto 22
:manage
echo                                             ============================================================
echo                                             =      [1]重启工具箱                                       =
echo                                             =      [2]工具箱设置                                       =
echo                                             ============================================================
set /p "num=请输入数字然后按下回车键,输入Q返回：
if "%num%"=="Q" cls & goto input
if "%num%"=="1" cls & goto 12
if "%num%"=="2" cls & goto 20
:1
if exist Resources\apk\Cloudmusic.apk (goto 1b) else (echo 正在下载网易云...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Cloudmusic.apk)&(move Cloudmusic.apk %name%\apk)&cls
:1b
echo 现在正在执行安装手机版网易云.
echo =====================================================
echo ==============安装网易云ing...=======================
echo =====================================================
adb install %name%\apk\cloudmusic.apk
set /p "dpi=是否要更改DPI为120来登录?是请输入Y,否按任意键:
if "%dpi%"=="Y" (adb shell wm density 120)&(echo 已完成更改!)&(echo 登陆网易云后,完成下一步将DPI更改至220日常使用)&pause&(adb shell wm density 220)&(echo 已将DPI修改至220!)
cls & goto input
:2
echo  =======================================
echo =      [1]安装搜狗输入法                =
echo =      [2]安装可以打字的QQ(手表版)      =
echo =      [3]激活输入法                    =
echo =      [4]安装第三方桌面(Lawnchair)     =
echo =      [5]一键去除/恢复防沉迷           =
echo  =======================================
set /p "cho2=请选择一项并输入,输入Q退出:
if "%cho2%"=="1" cls & goto a2
if "%cho2%"=="2" cls & goto b2
if "%cho2%"=="3" cls & goto b3
if "%cho2%"=="4" cls & goto b4
if "%cho2%"=="5" cls & goto b5
if "%cho2%"=="Q" cls & goto input
echo. & echo 不能输入除了1-5和"Q"之外的其他字符！ & pause>nul & cls & goto 2
cls & goto input
:a2
if exist Resources\apk\sougouinput.apk (goto a22) else (echo 正在下载搜狗输入法...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/sougouinput.apk)&(move sougouinput.apk %name%\apk)&cls
:a22
echo 现在正在执行安装搜狗输入法.
echo =====================================================
echo ==============安装输入法并激活ing...==================
echo =====================================================
adb install %name%\apk\sougouinput.apk
echo 三秒后自动激活输入法
timeout /t 3
adb shell ime enable com.sogou.ime.wear/com.sohu.inputmethod.sogou.ime.SogouIMS
adb shell ime set com.sogou.ime.wear/com.sohu.inputmethod.sogou.ime.SogouIMS
echo 按任意键返回主界面
pause>nul
cls & goto input
:b2
if exist Resources\apk\QQ.apk (goto b22) else (echo 正在下载QQ...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/QQ.apk)&(move QQ.apk %name%\apk)&cls
:b22
echo 现在正在执行安装QQ.
echo =====================================================
echo ==============安装QQing...==========================
echo =====================================================
adb install %name%\apk\QQ.apk
echo 按任意键返回主界面
pause>nul
cls & goto input
:b3
echo 三秒后自动激活输入法
timeout /t 3
adb shell ime enable com.sogou.ime.wear/com.sohu.inputmethod.sogou.ime.SogouIMS
adb shell ime set com.sogou.ime.wear/com.sohu.inputmethod.sogou.ime.SogouIMS
echo 按任意键返回主界面
pause>nul
cls & goto input
:b4
if exist Resources\apk\Lawnchair.apk (goto b44) else (echo 正在下载Lawnchair...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Lawnchair.apk)&(move Lawnchair.apk %name%\apk)&cls
:b44
echo 现在正在执行安装Lawnchair.
echo =====================================================
echo ==============安装Lawnchairing...====================
echo =====================================================
adb install %name%\apk\Lawnchair.apk
echo 按任意键返回主界面
pause>nul
cls & goto input
:b5
echo  ===================
echo =   [1]去除防沉迷   =
echo =   [2]恢复防沉迷   =
echo  ===================
set /p "ui=请选择一项并输入,输入Q退出:
if "%ui%"=="1" cls & goto c1
if "%ui%"=="2" cls & goto c2
if "%ui%"=="Q" cls & goto input
:c1
echo ======================================================================================================================================================
echo +                      去除防沉迷即为去除温控,手表会变得十分烫,有可能会损坏手表!(实测最高温度电池55°C,后壳53.8°C,PA(核心)64°C)                        +
echo +                      去除防沉迷的原理是禁用com.android.systemui即系统UI达到的,此时将会无法接听电话且失去状态栏与通知栏!                             +
echo +                      所以请务必在此之前先安装一个第三方桌面,你也可以输入desk快速前往安装桌面,如已安装则请略过                                      +
echo ======================================================================================================================================================
set /p "tips=明白了请输入yes do as i say,否则输入Q退出:
if "%tips%"=="yes do as i say" cls & goto d1
if "%tips%"=="desk" cls & goto b4
if "%tips%"=="Q" cls & goto input
if "%tips%"=="q" cls & goto input
echo. & echo 不能输入除了"yes do as i say"/"Q"/"desk"之外的其他字符！ & pause>nul & cls & goto c1
:d1
echo =========================
echo +    禁用SystemUI中...  +
echo =========================
(adb shell pm disable-user com.android.systemui)&(echo 禁用完毕,请按Home键返回桌面)
echo 按任意键返回主界面
pause>nul
cls & goto input
:c2
echo =========================
echo +    恢复SystemUI中...  +
echo =========================
(adb shell pm enable com.android.systemui)&(echo 恢复完毕请按Home键返回桌面)
echo 按任意键返回主界面
pause>nul
cls & goto input
:3
if exist Resources\apk\VAeXposed.apk (goto 3a) else (echo 正在下载VA框架...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/VAeXposed.apk)&(move VAeXposed.apk %name%\apk)&cls
:3a
echo 现在正在执行安装VAeXposed.
echo =====================================================
echo ==============安装VA框架ing...=======================
echo =====================================================
adb install %name%\apk\VAeXposed.apk
set /p "cho=是否要导入腕上哔哩和腕上视频?是请输入Y,否按任意键:
if "%cho%"=="Y" goto bv else cls & goto input
:bv
if exist Resources\apk\Bili.apk (goto 3ab) else (echo 正在下载BILI&Vedio...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Bili.apk)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Vedio.apk)&(move Bili.apk %name%\apk)&(move Vedio.apk %name%\apk)&cls&(goto 3b)
:3ab
if exist Resources\apk\Vedio.apk (goto 3b) else (echo 正在下载Vedio...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Vedio.apk)&(move Vedio.apk %name%\apk)&cls
:3b
(adb push %name%\apk\Bili.apk //sdcard/DCIM)&(adb push %name%\apk\Vedio.apk //sdcard/DCIM)&(echo 已完成传输!请自行打开框架安装!)&(timeout /t 5)&cls & goto input
:4
title 输入Q返回
echo =========================================================================================================================================
echo =          常用的adb命令有install(安装),uninstall(卸载),reboot(重启)等,可自行百度查看,此处已经省略了adb的前缀,只需要直接输入命令即可    =
echo =========================================================================================================================================
setlocal enabledelayedexpansion
set /p command=请在此输入指令:
if "%command%"=="Q" (cls&goto input)
adb %command%&pause
cls
goto 4
:5
title 输入Q返回
adb shell wm density |find "Physical density">%name%\stats\dpi.txt
adb shell wm density |find "Override density">%name%\stats\cdpi.txt
setlocal enabledelayedexpansion
for /f "tokens=3" %%g in (%name%\stats\cdpi.txt) do (
    set cdpi=%%g
)
for /f "tokens=3" %%f in (%name%\stats\dpi.txt) do (
    set dpi=%%f
)
echo                                                          ============================
echo                                                          =     当前设备DPI为!cdpi!     =
echo                                                          =     设备默认DPI为!dpi!     =
echo                                                          ============================
set /p var=请输入需要修改的DPI值:
if "%var%"=="Q" (cls&goto input)
(adb shell wm density %var%)&(echo 已完成更改!)
echo 按任意键返回主界面
pause>nul
cls & goto input
:6
title 查询中...
adb shell dumpsys battery | find "level">%name%\stats\ba.txt
adb shell getprop ro.product.model >%name%\stats\model.txt
adb shell getprop ro.build.version.release >%name%\stats\sys.txt
adb shell cat /proc/cpuinfo | find "Hardware">%name%\stats\cpu.txt
adb shell cat /proc/meminfo |find "MemTotal">%name%\stats\mem.txt
adb shell cat /proc/meminfo |find "MemFree">%name%\stats\fmem.txt
adb shell wm density |find "Physical density">%name%\stats\dpi.txt
adb shell wm density |find "Override density">%name%\stats\cdpi.txt
setlocal enabledelayedexpansion
for /f "tokens=1" %%o in (%name%\stats\model.txt) do (
    set model=%%o
)
for /f "tokens=1" %%p in (%name%\stats\sys.txt) do (
    set sys=%%p
)
for /f "eol=* tokens=*" %%q in (%name%\stats\cpu.txt) do (
    set cpu=%%q
    set "cpu=!cpu:Hardware	=型号!"
)
for /f "tokens=2" %%w in (%name%\stats\mem.txt) do (
    set mem=%%w
)
for /f "tokens=2" %%e in (%name%\stats\fmem.txt) do (
    set fmem=%%e
)
for /f "tokens=3" %%f in (%name%\stats\dpi.txt) do (
    set dpi=%%f
)
for /f "tokens=3" %%g in (%name%\stats\cdpi.txt) do (
    set cdpi=%%g
)
for /f "tokens=2" %%i in (%name%\stats\ba.txt) do (
    set ba=%%i
    echo ================================================
    echo         设备型号:!model!
    echo         Android版本:!sys!
    echo         CPU!cpu!
    echo         设备默认DPI:!dpi!
    echo         设备当前DPI:!cdpi!
    echo         设备总运存:!mem!KB
    echo         设备剩余运存:!fmem!KB
    echo         当前电量为:!ba!
    echo ================================================
)
title W.Tools工具箱V1.2.6(BY:不爱酒的I9先生、LIPiston)
echo 按任意键返回主界面
pause>nul
cls & goto input
:7
title 输入Q返回
::setlocal enabledelayedexpansion
cls
echo =======================================================================================
echo =              请直接把要安装的软件直接拖入到工具箱窗口(确保你已经签名为V2!)           =
echo =                      软件目录不要有空格,否则工具箱直接崩溃!                          =
echo =======================================================================================
set /p apk=要安装的软件:
if "%apk%"=="Q" (cls&goto input)
chcp 65001
%name%\apk\aapt.exe dump badging %apk% >%name%\stats\app.txt
find "package: name=" %name%\stats\app.txt > %name%\stats\pname.txt
find "application-label:'" %name%\stats\app.txt > %name%\stats\aname.txt
for /f "skip=2 tokens=*" %%c in (%name%\stats\aname.txt) do (
    set an=%%c
    set "an=!an:application-label:= !"
    echo !an!>>$
    move $ %name%\stats\aname.txt
)
for /f "skip=2 tokens=*" %%v in (%name%\stats\pname.txt) do (
    set pn=%%v
    set "pn=!pn:package: name= !"
    set "pn=!pn:versionName= !"
    echo !pn!>$
    move $ %name%\stats\pname.txt
)
for /f "tokens=1" %%r in (%name%\stats\pname.txt) do (
    set pn=%%r
)
for /f "tokens=3" %%t in (%name%\stats\pname.txt) do (
    set ppn=%%t
)
cls
chcp 936
cls
echo ==========================================================================================================
echo =              要安装的软件信息:                     
echo =              软件名!an!        
echo =              包名!pn!
echo =              版本!ppn!
echo =              请确认是否安装此应用,是请输入Y,否输入Q返回
echo ==========================================================================================================
set /p iapk=请在此输入:
if "%iapk%"=="Y" (adb install %apk%)
if "%iapk%"=="Q" (cls&goto input)
pause
cls
goto 7
:8
echo  ==========================================================
echo =        [1]获取当前软件包名   [2]获取所有包名            =
echo = Tips:如要获取当前软件包名请先在设备上打开需要获取的软件 =
echo  ==========================================================    
set /p "num=请输入数字,输入Q则退出:
if "%num%"=="1" cls & goto a8
if "%num%"=="2" cls & goto b8
if "%num%"=="Q" cls & goto input
echo. & echo 不能输入除了1-2/Q之外的其他字符！ & pause>nul & cls & goto 8
:a8
title 输入Q返回
setlocal enabledelayedexpansion
adb shell dumpsys window | find "mCurrentFocus">%name%\stats\at.txt
for /f "tokens=*" %%m in (%name%\stats\at.txt) do (
    set at=%%m
    set "at=!at:/= !"
    echo !at!>>$
    move $ %name%\stats\at.txt
    cls
)
for /f "tokens=3" %%m in (%name%\stats\at.txt) do (
    set at=%%m
)
echo =================================================
echo =    要卸载的软件包名:!at!           
echo =================================================
set /p "atn=如果是想要卸载的请输入yes,否则输入Q退出:
if "%atn%"=="yes" cls & goto a99
if "%atn%"=="Q" cls & goto input
echo. & echo 不能输入除了yes/Q之外的其他字符！ & pause>nul & cls & goto a8
:a99
adb uninstall !at!
echo 按任意键返回主界面
pause>nul
cls & goto input
:b8
title 输入Q返回
adb shell pm list packages>%name%\apk\list.txt
start %name%\apk\list.txt
echo ===============================================================
echo =      请在打开的记事本中找到你要卸载的软件的包名并复制到这里 =
echo =      Tips:package:后面的即为包名                            =
echo ===============================================================
set /p unapk=要卸载的软件:
if "%unapk%"=="Q" (cls&goto input)
(adb uninstall %unapk%)&(echo 完成!)
pause>nul
cls & goto input
echo 按任意键返回主界面
:9
echo  ==============================================
echo =     [1]禁用/冻结应用   [2]启用/恢复应用      =
echo  ==============================================    
set /p "pm=请输入数字,输入Q则退出:
if "%pm%"=="1" cls & goto a9
if "%pm%"=="2" cls & goto b9
if "%pm%"=="Q" cls & goto input
echo. & echo 不能输入除了1-2/"Q"之外的其他字符！ & pause>nul & cls & goto 9
:a9
title 输入Q返回
adb shell pm list packages>%name%\apk\list.txt
echo ===============================================================
echo =      请在打开的记事本中找到你要禁用的软件的包名并复制到这里 =
echo =      Tips:package:后面的即为包名                            =
echo ===============================================================
start %name%\apk\list.txt
set /p bapk=要禁用/冻结的软件:
if "%bapk%"=="Q" (cls&goto input)
(adb shell pm disable-user %bapk%)&(echo 完成!)
pause>nul
cls & goto input
echo 按任意键返回主界面
:b9
title 输入Q返回
echo ===============================================================
echo =      请在打开的记事本中找到你要启用的软件的包名并复制到这里 =
echo =      Tips:package:后面的即为包名                            =
echo ===============================================================
set /p eapk=要启用/恢复的软件:
if "%eapk%"=="Q" (cls&goto input)
(adb shell pm enable %eapk%)&(echo 完成!)
pause>nul
cls & goto input
echo 按任意键返回主界面
:10
title 输入Q返回
setlocal enabledelayedexpansion
adb shell dumpsys window | find "mCurrentFocus">%name%\stats\at.txt
for /f "tokens=*" %%m in (%name%\stats\at.txt) do (
    set at=%%m
    set "at=!at:/= !"
    echo !at!>>$
    move $ %name%\stats\at.txt
    cls
)
for /f "tokens=3" %%m in (%name%\stats\at.txt) do (
    set at=%%m
    echo =================================================
    echo =    要提取的软件包名:!at!           
    echo =================================================
)
set /p "atn=如果是想要提取的请输入yes,否则输入Q退出:
if "%atn%"=="yes" cls & goto a99
if "%atn%"=="Q" cls & goto input
echo. & echo 不能输入除了yes/Q之外的其他字符！ & pause>nul & cls & goto a8
:a99
adb shell pm path !at! | find "package:">%name%\stats\bt.txt
for /f "tokens=*" %%m in (%name%\stats\bt.txt) do (
    set bt=%%m
    set "bt=!bt:package:/= !"
    echo !bt!>>$
    move $ %name%\stats\bt.txt
)
adb pull !bt! %soft%
ren Application\base.apk !at!.apk
echo 提取成功!请到Application文件夹查看Apk
start %soft%
echo 按任意键返回主界面
pause>nul
cls & goto input
:11
title 输入Q返回
(adb shell mkdir //sdcard/Ringtones)&(echo 成功创建文件夹!)&cls
echo =============================================================================================
echo =              请直接把要导入的铃声直接拖入到工具箱窗口(确保后缀名为ogg!)                    =
echo =                      软件目录不要有空格,否则工具箱直接崩溃!                                =
echo =          Tips:因厂家原因,导入铃声后必须要重启设备才可识别,导入前请保存手表上的工作        =
echo =============================================================================================
set /p rts=请把你要添加的铃声拖到这里:
if "%rts%"=="Q" (cls&goto input)
(adb push %rts% //sdcard/Ringtones)&(echo 下面是文件列表)&(adb shell ls //sdcard/Ringtones)&(echo 导入完成!设备会自动重启.)
adb reboot
echo 按任意键返回主界面
pause>nul
cls & goto input
:12
start 点我使用.bat&exit
:20
echo   ========================================
echo =    当前工具箱模式!Config!                =
echo =    [1]切换ADBMODE0(恢复默认5037端口)     =
echo =    [2]切换ADBMODE1(端口为24986)          =
echo =    [3]更新工具箱                         =
echo   ========================================
set /p "choX=请选择一项并输入,输入Q退出:
if "%choX%"=="1" cls & goto ADBPORTDEF
if "%choX%"=="2" cls & goto ADBPORT24986
if "%choX%"=="3" cls & goto update
if "%choX%"=="Q" cls & goto input
echo. & echo 不能输入除了1-2和Q之外的其他字符！ & pause>nul & cls & goto :20
:ADBPORTDEF
setlocal enabledelayedexpansion
for /f "tokens=*" %%Y in (%name%\stats\Config.txt) do (
    set Config=%%Y
    set "Config=!Config:ADBMODE1=ADBMODE0!"
    echo !Config!>>$
    move $ %name%\stats\Config.txt
)
taskkill /f /IM adb.exe
echo 恢复默认端口成功,按任意键重启工具箱
pause>nul
start 点我使用.bat&exit
:ADBPORT24986
setlocal enabledelayedexpansion
for /f "tokens=*" %%Y in (%name%\stats\Config.txt) do (
    set Config=%%Y
    set "Config=!Config:ADBMODE0=ADBMODE1!"
    echo !Config!>>$
    move $ %name%\stats\Config.txt
)
taskkill /f /IM adb.exe
echo 设置24986端口成功,按任意键重启工具箱
pause>nul
start 点我使用.bat&exit
:update
setlocal enabledelayedexpansion
del %name%\stats\version.txt
(echo 正在检查更新....)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Version.txt)&(move Version.txt %name%\stats\)&cls
for /f "tokens=*" %%A in (%name%\stats\Version.txt) do (
    set nver=%%A
    if "!nver!"=="1.2.6" (echo 当前版本已更新至最新,无需更新)&(echo 按任意键返回主界面)&(pause>nul)&(cls&goto input) else (echo 当前版本已过期,正在更新!)&(timeout /nobreak /t 2)&cls&(goto dupdate)
)
:dupdate
(echo 下载更新脚本中...)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/update.bat)&(if exist update.bat (goto doupdate&del version.txt) else (echo 文件不存在,正在重新下载!)&(cls&goto dupdate)
:doupdate
(echo 开始更新!)&(timeout /nobreak /t 2)&(start update.bat)&exit 
:Exit
start 关闭ADB服务.bat&exit
:21
start 关闭ADB服务.bat
timeout /nobreak /t 1
start scrcpy.exe
pause
start 关闭ADB服务.bat
cls & goto 12
:Re
cls & start 关闭ADB服务.bat
timeout /nobreak /t 2
rd /s/Q %soft%
rd /s/Q %name%
del /s/Q .wget-hsts
exit
:22
start %name%\adb\input.bat
cls&goto input