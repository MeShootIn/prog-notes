### УСТАНОВКА И ОБНОВЛЕНИЕ YARN ###

# FIXME Юзается yarn classic => перейти на новую версию:
# https://yarnpkg.com/getting-started/migration

# Установку yarn лучше проводить через corepack (посредник между Вами и yarn,
# позволяющий юзать разные версии yarn (аналогично nvm для версий Node.js)) для
# Node.js >= 16.10 версии.
corepack enable # включить Corepack
corepack prepare yarn@stable --activate

# Обновление yarn.
# NOTE После обновы надо запустить установку (yarn install) для
# каждого проекта заново.

yarn set version (stable / latest / from sources)



### ОБЩИЕ ###

yarn [--version/-v] # версия самого yarn
yarn [--help/-h]



### ИНИЦИАЛИЗАЦИЯ ПРОЕКТА ###

# FIXME Вместо ".npmrc" и ".yarnrc" теперь нужен ".yarnrc.yml"?

# Значения по умолчанию должны храниться в "init-*" ключах конфига.
# Если уже есть файл "package.json", то настоящие значения будут предлагаться по
# умолчанию в интерактиве.
# Если поле "private" !== true (т.е. пустое), то приватный ключ не будет
# добавлен в "package.json".

yarn init [--yes/-y] [--private/-p] # [всё по умолчанию] ["private": true]



### КОНФИГ YARN ###

yarn config [--why] # весь конфиг [c причиной такой установки параметра]

# FIXME Вместо ".npmrc" и ".yarnrc" теперь нужен ".yarnrc.yml"?

# Ключи:
# * init-author-name
# * init-author-email
# * init-author-url
# * init-version
# * init-license
# * version-tag-prefix
# * ...

yarn config get <name>
yarn config set init-license "GPL-3.0" -g
# yarn config ...

# INFO https://yarnpkg.com/cli/config


### УПРАВЛЕНИЕ ЗАВИСИМОСТЯМИ ###

# Установка всех зависимостей в проекте.
yarn # <=> yarn install

# FIXME https://yarnpkg.com/cli/add

# Добавление, обновление и удаление.
yarn (add / up / remove) <package>
yarn (add / up) (<package>@<version> / <package>@<tag>)

# Добавление в определённую категорию завесимостей.
yarn add <package> (--dev / --peer) # devDependencies / peerDependencies
