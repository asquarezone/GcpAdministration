from flask import Flask

app = Flask(__name__)

@app.route('/')
def get_home():
    return "Sample flask app"

@app.route('/api/colors')
def get_colors():
    return "red"

@app.route('/api/days')
def get_days():
    return "Thursday"

if __name__ == '__main__':
    # This is used when running locally only. When deploying to Google App
    # Engine, a webserver process such as Gunicorn will serve the app. This
    # can be configured by adding an `entrypoint` to app.yaml.
    app.run(host='127.0.0.1', port=8080, debug=True)
