FROM python:3.11.2-alpine

RUN apk --no-cache add gcc musl-dev

RUN pip install solara --no-cache-dir

WORKDIR /srv

COPY requirements.txt /srv/
RUN pip install -r requirements.txt --no-cache-dir

COPY . /srv

CMD ["solara", "run", "app.py", "--port=80", "--host=0.0.0.0", "--production"]
