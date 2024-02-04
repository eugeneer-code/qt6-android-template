# ============== Настройка путей
QtPath=/opt/Qt/6.5.3/android_armv7
QtHostPath=/opt/Qt/6.5.3/gcc_64
NdkPath=/android/SDK/ndk/25.1.8937393
SdkPath=/android/SDK
CMake=cmake

# ============== Добавляем путь до java для подписи apk
JAVA_HOME=/android/jdk-17.0.1
export PATH=$PATH:$JAVA_HOME/bin

# ============== Настройка переменных окружения для подписи пакета
export QT_ANDROID_KEYSTORE_PATH=$PWD/../example.keystore
export QT_ANDROID_KEYSTORE_ALIAS=Example
export QT_ANDROID_KEYSTORE_KEY_PASS=12345678
export QT_ANDROID_KEYSTORE_STORE_PASS=12345678

# ============== Очистка папки сборки
rm -r ./build 
mkdir build
cd build

$CMake \
-DCMAKE_PREFIX_PATH=$QtPath/lib/cmake \
-DCMAKE_BUILD_TYPE=Release \
-DANDROID_SDK_ROOT=$SdkPath \
-DANDROID_NDK_ROOT=$NdkPath \
-DCMAKE_TOOLCHAIN_FILE=$QtPath/lib/cmake/Qt6/qt.toolchain.cmake \
-DQT_HOST_PATH=$QtHostPath \
-DQT_ANDROID_SIGN_APK=ON \
..

$CMake --build . --config Release --target apk