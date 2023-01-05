### ТЕРМИНАЛ ###

# '/home/meshootin/Рабочий стол' - абсолютный путь (лучше с ")
# / - корневая папка
# ~ - домашняя папка
# . - текущая папка
# .. - на уровень выше
# * - 0, 1, 2, ... символов
# ? - ровно 1 символ

# В Linux разделитель директорий - "/", в Windows - "\"

# Общий вид команды:
КОМАНДА [ОПЦИИ [АРГУМЕНТЫ]]
# Имя файла / папки = (абсолютный_путь / относительный_путь) + (название файла
# + [расширение] / папки)

pwd # (print working directory)

clear # очистка терминала

exit # выйти из текущей сессии оболочки

whoami # текущее имя пользователя

cd # (change directory) без аргументов - вовзврат в ~

which firefox # путь до

echo kek # <=> echo 'kek' <=> echo ''kek'' ... вывод строки kek
echo -e 'first line\nsecond line' >> file.txt # создание файла (если его ещё
# нет) + дозапись (>>) в файл 2 строк

ls # вывести содержимое папки
ls --all --human-readable -l # <=> ls -alh <=> ls -lah .
# у -l нет полной записи
# -a - включая скрытые файлы и папки

touch ../file.txt # создать файл

mkdir ~/folder another_folder # создать папки

rm [-r] [-f] ./folder # удалить файл [папку] [принудительно]

cp file_1 file_2 # скопировать file_1 в file_2
cp -r dir_1 dir_2 # папку dir_1 (включительно) в dir_2

mv dir_1 dir_2 # переместить папку dir_1

chmod [ugoa][+-][drwx] # изменить права доступа
./main.sh # выполнить программу в текущей директории (без "./" будет
# воспринимать как команду терминала)

less err.txt # открыть файл на чтение
# Home, End
# /слово_для_поиска - поиск всех непересекающихся первых вхождений
# q - выход

nano file.txt # чтение + запись



### АРХИВЫ ###

# опция f всегда должна быть В КОНЦЕ
tar -cvf archive.tar dir_1 file_1.txt dir_2 # упаковка файлов и папок без
# удаления + без сжатия
tar -zcvf archive.tar.gz dir_1 file_1.txt dir_2 # упаковка файлов и папок без
# удаления + сжатие через gzip (+z)

tar -xvf archive.tar # распаковка .tar без его удаления
tar -zxvf archive.tar.gz # распаковка .tar.gz без его удаления



### ВВОД / ВЫВОД ###

# Потоки
./script.sh < input.txt # перенаправление потока ввода (stdin)

./script.sh > output.txt # stdout
./script.sh >> output.txt # + дозапись

./script.sh 2> err.txt # stderr
./script.sh 2>> err.txt # + дозапись

./script.sh < input.txt > output.txt 2> err.txt # все потоки перенаправлены

# !!!
# Сначала [создаются] + открываются файлы потоков, даже если, к примеру, ">
# output.txt", но вывод пуст
# !!!

# pipe (конвейер), оператор - "|"

./prog1.sh | ./prog2.sh | ./prog3.sh

# stdout prog1 -> stdin prog2
# stdout prog2 -> stdin prog3
# stdout prog3

cat input.txt | ./script.sh | less

# !!!
# stderr будет выводиться ЭКРАН (как по умолчанию)
# !!!



### ПОИСК ###

find <папка> -name "имя_файла" # поиск файла по имени в папке и подпапках
find -name "имя_файла" # из текущей папки
find -iname "имя_файла" # без учёта регистра
find -path "путь" # по имени с учётом пути (find -path "*subdir*/*.png")
find -size размер # find -size 4k
find -max(min)depth n -name "имя_файла" # искать на глубине <= (>=) n уровней
# (в пути n штук "/")

grep "<подстрока>" <файл> # регистрозависимый поиск строки в файле
# вообще, все параметры, задающие имена файлов, РЕГИСТРОЗАВИСИМЫЕ
grep -c "<подстрока>" <файл> # для каждого файла только количество строк,
# содержащих данную подстроку
grep -r "<подстрока>" <папка> # в папке и подпапках
grep -n "<подстрока>" <файл> # поиск вхождений слова в файле с выводом
# соответствующей строки
# grep -n "hough transform" ./*dir*/.doc
grep -l "<подстрока>" <файл> # список файлов, содержащих слово
grep -L "<подстрока>" <файл> # список файлов, НЕ содержащих слово
grep -i "<подстрока>" <файл> # регистронезависимый поиск
grep -E "<подстрока>" <файл> # регулярка

