# DWH_Test

SQL scripts for database tables and procedures

Используемая СУБД

Microsoft SQL Server

Архитектура

Проект состоит из 3 слоёв:

stage – таблицы источники

dwh – витрины данных

mart – аналитическая витрина

Реализовано:

Задача 1

Реализована инкрементальная загрузка через MERGE:

customers 

products

orders

Выбран полный MERGE, так как:

объём данных небольшой

историчность в задании не обязательна

решение проще для стажёрского уровня


Задача 2
Создана витрина ТОП-5 товаров по городам:
рассчитывается через GROUP BY

используется ROW_NUMBER()

хранится в отдельной таблице mart.top_products_by_city

Допущения:

История изменений цен не хранится.

Удаление товаров не обрабатывается.

Как запустить
1. Create_Database.sql
2. stage.klienti.sql
3. stage.tovari.sql
4. stage.zakazi.sql
5. dwh.customer.sql
6. dwh.products.sql
7. dwh.orders.sql
8. insert_stage_data.sql
9. insert_stage.tovari.sql
10. insert_stage.zakazi.sql
11. load_customer.sql
12. load_products.sql
13. load_orders.sql
14. calc_top_products.sql
