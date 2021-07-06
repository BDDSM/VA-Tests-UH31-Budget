﻿#language: ru
@tree

Функционал: 04. Проверка произвольных запросов расчета показателей

Как Администратор я хочу
Проверить что произвольные запросы работают для расчета показателей
чтобы показатели рассчитывались без ошибок

Контекст: 

	Дано Я открыл новый сеанс TestClient или подключил уже существующий	
	И я закрыл все окна клиентского приложения

Сценарий: 04.00 Определение типа приложения

	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И НЕ ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоУХ$$"
	И Я запоминаю значение выражения 'ИдентификацияПродуктаУХКлиентСервер.ЭтоУправлениеХолдингом() И ИдентификацияПродуктаУХКлиентСервер.ЭтоЕХ()' в переменную "$$ЭтоЕРПУХ$$"

Сценарий: 04.01 Создание вида отчета "ВА - Произвольный запрос"

	* Ищем вид отчета с именем "ВА - Произвольный запрос"
		И В командном интерфейсе я выбираю 'Бюджетирование, отчетность и анализ' 'Виды и бланки отчетов'
		Тогда открылось окно 'Виды и бланки отчетов'
		И в таблице "СписокВидовОтчетов" я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
		Тогда открылось окно 'Найти'
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Вид отчета'
		И я меняю значение переключателя с именем 'CompareType' на 'По части строки'
		И в поле с именем 'Pattern' я ввожу текст 'ВА - Произвольный запрос'
		И я нажимаю на кнопку с именем 'Find'
		И Пока в таблице "СписокВидовОтчетов" количество строк "больше" 0 Тогда
			И Я запоминаю значение выражения '"Удалить_" + СтрЗаменить(Новый УникальныйИдентификатор, "-", "")' в переменную "УИД"		
			И в таблице "СписокВидовОтчетов" я выбираю текущую строку
			Когда открылось окно 'ВА - Произвольный запрос (Виды отчетов)'		
			И в поле с именем 'Наименование' я ввожу значение переменной "УИД"
			И в поле с именем 'ПолноеНаименование' я ввожу значение переменной "УИД"
			И в поле с именем 'Код' я ввожу значение переменной "УИД"
			И в поле с именем 'Родитель' я ввожу текст ''						
			И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
			И я жду закрытия окна 'ВА - Произвольный запрос (Виды отчетов)' в течение 20 секунд
	
	* Создаем новый вид отчета
		Тогда открылось окно 'Виды и бланки отчетов'
		И в таблице "СписокВидовОтчетов" я нажимаю на кнопку с именем 'СписокВидовОтчетовСоздать'
		Тогда открылось окно 'Виды отчетов (создание)'
		И в поле с именем 'Наименование' я ввожу текст 'ВА - Произвольный запрос'
		И из выпадающего списка с именем "Родитель" я выбираю по строке 'ВА - Группа отчетов'
		И я нажимаю на кнопку с именем 'ФормаКнопкаЗаписать'
	
	* Редактируем структуру отчета
		Тогда открылось окно 'ВА - Произвольный запрос (Виды отчетов)'
		И я нажимаю на кнопку с именем 'РедактироватьДерево'
		Тогда открылось окно 'Конструктор отчета'
		* Добавляем строки
			И я нажимаю на кнопку с именем 'ДеревоСтрокДобавитьСтроки'
			Тогда открылось окно 'Добавление новых строк'
			И в таблице "НовыеСтроки" я нажимаю на кнопку с именем 'НовыеСтрокиДобавить'
			И в таблице "НовыеСтроки" в поле с именем 'НовыеСтрокиНаименование' я ввожу текст 'Номенклатура'
			И в таблице "НовыеСтроки" я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ОК'
		* Добавляем колонки
			И я нажимаю на кнопку с именем 'ДеревоСтрокДобавитьКолонку'		
			Тогда открылось окно 'Добавление новых колонок'
			И в таблице "НовыеСтроки" я нажимаю на кнопку с именем 'НовыеСтрокиДобавить'
			И в таблице "НовыеСтроки" в поле с именем 'НовыеСтрокиНаименование' я ввожу текст 'Цена'
			И в таблице "НовыеСтроки" я завершаю редактирование строки
			И я нажимаю на кнопку с именем 'ОК'

	* Устанавливаем аналитики отчета
		Когда открылось окно 'Конструктор отчета'
		И из выпадающего списка с именем "РежимРаботы" я выбираю точное значение 'Аналитики показателей'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R2C2"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		Тогда открылось окно 'Виды аналитик (корпоративные)'
		И я нажимаю на кнопку с именем 'ФормаНайти'
		Тогда открылось окно 'Найти'
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Код'
		И в поле с именем 'Pattern' я ввожу текст 'ВА0Номенкл'
		И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно 'Виды аналитик (корпоративные)'
		И в таблице "Список" я выбираю текущую строку

	* Создаем бланк отчета
		Когда открылось окно 'Конструктор отчета'
		И Я закрываю окно 'Конструктор отчета'
		Тогда открылось окно 'ВА - Произвольный запрос (Виды отчетов)'
		И я закрываю окно 'ВА - Произвольный запрос (Виды отчетов)'
		Тогда открылось окно 'Виды и бланки отчетов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                             |
			| 'ВА - Произвольный запрос(многопериодный)' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Бланк ВА - Произвольный запрос(многопериодный) вида отчета: ВА - Произвольный запрос'
		И я нажимаю на кнопку с именем 'ФормаСоздатьМакетИмпорта'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку с именем 'Button0'
		Тогда открылось окно 'Структура отчета'
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		Тогда открылось окно 'Бланк ВА - Произвольный запрос(многопериодный) вида отчета: ВА - Произвольный запрос *'
		И я нажимаю на кнопку с именем 'ФормаКнопкаЗаписатьИЗакрыть'					

