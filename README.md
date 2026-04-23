# dbt_scooters

## Описание проекта

Проект на базе dbt, предназначенный для управления и трансформации данных,
связанных с использованием скутеров кикшеринга.
Позволяет выстроить аналитику данных о передвижениях и использовании скутеров.

## Технологии

- Python 3.11+
- uv — менеджер пакетов
- dbt-core — трансформация данных

## Быстрый старт

1. Убедитесь, что у вас установлен пакетный менеджер uv:

```bash
uv --version
```

2. Установите зависимости проекта (dbt и адаптер postgres):
   
```bash
uv sync
```

3. Клонируйте репозиторий, а затем перейдите в директорию проекта:

```bash
cd dbt_scooters
```

### Установка окружения

git clone https://github.com/mak200/dbt-scooters.git
cd dbt-scooters
uv sync

Активация виртуального окружения:

# Windows (cmd)
.venv\Scripts\activate

# Windows (PowerShell)
.venv\Scripts\Activate.ps1

# Linux/macOS
source .venv/bin/activate

### Настройка подключения к БД

Создайте файл ~/.dbt/profiles.yml (Linux/macOS) или %USERPROFILE%\.dbt\profiles.yml (Windows):

dbt_scooters:
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      port: 5432
      user: your_user
      password: your_password
      dbname: scooters_db
      schema: public
      threads: 4

## Основные команды dbt

- `dbt debug` - проверка подключения к хранилищу данных (проверка профиля)
- `dbt parse` - парсинг файлов проекта (проверка корректности)
- `dbt compile` - компилирует dbt-модели и создает SQL-файлы
- `dbt run` - материализация моделей в таблицы и представления
- `dbt test` - запускает тесты для проверки качества данных
- `dbt seed` - загружает данные в таблицы из CSV-файлов
- `dbt build` - основная команда, комбинирует run, test и seed
- `dbt docs generate` - генерирует документацию проекта
- `dbt docs serve` - запускает локальный сервер для просмотра документации

Примечание: если виртуальное окружение не активно, используйте `uv run dbt`.

## Конфигурация

Обновите конфигурационный файл `~/.dbt/profiles.yml` с вашими данными доступа к базе данных.

## Структура проекта

dbt_scooters/
├── models/          # SQL-модели
│   └── example/     # Примеры моделей
├── seeds/           # CSV-файлы (справочники)
├── tests/           # Пользовательские тесты
├── macros/          # Макросы
├── analyses/        # Аналитические запросы
├── snapshots/       # SCD Type 2
├── dbt_project.yml  # Конфигурация проекта
└── pyproject.toml   # Зависимости (uv)

## Типичные проблемы

Ошибка аутентификации GitHub при push: Используйте Personal Access Token вместо пароля.

Ошибка подключения к БД: Выполните dbt debug для диагностики.

## Лицензия

MIT