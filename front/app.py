from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

@app.route("/papay")
def main():
    return render_template("index.html")

@app.route("/papay/add", methods = ['POST', 'GET'])
def add_news():
    if request.method == 'POST':
        data=request.get_json()
        return ""
    else:
        return ""


@app.route("/papay/read", methods = ['POST', 'GET'])
def read_news(numb):
    avg = "My prod: Lorem ipsum dolor sit amet, consectetur adipiscing"
    return str(avg)

@app.route("/papay/read/<numb>")
def read_specific_news(numb):
    avg=""
    return str(avg)

if __name__ == "__main__":
    app.config['TEMPLATES_AUTO_RELOAD'] = True
    app.run(debug=True, host='127.0.0.1')