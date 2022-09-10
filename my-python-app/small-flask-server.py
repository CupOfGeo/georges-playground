from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello_cloud() -> str:
    """
    Hello cloud test function.

    :return:
    """
    return "Hello Cloud!"


app.run(host="0.0.0.0", port=8080)
