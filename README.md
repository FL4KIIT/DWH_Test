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

Выполнить create_tables.sql

Выполнить insert_stage_data.sql

Запустить процедуры:

dwh.load_customer

dwh.load_products

dwh.load_orders

Запустить mart.calc_top_products
