FROM python:3.7.3-slim

RUN apt-get update \
&& apt-get install gcc -y \
&& apt-get clean \
&& apt-get install gunicorn3 -y
RUN touch /var/log/hello_world.log
WORKDIR opt
RUN python3 -m venv /opt/venv

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
COPY requirements.txt /opt
RUN /opt/venv/bin/pip install -r requirements.txt
COPY . /opt


EXPOSE 8000
CMD ["python3" ,"main.py"]


