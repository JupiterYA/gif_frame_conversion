@echo off
rd /s /q png
rd /s /q out
md png
ffmpeg -i "%~1" -vf scale=120:-1 ".\png\%%d.png"
md out

setlocal enabledelayedexpansion
for %%f in (".\png\*.png") do (
	set /a sum=%%~nf+1
	
	move "%%~f" "out\!sum!%%~xf"
	
)
ren ".\out\!sum!.png" "1.png"
for %%f in (".\out\*.png") do (
	set /a e=%%~nf-1
	
	if not exist "out\!e!%%~xf" copy "out\%%~nxf" "out\!e!%%~xf"
)
ffmpeg -i ".\out\%%d.png" -f gif "%~dpn1_01.gif"
rem %~dpnx1
rem %%~dpf
rem %~dp[変数]	%[変数]からドライブレターを含むフルパスを出力
rem %~n[変数]	%[変数]から「ファイル名」を抽出（拡張子なし）
rem %~x[変数]	%[変数]からファイル名の「拡張子」を抽出
rem 1　ファイル名を出す　2　ファイル名を分割ファイル名だけにする
