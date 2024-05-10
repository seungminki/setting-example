FROM python:3.10

WORKDIR /workspace

COPY . /workspace

RUN pip install -r requirements.txt

EXPOSE 8888

CMD ["jupyter", "notebook","--ip", "0.0.0.0", "--port", "8888", "--allow-root", "--NotebookApp.token='password'"]