# !!!
# То есть, если ./file.txt содержит текст 'a1bc 111ef g\nkek\n123'
# Тогда grep -rc '1' . выдаст ./file.txt:2
# Так как всего 2 строки, содержащие хотя бы один символ '1'
# !!!



### СЕРВЕР ###

ssh meshootin@shell.xshellz.com -p 22 # логин@сервер [-p порт]
# пароль: Anders%456
exit # дисконнект



# ПРЕДВАРИТЕЛЬНАЯ НАСТРОЙКА

# Замена дефолтного порта:
vim /etc/ssh/sshd_config # '# Port 22' -> 'Port 1234'
sudo apt update -y && sudo apt upgrade -y && sudo reboot # обновление и ребут

# Для цветных подсказок в файле ~/.bashrc раскомментить строку:
force_color_prompt=yes

# АВТОРИЗАЦИЯ БЕЗ ВВОДЫ ПАРОЛЯ

# 1) создание ключа
ssh-keygen # генерация ключа
ssh-add [path] # добавить закрытый ключ (id_rsa или id_) или [путь]
# в папке ~/.ssh есть 2 ключа: id_rsa, id_rsa.pub - закрытый (приватный) и
# открытый (публичный)
# также файл known_hosts содержит посещённые сервера

# 2) копируем публичный ключ в буфер обмена
cat ~/.ssh/id_rsa.pub

# 3) заходим на сервер и вставляем туда публичный ключ
mkdir .ssh
echo "публичный_ключ" > .ssh/authorized_keys

# 4) теперь можно заходить на сервер, не вводя пароль

ssh-add -D # удалит все ключи из текущего активного ssh-agent сеанса



## КОНФИГ ##

# https://linuxize.com/post/using-the-ssh-config-file/#ssh-config-file-structure-and-patterns
ssh -o "User=root" my-server # юзать стандартный конфиг, переопределив
# некоторые параметры
ssh -F ~/another-config my-server # юзать другой конфиг



### СКРИПТЫ НА BASH ###

# В терминале может работать одновременно только 1 оболочка (англ. shell -
# интерпретатор команд): sh, bash (они есть почти во всех дистрибутивах), ...
# Оболочки - тоже программы (т. к. which bash, which sh)
# Есть очень незначительные отличие в работе команд
# Команды какой-либо оболочки называются ИНСТРУКЦИЯМИ
# Внутри одной оболочки может работать другая:

# meshootin@MeShootIn:~$ bash
# meshootin@MeShootIn:~$ bash
# meshootin@MeShootIn:~$ sh
# $ exit
# meshootin@MeShootIn:~$ exit
# exit
# meshootin@MeShootIn:~$ exit
# exit

# "Шебанг" (2 символа '#!' в начале файла) показывает какую оболочку запускать
# для исполнения данного скрипта
#!/usr/bin/bash

# Можно исполнять через:
./script.sh
bash ./script.sh
bash script.sh

# Все действия скрипта (переход в другую папку, создание файлов) выполняются в
# отдельной оболочке, так что по окончании работы скрипта, мы, например,
# будем находиться в той же папке



### ПЕРЕМЕННЫЕ ###

# $ - оператор раскрытия значения
# Лучше везде использовать двойные кавычки "
# Одинарные кавычки ' не раскрывают значения переменных
# При чтении несуществующей переменной вместо ошибки будет пустая строка
# НЕЛЬЗЯ ставить пробелы до и после знака '=', иначе будет восприниматься как
# команда и последовательность опций
# В строках лучше обрамлять переменные фигурными скобками
# Можно записывать выражения в одну строку через ';'
# Строки можно писать как с кавычками, так и без => числа в привычном виде не
# складываются:
one=1
two=$one+1 # '1+1'

var=123
var2=${var}4 # '1234'

# " - раскрывают значения переменных
name='Dmitrii'
surname='Mishutin'
full_name="Dima's full name is ${name} ${surname}"

# Символ '\' экранирует следующий символ:
life='life'
opus="\$life is ${life}" # '$life is life'

