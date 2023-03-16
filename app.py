from flask import Flask

app = Flask(__name__)

@app.route("/")
def pagina_inicial():
    return "Hello World FIAP - Aula 04 - Arquitetura Cloud Native"

if __name__ == '__main__':
    app.run()
