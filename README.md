#Тестирования коллекций Postman с помощью Newman
##Запуск

Тесты запускаются с помощью вызовом
````
docker run \
  -v $PWD/output:/home/newman/output \
  -e POSTMAN_COLLECTION_ID=*** \
  -e POSTMAN_API_TOKEN=*** \
  artemlipovoy/postman-api-tests:latest
````

##Результаты тестирования

Детальный отчет о тестировании сохраняется в виде .html файла в
в /output в директории запуска, а также выводится в терминал.

