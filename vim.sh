:help [w] # справка [по команде "w"] в отдельной части экрана
- Режим ввода текста - все, что вы нажимаете, вставляется (заменяется).
- Выход через <Esc>, <Ctrl+c>

3. visual
- Режим выделения
- Доступны команды d (удалить) и y (скопировать).
- Доступны команды перемещения (W, e, $, и др.).
- Вход через <v>.
- Выход через <Esc>, <Ctrl+c>.
РЕЖИМЫ РАБОТЫ

<< 'ПЕРЕМЕЩЕНИЕ'
!!! Все стандартные хоткеи (Pg Up, End, ...) тоже работают !!!
!!!
СЛОВО - последовательность символов, разделённых пробелом(-ами)/табом(-ами)
!!!

По символам:
- Стрелки: h, j, k, l
По словам:
	Shift + стрелки - по началам слов/абзацев (???) В РЕЖИМЕ INSERT !!!
	w, W - в начало следующего слова/СЛОВА
	e, E - в конец
	b, B - в начало предыдущего
Еще крупнее:
	0, ^, $ - начало строки, первый непробельный символ, конец строк
	(, ) - по на предложениям
	{, } - по на абзацам
	% - к парной скобке
Совсем крупно:
	gf — переход к файлу под курсором
	gg- начало первой строки
	G - начало последней строки
	:21<Enter> - начало строки 21
	<Ctrl+D>, <Ctrl+U> - вниз/вверх на N строчек, где N обычно пол-экрана
ПЕРЕМЕЩЕНИЕ

<< 'СОЗДАНИЕ'
i - войти в insertion mode
a - сдвинуть курсор вправо и войти в insertion mode
o - создать строку ниже и войти в insertion mode
O - .............. выше ...
СОЗДАНИЕ

<< 'УДАЛЕНИЕ'
По символам:
  x - символ под курсором
  X - символ до курсора
Сразу много: d [<кол-во>] <ход>
	dе - удалить до конца текущего слова
	d$ - удалить до конца строки
	d5W - удалить пять СЛОВ
	:di" - удалить всё между двойным кавычками
  dt' - удалить до (не включительно) символа '
Специальная команда:
  dd - удалить строку (или, например, 10dd - удалить 10 строк, включая текущую)
УДАЛЕНИЕ

# Опять же, Ctrl+C, Ctrl+V, выделение через Shift и стрелки также работают
<< 'КОПИРОВАНИЕ'
Скопировать:
  y <кол-во> <ход> - скопировать
	yy - скопировать строку
Вставить:
	p - вставить после
	P - вставить перед
КОПИРОВАНИЕ

<< 'ПОИСК И ЗАМЕНА'
Поиск:
	:set ignorecase - регистронезависимый поиск
	/cAsEinsenSetiVe\C - '\C' даёт регистроЗАВИСИМЫЙ поиск
  * - искать слово под курсором и перейти к следующему
  /<текст> - искать <текст> вперед
	?<текст> - назад
	n - следующее вхождение, N - предыдущее
Замена:
  :%s/<что ищем>/<на что меняем>/<флаги> (s - substitute)
  Регистр:
    Shift + v + ... + [Shift] + u - -> lowercase [UPPERCASE]
    Shift + v + ... + ~ - switch case
	Флаги:
    g - много замен в строке (без флага - только 1-е вхождение)
    с - подтверждение при замене в каждом случае
ПОИСК И ЗАМЕНА

<< 'ВЫДЕЛЕНИЕ'
V - выделить всю строку
ВЫДЕЛЕНИЕ

<< 'ПОЛЕЗНЫЕ КОМАНДЫ'
Курсор:
	<Ctrl+o> — вернуться к позиции курсора в предыдущем файле
Отмена/возврат:
	u - отменить последнее действие
	<Ctrl+r> - вернуть отмененное действие
Сохранение работы:
  :w - сохранить изменения
	:qa - закрыть все вкладки (all) и выйти
  :wq - сохранить и выйти
  :q! - выйти без сохранения
  :w <файл> - сохранить изменения в <файл>
ПОЛЕЗНЫЕ КОМАНДЫ

<< 'ЗАКЛАДКИ'
m<символ> - закладка с названием <символ> в начале текущей строки
`<символ> - вернуться к закладке (строка + столбец)
`. — возврат к последнему редактироваемому символу
:marks - список всех закладок
Закладка с заглавной буквы - глобальная закладка (мб в другом файле)
ЗАКЛАДКИ

<< 'МАКРОСЫ'
q<символ> - начать запись макроса с именем <символ>
... записываются все действия (до завершения записи) ...
q - завершить запись
@<символ> - выполнить макрос
<n>@<символ> - ... <n> раз подряд
МАКРОСЫ

<< 'ОТСТУПЫ'
'=' + Shift + g - исправить отступ от текущей строки до конца файла
ОТСТУПЫ

<< 'БИНДЫ'
nmap - для normal режима
imap – для insert режима
vmap - для visual режима
БИНДЫ

<< 'ПЕРЕМЕННЫЕ'
ft - тип текущего файла, окна (TelescopePrompt, spectre_panel)
ПЕРЕМЕННЫЕ
# для выхода из справки всё так же ":q"
vimtutor # автотутор

