# Use uma Imagem Official do Python
FROM python:3.10-slim

RUN groupadd -g 999 python && \
    useradd -r -u 999 -g python python

# Definindo o diretório onde a aplicação será armazenada
RUN mkdir /usr/app && chown python:python /usr/app

WORKDIR /usr/app

USER 999

RUN python -m venv /usr/app/venv
ENV PATH="/usr/app/venv/bin:$PATH"

COPY --chmod=444 --chown=python:python requirements.txt .

# Instalar as dependências de Python de acordo com o que foi desenvolvido na aplicação e que está declarado no arquivo requirements.txt.
RUN pip install --trusted-host pypi.python.org -U -r requirements.txt

# Copiar os arquivos da pasta local para dentro do container
COPY --chmod=444 --chown=python:python app.py .

# Garante que será iniciado a aplicação.
CMD ["gunicorn", "app:app"]