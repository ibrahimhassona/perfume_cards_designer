@echo off
chcp 65001 > nul
cd /d "%~dp0"

echo ========================================================
echo  رفع مصمم كروت العطور الى GitHub
echo  المجلد الحالي: %cd%
echo  المستودع: https://github.com/ibrahimhassona/perfume_cards_designer.git
echo ========================================================
echo.

:: 1. التحقق من وجود Git
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [خطأ]: برنامج Git غير مثبت على جهازك أو غير مضاف للمسار (PATH).
    echo يرجى تحميل وتثبيت Git من: https://git-scm.com
    echo.
    pause
    exit /b
)

echo [1/5] تهيئة المستودع...
git init

echo [2/5] إضافة الملفات...
git add -A

echo [3/5] حفظ الالتزام (Commit)...
git commit -m "تحديث: إضافة رابط الموقع الرسمي تحت توقيع البراند وتعديل حالة التعتيق إلى ليس الأفضل حالياً" 2>nul || echo (الملفات محفوظة مسبقاً)

echo [4/5] ضبط الفرع الاساسي main...
git branch -M main

echo [5/5] ربط المستودع والرفع الى GitHub...
git remote remove origin 2>nul
git remote add origin https://github.com/ibrahimhassona/perfume_cards_designer.git

echo جاري الرفع الآن (قد يطلب منك GitHub تسجيل الدخول في المتصفح)...
git push -u origin main --force

if %errorlevel% equ 0 (
    echo.
    echo ========================================================
    echo  [نجاح]: تم رفع كافة الملفات بنجاح إلى GitHub!
    echo  رابط المستودع:
    echo  https://github.com/ibrahimhassona/perfume_cards_designer
    echo ========================================================
) else (
    echo.
    echo ========================================================
    echo  [تنبيه]: إذا ظهر خطأ في تسجيل الدخول (Authentication):
    echo  تأكد من تسجيل الدخول بحساب ibrahimhassona في نافذة المتصفح التي ستفتح.
    echo ========================================================
)

echo.
pause
