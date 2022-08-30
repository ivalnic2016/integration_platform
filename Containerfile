FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN integration_platform create-db
RUN integration_platform populate-db
RUN integration_platform add-user -u admin -p admin
EXPOSE 5000
CMD ["integration_platform", "run"]
