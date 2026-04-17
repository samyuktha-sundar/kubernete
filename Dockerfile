FROM python:3.10

WORKDIR /app

COPY . .

RUN pip config set global.index-url https://pypi.org/simple
RUN python -m pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]
