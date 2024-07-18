# syntax=docker/dockerfile:1

FROM python:3.10

WORKDIR /app

COPY flights*.whl .
COPY requirements.txt .
COPY ibm-edu.* .
RUN python -m pip install -r requirements.txt
RUN python -m pip install flights*.whl

ENV FLASK_APP="flights:create_app('flight_id')"

RUN flask init-db

CMD ["python", "-m", "flask", "run", "-h", "0.0.0.0", "-p", "9443", "--cert", "ibm-edu.crt","--key","ibm-edu.key"]
