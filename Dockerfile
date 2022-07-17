FROM ubuntu
RUN  mkdir flask_website 

COPY requirements.txt flask_website/requirements.txt
COPY market flask_website/market
COPY app.py flask_website
WORKDIR flask_website


RUN  apt update -y
RUN  apt upgrade -y 
RUN  apt install python3 -y 
RUN  apt install python3-pip -y
RUN  pip install -r requirements.txt 


EXPOSE 1111
CMD export FLASK_DEBUG=1
CMD export FLASK_APP=app.py
ENTRYPOINT flask  run --host=0.0.0.0 --port=1111



