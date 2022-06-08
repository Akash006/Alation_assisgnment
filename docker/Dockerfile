FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
COPY . .
RUN apk add --no-cache gcc musl-dev linux-headers && pip install -r requirements.txt
ENTRYPOINT ["flask", "run"]
