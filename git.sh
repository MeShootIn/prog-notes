### ИНДЕКС ###

# Коммит - "снапшот" репозитория
# Stage (или cache) – это хранилище для файлов с изменениями, информация о
# которых попадет в единый коммит.

# Для безпроблемных операций с коммитами (удаление, изменений, объединение, ...)
# они должны удовлетворять следующим принципам ("Commit early. Commit often."):
# * атомарность (коммит должен выполнять 1 неделимую задачу);
# * консистентность (все тесты проходят).

# Правила написания сообщений коммита:
# * весь текст на английском;
# * сначала идёт заголовок в повелительном наклонении, не оканчивается точкой,
# длина <= 50;
# * после заголовка следует пустая строка (2 символа переноса строки);
# * затем идут абзацы, так же разделённые пустой строкой, с длиной каждой строки
# <= 72.

# Двухступенчатая система сохранения изменений (add + commit) нужна для
# неиндексирования файлов, которые по каким-либо причинам (внесение изменений
# раньше времени, чтобы не перемещать все файлы в какую-нибудь папку "todo" или
# в ".gitignore") не должны попасть в коммит.

# Создание + добавление файлов:
git init
git status
git add .  # только текущая папка
git add -a # только проиндексированные файлы
git add -A # абсолютно все файлы
git add -p file.txt # добавление в индекс определённых фрагментов из файла
git commit -m 'add all files'
git commit -am 'message' # как git add, но только для изменённых или удалённых
# файлов + коммит
git commit --allow-empty -m 'empty commit'
git commit --allow-empty-message -m '' # пустое сообщение
git commit -m 'Updated `composer.json` file' # или git commit -m "Updated
# \`composer.json\` file", иначе обратные кавычки будут запускать прогу в Linux
git tag 1.2.3 # помечает текущий коммит версией (тегом) 1.2.3
# можно делать несколько тегов на 1 коммит, но так, чтобы они не повторялись
git tag --delete 1.2.3 # удалить тег
git tag # или git tag --list, выводит список версий в АЛФАВИТНОМ порядке
git push --tags # пометка тегом без push'а коммитов
git push --delete origin some_tag # удаление тега из удалённого репозитория без
# push'а коммитов (НЕ УДАЛЯЕТ из локального)
git push -u origin master # push + устанавливает удалённый репозиторий origin и
# ветку master по умолчанию (можно писать git push)



### ПРАВА НА ФАЙЛЫ ###

# В логе операции (например, git add -A => "create mode 100644 file.ext") перед
# именем файла 6-значное число. Пример: 100644 (100 - тип объекта: 100 для
# файла, др. числа для символических ссылок, папок, ...; 644 - права: ЛИБО 644
# для неисполнимого (для текущего пользователя), ЛИБО 755 для исполнимого файла
# (для текущего пользователя)).

git config core.fileMode false # => файловая система не поддерживает отдельное
# право на выполнение

git update-index --chmod=+x file.ext # для Windows: принудительно добавляет для
# ПРОИНДЕКСИРОВАННОГО файла право на исполнение в обход файловой системы
# (хороший тон)
git add --chmod=+x file.ext # <=> git update-index --add --chmod=+x file.etx
# (аналогично выше, но для НЕпроиндексированного)



### SHOW ###

# Разница между текущим и предыдующим коммитом + инфа в удобном виде:
# * (Author/Commit) - имя и email автора (изменений (написанного кода)) / коммита (тот, кто
# сделал "git commit ...", т.к. у автора изменений может не быть прав);
# * (Author/Commit)Date - дата.
# NOTE По умолчанию "Author" === "Commit".
# Существуют переменные окружения: GIT_(AUTHOR/COMMITTER)_(NAME/EMAIL/DATE)
git show



### DIFF ###

# TODO HEAD~{N}
git diff --name-status [<base_commit_id> [<compare_commit_id>]] # --name-only +
# флаги изменений

# Флаги:
# M (modified)
# C (copy-edit) - скопирован + M
# R (rename-edit) - переименован + M
# A (added)
# D (deleted)
# U (unmerged) - имеются конфликты после merge



