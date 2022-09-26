from marshmallow.schema import BaseSchema
from webargs import fields


class HealthResponseSchema(BaseSchema):
    hostname = fields.String(metadata=dict(description="The hostname"))

    cpu_usage = fields.Integer(
        data_key="cpuUsage", metadata=dict(description="CPU used (percentage)")
    )

    mem_usage = fields.Integer(
        data_key="memUsage", metadata=dict(description="Memory used (percentage)")
    )


class EchoResponseSchema(BaseSchema):
    text = fields.String(metadata=dict(description="Value of the input text"))
