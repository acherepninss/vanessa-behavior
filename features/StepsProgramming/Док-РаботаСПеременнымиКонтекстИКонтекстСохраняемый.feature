﻿# encoding: utf-8
# language: ru

@IgnoreOnCIMainBuild
@DocumentationBuild
@tree

Функционал: Инструкция по работе с переменными Контекст и КонтекстСохраняемый
	Как Разработчик
	Я Хочу чтобы я мог сохранять значения для передачи контекста между шагами
	Чтобы я мог знать состояние предыдущих шагов
 
Контекст:
	Дано Я убедился что служебный EPF для проверки работы с переменными Контекст удален
	Дано Я открываю Vanessa-Behavior в TestClient без загрузки сохраненных настроек

	
Сценарий: Работа с переменной "Контекст"
	Сначала надо загрузить фичу в Vanessa-Behavior
			Когда Я нажимаю на кнопку Загрузить одну фичу
			Тогда в открывшемся окне я указываю путь к фиче "Support\Instructions\Core\ДляРаботыСПеременнымиКонтекст.feature"
	Затем надо создать EPF
			И я перехожу к закладке "Генератор EPF"
			И я изменяю флаг "Генерировать управляемую форму"
			И я изменяю флаг "Создавать области при генерации кода"
			И я нажимаю на кнопку "Создать и обновить шаблоны обработок"
			И В каталоге появилась обработка "Support\Instructions\Core\step_definitions\ДляРаботыСПеременнымиКонтекст.epf"
	Затем надо открыть полученную обработку в конфигураторе
			Тогда я запускаю конфигуратор служебной базы 
			И я открываю в конфигураторе файл "Support\Instructions\Core\step_definitions\ДляРаботыСПеременнымиКонтекст.epf"
			И я открываю основную форму обработки
			И я перехожу на закладку Модуль
			И я сворачиваю область Служебные функции
			И я заменяю строку "ВызватьИсключение" на "//ВызватьИсключение"
	Далее надо заполнить процедуры в модуле обработки
			И я перехожу внутрь процедуры "ЯУказалПервоеСлагаемое"
			И я добавляю строку 'Контекст.Вставить("ПервоеСлагаемое",Парам01);'
			И я добавляю строку 'КонтекстСохраняемый.Вставить("ПервоеСлагаемое",Парам01);'
			
			И я перехожу внутрь процедуры "ЯУказалВтороеСлагаемое"
			И я добавляю строку 'Контекст.Вставить("ВтороеСлагаемое",Парам01);'
			И я добавляю строку 'КонтекстСохраняемый.Вставить("ВтороеСлагаемое",Парам01);'
			
			И я перехожу внутрь процедуры "ЯПолучуСумму"
			И я добавляю строку 'Сумма = Контекст.ПервоеСлагаемое + Контекст.ВтороеСлагаемое;'
			И я добавляю строку 'Если Сумма <> Парам01 Тогда'
			И я добавляю строку 'ВызватьИсключение "Ошибка. Ожидали сумму = " + Парам01 + ", а получили " + Сумма;'
			И я добавляю строку 'КонецЕсли;'
			
			И я перехожу внутрь процедуры "ЯВывожуНаЭкранЗначениеСтруктуры"
			И я добавляю строку 'Ванесса.ВывестиНаЭкранЗначениеСтруктуры(Вычислить(Парам01));'
	Далее надо проверить работу нашего алгоритма
			И я сохраняю изменения в файле
			И я перехожу в сеанс 1С TestClient
			И Я нажимаю на кнопку Перезагрузить Сценарии
			И Пауза 3
			И Я нажимаю на кнопку Выполнить Сценарии
			И пауза 4

	И обратите внимание 'Обратите внимание, что во втором сценарии содержимое переменной Контекст стало пустым'
	И обратите внимание 'А содержимое переменной КонтекстСохраняемый осталось прежним'
	И обратите внимание 'Итого. Переменная Контекст очищается перед выполнением каждого сценария.'
	И обратите внимание 'А КонтекстСохраняемый существует, пока открыта форма Vanessa-Behavior.'
	И обратите внимание 'Спасибо за внимание!'