### ЛОГИ ###

git log [--oneline] # q для выхода
git log --follow file.txt # коммиты, в которых были изменения файла file.txt,
# даже с учётом переименования
git log --stat # коммиты со статистикой изменений
git reflog # log + операции (reset, commit, checkout, ...)

# Просмотр коммитов:
git checkout <commit_id>
git checkout [-f] <branch_name> # перейти на ветку с предупреждением о возможной
# потере незакоммиченных изменений [с удалением всех изменений]
git checkout -f # удалить все текущие изменения

# Разница в файлах:
git log --name-status --oneline # --name-only + флаги изменений



### УДАЛЕНИЕ ###

# git rm и git mv - обёртки над командами git + ОС: rm [-r] <file> && git add <file>
#
# Переименование = удаление физическое ("Changes not staged for commit:
# deleted: old.ext") + из индекса ("Untracked files: new.ext"). И только
# ПОСЛЕ `git add new.ext` будет "Changes to be committed: renamed: old.ext ->
# new.ext", т.к. в этот момент гит вычисляет контрольную сумму этих двух файлов,
# сравнивает их и делает вывод о переименовании. В то время как после удаления
# из индекса git ещё не знал о связи между этими файлами.
#
# NOTE => в большинстве случаев лучше юзать обёртки!

git rm [-r] [-f] unwanted_file # удаление (физическое + из индекса) файла
# [папки] [даже если в нём есть несохранённые изменения]
git rm [-r] --cached img/logo.png src/script.js # только из индекса (без
# физического удаления), т.е. переносит в Untracked files
git mv file.txt dir/kek.txt # переименование (перемещение) файла
git reset <file> # перемещает файл из "Changes to be committed" в
# "Untracked files" (удаляет из индекса)
git reset <commit_id> --hard # ОБЯЗАТЕЛЬНО --hard - удаляет все коммиты ВЫШЕ
# commit_id и ВОЗВРАЩАЕТСЯ к нему
git restore <file>...
git push -f # синхронизирует удалённые коммиты с локальными



### STASH ###

# Отложенные ИЗМЕНЕНИЯ (не привязаны к конкретной ветке) сохраняются в локальном
# репозитории, не передаются на сервер после push.
# После применения изменений к ветке, в которой изначальная версия какого-нибудь
# файла отличается от той, с которой были отложены изменения, то возникнет
# конфликт.

# Основные команды:
git stash # отложить ОТСЛЕЖИВАЕМЫЕ изменения в СТЕК, удалив из текущего проекта
git stash pop # применить и извлечь последнее изменение из стека
# Дополнительные:
git stash apply # применить последнее изменение без удаления из стека
git stash drop # удаляет последнее изменение
git stash list # список изменений в порядке стека (LIFO)



### ВЕТКИ ###

# Подходы к ведению веток:
# 1) Тематические (feature, ...);
# 2) Релизные (v1.0.0, v1.1.0, ..., v1.2.3, v2.0.0, ...);
# 3) git flow: 1) + 2).

git branch <branch_name> # создание ветки
git branch -v <branch_name> # отобразить текущее состояние всех веток (HEAD,
# последний коммит, ...)
git checkout - # переключиться на предыдущий коммит/ветку

# При принудительном удалении ветки удаляется ссылка на последний коммит ветки,
# состояние которого со временем ПОЛНОСТЬЮ удаляется гитом.
git branch {-d, -D} <target_branch_name> # удаление ветки {обычное,
# принудительное} с выводом последнего коммита
git branch <target_branch_name> <last_taget_commit> # восстановление НЕДАВНО
# удалённой ветки
git checkout [-b] <branch_name> # переключение [+ создание]
# NOTE Если имеются незакоммиченные изменения в одинаковых файлах в одной и
# другой ветке, то при git checkout эти файлы перезаписываться не будут (их
# список отобразится при выполнении команды) и ошибки тоже не будет!

# Cherry-pick - применение изменений из одного коммита из другой ветки к
# текущей. Нужно для немедленного исправления бага, присутствующего в нескольких
# ветках. Лучше не злоупотреблять, т.к. это "дублирование кода".
git cherry-pick <commit_id>
git cherry-pick <commit_id> --edit # с другим сообщением коммита
git cherry-pick <commit_id> --no-commit # перемещает изменения в рабочую
# директорию (в "Changes to be committed")

