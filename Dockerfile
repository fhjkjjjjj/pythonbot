ARG PORT=383
FROM cypress/browsers:latest
RUN apt-get update && apt-get install python3 -y
RUN echo $(python3 -m site --user-base)
COPY requirements.txt .
ENV PATH /home/root/.local/bin:${PATH}
RUN apt-get update && apt-get install python3-pip -y && pip3 install -r requirements.txt
COPY . .
CMD uvicorn aman:app --host 0.0.0.0 --port $PORT

