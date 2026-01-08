# brick-dl.sh

Модульный Bash скрипт, предназначенный для автоматизации скачивания и установки модов Brick Rigs с помощью `steamcmd`. Он интеллектуально размещает скачанные моды в правильной директории внутри Wine префикса Heroic Games Launcher, обеспечивая совместимость и простоту использования.

Этот скрипт был рефакторизован в модульную структуру для лучшей организации, поддержки и надежности.

## Описание

Этот скрипт автоматизирует процесс скачивания модов из Steam Workshop для игры Brick Rigs и их размещения в пользовательской директории игры, когда игра установлена через Heroic Games Launcher. Он использует модульный подход, вынося отдельные функции в файлы в папке `modules/`.

## Структура папок

```
brick-dl/
├── brick-dl.sh         # Главный скрипт, оркестрирующий процесс.
├── modules/
│   ├── config.sh       # Содержит все конфигурационные переменные.
│   ├── download.sh     # Функции для скачивания модов с помощью steamcmd.
│   ├── file_ops.sh     # Функции для операций с файлами (создание папок, перемещение, права доступа).
│   ├── logging.sh      # Функции для форматированного вывода сообщений (инфо, ошибки, успех).
│   └── utils.sh        # Вспомогательные утилиты, например, генерация случайных имен.
└── README.md           # Этот файл (английская версия).
└── README_RU.md        # Этот файл (русская версия).
```

## Использование

1.  **Настройка (`modules/config.sh`):**
    *   Откройте файл `modules/config.sh` в текстовом редакторе.
    *   **Критически важно, обновите `MY_LOGIN`** на ваш реальный логин Steam.
    *   **ВАЖНО: Измените `TARGET_BASE`**, чтобы он указывал на правильный путь к сохранениям Brick Rigs внутри вашего Wine префикса Heroic Games Launcher. Замените `/home/your_user/` на ваш реальный путь и имя пользователя.
        *   **Пример:** Для пользователя с именем `gamer` это может выглядеть так:
            ```
            TARGET_BASE="/home/gamer/Games/Heroic/Prefixes/default/Brick Rigs/drive_c/users/steamuser/AppData/Local/BrickRigs/SavedRemastered/Vehicles"
            ```
    *   `APP_ID` (552100) и `TEMP_DIR` (/tmp/brick_steamcmd) обычно не требуют изменений.

2.  **Предварительные требования:**
    *   `steamcmd` должен быть установлен и доступен в PATH вашей системы.
    *   Heroic Games Launcher должен быть установлен, и Brick Rigs настроен в нем.
    *   Требуется действующая учетная запись Steam и логин.

3.  **Запуск скрипта:**
    *   Сделайте главный скрипт `brick-dl.sh` исполняемым:
        ```bash
        chmod +x brick-dl.sh
        ```
    *   Запустите скрипт, передав ID мода из Steam Workshop в качестве аргумента:
        ```bash
        ./brick-dl.sh <MOD_ID>
        ```
        Например:
        ```bash
        ./brick-dl.sh 1234567890
        ```

## Как получить ID мода?

ID мода можно найти в URL страницы мода на Steam Workshop. Например, в URL `https://steamcommunity.com/sharedfiles/filedetails/?id=1234567890`, ID мода будет `1234567890`.

## Пример рабочего процесса

```bash
./brick-dl.sh 1234567890

# Ожидаемый вывод:
# [INFO] Скачивание мода 1234567890...
# [INFO] Создание целевой папки: /home/your_user/Games/Heroic/Prefixes/default/Brick Rigs/drive_c/users/steamuser/AppData/Local/BrickRigs/SavedRemastered/Vehicles/9876543210
# [INFO] Перемещение файла '/tmp/brick_steamcmd/steamapps/workshop/content/552100/1234567890/Vehicle.brv' в '/home/your_user/Games/Heroic/Prefixes/default/Brick Rigs/drive_c/users/steamuser/AppData/Local/BrickRigs/SavedRemastered/Vehicles/9876543210/Vehicle.brv'
# [INFO] Установка прав доступа (777) для '/home/your_user/Games/Heroic/Prefixes/default/Brick Rigs/drive_c/users/steamuser/AppData/Local/BrickRigs/SavedRemastered/Vehicles/9876543210'
# [SUCCESS] Мод 1234567890 успешно скачан и установлен.
# [SUCCESS] Он сохранен в папке: 9876543210
```

## Лицензия

Этот скрипт предоставляется под [Лицензией MIT](LICENSE). Вы можете свободно использовать, изменять и распространять его.

---

*   *Пожалуйста, убедитесь, что все пути и конфигурации в `modules/config.sh` правильно настроены для вашей среды.*
