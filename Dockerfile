FROM squidfunk/mkdocs-material:latest

WORKDIR /gv-api
COPY docs docs
COPY mkdocs.yml .

# RUN ["mkdocs", "build"]

EXPOSE 8000

ENTRYPOINT ["mkdocs"]

CMD ["serve", "--dev-addr=0.0.0.0:8000"]