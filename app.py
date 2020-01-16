from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, World, nu er gaman.  <a href='/sida2'>Sida 2</a><a href='/sida3'>Sida 3</a>"

@app.route("/sida2")
def sida2():
    return "Thetta er sida 2"

@app.route("/sida3")
def sida3():
    return render_template("http.html")

if __name__ == "__main__":
	app.run(debug=True) 
   