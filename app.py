from flask import Flask
from flask_wtf.csrf import CSRFProtect

csrf = CSRFProtect()

app = Flask(__name__)
csrf.init_app(app) # Compliant

@app.route("/")
def pagina_inicial():
    return "Hello World FIAP - Aula 04 - Arquitetura Cloud Native with secure image"

if __name__ == '__main__':
    app.run()
