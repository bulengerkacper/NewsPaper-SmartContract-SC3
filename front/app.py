from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

@app.route("/papay")
def main():
    return render_template("index.html")

@app.route("/papay/read")
def read_news():
    return str("sdfsdf")

@app.route("/papay/add", methods = ['POST', 'GET'])
def add_news():
    if request.method == 'POST':
        data=request.get_json()
        return ""
    return ""

@app.route("/papay/read/<numb>")
def read_specific_news(numb):
    avg=""
    return str(avg)

@app.route("/papay/menu")
def menu():
    menu="<a href='"'papay/add'"'>Add</a>"
    menu+="&emsp;"
    menu+="<a href='"'papay/read'"'>Read</a>"
    return str(menu)

if __name__ == "__main__":
    app.config['TEMPLATES_AUTO_RELOAD'] = True
    app.run(debug=True,host='127.0.0.1')