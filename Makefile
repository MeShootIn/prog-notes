.SILENT: # без вывода выполняемых команд

# Переменные можно также задавать после вызова цели (например, `make run
# TARGET=prog.exe`).
TARGET = main.exe
PREF_SRC = ./src/
PREF_OBJ = ./obj/

# Сначала выполняются кастомные цели (следующие в одной строке после ":"), затем
# блочные (консольные).
# Обязательна табуляция в качестве отступа!
build: mkdir_obj sum_o main_o
	gcc ${PREF_OBJ}main.o ${PREF_OBJ}sum.o -Wall -o ${TARGET}

mkdir_obj:
	mkdir -p ${PREF_OBJ}

sum_o:
	gcc -c ${PREF_SRC}sum.c -Wall -o ${PREF_OBJ}sum.o

main_o:
	gcc -c ${PREF_SRC}main.c -Wall -o ${PREF_OBJ}main.o

build-and-run: build run

run:
	./${TARGET}

clean:
	rm -f ${TARGET}
	rm -rf ${PREF_OBJ}

# Если бы существовала папка "./build" или "./log", никак не связанная с
# одноименной целью, то при последующем выполнении `make build` утилита выдала
# бы "make: `build` is up to date", т.к. make воспринимает её как папку с
# выполненной задачей "build" (в силу предназначения make). Чтобы этого
# избежать, надо отвязать задачу от файловой структуры:
.PHONY: build log
