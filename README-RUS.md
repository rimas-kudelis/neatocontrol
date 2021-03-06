﻿NeatoControl - управление роботом
============== 

Программа управления и диагностирования роботов пылесосов фирмы Neato.
Работает с моделями: Neato XV серия, Neato Signature, Neato Botvac.

Возможности весьма простые: увидеть состояние датчиков, изменить расписание, установить время, получить картинку со сканера.
(Интерфейс программы оставляет желать лучшего - но зато есть простор для улучшений)

Использование
-------------
Поставьте драйвера - для этого скачайте программу обновления прошивки (Neato Updater Tool) с [офф сайта](http://www.neatorobotics.com/support/software-update/step-one/).
Подключите робота к компу, и нажмите кнопку Connect.

Скачать
-------
**[Скачать NeatoControl](https://bitbucket.org/heXor/neatocontrol/downloads/neatocontrol.zip)**

Баги, идеи, предложения
------------
Оставлять [тут](https://bitbucket.org/heXor/neatocontrol/issues)

Скриншоты
---------

[![](/_media/programs/1.png?w=90&h=65&tok=069583)](/_media/programs/1.png)
[![](/_media/programs/2.png?w=119&h=87&tok=e7d5c0)](/_media/programs/2.png)
[![](/_media/programs/3.png?w=90&h=65&tok=3d3d7a)](/_media/programs/3.png)

Известные проблемы и их решение
-------------------------------
Если вы подключились программой к роботу, а затем выдернули шнур USB не нажав Disconnect.
То робот не будет реагировать на нажатие кнопок - поскольку находится в режиме диагностирования сенсоров и кнопок (так называемый "TestMode"). Не пугайтесь, это нормально.

Просто выключите программу, подключите USB шнур повторно, включите программу, нажмите Connect и затем Disconnect.

Отказ от ответственности
------------------------
Программа предоставляется "как есть". Разработчик не несет ответственности за использование программы (или не использование).

Разработанная программа посылает стандартные команды описанные в документации изделия ([на офф. сайте](http://www.neatorobotics.com/programmers-manual/)). Команды посылаются через стандартные функции описанные в документации ОС. Подобное взаимодействие с роботом через USB-порт предусмотрено производителем. Согласно их документации это не приводит к ухудшению работы, и гарантия сохраняется - это не утверждается явно, но на их сайте нигде не написано обратного.

И если после использования программы робот станет вести себя подозрительно, например следить за вами, прятаться в темных углах и светить оттуда красным глазом, или пытаться засосать вашего кота, то я не виноват!

Управление
----------
Внимание: будьте готовы ловить робота! Перед запуском убедитесь что робот не сломает ничего и не разорвет шнур, не стащит ноутбук со стола, и тп. В общем обещайте быть аккуратными (и как обычно вся ответственность лежит на вас).

Если USB шнур вылетит из разъема в процессе езды, то робот будет выполнять последнюю команду. Например продолжит ехать вперед (уничтожая все на своем пути). Просто поймайте его и поднимите в воздух, через секунд 5-10 команда завершиться и он остановится.

Вкладка "Сканер" ставим галочку "Управление".

Один раз нажимаем кнопку **вперед** - робот поехал вперед. Он будет ехать вперед пока не нажмете кнопку **назад**.

Повторное нажатие кнопки **вперед** - увеличиваем скорость.

**Влево вправо** - повороты.

**Назад** - назад.

Все почти очевидно.

Интерфейс управления будет дорабатываться.


Вкладка команды
-----------------
Есть 6 команд которые можно вызывать, кнопкой "Run" или просто нажав Enter находясь в нужной строке, или нажав функциональную клавишу.

Также можно включить таймер чтобы команда вызывалась периодично.

Внизу выводится результат команды.

Если установить галочку "Save..." то результаты команды сохраняются в файл.

Инструкция использования: ввести необходимые команды, назначить время повтора, включить запись. И через пару часов вы получите файл с данными, которые можно вдумчиво просматривать. =)






Изменения
=========

      2.2
      Добавил вкладку "Моторы"
      Добавил вкладку "Лог"

      2.1
      Сохранение некоторых опций
      Совместный онлайн перевод на другие языки: https://poeditor.com/join/project/EdLcbGzBsR

      2.0
      Переход с Delphi на Lazarus!
      Вкладка "Сенсоры" - серый цвет для неактивных сенсоров.
      Новая система перевода на другие языки.

      1.10
      Исправление ошибок

      1.9
      Корректный мониторинг зарядки (и наверно еще некоторых показателей).
      изменена логика работы TestMode - теперь включается только когда требуется.
      добавлено TCP соединение - экспериментально! (не тестировал)

      1.8
      Вкладка "Команды"

      1.7
      добавил "Scan Line"
      перевод на Французский и Немецкий (спасибо glnc222)
      поддержка тем Windows
      исправлены разные баги

      1.6
      авто-определение порта BotVac.
      авто-определение языка.

      1.5
      Улучшен перевод. Спасибо Yuval Kohavi.

      1.4
      Раскачка аккумулятора.
      В телеметрию добавлены показания батареи.
      Отображение процента заряда и внутреннего времени.
      Можно копировать в буфер показания датчиков.

      1.3
      Теперь можно действительно управлять роботом!

      1.2
      Добавил механизм локализации через файлы.
      Русская версия интерфейса.
      Улучшен интерфейс.

      1.1
      Авто определение порта и более подробный вывод ошибок подключения
      Вывод версии при подключении
      Частично переработан интерфейс

      1.0
      Первый релиз
