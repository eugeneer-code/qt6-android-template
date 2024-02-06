**Добавление AndroidManifest.xml**

Для более тонкой настройки android приложения необходимо вносить изменения в файл AndroidManifest.xml. В нём указаны основные свойства приложения и входная точка для запуска. Подробнее о формате файла можно почитать здесь: 

https://developer.alexanderklimov.ru/android/theory/AndroidManifestXML.php

https://developer.android.com/guide/topics/manifest/manifest-intro

**Создание файла**

Можно создать файл с помощью QtCreator, но самое простое - скопировать его из установленного Qt: ``<QtPath>/src/android/templates/AndroidManifest.xml``

В проекте необходимо создать папку, где будут лежать файлы для настройки пакета. В данном проекте это папка android. В неё копируем файл AndroidManifest.xml.

В файле имеются строки, которые Qt будет заменять сам при сборке apk пакета. Это строки вида:

```
 android:versionCode="-- %%INSERT_VERSION_CODE%% --"
 android:versionName="-- %%INSERT_VERSION_NAME%% --"
```

**Название приложения**

По умолчанию название приложения установится равным имени цели, которая указана в qt_add_executable. В нашем случае, если ничего не менять, приложение после установки будет называться manifest-file.

Чтобы это исправить меняем в файле AndroidManifest.xml строчку

```
android:label="-- %%INSERT_APP_NAME%% --"
```
в тегах `<android>` и `<activity>` на необходимую строку.

**Ориентация экрана**

Можно зафиксировать ориентацию приложения в строке:

```
android:screenOrientation="unspecified"
```

Возможные варианты описаны здесь: https://developer.android.com/guide/topics/manifest/activity-element#screen


**Иконка приложения**

Создавать иконку приложения рекомендуется в менеджере Android Studio. Для этого необходимо создать любое приложение, вызвать контекстное меню в дереве проекта и выбрать New -> Image Asset. Тип иконки "Launcher Icons (Adaptive and Legacy)". Данный вариант создаст векторный вариант иконки (состоящий из background и foreground) и растровые иконки под разные размеры.

После создания иконки необходимо все получившиеся файлы скопировать в папку android/res. Эта папка будет вложена в итоговый apk архив и будет использована в качестве ресурсов android-приложения.

**Указание папки ресурсов**

Папка указывается как свойство у собираемой цели:

```
set_target_properties(${PROJECT_NAME} PROPERTIES
    QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
)
```

