FROM python:3.13
WORKDIR /app
COPY . .

RUN pip install flask

CMD ["python", "python.py"]