Сценарий: 04.02 Проверка поведения формы настройки показателей

	* Ищем вид отчета с именем "ВА - Произвольный запрос"
		И В командном интерфейсе я выбираю 'Бюджетирование, отчетность и анализ' 'Виды и бланки отчетов'
		Тогда открылось окно 'Виды и бланки отчетов'
		И в таблице "СписокВидовОтчетов" я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
		Тогда открылось окно 'Найти'
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Вид отчета'
		И я меняю значение переключателя с именем 'CompareType' на 'По части строки'
		И в поле с именем 'Pattern' я ввожу текст 'ВА - Произвольный запрос'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно 'Виды и бланки отчетов'
		И в таблице "СписокВидовОтчетов" я нажимаю на кнопку с именем 'ОткрытьКонструктор'
				
	* Вводим формулу расчета	
		Тогда открылось окно 'Конструктор отчета'
		И из выпадающего списка с именем "РежимРаботы" я выбираю точное значение 'Формулы расчета показателей'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R2C2"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И в поле с именем "ПолеТекстовогоДокументаПроцедура" я ввожу текст ' '
		И я нажимаю на кнопку с именем 'ДобавитьОперанд1'

	* Проверяем поведение формы при классическом движке расчета показателей
		И я устанавливаю в константу "ИспользоватьРасширенныйАлгоритмПересчетаПоказателей" значение "Ложь"
		Тогда открылось окно 'Источники данных'
		И я нажимаю на кнопку с именем 'ФормаСоздать'			
		Когда открылось окно 'Источник данных (создание)'
		И из выпадающего списка с именем "СпособПолучения" я выбираю точное значение 'Произвольный запрос к текущей ИБ'
		И элемент формы с именем "ИспользоватьМногопериодныйКонтекст" отсутствует на форме
		И элемент формы с именем "Справка" отсутствует на форме			
		И Я закрываю окно 'Источник данных (создание) *'
		Тогда открылось окно '1С:Предприятие'
		И я нажимаю на кнопку с именем 'Button1'

	* Проверяем поведение формы при расширенном движке расчета показателей
		И я устанавливаю в константу "ИспользоватьРасширенныйАлгоритмПересчетаПоказателей" значение "Истина"
		Тогда открылось окно 'Источники данных'
		И я нажимаю на кнопку с именем 'ФормаСоздать'	
		Когда открылось окно 'Источник данных (создание)'
		И из выпадающего списка с именем "СпособПолучения" я выбираю точное значение 'Показатель отчета текущей ИБ'
		И элемент формы с именем "ИспользоватьМногопериодныйКонтекст" отсутствует на форме
		И элемент формы с именем "Справка" отсутствует на форме
		И из выпадающего списка с именем "СпособПолучения" я выбираю точное значение 'Регистр накопления текущей ИБ'
		И элемент формы с именем "ИспользоватьМногопериодныйКонтекст" отсутствует на форме
		И элемент формы с именем "Справка" отсутствует на форме
		И из выпадающего списка с именем "СпособПолучения" я выбираю точное значение 'Регистр бухгалтерии текущей ИБ'
		И элемент формы с именем "ИспользоватьМногопериодныйКонтекст" отсутствует на форме
		И элемент формы с именем "Справка" отсутствует на форме
		И из выпадающего списка с именем "СпособПолучения" я выбираю точное значение 'Регистр сведений текущей ИБ'
		И элемент формы с именем "ИспользоватьМногопериодныйКонтекст" отсутствует на форме
		И элемент формы с именем "Справка" отсутствует на форме
		И из выпадающего списка с именем "СпособПолучения" я выбираю точное значение 'Справочник текущей ИБ'
		И элемент формы с именем "ИспользоватьМногопериодныйКонтекст" отсутствует на форме
		И элемент формы с именем "Справка" отсутствует на форме
		И из выпадающего списка с именем "СпособПолучения" я выбираю точное значение 'Произвольный запрос к текущей ИБ'
		И элемент формы с именем "ИспользоватьМногопериодныйКонтекст" присутствует на форме
		И элемент формы с именем "Справка" присутствует на форме			
		И я нажимаю на кнопку с именем 'Справка'
		Тогда открылось окно 'Справка'
		И Я закрываю окно 'Справка'

	* Устанавливаем текст запроса
		Когда открылось окно 'Источник данных (создание) *'
		Если '$$ЭтоУХ$$' Тогда 
			И в поле с именем 'ТекстЗапросаФорма' я ввожу текст 
				|'ВЫБРАТЬ'|
				|'	ЦеныНоменклатуры.Период КАК Дата,'|
				|'	ЦеныНоменклатуры.Номенклатура КАК Номенклатура,'|
				|'	МАКСИМУМ(ЦеныНоменклатуры.Цена) КАК Цена'|
				|'ПОМЕСТИТЬ втРасчетная'|
				|'ИЗ'|
				|'	РегистрСведений.ЦеныНоменклатуры КАК ЦеныНоменклатуры'|
				|'ГДЕ'|
				|'	ЦеныНоменклатуры.Период >= &ПериодНачала'|
				|'	И ЦеныНоменклатуры.Период <= &ПериодОкончания'|
				|'	И ЦеныНоменклатуры.ТипЦен = &ТипЦен'|
				|''|
				|'СГРУППИРОВАТЬ ПО'|
				|'	ЦеныНоменклатуры.Период,'|
				|'	ЦеныНоменклатуры.Номенклатура'|
				|';'|
				|''|
				|'////////////////////////////////////////////////////////////////////////////////'|
				|'ВЫБРАТЬ'|
				|'	втРасчетная.Дата КАК Дата,'|
				|'	втРасчетная.Номенклатура КАК Номенклатура,'|
				|'	втРасчетная.Цена КАК Цена'|
				|'ИЗ'|
				|'	втРасчетная КАК втРасчетная'|
		Если '$$ЭтоЕРПУХ$$' Тогда
			И в поле с именем 'ТекстЗапросаФорма' я ввожу текст 
				|'ВЫБРАТЬ'|
				|'	ЦеныНоменклатуры.Период КАК Дата,'|
				|'	ЦеныНоменклатуры.Номенклатура КАК Номенклатура,'|
				|'	МАКСИМУМ(ЦеныНоменклатуры.Цена) КАК Цена'|
				|'ПОМЕСТИТЬ втРасчетная'|
				|'ИЗ'|
				|'	РегистрСведений.ЦеныНоменклатуры КАК ЦеныНоменклатуры'|
				|'ГДЕ'|
				|'	ЦеныНоменклатуры.Период >= &ПериодНачала'|
				|'	И ЦеныНоменклатуры.Период <= &ПериодОкончания'|
				|'	И ЦеныНоменклатуры.ВидЦены = &ТипЦен'|
				|''|
				|'СГРУППИРОВАТЬ ПО'|
				|'	ЦеныНоменклатуры.Период,'|
				|'	ЦеныНоменклатуры.Номенклатура'|
				|';'|
				|''|
				|'////////////////////////////////////////////////////////////////////////////////'|
				|'ВЫБРАТЬ'|
				|'	втРасчетная.Дата КАК Дата,'|
				|'	втРасчетная.Номенклатура КАК Номенклатура,'|
				|'	втРасчетная.Цена КАК Цена'|
				|'ИЗ'|
				|'	втРасчетная КАК втРасчетная'|
		И я нажимаю на кнопку с именем 'КонструкторЗапроса'
		Тогда открылось окно 'Конструктор запроса'
		И Я закрываю окно 'Конструктор запроса'
		Тогда открылось окно 'Источник данных (создание) *'
		И я нажимаю на кнопку с именем 'РедактироватьТекстЗапроса'
		И я перехожу к закладке с именем "СоответствиеАналитик"
		
	* Проверяем заполнение таблиц
		Когда открылось окно 'Источник данных (создание) *'
		И в таблице "ДеревоПолейБД" я разворачиваю строку:
			| 'Поле'                 |
			| 'Параметры запроса(3)' |
		И в таблице "ДеревоПолейБД" я разворачиваю строку
			| 'Поле'                 |
			| 'Поля источника данных(3)' |				
		Тогда таблица "ДеревоПолейБД" стала равной:
			| 'Поле'                     |
			| 'Параметры запроса(3)'     |
			| 'ПериодНачала'             |
			| 'ПериодОкончания'          |
			| 'ТипЦен'                   |
			| 'Поля источника данных(3)' |
			| 'Дата'                     |
			| 'Номенклатура'             |
			| 'Цена'                     |
		Тогда таблица "ТаблицаСоответствия" стала равной:
			| 'Аналитика приемника'      | 'Способ заполнения' | 'Поле источника' | 'Вид аналитики' |
			| 'Аналитика1: Номенклатура' | 'Поле источника'    | 'Номенклатура'   | 'Номенклатура'  |
			| 'Значение'                 | 'Поле источника'    | 'Цена'           | ''              |
			| 'Период'                   | 'Поле источника'    | 'Дата'           | ''              |
		И я перехожу к закладке с именем "СтраницаОтборы"
		Когда открылось окно 'Источник данных (создание) *'
		Тогда таблица "ДеревоПараметровОтбораБД" стала равной:
			| 'Поле'            | 'Отбор' | 'Уточнение отбора' | 'Значение для проверки' |
			| 'ПериодНачала'    | ''      | ''                 | ''                      |
			| 'ПериодОкончания' | ''      | ''                 | ''                      |
			| 'ТипЦен'          | ''      | ''                 | ''                      |	

	* Заполняем параметры		
		Когда открылось окно 'Источник данных (создание) *'	
		И в таблице "ДеревоПараметровОтбораБД" я перехожу к строке:
			| 'Поле'            |
			| 'ПериодНачала'	|	
		И в таблице "ДеревоПараметровОтбораБД" из выпадающего списка с именем "СпособВычисленияПараметра" я выбираю точное значение 'Дата начала периода отчета'
		И в таблице "ДеревоПараметровОтбораБД" я завершаю редактирование строки
		И в таблице "ДеревоПараметровОтбораБД" я перехожу к строке:
			| 'Поле'            |
			| 'ПериодОкончания' |
		И в таблице "ДеревоПараметровОтбораБД" я выбираю текущую строку
		И в таблице "ДеревоПараметровОтбораБД" из выпадающего списка с именем "СпособВычисленияПараметра" я выбираю точное значение 'Дата конца периода отчета'
		И в таблице "ДеревоПараметровОтбораБД" я завершаю редактирование строки
		И в таблице "ДеревоПараметровОтбораБД" я перехожу к строке:
			| 'Поле'   |
			| 'ТипЦен' |
		И в таблице "ДеревоПараметровОтбораБД" я выбираю текущую строку
		И в таблице "ДеревоПараметровОтбораБД" из выпадающего списка с именем "СпособВычисленияПараметра" я выбираю точное значение 'Фиксированное значение'
		И в таблице "ДеревоПараметровОтбораБД" я активизирую поле с именем "УточнениеСпособаОпределения"
		И в таблице "ДеревоПараметровОтбораБД" из выпадающего списка с именем "УточнениеСпособаОпределения" я выбираю по строке 'ВА - Номенклатура'
		И в таблице "ДеревоПараметровОтбораБД" я завершаю редактирование строки
		Тогда таблица "ДеревоПараметровОтбораБД" стала равной:
			| 'Поле'            | 'Отбор'                      | 'Уточнение отбора'  | 'Значение для проверки' |
			| 'ПериодНачала'    | 'Дата начала периода отчета' | ''                  | ''                      |
			| 'ПериодОкончания' | 'Дата конца периода отчета'  | ''                  | ''                      |
			| 'ТипЦен'          | 'Фиксированное значение'     | 'ВА - Номенклатура' | ''                      |

	* Записываем элемент
		Когда открылось окно 'Источник данных (создание) *'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Источник данных (создание) *' в течение 20 секунд
		Тогда открылось окно 'Источники данных'
		И в таблице "Список" я активизирую поле с именем "КодУпрощеннойФормулы"
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Конструктор отчета *'
		И я нажимаю на кнопку с именем 'ЗаписатьИСвернуть'

