vimtutor # автотутор
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
  d`x - удалить символы с текущей позиции курсора по закладку `x`
  d'x - удалить строки с тукущей по содержащую закладку `x`
Специальная команда:
  dd - удалить строку (или, например, 10dd - удалить 10 строк, включая текущую)
УДАЛЕНИЕ

# Опять же, Ctrl+C, Ctrl+V, выделение через Shift и стрелки также работают
<< 'КОПИРОВАНИЕ И ВСТАВКА'
Скопировать:
  y <кол-во> <ход> - скопировать
  yy - скопировать строку
  y`x - копирует текст в безымянный буфер начиная с позиции курсора и заканчивая
  содержащей закладку `x`
Вставить:
  p - вставить после
  P - вставить перед
КОПИРОВАНИЕ И ВСТАВКА

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
  ciw - заменить слово под курсором
ПОИСК И ЗАМЕНА

<< 'ВЫДЕЛЕНИЕ'
V - выделить всю строку
vi(w/W) - выделить слово/СЛОВО под курсором
ВЫДЕЛЕНИЕ

<< 'ПОЛЕЗНЫЕ КОМАНДЫ'
<Ctrl+A> - инкремент числа под курсором
<Ctrl+X> - декремент числа под курсором
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
mx - закладка с названием `x` в позиции курсора
`x - вернуться к закладке `x` (строка + столбец)
`. — возврат к последнему редактироваемому символу
'x - перейти к строке, содержащей закладку `x`
:marks - список всех закладок
Закладка с заглавной буквы - глобальная закладка (мб в другом файле)
:delmarks a-d - удалить закладки с `a` до `d`
:delmarks! - удалить все закладки
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

<< 'ОСНОВЫ'
Команды типа "d'x" работают построчно ( [начало,конец] )
Команды типа "d`x" работают посимвольно ( [начало,конец) )
ОСНОВЫ

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
  gj, gk - вниз, вверх по столбцу внутри свёрнутой строки
  g0, g$ - в начало, в конец внутри свёрнутой строки
  0, ^, $ - начало строки, первый непробельный символ, конец строк
  (, ) - по предложениям
  {, } - по параграфам
  [m , ]m - по функциям
  [[ , ]] - по секциям
  [s, ]s - по грамматическим ошибкам
  % - к парной скобке
  o (visual) - переместиться к противоположной строке выделения
Совсем крупно:
  gf - переход к файлу под курсором (в начале обязательно должны быть `./`)
  <C-w>f - ... в новом сплите
  gv - перейти + произвести последнее выделение
  gg - 1-я строка
  G - последняя строка
  21gg - 21-я строка
  <Ctrl+d>, <Ctrl+u> - вниз/вверх на N строчек, где N обычно пол-экрана
  <Ctrl+f>, <Ctrl+b> - foward/back на 1 экран
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
  <S-d> или d$ - удалить до конца строки
  d5W - удалить пять СЛОВ
  di" - удалить всё между двойным кавычками
  dat - ... между xml-тэгом, включая сам тэг
  dt` - удалить до (не включительно) символа `
  d`x - удалить символы с текущей позиции курсора по закладку `x`
  d'x - удалить строки с тукущей по содержащую закладку `x`
  <C-w> (insert) - удалить слово назад
  <C-u> (insert) - удалить до начала строки
  <C-k> (insert) - удалить до конца строки
Двойные команды:
  dd - удалить строку (или, например, 10dd - удалить 10 строк, включая текущую)
УДАЛЕНИЕ

# Опять же, Ctrl+C, Ctrl+V, выделение через Shift и стрелки также работают
<< 'КОПИРОВАНИЕ И ВСТАВКА'
Скопировать:
  y <кол-во> <ход> - скопировать
  yy - скопировать строку
  y`x - копирует текст в безымянный буфер начиная с позиции курсора и заканчивая
  содержащей закладку `x`
Вставить:
  p - вставить после
  P - вставить перед
КОПИРОВАНИЕ И ВСТАВКА

<< 'ПОИСК И ЗАМЕНА'
Поиск:
  :set ignorecase - регистронезависимый поиск
  /cAsEinsenSetiVe\C - '\C' даёт регистроЗАВИСИМЫЙ поиск
  * - искать слово под курсором и перейти к следующему
  /<текст> - искать <текст> вперед
  ?<текст> - назад
  n - следующее вхождение, N - предыдущее
  ; - повторить последнюю f, F, t или T.
  , - повторить последнюю f, F, t или T в ОБРАТНОМ направлении.
