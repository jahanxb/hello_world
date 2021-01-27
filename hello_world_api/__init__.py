# -*-coding:utf-8-*-
import os

from flask import Flask

from hello_world_api.hello_api import hello_app
from conf.configs import Config as config,config_dict


def create_app():
    app = Flask(__name__)
    app.config.from_object(config_dict[configName])

    return app


configName = os.environ.get('CONFIGNAME') or 'default'
app = create_app()

# register apps
app.register_blueprint(hello_app, url_prefix='/api')


@app.route('/', methods=['GET'])
def index():
    return 'Welcome to Local Time Code service! redirect to http://0.0.0.0:8000/api/localtime for localtime API json'