Сценарий: 04.03 Создание экземпляра отчета - "ВА - Основной сценарий" с использованием многопериодного контекста							

	* Создаем новый экземпляр отчета
		И В командном интерфейсе я выбираю 'Бюджетирование, отчетность и анализ' 'Экземпляры отчетов'
		Тогда открылось окно 'Экземпляры отчетов'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Укажите ключевые реквизиты документа'
		И из выпадающего списка с именем "ВидОтчета" я выбираю по строке 'ВА - Произвольный запрос'
		И из выпадающего списка с именем "Сценарий" я выбираю по строке 'ВА - Основной сценарий'
		И из выпадающего списка с именем "Периодичность" я выбираю точное значение 'Месяц'
		И я нажимаю на кнопку с именем 'ИзменитьПериод'
		Тогда открылось окно 'Выберите период'
		И в поле с именем 'DateBegin' я ввожу текст '01.01.2021'
		И в поле с именем 'DateEnd' я ввожу текст '31.03.2021'
		И я нажимаю на кнопку с именем 'Select'
		Тогда открылось окно 'Укажите ключевые реквизиты документа'
		И я нажимаю кнопку выбора у поля с именем "Организация"
		* Выбираем организацию
			Если '$$ЭтоУХ$$' Тогда 	
				Когда открылось окно "Организационные единицы"
				И в таблице "Список" я активизирую поле с именем "Наименование"
				И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем "Список"
				Тогда открылось окно 'Найти'
				И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Наименование в программе'
				И в поле с именем 'Pattern' я ввожу текст 'Меркурий ООО'
				И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно 'Организационные единицы'
				И в таблице "Список" я выбираю текущую строку	
			Если '$$ЭтоЕРПУХ$$' Тогда
				Когда открылось окно 'Организации'
				И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем "Список"
				Тогда открылось окно 'Найти'
				И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
				И в поле с именем 'Pattern' я ввожу текст 'Меркурий ООО'	
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно 'Организации'
				И в таблице "Список" я выбираю текущую строку
		Когда открылось окно 'Укажите ключевые реквизиты документа'
		И я нажимаю на кнопку с именем 'КнопкаОК'

	* Документ должен быть пустой
		Когда открылось окно 'Экземпляр отчета ВА - Произвольный запрос:  Валюта отображения:  RUB <Меркурий ООО> <> <Январь * г. - Март * г. (Периодичность: Месяц) <ВА - Основной сценарий>> *'
		Тогда табличный документ "ПолеТабличногоДокументаМакет" равен:
			| 'ВА - Произвольный запрос(многопериодный)' | ''               | ''                | ''             | ''      |
			| ''                                         | ''               | ''                | ''             | ''      |
			| ''                                         | 'Январь 2021 г.' | 'Февраль 2021 г.' | 'Март 2021 г.' | 'ИТОГО' |
			| ''                                         | 'Цена'           | 'Цена'            | 'Цена'         | 'Цена'  |
			| 'Номенклатура'                             | '0'              | '0'               | '0'            | '0'     |	

	* Рассчитываем значения показателей	
		Когда открылось окно 'Экземпляр отчета ВА - Произвольный запрос:  Валюта отображения:  RUB <Меркурий ООО> <> <Январь * г. - Март * г. (Периодичность: Месяц) <ВА - Основной сценарий>> *'
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПоУмолчанию'
		Тогда табличный документ "ПолеТабличногоДокументаМакет" равен:
			| 'ВА - Произвольный запрос(многопериодный)'                        | ''               | ''                | ''             | ''           |
			| ''                                                                | ''               | ''                | ''             | ''           |
			| ''                                                                | 'Январь 2021 г.' | 'Февраль 2021 г.' | 'Март 2021 г.' | 'ИТОГО'      |
			| ''                                                                | 'Цена'           | 'Цена'            | 'Цена'         | 'Цена'       |
			| 'Номенклатура'                                                    | '6 030 000'      | '6 633 000'       | '7 495 400'    | '20 158 400' |
			| '1С:ERP. Управление холдингом '                                   | '1 950 000'      | '2 145 000'       | '2 423 900'    | '6 518 900'  |
			| '1С:Корпорация '                                                  | '2 050 000'      | '2 255 000'       | '2 548 200'    | '6 853 200'  |
			| '1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест ' | '600 000'        | '660 000'         | '745 800'      | '2 005 800'  |
			| '1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64) '           | '180 000'        | '198 000'         | '223 700'      | '601 700'    |
			| '1С:Управление холдингом 8 '                                      | '1 250 000'      | '1 375 000'       | '1 553 800'    | '4 178 800'  |

	* Записываем документ
		Когда открылось окно 'Экземпляр отчета ВА - Произвольный запрос:  Валюта отображения:  RUB <Меркурий ООО> <> <Январь * г. - Март * г. (Периодичность: Месяц) <ВА - Основной сценарий>> *'
		И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
		И я жду закрытия окна 'Экземпляр отчета ВА - Произвольный запрос:  Валюта отображения:  RUB <Меркурий ООО> <> <Январь * г. - Март * г. (Периодичность: Месяц) <ВА - Основной сценарий>> *' в течение 20 секунд

