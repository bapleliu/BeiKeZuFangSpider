@echo off

::���ÿ�Ⱥ͸߶�
mode con cols=109

::������ɫ
color 2e
echo.
echo ############################################## Python ������� ##############################################
echo. 
set /p is_build=�Ƿ�ʼ���(Y��yΪ��, N��nΪ��):
echo. 
echo ���ѡ���ǣ�%is_build%
echo.

::�ж�ѡ��
if /i "%is_build%" == "Y" goto :start_build_project
if /i "%is_build%" == "y" goto :start_build_project
if /i "%is_build%" == "N" goto :close_build_project
if /i "%is_build%" == "n" goto :close_build_project
goto error_choice_end


:start_build_project
echo ׼����ʼ�������...
echo.

::������� -- ��ʼ

::���build_path�µ������ļ�
del /f /s /q .\build_path\*
echo.
echo ɾ���ļ��ɹ�!

::ɾ��build_path�ļ���
rd /s /q  .\build_path\
echo.
echo ɾ���ļ��гɹ�!

::�ؽ�build_path�ļ���
md build_path
echo.
echo �ؽ�����ļ���

::�������
::����1 -- ����������spec�ļ� pyinstaller -F spider_starter.py --workpath ./build_path --distpath ./build_path
::����2 -- ������: pyinstaller -F spider_starter.spec --workpath ./build_path --distpath ./build_path (�ᱨwin32����)
echo.
echo ��ʼ���
C:\\Python\\Python36\\Scripts\\pyinstaller.exe -F cmdline_start_spider.py --workpath ./build_path --distpath ./build_path
::pyinstaller -F spider_starter.spec --workpath ./build_path --distpath ./build_path
::������� -- ����

pause
echo.
goto end

:close_build_project
echo �˳��������!
echo.
goto end

:error_choice_end
echo ���ѡ������!
pause > nul

:end
echo �������!
pause > nul