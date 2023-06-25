from flask import Flask
from flask_wtf.csrf import CSRFProtect

csrf = CSRFProtect()

app = Flask(__name__)
csrf.init_app(app) # Compliant

@app.route("/")
def pagina_inicial():
    return "Hello World - Arquitetura Cloud Native - Deploy on Terraform"

if __name__ == '__main__':
    app.run()