Сценарий: 04.04 Проверка поведениея формы настройки показателей без использования многопериодного контекста

	* Ищем вид отчета с именем "ВА - Произвольный запрос"
		И В командном интерфейсе я выбираю 'Бюджетирование, отчетность и анализ' 'Виды и бланки отчетов'
		Тогда открылось окно 'Виды и бланки отчетов'
		И в таблице "СписокВидовОтчетов" я нажимаю на кнопку с именем 'СписокВидовОтчетовНайти'
		Тогда открылось окно 'Найти'
		И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Вид отчета'
		И я меняю значение переключателя с именем 'CompareType' на 'По части строки'
		И в поле с именем 'Pattern' я ввожу текст 'ВА - Произвольный запрос'
		И я нажимаю на кнопку с именем 'Find'
		Тогда открылось окно 'Виды и бланки отчетов'
		И в таблице "СписокВидовОтчетов" я нажимаю на кнопку с именем 'ОткрытьКонструктор'

	* Снимаем флаг многопериодного контекста у источника данных	
		И я устанавливаю в константу "ИспользоватьРасширенныйАлгоритмПересчетаПоказателей" значение "Ложь"
		Тогда открылось окно 'Конструктор отчета'
		И из выпадающего списка с именем "РежимРаботы" я выбираю точное значение 'Формулы расчета показателей'
		И в табличном документе 'ПолеТабличногоДокументаМакет' я перехожу к ячейке "R2C2"
		И в табличном документе 'ПолеТабличногоДокументаМакет' я делаю двойной клик на текущей ячейке
		И я нажимаю на кнопку с именем 'ДобавитьОперанд1'
		Когда открылось окно 'Источники данных'
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюИзменить' на элементе формы с именем "Список"
		Тогда открылось окно 'Произвольный запрос к текущей ИБ (Источник данных)'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Произвольный запрос к текущей ИБ (Источник данных)' в течение 20 секунд

	* Проверяем поведение формы при расширенном движке расчета показателей
		И я устанавливаю в константу "ИспользоватьРасширенныйАлгоритмПересчетаПоказателей" значение "Истина"
		Тогда открылось окно 'Источники данных'
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюИзменить' на элементе формы с именем "Список"
		Тогда открылось окно 'Произвольный запрос к текущей ИБ (Источник данных)'
		И элемент формы с именем "ИспользоватьМногопериодныйКонтекст" присутствует на форме
		И элемент формы с именем "Справка" присутствует на форме			
		И флаг с именем "ИспользоватьМногопериодныйКонтекст" равен "Ложь"		
								
	* Проверяем заполнение таблиц
		Когда открылось окно 'Произвольный запрос к текущей ИБ (Источник данных)'
		И я нажимаю на кнопку с именем 'РедактироватьТекстЗапроса'
		И я нажимаю на кнопку с именем 'РедактироватьТекстЗапроса'				
		И в таблице "ДеревоПолейБД" я разворачиваю строку:
			| 'Поле'                 |
			| 'Параметры запроса(3)' |
		И в таблице "ДеревоПолейБД" я разворачиваю строку
			| 'Поле'                 |
			| 'Поля источника данных(3)' |				
		Тогда таблица "ДеревоПолейБД" стала равной:
			| 'Поле'                     |
			| 'Параметры запроса(3)'     |
			| 'ПериодНачала'             |
			| 'ПериодОкончания'          |
			| 'ТипЦен'                   |
			| 'Поля источника данных(3)' |
			| 'Дата'                     |
			| 'Номенклатура'             |
			| 'Цена'                     |
		Тогда таблица "ТаблицаСоответствия" стала равной:
			| 'Аналитика приемника'      | 'Способ заполнения' | 'Поле источника' | 'Вид аналитики' |
			| 'Аналитика1: Номенклатура' | 'Поле источника'    | 'Номенклатура'   | 'Номенклатура'  |
			| 'Значение'                 | 'Поле источника'    | 'Цена'           | ''              |
		И я перехожу к закладке с именем "СтраницаОтборы"
		Когда открылось окно 'Произвольный запрос к текущей ИБ (Источник данных)'
		Тогда таблица "ДеревоПараметровОтбораБД" стала равной:
			| 'Поле'            | 'Отбор'                      | 'Уточнение отбора'  | 'Значение для проверки' |
			| 'ПериодНачала'    | 'Дата начала периода отчета' | ''                  | ''                      |
			| 'ПериодОкончания' | 'Дата конца периода отчета'  | ''                  | ''                      |
			| 'ТипЦен'          | 'Фиксированное значение'     | 'ВА - Номенклатура' | ''                      |	
	 			
	* Закрываем источник данных
		Когда открылось окно 'Произвольный запрос к текущей ИБ (Источник данных)'
		И Я закрываю окно 'Произвольный запрос к текущей ИБ (Источник данных)'
		Тогда открылось окно 'Источники данных'
		И Я закрываю окно 'Источники данных'
		Тогда открылось окно 'Конструктор отчета'
		И я нажимаю на кнопку с именем 'ОтменаРедактированияФормулы'

