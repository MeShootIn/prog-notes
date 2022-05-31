Ctrl + E - панель с недавними локациями: файлами, TODO, Problems, ...
^^^^^^^^ Там же можно сразу искать локации
Shift + Esc - закрыть нижнюю панель



// НАВИГАЦИЯ
Alt + 1 - дерево файлов проекта
Alt + Shift + N - поиск по имени файла
Alt + N - поиск по имени класса (функциональные компоненты не ищет, надо искать 
по символам)
Ctrl + Shift + F - поиск по символам в проекте
Ctrl + Shift + R - поиск и замена по проекту
Alt + <- / -> - перемещение по вкладкам
Ctrl + F4 - закрыть вкладку



// НАВИГАЦИЯ ПО КОДУ
Ctrl + B - переход к декларации/использованию
Ctrl + G - переход к строке:символу
Ctrl + -/+ - свернуть/развернуть блок кода



// ЗАКЛАДКИ
// TODO https://youtu.be/hH5xZ2lt_-o?t=3819



// РЕФАКТОРИНГ
Shift + F6 - Rename
Ctrl + F6 - изменить сигнатуру функции
F6 - переместить несколько модулей в отдельные файлы и компоненты
Ctrl + Alt + Shift + T - Refactor this (все варианты рефактора)

Alt + F7 - Find Usages
Alt + Enter - Quick Fixes (подсказки)
Ctrl + Atl + L - линтинг



// КУРСОР И ВЫДЕЛЕНИЕ
Ctrl + стрелки - перемещение по началам слов (на уровне ОС)
Ctrl + Shift + стрелки - выделение по словам (на уровне ОС)
Ctrl + W / Ctrl + Shift + W - расширить / сузить область выделения
F2 / Shift + F2 - перемещение к следующей / предыдущей ошибке
Ctrl + D - дублирует строку
Ctrl + Y - удаляет строку



// СНИППЕТЫ
log, warn, error, trace
fori, forof, forin
importitems / importdefault - импорт обычных / default выражений
exportitems / exportdefault - экспорт обычных / default выражений




// POSTFIX TEMPLATES:
someVariable.шаблон

'kek'.log -> console.log('kek'); // ПОДСТАВЛЯЕТСЯ ";", а при log -> 
console.log(justSomething) нету ";"

const a = 123;
a.let -> let a1 = a;

['1', '2', '3'].forof -> for (let string of ['1', '2', '3']) {}
