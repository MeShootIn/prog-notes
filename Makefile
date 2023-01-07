.SILENT: # без вывода выполняемых команд

# Переменные можно также задавать после вызова команды (например, `make run
# TARGET=prog.exe`).
TARGET = main.exe
PREF_SRC = ./src/
PREF_OBJ = ./obj/

# Сначала выполняются кастомные Makefile-команды (следующие в одной строке после
# ":"), затем нижние (консольные).
# Обязательна табуляция в качестве отступа.
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
