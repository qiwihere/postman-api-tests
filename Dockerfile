FROM dannydainton/htmlextra

WORKDIR /home/newman

COPY run-tests.sh .

ENTRYPOINT ["sh", "run-tests.sh"]
