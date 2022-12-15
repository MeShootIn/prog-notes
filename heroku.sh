# https://devhints.io/heroku

heroku create $APP_NAME --buildpack mars/create-react-app --region eu # при
# использовании на инициализированном репозитории автоматически подключается
# remote

heroku buildpacks:set heroku/php

heroku apps # список приложений

heroku ps:scale --app vk-random-bot [web=228]

heroku logs --tail --app vk-upload-bot

''' CONFIG '''

heroku config --app vk-upload-bot

heroku config:get GROUP_TOKEN SECRET_KEY STANDALONE_TOKEN

heroku config:set KEY1=val KEY2=val

heroku config:unset KEY1

''' DESTROY '''

heroku destroy some-app # удалить приложение (вместе с аддонами)