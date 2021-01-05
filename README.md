
Тесты запускаются вызовом, необходимо заменить *** на соответствующие параметры
````
docker run \
  -v $PWD/output:/home/newman/output \
  -e POSTMAN_COLLECTION_ID=*** \
  -e POSTMAN_API_TOKEN=*** \
  artemlipovoy/postman-api-tests:latest
````

Детальный отчет о тестировании сохраняется в виде .html файла в
в /output в директории запуска, а также выводится в терминал.

