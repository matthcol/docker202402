FROM python:latest

ARG APP=hello.py

# executed during build in a temporary container
RUN echo "start building new image"

WORKDIR /usr/src

COPY src/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY src .

RUN pwd
RUN ls -l

RUN echo $APP
RUN ln -s "${APP}" main.py

ENV MAIN=${APP}

# executed when running the container
ENTRYPOINT ["python"]
#CMD [ "$MAIN" ]
CMD [ "main.py" ]
