FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3 python3-pip && pyhton3 -m pip install Flask

WORKDIR /app

COPY /app/main.py ./
COPY /app/index.html ./templates/

ENW PORT=5000  

CMD ["python3", "./main.py"]
