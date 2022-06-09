:help [w] # справка [по команде "w"] в отдельной части экрана
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

По символам:
- Стрелочки: h, j, k, l
По словам:
	Shift + стрелки - по началам слов / абзацев (???) В РЕЖИМЕ INSERT !!!
	w, W - в начало следующего слова
	e, E - в конец
	b, B - в начало предыдущего
Еще крупнее:
	0, ^, $ - начало строки, первый непробельный символ, конец строк
Совсем крупно:
	gg- начало первой строки
	G - начало последней строки
	:21<Enter> - начало строки 21
	<Ctrl+D>, <Ctrl+U> - вниз/вверх на N строчек, где N обычно пол-экрана
ПЕРЕМЕЩЕНИЕ

<< 'СОЗДАНИЕ'
i - войти в insertion mode
a - сдвинуть курсор вправо и войти в insertion mode
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
  * - искать слово под курсором и перейти к следующему
  /<текст> - искать <текст> вперед
	?<текст> - назад
	/cAsEinsenSetiVe\C - '\C' даёт регистроЗАВИСИМЫЙ поиск
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
ЗАКЛАДКИ

<< 'МАКРОСЫ'
q<символ> - начать запись макроса с именем <символ>
... записываются все действия (до завершения записи) ...
q - завершить запись
@<символ> - выполнить макрос
<n>@<символ> - ... <n> раз подряд
МАКРОСЫ

<< 'ПРИМЕР ТЕКСТА'
- Скажи-ка, дядя, ведь не даром
Москва, спаленная пожаром,
Французу отдана?
Ведь были ж боевые схватки,
Да, гsdsasdaasdоворят, еще какие!
Недаром помнит вся Россия
Про day Бородина!

- Да, были люди в наше время,
Не то, что нынешнее племя:
 редут.
У осветило пушки
И леса синие верхушки -
Французы тут как тут.

Забил заряд я в пушку туго
И думал: угощу я друга!
Постой-ка, брат мусью!
Что тут хитрить, пожалуй к бою;
Уж мы пойдем ломить стеною,
Уж постоим мы головою
За родину свою!

Два дня мы были в перестрелке.
Что толку в этакой безделке?
Мы ждали третий день.
Повсюду стали слышны речи:
"Пора добраться до картечи!"
И вот на поле грозной сечи
Ночная пала тень.

Прилег вздремнуть я у лафета,
И слышно было до рассвета,
Как ликовал француз.
Но тих был наш бивак открытый:
Кто кивер чистил весь избитый,
Кто штык точил, ворча сердито,
Кусая длинный ус.

И только небо засветилось,
Все шумно вдруг зашевелилось,
Сверкнул за строем строй.
Полковник наш рожден был хватом:
Слуга царю, отец солдатам…
Да, жаль его: сражен булатом,
Он спит в земле сырой.

И молвил он, сверкнув очами:
"Ребята! не Москва ль за нами?
Умремте же под Москвой,
Как наши братья умирали!»
И умереть мы обещали,
И клятву верности сдержали
Мы в Бородинский бой.

Ну ж был денек! Сквозь дым летучий
Французы двинулись, как тучи,
И всё на наш редут.
Уланы с пестрыми значками,
Драгуны с конскими хвостами,
Все промелькнули перед нами,
Все побывали тут.

Вам не видать таких сражений!..
Носились знамена, как тени,
В дыму огонь блестел,
Звучал булат, картечь визжала,
Рука бойцов колоть устала,
И ядрам пролетать мешала
Гора кровавых тел.

Изведал враг в тот day немало,
Что значит русский бой удалый,
Наш рукопашный бой!..
Земля тряслась - как наши груди,
Смешались в кучу кони, люди,
И залпы тысячи орудий
Слились в протяжный вой…

Вот смерклось. Были все готовы
Заутра бой затеять новый
И до конца стоять…
Вот затрещали барабаны -
И отступили бусурманы.
Тогда считать мы стали раны,
Товарищей считать.

Да, были люди в наше время,
Могучее, лихое племя:
Богатыри - не вы.
Плохая им досталась доля:
Немногие вернулись с поля.
Когда б на то не божья воля,
Не отдали б Москвы!

1837 г.
ПРИМЕР ТЕКСТА