Замена:
  ra - заменяет символ под курсором на "a" (был в нормальном режиме, там и
  остался)
  :%s/<что ищем>/<на что меняем>/<флаги> (s - substitute)
  Флаги:
    g - много замен в строке (без флага - только 1-е вхождение)
    с - подтверждение при замене в каждом случае
  ciw - заменить слово под курсором
  cc - заменить всю строку
  cip - заменить параграф
  <S-j> - "smart join" с разделяющим пробелом
  gJ - "smart join" без разделителя
ПОИСК И ЗАМЕНА

<< 'ВЫДЕЛЕНИЕ'
V - выделить всю строку
vi(w/W) - выделить слово/СЛОВО под курсором
ВЫДЕЛЕНИЕ

<< 'ПОЛЕЗНЫЕ КОМАНДЫ'
diff:
  window diffthis - показывает разницу для двух сплитов
Сортировка:
  :'<,'>sort[!] [i][u] - сортировка выделенных строк: ! - по невозрастанию, i -
  ignorecase, [u] - unique
Вид:
  zt - отмотать место под курсором (положение курсора не меняется) к верху
  (top) страницы
  zb - ... (bottom) ...
  zz - центрировать
Грамматика:
  z= - исправить ошибку под курсором
  zg - добавить в глоссарий
  zug - удалить из глоссария
Регистр:
  gU - to uppercase
  gu - to lowercase
  g~ - toggle case
Инк(Дек)ремент:
  <Ctrl+a> - инкремент числа под курсором
  <Ctrl+x> - декремент числа под курсором
Курсор:
  <Ctrl+o> — вернуться к предыдущей позиции курсора
  <Ctrl+i> — вернуться к следующей позиции курсора
  ga - показать ASCII-информацию о символе под курсором
  g8 - ... UTF-8 ...
Отмена/возврат:
  u - отменить последнее действие
  <Ctrl+r> - вернуть отмененное действие
Сохранение работы:
  :w - сохранить изменения
  :qa - закрыть все вкладки (all) и выйти
  :wq - сохранить и выйти
  :q! - выйти без сохранения
  :w <файл> - сохранить изменения в <файл>
Несколько файлов:
  :args autoload/readme_diff/*.vim
  " Далее можно через :args посмотреть список файлов
  :argdo %s/readme_diff/rmd/c
  :argdo update
ПОЛЕЗНЫЕ КОМАНДЫ

<< 'ЗАКЛАДКИ'
Окна:
  <C-w>_ - сделать текущее окно максимально большим (стянуть остальные окна)
  <C-w>= - сделать окна одинакового размера
ЗАКЛАДКИ

<< 'ЗАКЛАДКИ'
mx - закладка с названием `x` в позиции курсора
`x - вернуться к закладке `x` (строка + столбец)
`. — возврат к последнему редактироваемому символу
'x - перейти к строке, содержащей закладку `x`
:marks - список всех закладок
Закладка с заглавной буквы - глобальная закладка (мб в другом файле)
:delmarks a-d - удалить закладки с `a` до `d`
:delmarks! - удалить все закладки
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

<< 'FOLDING'
zf - создать фолд для выделенной области
zd - удалить фолд под курсором
zr - +foldlevel (reduce)
zm - -foldlevel (more)
zR - развернуть всё
zM - свернуть всё
zo - развернуть (open) текущий фолдинг на +1 foldlevel
zO - развернуть текущий фолдинг рекурсивно на +1 foldlevel
zc - свернуть (close) текущий фолдинг на -1 foldlevel
zC - свернуть текущий фолдинг рекурсивно на -1 foldlevel
FOLDING

<< 'ПЕРЕМЕННЫЕ'
ft - тип текущего файла, окна (TelescopePrompt, spectre_panel)
ПЕРЕМЕННЫЕ

<< 'КОМАНДНАЯ СТРОКА VIM'
q: - открыть историю команд (нажатие <CR> на определённой команду вызовет её)
q/ (или q?) - ... историю поиска ...
:helpgrep - поиск (регистрозависимый) по всем документациям
:cn / :cp / :cl / :cc3 - след. / пред. (ошибки, вхождения, ...) / список /
перейти к элементу под номером 3
КОМАНДНАЯ СТРОКА VIM

<< 'АВТОКОМПЛИТ'
Вызов окна с подсказками (+ много другого с ":h ins-completion"):
  ^x^n - только в текущем файле
  ^x^f - только имена файлов
  ^x^] - только для тегов
  ^n - для всего, что предполагает опция 'complete'
Перемещение по подсказкам:
  ^n - следующая (next)
  ^p - предыдущая (previous)
АВТОКОМПЛИТ
