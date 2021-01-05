## Запуск
Создаем контейнер, необходимо заменить *** на соответствующие параметры
````
docker run \
  -v $PWD/output:/home/newman/output \
  -e POSTMAN_COLLECTION_ID=*** \
  -e POSTMAN_API_TOKEN=*** \
  artemlipovoy/postman-api-tests:latest
````

## Результат
Результаты работы тестов находтся /output в директории запуска, а также выводится в терминал.

## Пример
Job для Gitlab CI, результат теста будет в artifacts
````
API test:
  stage: API test
  tags:
    - docker
  image: docker:stable
  allow_failure: false
  services:
    - docker:dind
  script:
    - docker run
      --name api-tests
      -v $PWD/output:/home/newman/output
      -e POSTMAN_COLLECTION_ID=$POSTMAN_COLLECTION_ID
      -e POSTMAN_API_TOKEN=$POSTMAN_API_TOKEN
      artemlipovoy/postman-api-tests:latest
  artifacts:
    when: always
    expose_as: 'api tests result'
    paths:
      - output/
    expire_in: 1 week
````

