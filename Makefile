### ОБЩЕЕ ###

# Использование: `make [-f <make-файл> (по умолчанию Makefile)]
# [-j <число_потоков>] [...<цель>]`
#
# На основе информации о времени последнего изменения каждого файла make
# определяет и запускает необходимые программы.
#
# По умолчанию make использует самую первую цель в make-файле.
#
# Обязательна табуляция в качестве отступа!
#
# Стандартные цели для сборки дистрибутивов GNU:
# * "all" - выполнить сборку пакета;
# * "install" - установить пакет из дистрибутива;
# * "uninstall" - удалить пакет;
# * "clean" - очистить дистрибутив (удалить скомпилированные объектные и
# исполняемые файлы);
# * "distclean" - "clean" + удалить вспомогательные файлы, созданные утилитой
# "./configure" в процессе настройки параметров компиляции дистрибутива.
#
# Общий вид правила:
# цель_1 цель_2 ...: реквизит_1 реквизит_2 ...
# 	команда_1
# 	команда_2
# 	...
#
# make проверяет наличие файлов-реквизитов перед выполнением команды, а затем
# ставит их в зависимости.



.SILENT: # без вывода выполняемых команд

# Переменные можно также задавать после вызова цели (например, `make run
# TARGET=prog.exe`).
TARGET = main.exe
PREFIX_SRC = ./src/
PREFIX_OBJ = ./obj/
MAIN_O = main.o
SUM_O = sum.o

# Сначала выполняются кастомные цели (следующие в одной строке после ":"), затем
# блочные (консольные).
build: mkdir_obj ${SUM_O} ${MAIN_O}
	gcc -Wall -o ${TARGET} ${PREFIX_OBJ}${MAIN_O} ${PREFIX_OBJ}${SUM_O}

mkdir_obj:
	mkdir -p ${PREFIX_OBJ}

${SUM_O}:
	gcc -Wall -c ${PREFIX_SRC}sum.c -o ${PREFIX_OBJ}${SUM_O}

${MAIN_O}:
	gcc -Wall -c ${PREFIX_SRC}main.c -o ${PREFIX_OBJ}${MAIN_O}

build-and-run: build run

run:
	./${TARGET}

clean:
	rm -f ${TARGET}
	rm -rf ${PREFIX_OBJ}

# Если бы существовала папка "./build" или "./log", никак не связанная с
# одноименной целью, то при последующем выполнении `make build` утилита выдала
# бы "make: `build` is up to date", т.к. make воспринимает её как папку с
# выполненной задачей "build" (в силу предназначения make). Чтобы этого
# избежать, надо отвязать задачу от файловой структуры:
.PHONY: build log
