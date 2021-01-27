# -*-coding:utf-8-*-
from flask import Blueprint

hello_app = Blueprint('hello_app', __name__)
from hello_world_api.hello_api import views
