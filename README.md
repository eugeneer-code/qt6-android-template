## Настройка окружения

**1. Установка Qt**

Требуется установка Qt 6.5.3 для android, одной или нескольких требуемых архитектур (armv7, x86, arm64_v8a). Несколько архитектур может понадобиться для сборки общего пакета сразу для всех типов устройств.

Помимо этого потребуется установка аналогичной версии Qt для хостовой машины.

> В Qt 6.6.0 имеется какая-то ошибка при сборке apk пакета, не удалось на нём собрать.

**2. Установка Android Studio**

https://developer.android.com/studio

При установке по умолчанию будут поставлены последние BuildTools и SDK.

**3. Установка Build Tools**

Ставится из SDK Manager (Android Studio). Можно установить максимальную текущую версию, например 34.

**4. Установка SDK**

Ставится из SDK Manager (Android Studio). Минимально поддерживаемой версией в Qt6 является SDK 26 (Android 8.0 Oreo). Выбираем его для охвата большего количества устройств.

**5. Установка NDK**

Ставим единственную официально поддерживаемую Qt версию - 25.1.8937393. Устанавливается из SDK Manager, вкладка SDK Tools. Для отображения всех версий NDK нужно отметить галочку Show package details.

**6. Установка JDK**

Подойдет любая версия с 11 до 17. С последними версиями Qt не будет собираться

https://jdk.java.net/archive/


## Сборка

Собирать проекты можно либо сразу из QtCreator (предварительно настроив комплект) либо из консоли, в каждом примере есть скрипты для сборки. Эти же скрипты можно применить для сборки проекта в CLion.

## Общие правила

- Для исполняемых файлов необходимо в cmake файле указывать *qt_add_executable* вместо *add_executable*. Тогда cmake самостоятельно при сборке для Android соберёт библиотеку вместо исполняемого файла.


## Подпись пакета

Для установки Release пакета на устройство, он должен быть подписан (Debug пакеты вроде бы без подписи ставятся).

При сборке пакета через QtCreator ключ задаётся в настройках сборки. При сборке скриптом необходимые параметры задаются в скрипте (путь к файлу, название, пароли).