<< 'РЕЖИМЫ РАБОТЫ'
0. Командный:
- ":!with_bit_output" - перейдёт обратно в терминал, выполнит команду там и по
нажатии на клавишу (Enter) и вернёт обратно в vim

1. normal
- Режим по умолчанию
- Любая клавиша воспринимается как команда
- "Сложные" команды начинаются с ‘:’

2. insert
- Режим ввода текста - все, что вы нажимаете, вставляется (заменяется).
- Выход через <Esc>, <Ctrl+c>

3. visual
- Режим выделения
- Доступны команды d (удалить) и y (скопировать).
- Доступны команды перемещения (W, e, $, и др.).
- Вход через <v>.
- Выход через <Esc>, <Ctrl+c>.
РЕЖИМЫ РАБОТЫ

<< 'ПЕРЕМЕЩЕНИЕ'
!!! Все стандартные хоткеи (Pg Up, End, ...) тоже работают !!!
!!!
СЛОВО - последовательность символов, разделённых пробелом(-ами)/табом(-ами)
!!!

По символам:
- Стрелки: h, j, k, l
По словам:
	Shift + стрелки - по началам слов/абзацев (???) В РЕЖИМЕ INSERT !!!
	w, W - в начало следующего слова/СЛОВА
	e, E - в конец
	b, B - в начало предыдущего
Еще крупнее:
	0, ^, $ - начало строки, первый непробельный символ, конец строк
	(, ) - по на предложениям
	{, } - по на абзацам
	% - к парной скобке
Совсем крупно:
	gf — переход к файлу под курсором
	gg- начало первой строки
	G - начало последней строки
	:21<Enter> - начало строки 21
	<Ctrl+D>, <Ctrl+U> - вниз/вверх на N строчек, где N обычно пол-экрана
ПЕРЕМЕЩЕНИЕ

<< 'СОЗДАНИЕ'
i - войти в insertion mode
a - сдвинуть курсор вправо и войти в insertion mode
o - создать строку ниже и войти в insertion mode
O - .............. выше ...
СОЗДАНИЕ

<< 'УДАЛЕНИЕ'
По символам:
  x - символ под курсором
  X - символ до курсора
Сразу много: d [<кол-во>] <ход>
	dе - удалить до конца текущего слова
	d$ - удалить до конца строки
	d5W - удалить пять СЛОВ
	:di" - удалить всё между двойным кавычками
  dt' - удалить до (не включительно) символа '
Специальная команда:
  dd - удалить строку (или, например, 10dd - удалить 10 строк, включая текущую)
УДАЛЕНИЕ

# Опять же, Ctrl+C, Ctrl+V, выделение через Shift и стрелки также работают
<< 'КОПИРОВАНИЕ'
Скопировать:
  y <кол-во> <ход> - скопировать
	yy - скопировать строку
Вставить:
	p - вставить после
	P - вставить перед
КОПИРОВАНИЕ

<< 'ПОИСК И ЗАМЕНА'
Поиск:
	:set ignorecase - регистронезависимый поиск
	/cAsEinsenSetiVe\C - '\C' даёт регистроЗАВИСИМЫЙ поиск
  * - искать слово под курсором и перейти к следующему
  /<текст> - искать <текст> вперед
	?<текст> - назад
	n - следующее вхождение, N - предыдущее
Замена:
  :%s/<что ищем>/<на что меняем>/<флаги> (s - substitute)
	Флаги:
    g - много замен в строке (без флага - только 1-е вхождение)
    с - подтверждение при замене в каждом случае
ПОИСК И ЗАМЕНА

<< 'ВЫДЕЛЕНИЕ'
V - выделить всю строку
ВЫДЕЛЕНИЕ

<< 'ПОЛЕЗНЫЕ КОМАНДЫ'
Курсор:
	<Ctrl+o> — вернуться к позиции курсора в предыдущем файле
Отмена/возврат:
	u - отменить последнее действие
	<Ctrl+r> - вернуть отмененное действие
Сохранение работы:
  :w - сохранить изменения
	:qa - закрыть все вкладки (all) и выйти
  :wq - сохранить и выйти
  :q! - выйти без сохранения
  :w <файл> - сохранить изменения в <файл>
ПОЛЕЗНЫЕ КОМАНДЫ

<< 'ЗАКЛАДКИ'
m<символ> - закладка с названием <символ> в начале текущей строки
`<символ> - вернуться к закладке (строка + столбец)
`. — возврат к последнему редактироваемому символу
:marks - список всех закладок
Закладка с заглавной буквы - глобальная закладка (мб в другом файле)
ЗАКЛАДКИ

<< 'МАКРОСЫ'
q<символ> - начать запись макроса с именем <символ>
... записываются все действия (до завершения записи) ...
q - завершить запись
@<символ> - выполнить макрос
<n>@<символ> - ... <n> раз подряд
МАКРОСЫ

<< 'ОТСТУПЫ'
'=' + Shift + g - исправить отступ от текущей строки до конца файла
ОТСТУПЫ

<< 'БИНДЫ'
nmap - для normal режима
imap – для insert режима
vmap - для visual режима
БИНДЫ

<< 'ПЕРЕМЕННЫЕ'
ft - тип текущего файла, окна (TelescopePrompt, spectre_panel)
ПЕРЕМЕННЫЕ
