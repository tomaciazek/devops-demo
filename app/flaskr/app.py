import socket

import psutil
from apispec import APISpec
from apispec.ext.marshmallow import MarshmallowPlugin
from apispec_webframeworks.flask import FlaskPlugin
from flask import Flask, jsonify
from flaskr.schemas import EchoResponseSchema, HealthResponseSchema
from webargs import fields
from webargs.flaskparser import use_args

spec = APISpec(
    title="Echo web service",
    version="1.0.0",
    openapi_version="3.0.3",
    info=dict(description="A service that echoes the input in JSON format"),
    plugins=[FlaskPlugin(), MarshmallowPlugin()],
)
spec.components.schema("EchoResponse", schema=EchoResponseSchema)

app = Flask(__name__)
echo_response_schema = EchoResponseSchema()
health_response_schema = HealthResponseSchema()


@app.route("/-/health", methods=["GET"])
def health():
    """---
    get:
      description: Used to verify whether the application is healthy.
      responses:
        200:
          description: System information if the service is up and running.
          content:
            application/json:
              schema: HealthResponse
    """

    status = dict(
        hostname=socket.gethostname(),
        cpu_usage=psutil.cpu_percent(),
        mem_usage=psutil.virtual_memory().percent,
    )
    return health_response_schema.dump(status)


@app.route("/api/echo", methods=["GET"])
@use_args({"text": fields.String(required=True)}, location="query")
def get_echo(query):
    """---
    post:
      description: Echo the query text as JSON.
      parameters:
        - in: query
          name: noCache
          schema:
            type: boolean
            default: false
      responses:
        200:
          description: A JSON object with the key "text" and the value passed to the query string
          content:
            application/json:
              schema: EchoResponse
    """
    return echo_response_schema.dump(dict(text=query["text"]))


@app.errorhandler(422)
@app.errorhandler(400)
def handle_error(err):
    # Return validation errors as JSON
    headers = err.data.get("headers", None)
    messages = err.data.get("messages", ["Invalid request."])
    if headers:
        return jsonify({"errors": messages}), err.code, headers
    else:
        return jsonify({"errors": messages}), err.code
