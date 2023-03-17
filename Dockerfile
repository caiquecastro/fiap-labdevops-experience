# Use uma Imagem Official do Python
FROM python:3.10-slim

# Definindo o diretório onde a aplicação será armazenada
WORKDIR /usr/app

RUN groupadd -g 999 python && \
    useradd -r -u 999 -g python python
USER 999

COPY --chown=python:python requirements.txt .

# Instalar as dependências de Python de acordo com o que foi desenvolvido na aplicação e que está declarado no arquivo requirements.txt.
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Copiar os arquivos da pasta local para dentro do container
COPY --chown=python:python . .

# Garante que será iniciado a aplicação.
CMD ["gunicorn", "app:app"]