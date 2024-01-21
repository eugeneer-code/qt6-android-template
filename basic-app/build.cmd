: ============== Настройка путей
set QtPath=C:\Qt\6.5.1\android_armv7
set QtHostPath=C:\Qt\6.5.1\msvc2019_64
set NdkPath=D:\Programs\Android\SDK\ndk\25.1.8937393
set SdkPath=D:\Programs\Android\SDK
set CMake=D:\Programs\CMake3.19\bin\cmake.exe

: ============== Добавляем путь до java для подписи apk
set JAVA_HOME=D:\Programs\Android\jdk-11.0.13.8-hotspot
set PATH=%PATH%;%JAVA_HOME%/bin

: ============== Инициализация компилятора
call "D:\Program Files\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

: ============== Настройка переменных окружения для подписи пакета
set QT_ANDROID_KEYSTORE_PATH=%cd%/../example.keystore
set QT_ANDROID_KEYSTORE_ALIAS=Example
set QT_ANDROID_KEYSTORE_KEY_PASS=12345678
set QT_ANDROID_KEYSTORE_STORE_PASS=12345678

: ============== Очистка папки сборки
rmdir .\build /s /q 
mkdir build
cd build

%CMake% ^
-DCMAKE_PREFIX_PATH=%QtPath%/lib/cmake ^
-DCMAKE_BUILD_TYPE=Release ^
-DANDROID_SDK_ROOT=%SdkPath% ^
-DANDROID_NDK_ROOT=%NdkPath% ^
-DCMAKE_TOOLCHAIN_FILE=%QtPath%/lib/cmake/Qt6/qt.toolchain.cmake ^
-DQT_HOST_PATH=%QtHostPath% ^
-DQT_ANDROID_SIGN_APK=ON ^
-G Ninja ^
..

%CMake% --build . --config Release --target apk