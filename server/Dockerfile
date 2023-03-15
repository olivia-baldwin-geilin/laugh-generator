FROM python:3.9
ADD server.py .

COPY requirements.txt /app/requirements.txt

COPY server.py /app/server.py

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python3" ]

CMD ["server.py"]