FROM alpine:3.10

RUN apk add --no-cache python3-dev \
    && pip3 install --upgrade pip

WORKDIR /lunaapp

COPY . /lunaapp/

RUN pip3 --no-cache-dir install -r requirements.txt

CMD [ "python3", "src/manage.py", "runserver", "0.0.0.0:8000" ]