# Показательный пример в пользу ${}
live="live"
live2="${live}2"
live2code="${live2}code"
echo $live2code



### АРГУМЕНТЫ ###

./script.sh arg1 arg2 ...

$1 # 1-ый аргумент
$2 # 2-ой аргумент
...
$0 # имя данного скрипта
$# # кол-во аргументов

echo "скрипт ${0} с ${#} аргументом(-ами):"
echo -e "1-ый аргумент: ${1}\n2-ой: ${2}"

./example.sh "in quotes" # один аргумент (в двойных кавычках) =>
# скрипт ./example.sh с 1 аргументом (-ами):
# 1-ый аргумент: in quotes
# 2-ой:



# ВЕТВЛЕНИЕ

str=""
len=${#str}

# <=> -z $str <=> len -eq 0
if [[ $str == "" ]]; then
  echo "\$str is empty"
elif [[ $len -eq 1 ]]; then
  echo "\$str's length is 1"
else
  echo "\$str's length is more than 1"
fi

if [[ $str != "" ]]; then # <=> -n $str
  echo "\$str is NOT empty"
fi

# Условия [числа (строки)]:
# <число/строка> операция <число/строка>
-eq, (==) # равно
-ne, (!=) # не равно
-lt, (<) # меньше
-le, # меньше или равно
-gt, (>) # больше
-ge, # больше или равно

# Условия (файлы):
-e <путь> # путь существует
-f <путь> # это файл
-d <путь> # это директория
-s <путь> # размер файла больше 0
-x <путь> # файл исполняемый

# Условия (логические):
! # отрицание логического выражения
&& # логическое «И»
  || # логическое «ИЛИ»

  case $str in
    "Da")
      echo "sha"
      ;;
    "a")
      echo "llo"
      ;;
    *)
      echo "???"
  esac



# ЦИКЛЫ

for i in 1 2 3; do
  break
  сontinue
done

while [[ 1 -eq 1 ]]; do
  echo "Endless cycle"
done

read -p "Enter some word: " word
echo "You've entered the word \"${word}\""



### АРИФМЕТИКА ###

((2+3)) # ничего не выведется
((x =227    + 1  ))

echo "$x $((2 ** 10)) $(( 7 - 8 ))"

# Файлы в текущей директории
i=0
for file in `ls .`
do
  if [[ -f $file ]]
  then
    (( i++ ))
    echo "file №${i}: ${file}"
  fi
done



# ВНЕШНИЕ ПРОГРАММЫ

ls_result=`ls ~`

# Код возврата:
# 0 - корректное завершение
# не 0 - в процессе работы были ошибки
# Узнать код:
echo $?
# Выйти с кодом:
exit 228
# Пример:
touch file.txt
echo $?

# Проверка кода возврата:
dr="some_dir"

if `mkdir $dr`
then
  echo "\"${dr}\" dir has been created!"
  еlse
  err=$?
  echo "error during creating dir \"${dr}\": ${err}"
fi



# ФУНКЦИИ

# Определение функции должно идти выше применения

check_dir() {
  if [[ -d $1 ]]; then
    echo "It's a dir!"
  fi
}

check_dir $1



### АЛИАСЫ ###

alias # список псевдонимов (алиасов), действующих на данный момент
nvim ~/.bashrc # изменить алиасы
alias l="ls -ahl" # установить новый алиас в ТЕКУЩЕЙ сессии терминала
source ~/.bashrc # применить все изменения для терминала из ~/.bashrc
source % # для текущего файла



### ГОРЯЧИЕ КЛАВИШИ ###

# Tab [двойной] - автокомплит/[подсказки] в терминале
# Ctrl + U - очистить строку от начала до курсора
# Ctrl + K - очистить строку от курсора до конца
# Ctrl + A - переместить курсор в начало строки
# Ctrl + E - переместить курсор в конец строки
# Ctrl + Y - вызвать очищенную строку, которая не была удалена через Ctrl + C
# Ctrl + C - очистить текущую командную строку без возможности её далее вызвать



### ПОЛЕЗНЫЕ УТИЛИТЫ ###

# Вывод через "\n" чисел в диапозоне.
# seq [OPTION]... LAST
# seq [OPTION]... FIRST LAST
# seq [OPTION]... FIRST INCREMENT LAST

# Копирование данных в буфер.
git config --global user.email | clip
clip < file.txt
