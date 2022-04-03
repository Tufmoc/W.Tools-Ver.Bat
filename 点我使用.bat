@echo off
:start
title 补全资源中...
color 4F
mode con cols=140 lines=30
if exist %soft% (echo 存在Application文件夹!) else (echo 不存在Application文件夹!正在创建!&md Application)
if exist %soft% (echo 存在Application文件夹!) else (echo 不存在Application文件夹!正在创建!&md Application)
if exist %soft% (echo 存在Resources文件夹!) else (echo 不存在Resources文件夹!正在补全!&goto install)
if exist %soft% (echo 存在Resources文件夹!) else (echo 不存在Resources文件夹!正在补全!&goto install)
set name=Resources
set soft=Application
taskkill /f /IM adb.exe
cls & goto check
:install
title 下载资源ing...
if exist Resources\adb\adb.exe (echo 存在Resources文件夹!) else (echo 不存在Resources文件夹!正在重新下载!)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Resources.7z)&(7z.exe x Resources.7z | FIND "ing archive")&(del Resources.7z)
if exist Resources\adb\adb.exe (echo 存在Resources文件夹!) else (echo 不存在Resources文件夹!正在重新下载!)&(wget -q --show-progress https://mirror.ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/Resources.7z)&(7z.exe x Resources.7z | FIND "ing archive")&(del Resources.7z)
if exist Resources\apk\Cloudmusic.apk (echo 存在软件包!) else (echo 不存在软件包!正在重新下载!)&(wget -q --show-progress https://ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/get-apk.zip)&(7z.exe x get-apk.zip -o%name%\apk | FIND "ing archive")&(del get-apk.zip)
if exist Resources\apk\Vedio.apk (echo 存在软件包!) else (echo 不存在软件包!正在重新下载!)&(wget -q --show-progress https://mirror.ghproxy.com/https://github.com/Tufmoc/Garbage/releases/download/W.Tools-bat/get-apk.zip)&(7z.exe x get-apk.zip -o%name%\apk | FIND "ing archive")&(del get-apk.zip)
path = Resources
cls & goto start
:check
title 检索资源ing...
setlocal enabledelayedexpansion
if exist %name%\apk\Cloudmusic.apk (echo 存在Cloudmusic.apk!) else (echo 缺少apk!正在重新下载!)&(goto install)
if exist %name%\apk\Bili.apk (echo 存在Bili.apk!) else (echo 缺少!正在重新下载!)&(goto install)
if exist %name%\apk\Lawnchair.apk (echo 存在Lawnchair.apk!) else (echo 缺少apk!正在重新下载!)&(goto install)
if exist %name%\apk\QQ.apk (echo 存在QQ.apk!) else (echo 缺少apk!正在重新下载!)&(goto install)
if exist %name%\apk\sougouinput.apk (echo 存在sougouinput.apk!) else (echo 缺少apk!正在重新下载!)&(goto install)
if exist %name%\apk\VAeXposed.apk (echo 存在VAeXposed.apk!) else (echo 缺少apk!正在重新下载!)&(goto install)
if exist %name%\apk\Vedio.apk (echo 存在Vedio.apk!) else (echo 缺少apk!正在重新下载!)&(goto install)
if exist %name%\stats\cpu.txt (echo 检测框架完整!) else (echo 检测框架不完整!正在重新下载!)&(goto install)
if exist %name%\adb\adb.exe (echo adb包完整!) else (echo adb不完整!正在重新下载!)&(goto install)
for /f "tokens=*" %%Y in (%name%\stats\Config.txt) do (
    set Config=%%Y
    if "!Config!"=="ADBMODE0" cls & goto main
    if "!Config!"=="ADBMODE1" cls & goto main2
)
:main
title W.Tools工具箱V1.1.9(BY:不爱酒的I9先生、LIPiston)
color    3F
echo 欢迎使用 W.Tools 工具箱!
echo 工具箱ADB模式:!Config!(0为5037,1为24986)
echo 请检查设备是否连接上了电脑!如果下行没有显示设备请先连接!(显示unauthorized是未授权!请先在设备同意再进行下一步操作!)
echo 如果遇到ADB端口被占用请进入工具箱设置并切换ADBMODE1
path = %path%;.\resources\adb;
set ANDROID_ADB_SERVER_PORT=5037
adb.exe devices
pause
cls & goto input
:main2
title W.Tools工具箱V1.1.9(BY:不爱酒的I9先生、LIPiston)
color    3F
echo 欢迎使用 W.Tools 工具箱!
echo 工具箱ADB模式:!Config!(0为5037,1为24986)
echo 请检查设备是否连接上了电脑!如果下行没有显示设备请先连接!(显示unauthorized是未授权!请先在设备同意再进行下一步操作!)
echo 如果遇到ADB端口被占用请进入工具箱设置并切换ADBMODE1
path = %path%;.\resources\adb;
set ANDROID_ADB_SERVER_PORT=24986
adb.exe devices
pause
cls & goto input
:input
title W.Tools工具箱V1.1.9(BY:不爱酒的I9先生、LIPiston)
echo ====================  W.Tools工具箱V1.1.9   BY:不爱酒的I9先生、LIPiston  ================
echo =                                                                                       =
echo = [1]安装网易云   [2]安装日常软件   [3]安装VAeXposed(框架)   [4]ADB命令   [5]调整DPI    =
echo =                                                                                       =
echo = [6]查看设备状态   [7]安装应用   [8]卸载应用   [9]禁用/启用应用   [10]提取当前应用     =
echo =                                                                                       =
echo = [11]替换铃声  [12]重启工具箱  [20]工具箱设置   [21]Scrcpy投屏                         =
echo =                                                                                       =
echo ==========================[Re]初始化工具箱  [Exit]关闭工具箱==============================
set /p "num=请输入数字然后按下回车键：
if "%num%"=="1" cls & goto 1
if "%num%"=="2" cls & goto 2
if "%num%"=="3" cls & goto 3
if "%num%"=="4" cls & goto 4
if "%num%"=="5" cls & goto 5
if "%num%"=="6" cls & goto 6
if "%num%"=="7" cls & goto 7
if "%num%"=="8" cls & goto 8
if "%num%"=="9" cls & goto 9
if "%num%"=="10" cls & goto 10
if "%num%"=="11" cls & goto 11
if "%num%"=="12" cls & goto 12
if "%num%"=="20" cls & goto 20
if "%num%"=="Exit" cls & goto Exit
if "%num%"=="exit" cls & goto Exit
if "%num%"=="21" cls & goto 21
if "%num%"=="Re" cls & goto Re
echo. & echo 不能输入除了1-12,20-22和Re之外的其他字符！ & pause>nul & cls & goto input
:1
echo 现在正在执行安装手机版网易云.
echo =====================================================
echo ==============安装网易云ing...=======================
echo =====================================================
adb install %name%\apk\cloudmusic.apk
set /p "dpi=是否要更改DPI为120来登录?是请输入Y(设备会自动重启!),否按任意键:
if "%dpi%"=="Y" (adb shell wm density 120)&(adb reboot)&(echo 已完成更改!)&(echo 等待设备完成重启,登陆网易云后,完成下一步DPI更改至220日常使用)&pause&(adb shell wm density 220)&(adb reboot)&(echo 已将DPI修改至220!)
cls & goto input
:2
echo  =======================================
echo =      [1]安装搜狗输入法                =
echo =      [2]安装可以打字的QQ(手表版)      =
echo =      [3]激活输入法                    =
echo =      [4]安装第三方桌面(Lawnchair)     =
echo =      [5]一键去除/恢复防沉迷           =
echo  =======================================
set /p "cho2=请选择一项并输入,exit退出:
if "%cho2%"=="1" cls & goto a2
if "%cho2%"=="2" cls & goto b2
if "%cho2%"=="3" cls & goto b3
if "%cho2%"=="4" cls & goto b4
if "%cho2%"=="5" cls & goto b5
if "%cho2%"=="exit" cls & goto input
echo. & echo 不能输入除了1-5和"exit"之外的其他字符！ & pause>nul & cls & goto 2
cls & goto input
:a2
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
set /p "ui=请选择一项并输入,exit退出:
if "%ui%"=="1" cls & goto c1
if "%ui%"=="2" cls & goto c2
if "%ui%"=="exit" cls & goto input
:c1
echo 请明白你正在做什么!去除防沉迷即为去除温控,手表会变得十分烫!有可能会损坏手表!(本人实测最高温度电池55°C,后壳53.8°C,PA(核心)64°C)
echo 去除防沉迷的原理是禁用com.android.systemui即系统ui达到的,所以请务必在此之前先安装一个第三方桌面,你也可以输入desk快速前往安装桌面,如已安装则请略过
set /p "tips=明白了请输入yes do as I say,否则输入exit退出! :
if "%tips%"=="yes do as I say" cls & goto d1
if "%tips%"=="desk" cls & goto b4
if "%tips%"=="exit" cls & goto input
echo. & echo 不能输入除了"yes do as I say"/"exit"/"desk"之外的其他字符！ & pause>nul & cls & goto c1
:d1
(echo 禁用SystemUI中...)&(adb shell pm disable-user com.android.systemui)&(echo 成功!请按Home键返回桌面)
echo 按任意键返回主界面
pause>nul
cls & goto input
:c2
(echo 恢复防沉迷中...)&(adb shell pm enable com.android.systemui)&(echo 成功!请按Home键返回桌面)
echo 按任意键返回主界面
pause>nul
cls & goto input
:3
echo 现在正在执行安装VAeXposed.
echo =====================================================
echo ==============安装VA框架ing...=======================
echo =====================================================
adb install %name%\apk\VAeXposed.apk
set /p "cho=是否要导入腕上哔哩和腕上视频?是请输入Y,否按任意键:
if "%cho%"=="Y" (adb push %name%\apk\Bili.apk //sdcard/DCIM)&(adb push %name%\apk\Vedio.apk //sdcard/DCIM)&(echo 已完成传输!请自行打开框架安装!)&(timeout /t 5)&cls & goto input
cls & goto input
:4
title 输入exit返回
echo 常用的adb命令有install(安装),uninstall(卸载),reboot(重启)等,可自行百度查看,此处已经省略了adb的前缀,只需要直接输入命令即可
setlocal enabledelayedexpansion
set /p command=输入指令:
if "%command%"=="exit" (cls&goto input)
adb %command%&(echo 完成!)&pause
cls
goto 4
:5
set /p var=输入DPI:
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
adb shell dumpsys meminfo |find "Total RAM">%name%\stats\mem.txt
adb shell dumpsys meminfo |find "Free RAM">%name%\stats\fmem.txt
adb shell wm density |find "Physical density">%name%\stats\dpi.txt
adb shell wm density |find "Override density">%name%\stats\cdpi.txt
setlocal enabledelayedexpansion
for /f "tokens=1" %%o in (%name%\stats\model.txt) do (
    set model=%%o
    echo 设备型号:!model!
)
for /f "tokens=1" %%p in (%name%\stats\sys.txt) do (
    set sys=%%p
    echo Android版本:!sys!
)
for /f "eol=* tokens=*" %%q in (%name%\stats\cpu.txt) do (
    set cpu=%%q
    set "cpu=!cpu:Hardware	=型号!"
    echo CPU!cpu!
)
for /f "tokens=3" %%w in (%name%\stats\mem.txt) do (
    set mem=%%w
    echo 设备总内存:!mem!
)
for /f "tokens=3" %%e in (%name%\stats\fmem.txt) do (
    set fmem=%%e
    echo 设备剩余内存:!fmem!
)
)
for /f "tokens=3" %%f in (%name%\stats\dpi.txt) do (
    set dpi=%%f
    echo 设备默认DPI:!dpi!
)
)
for /f "tokens=3" %%g in (%name%\stats\cdpi.txt) do (
    set cdpi=%%g
    echo 设备当前DPI:!cdpi!
)
for /f "tokens=2" %%i in (%name%\stats\ba.txt) do (
    set ba=%%i
    echo 当前电量为:!ba!
)
title W.Tools工具箱V1.1.9(BY:不爱酒的I9先生、LIPiston)
echo 按任意键返回主界面
pause>nul
cls & goto input
:7
title 输入exit返回
setlocal enabledelayedexpansion
echo 请直接把要安装的软件直接拖入到工具箱窗口(确保你已经签名为V2!最好是英文名字,不是请先改名!)
echo 软件目录不要放在C盘,否则工具箱直接崩溃!
set /p apk=要安装的软件:
if "%apk%"=="exit" (cls&goto input)
adb install %apk%&(echo 完成!)&pause
cls
goto 7
pause
:8
echo  ==============================================
echo =     [1]获取当前软件包名   [2]获取所有包名    =
echo  ==============================================    
set /p "num=请输入数字,输入exit则退出:
if "%num%"=="1" cls & goto a8
if "%num%"=="2" cls & goto b8
if "%num%"=="exit" cls & goto input
:a8
title 输入exit返回
setlocal enabledelayedexpansion
adb shell dumpsys window | find "mCurrentFocus">%name%\stats\at.txt
for /f "tokens=*" %%m in (%name%\stats\at.txt) do (
    set at=%%m
    set "at=!at:/= !"
    echo !at!>>$
    move $ %name%\stats\at.txt
)
for /f "tokens=3" %%m in (%name%\stats\at.txt) do (
    set at=%%m
    echo 要卸载的包名!at!
)
set /p "atn=如果是想要卸载的请输入yes,否则输入exit退出! :
if "%atn%"=="yes" cls & goto a99
if "%atn%"=="exit" cls & goto input
echo. & echo 不能输入除了yes/exit之外的其他字符！ & pause>nul & cls & goto a8
:a99
adb uninstall !at!
echo 按任意键返回主界面
pause>nul
cls & goto input
:b8
title 输入exit返回
adb shell pm list packages>%name%\apk\list.txt
echo 请在打开的记事本中找到你要卸载的软件的包名并复制到这里(package后面的就是包名!)
start %name%\apk\list.txt
set /p unapk=要卸载的软件:
if "%unapk%"=="exit" (cls&goto input)
(adb uninstall %unapk%)&(echo 完成!)
pause>nul
cls & goto input
:9
echo  ==============================================
echo =     [1]禁用/冻结应用   [2]启用/恢复应用      =
echo  ==============================================    
set /p "pm=请输入数字,输入exit则退出:
if "%pm%"=="1" cls & goto a9
if "%pm%"=="2" cls & goto b9
if "%pm%"=="exit" cls & goto input
echo. & echo 不能输入除了1-2/"exit"之外的其他字符！ & pause>nul & cls & goto 9
:a9
title 输入exit返回
adb shell pm list packages>%name%\apk\list.txt
echo 请在打开的记事本中找到你要禁用的软件的包名并复制到这里(package后面的就是包名!)
start %name%\apk\list.txt
set /p bapk=要禁用/冻结的软件:
if "%bapk%"=="exit" (cls&goto input)
(adb shell pm disable-user %bapk%)&(echo 完成!)
pause>nul
cls & goto input
:b9
title 输入exit返回
echo 请找到你要启用的软件的包名并复制到这里
set /p eapk=要启用/恢复的软件:
if "%eapk%"=="exit" (cls&goto input)
(adb shell pm enable %eapk%)&(echo 完成!)
pause>nul
cls & goto input
:10
title 输入exit返回
setlocal enabledelayedexpansion
adb shell dumpsys window | find "mCurrentFocus">%name%\stats\at.txt
for /f "tokens=*" %%m in (%name%\stats\at.txt) do (
    set at=%%m
    set "at=!at:/= !"
    echo !at!>>$
    move $ %name%\stats\at.txt
)
for /f "tokens=3" %%m in (%name%\stats\at.txt) do (
    set at=%%m
    echo 要提取的包名!at!
)
set /p "atn=如果是想要提取的请输入yes,否则输入exit退出! :
if "%atn%"=="yes" cls & goto a99
if "%atn%"=="exit" cls & goto input
echo. & echo 不能输入除了yes/exit之外的其他字符！ & pause>nul & cls & goto a8
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
title 输入exit返回
(adb shell mkdir //sdcard/Ringtones)&(echo 成功创建文件夹!)
set /p rts=请把你要替换的铃声(.ogg结尾)拖到这里:
if "%rts%"=="exit" (cls&goto input)
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
set /p "choX=请选择一项并输入,exit退出:
if "%choX%"=="1" cls & goto ADBPORTDEF
if "%choX%"=="2" cls & goto ADBPORT24986
if "%choX%"=="3" cls & goto update
if "%choX%"=="exit" cls & goto input
echo. & echo 不能输入除了1-2和exit之外的其他字符！ & pause>nul & cls & goto :20
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
    if "!nver!"=="1.1.9" (echo 当前版本已更新至最新,无需更新)&(echo 按任意键返回主界面)&(pause>nul)&(cls&goto input) else (echo 当前版本已过期,正在更新!)&(timeout /nobreak /t 2)&cls&(goto dupdate)
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