Сценарий: 04.05 Создание экземпляра отчета - "ВА - Основной сценарий" без использования многопериодного контекста							

	* Создаем новый экземпляр отчета
		И В командном интерфейсе я выбираю 'Бюджетирование, отчетность и анализ' 'Экземпляры отчетов'
		Тогда открылось окно 'Экземпляры отчетов'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Укажите ключевые реквизиты документа'
		И из выпадающего списка с именем "ВидОтчета" я выбираю по строке 'ВА - Произвольный запрос'
		И из выпадающего списка с именем "Сценарий" я выбираю по строке 'ВА - Основной сценарий'
		И из выпадающего списка с именем "Периодичность" я выбираю точное значение 'Месяц'
		И я нажимаю на кнопку с именем 'ИзменитьПериод'
		Тогда открылось окно 'Выберите период'
		И в поле с именем 'DateBegin' я ввожу текст '01.01.2021'
		И в поле с именем 'DateEnd' я ввожу текст '31.03.2021'
		И я нажимаю на кнопку с именем 'Select'
		Тогда открылось окно 'Укажите ключевые реквизиты документа'
		И я нажимаю кнопку выбора у поля с именем "Организация"
		* Выбираем организацию
			Если '$$ЭтоУХ$$' Тогда 	
				Когда открылось окно "Организационные единицы"
				И в таблице "Список" я активизирую поле с именем "Наименование"
				И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем "Список"
				Тогда открылось окно 'Найти'
				И из выпадающего списка с именем "FieldSelector" я выбираю точное значение 'Наименование в программе'
				И в поле с именем 'Pattern' я ввожу текст 'Венера ООО'
				И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно 'Организационные единицы'
				И в таблице "Список" я выбираю текущую строку	
			Если '$$ЭтоЕРПУХ$$' Тогда
				Когда открылось окно 'Организации'
				И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюНайти' на элементе формы с именем "Список"
				Тогда открылось окно 'Найти'
				И я меняю значение переключателя с именем 'CompareType' на 'По точному совпадению'
				И в поле с именем 'Pattern' я ввожу текст 'Венера ООО'	
				И я нажимаю на кнопку с именем 'Find'
				Тогда открылось окно 'Организации'
				И в таблице "Список" я выбираю текущую строку
		Когда открылось окно 'Укажите ключевые реквизиты документа'
		И я нажимаю на кнопку с именем 'КнопкаОК'

	* Документ должен быть пустой
		Когда открылось окно 'Экземпляр отчета ВА - Произвольный запрос:  Валюта отображения:  RUB <Венера ООО> <> <Январь * г. - Март * г. (Периодичность: Месяц) <ВА - Основной сценарий>> *'
		Тогда табличный документ "ПолеТабличногоДокументаМакет" равен:
			| 'ВА - Произвольный запрос(многопериодный)' | ''               | ''                | ''             | ''      |
			| ''                                         | ''               | ''                | ''             | ''      |
			| ''                                         | 'Январь 2021 г.' | 'Февраль 2021 г.' | 'Март 2021 г.' | 'ИТОГО' |
			| ''                                         | 'Цена'           | 'Цена'            | 'Цена'         | 'Цена'  |
			| 'Номенклатура'                             | '0'              | '0'               | '0'            | '0'     |	

	* Рассчитываем значения показателей	
		Когда открылось окно 'Экземпляр отчета ВА - Произвольный запрос:  Валюта отображения:  RUB <Венера ООО> <> <Январь * г. - Март * г. (Периодичность: Месяц) <ВА - Основной сценарий>> *'
		И я нажимаю на кнопку с именем 'ФормаЗаполнитьПоУмолчанию'
		Тогда табличный документ "ПолеТабличногоДокументаМакет" равен:
			| 'ВА - Произвольный запрос(многопериодный)'                        | ''               | ''                | ''             | ''           |
			| ''                                                                | ''               | ''                | ''             | ''           |
			| ''                                                                | 'Январь 2021 г.' | 'Февраль 2021 г.' | 'Март 2021 г.' | 'ИТОГО'      |
			| ''                                                                | 'Цена'           | 'Цена'            | 'Цена'         | 'Цена'       |
			| 'Номенклатура'                                                    | '6 030 000'      | '6 633 000'       | '7 495 400'    | '20 158 400' |
			| '1С:ERP. Управление холдингом '                                   | '1 950 000'      | '2 145 000'       | '2 423 900'    | '6 518 900'  |
			| '1С:Корпорация '                                                  | '2 050 000'      | '2 255 000'       | '2 548 200'    | '6 853 200'  |
			| '1С:Предприятие 8 КОРП. Клиентская лицензия на 100 рабочих мест ' | '600 000'        | '660 000'         | '745 800'      | '2 005 800'  |
			| '1С:Предприятие 8.3 КОРП. Лицензия на сервер (x86-64) '           | '180 000'        | '198 000'         | '223 700'      | '601 700'    |
			| '1С:Управление холдингом 8 '                                      | '1 250 000'      | '1 375 000'       | '1 553 800'    | '4 178 800'  |

	* Записываем документ
		Когда открылось окно 'Экземпляр отчета ВА - Произвольный запрос:  Валюта отображения:  RUB <Венера ООО> <> <Январь * г. - Март * г. (Периодичность: Месяц) <ВА - Основной сценарий>> *'
		И я нажимаю на кнопку с именем 'ЗаписатьИЗакрыть'
		И я жду закрытия окна 'Экземпляр отчета ВА - Произвольный запрос:  Валюта отображения:  RUB <Венера ООО> <> <Январь * г. - Март * г. (Периодичность: Месяц) <ВА - Основной сценарий>> *' в течение 20 секунд
					
