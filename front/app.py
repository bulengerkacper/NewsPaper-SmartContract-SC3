from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

@app.route("/papay")
def main():
    return render_template("index.html")

@app.route("/papay/add", methods = ['POST', 'GET'])
def add_news():
    return render_template("add.html")

@app.route("/papay/read/<numb>")
def read_specific_news(numb):
    avg=""
    return str(avg)

@app.route("/papay/menu")
def menu():
    menu="<a href='"'/papay/add'"'>Add</a>"
    menu+="&emsp;"
    menu+="<a href='"'/papay'"'>Read</a>"
    return str(menu)

def convert_file_into_text(filename):
    text_file = open(filename, "r")
    data = text_file.read()
    text_file.close()
    return data

@app.route("/papay/rules")
def get_rules():
    cont = convert_file_into_text("static/rules")
    return cont

if __name__ == "__main__":
    app.config['TEMPLATES_AUTO_RELOAD'] = True
    app.run(debug=True,host='127.0.0.1')