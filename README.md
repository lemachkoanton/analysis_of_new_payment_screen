# Анализ эффективности нового экрана оплаты

## Введение

Центральной задачей этого проекта является разработка оптимального SQL запроса для анализа эффективности нового экрана оплаты на образовательной платформе. Платформа предлагает курсы по trial-модели, где студенты могут решать 30 задач в день бесплатно, и для доступа к неограниченному количеству задач требуется покупка полного доступа.

## Цель Проекта

Главная цель проекта - разработать и оптимизировать SQL запрос, который позволит анализировать следующие метрики:

- ARPU (Average Revenue Per User)
- ARPAU (Average Revenue Per Active User)
- CR в покупку (Conversion Rate to Purchase)
- CR активного пользователя в покупку
- CR пользователя из активности по математике в покупку курса по математике

## Определения пользователей

- **Все пользователи**: Любой пользователь, попадающий в тестируемые группы.
- **Активный пользователь**: Пользователь, правильно решивший более 10 задач за все время в любых дисциплинах.
- **Активный по математике**: Пользователь, правильно решивший 2 или больше задач по математике.

## Данные

Используются следующие таблицы базы данных:

`default.studs`: Содержит информацию о студентах и их группах в эксперименте.

| Название атрибута | Тип атрибута | Смысловое значение |
|------------|-------------|-------------|
| st_id | int | ID ученика |
| test_grp | text | Метка ученика в данном эксперименте |

`default.final_project_check`: Включает данные о покупках курсов студентами.

| Название атрибута | Тип атрибута | Смысловое значение |
|------------|-------------|-------------|
| st_id | int | ID ученика |
| sale_time | timestamp | 	Время покупки |
| money | bool | Цена, по которой приобрели данный курс |
| subject | text | Дисциплина, в которой находится задача |

`default.peas`: Содержит информацию о решениях задач студентами.

| Название атрибута | Тип атрибута | Смысловое значение |
|------------|-------------|-------------|
| st_id | int | ID ученика |
| timest | timestamp | 	Время решения карточки |
| correct | bool | 	Время решения карточки |
| subject | text | 	Дисциплина, в которой находится задача |

## SQL Запрос

SQL-запрос для извлечения данных расположен в файле `analysis.sql`.

## Технологии

- **PostgreSQL**

## Заключение

Проект представляет собой уникальную возможность применить продвинутые навыки SQL для решения реальной бизнес-задачи, анализируя ключевые показатели эффективности и поведения пользователей на образовательной платформе.