# Поведение выше удобно, если нужно пофиксить баги в master'е:
# 1) Вносим исправления...
# 2) git checkout -b fix
# 3) Вносим ещё исправления...
# 4) git commit -am 'Fix bugs from `master` branch' # изменения сохранены в fix
# 5) git checkout master && git merge fix


# УДАЛЕНИЕ КОММИТОВ ИЗ ВЕТКИ И ИХ ПЕРЕНОС В ДРУГУЮ

# Пусть мы сейчас на ветке master...
git checkout [-b] <branch_name>
# Откатываем master до коммита <commit_id>, оставаясь в <branch_name>:
git branch -f master <commit_id>

# Либо всё то же самое, но через:
git checkout -B master <commit_id>


# DETACHED (ОТДЕЛЁННЫЙ) HEAD

git checkout <intermediate_commit>
# Внесли изменения, но забыли, что находимся в промежуточном коммите...
git commit -m 'Add some fixes'
# Создаётся отдельная висячая ветка, с новым коммитом <detached_commit>
git checkout fix # переключаемся на ту ветку, в которой надо было коммитить
git cherry-pick <detached_commit>
# Изменения внесены в нужную ветку fix

# TODO https://youtu.be/3z-LjQacu2Q?list=PLDyvV36pndZFHXjXuwA_NywNrVQO0aQqb
# Восстановление предыдущих версий файлов/папок:
git checkout <commit_with_needed_files> index.html src/kek.js
# Находимся на том же HEAD, но с добавленными в индекс старыми файлами

# Просмотр истории и старых файлов, символы ~, ^, @, поиск с :/
# TODO https://youtu.be/l-sTQBr3rXY?list=PLDyvV36pndZFHXjXuwA_NywNrVQO0aQqb

# Слияние:
git merge <branch_name> # текущая ветка мёрджится с <branch_name>
# (<branch_name> не удаляется)



### УДАЛЁННЫЙ РЕПОЗИТОРИЙ ###

# Подключение:
git remote add <имя> <адрес_сервера>

# Удаление:
git remote rm <имя>

# Слияние:
# ?????????????????????????????????????????????????????????????????????????????
git merge <имя>/<branch_name> # текущая локальная ветка мёрджится с удалённой
# веткой ???????????????????????
# пример: git merge origin/develop
# ?????????????????????????????????????????????????????????????????????????????

# Клонирование и pull:
git clone [-b <branch_name>] <url>
git pull ...



### ИГНОР ###

# NOTE .gitignore игнорирует только те файлы, которые были созданы ПОЗЖЕ
# .gitignore => надо удалить их из индекса!

git status --ignored # добавляет к выводу файлы, попавшие под шаблоны в
# .gitignore

file.type # файл в любом каталоге / подкаталоге (file.type, img/file.type, ...)
* # 0..inf символов
? # 1 символ
!file.type # исключение, если подходит под предыдущие шаблоны
[] # как в регулярках, НО *.[!abc] - игнор файлов, которые содержат в типе
# символы a, b или c
# комментарий

# NOTE Чтобы экранировать шаблон подстановки, надо приписать слэш: \*, \?, \!
# Когда каталог игнорируется, все его файлы и подкаталоги также игнорируются
# Если шаблон начинается с "/", то он соответствует файлам и каталогам только в
# КОРНЕ хранилища, иначе - соответствует файлам и каталогам в ЛЮБОМ каталоге
# или подкаталоге



### РАЗНОЕ ###

# Сложные команды:
(git checkout master && git status && git checkout develop && git status) | less
# применяет конвеерный оператор | ко всему выводу команд в скобке

git-update-git-for-windows # обновление git bash для Windows
# Для индексации пустой директории (которые git не индексирует) создают в ней
# пустой файл .gitkeep

less ~/.gitconfig
git config --global user.name MeShootIn
git config --global user.email dmitriimishutin@gmail.com
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"
