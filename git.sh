### ЛОКАЛЬНЫЙ РЕПОЗИТОРИЙ ###

# Коммит - "снапшот" репозитория
# Stage (или cache) – это хранилище для файлов с изменениями, информация о
# которых попадет в единый коммит.

# Создание + добавление файлов:
git init
git status
git add . # только текущая папка
git add -a # только проиндексированные файлы
git add -A # абсолютно всё
git add -p file.txt # добавление в индекс определённых фрагментов из файла
git commit -m 'add all files'
git commit -am 'comment' # git add только изменённые и удалённые файлы + коммит
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

# Перед именем 6-значное число. Пример: 100644 (100 - тип объекта: 100 для
# файла, др. числа для символических ссылок, папок, ...; 644 - права: ЛИБО 644
# для неисполнимого, ЛИБО 755 для исполнимого файла).

git config core.fileMode false # => файловая система не поддерживает отдельное
# право на выполнение

git update-index --chmod+=x file.ext # для Windows: принудительно добавляет для
# ПРОИНДЕКСИРОВАННОГО файла право на исполнение в обход файловой системы
# (хороший тон)
git add --chmod+=x file.ext # аналогично команде выше, но при добавлении



### ЛОГИ ###

git log [--oneline] # q для выхода
git log --follow file.txt # коммиты, в которых были изменения файла file.txt,
# даже с учётом переименования
git log --stat # коммиты со статистикой изменений
git reflog # log + операции (reset, commit, checkout, ...)
git show # разница между текущим и предыдующим коммитов в удобном виде

# Просмотр коммитов:
git checkout <commit_id>

# Удаление:
git rm [-r] [--force] unwanted_file # удаление (физическое + из индекса) файла
# [папки] [даже если он в Untracked files]
git rm [-r] --cached img/logo.png src/script.js # только из индекса
# (без физического удаления)
git mv file.txt dir/kek.txt # переименование (перемещение) файла, работает
# аналогично git rm
# rm и mv - обёртки над командами git и ОС
git reset <file_name> # перемещает файл из "Changes to be committed" в
# "Untracked files" (удаляет из индекса)
git reset <commit_id> --hard # ОБЯЗАТЕЛЬНО --hard - удаляет все коммиты ВЫШЕ
# commit_id и ВОЗВРАЩАЕТСЯ к нему
git restore <file>...
git push --force # синхронизирует удалённые коммиты с локальными

# Stash:
git stash # отложить ОТСЛЕЖИВАЕМЫЕ изменения в СТЕК
git stash pop # извлечь последнее изменение из стека
git stash apply # получить последнее изменение без удаления из стека
git stash drop # удаляет последнее изменение
git stash list # список изменений в порядке стека (LIFO)
# отложенные изменения сохраняются в локальном репозитории, не передаются на
# сервер после push

# Ветки:
# Подходы к ведению веток:
# 1) Тематические (feature, ...)
# 2) Релизные (v1.0.0, v1.1.0, ..., v1.2.3, v2.0.0, ...)
# 3) git flow: 1) + 2)
git branch <branch_name> # создание ветки
git branch -v <branch_name> # отобразить текущее состояние всех веток (HEAD,
# последний коммит, ...)
git checkout [-b] <branch_name> # переключение [+ создание]
# Если имеются незакоммиченные изменения в одинаковых файлах в одной и другой
# ветке, то при git checkout эти файлы перезаписываться не будут (их список
# отобразится при выполнении команды) и ошибки тоже не будет!!!

# Поведение выше удобно, если нужно пофиксить баги в master'е:
# 1) Вносим исправления...
# 2) git checkout -b fix
# 3) Вносим ещё исправления...
# 4) git commit -am 'Fix bugs from `master` branch' # изменения сохранены в fix
# 5) git checkout master && git merge fix

# Удаление уже внесённых в master изменений и их перенос в другую ветку:
git checkout -b fix
# Откатываем master до коммита <commit_id>, оставаясь в fix:
git branch -f master <commit_id>
# Либо с переходом в master:
git checkout -B master <commit_id>

# Detached (отделённый) HEAD:
git checkout <intermediate_commit>
# Внесли изменения, но забыли, что находимся в промежуточном коммите...
git commit -am 'Some fixes'
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
git clone [-b <branch>] <url>
git pull ...



### ИГНОР ###

# !!!
# .gitignore игнорирует только те файлы, которые были созданы ПОЗЖЕ .gitignore
# => надо удалить их из индекса
# !!!

git status --ignored # добавляет к выводу файлы, попавшие под шаблоны в
# .gitignore

file.type # файл в любом каталоге / подкаталоге (file.type, img/file.type, ...)
* # 0..inf символов
? # 1 символ
!file.type # исключение, если подходит под предыдущие шаблоны
[] # как в регулярках, НО *.[!abc] - игнор файлов, которые содержат в типе
# символы a, b или c
# комментарий

# !!!
# Чтобы экранировать шаблон подстановки, надо приписать слэш: \*, \?, \!
# Когда каталог игнорируется, все его файлы и подкаталоги также игнорируются
# Если шаблон начинается с "/", то он соответствует файлам и каталогам только в
# КОРНЕ хранилища, иначе - соответствует файлам и каталогам в ЛЮБОМ каталоге
# или подкаталоге
# !!!



### РАЗНОЕ ###

# Сложные команды:
(git checkout master && git status && git checkout kek && git status) | less
# применяет конвеерный оператор | ко всему выводу команд в скобке

git-update-git-for-windows # обновление git bash для Windows
# Для индексации пустой директории (которые git не индексирует) создают в ней
# пустой файл .gitkeep

less ~/.gitconfig
git config --global user.name MeShootIn
git config --global user.email dmitriimishutin@gmail.com
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"
