from flask import Flask, render_template, request, redirect, url_for
from flask_api import status
from block import *
app = Flask(__name__)

@app.route("/")
def main():
    return render_template("index.html")

@app.route("/add", methods = ['POST','GET'])
def add_news():
    if request.method == "POST":
        json=request.get_json()
        print(json)
        print(json['name'])
        print(json['message'])
        print(json['gas'])
        addNews(json['name'],json['message'],json['gas'])
        return "gites"
    else:
        return render_template("add.html")


@app.route("/read/<numb>")
def read_specific_amont_of_news(numb):
    data=getLastXNews(numb)
    return str(data)

@app.route("/menu")
def menu():
    menu="<a href='"'/add'"'>Add</a>"
    menu+="&emsp;"
    menu+="<a href='"'/'"'>Read</a>"
    return str(menu)

def convert_file_into_text(filename):
    text_file = open(filename, "r")
    data = text_file.read()
    text_file.close()
    return data

@app.route("/rules")
def get_rules():
    cont = convert_file_into_text("static/rules")
    return cont

@app.route("/check_b")
def check_b():
    print(web3.isConnected())
    return ""


if __name__ == "__main__":
    app.config['TEMPLATES_AUTO_RELOAD'] = True
    app.run(debug=True,host='127.0.0.1')