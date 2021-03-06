from datetime import datetime
from hello_world_api.hello_api import hello_app
import json

@hello_app.route('/localtime', methods=['GET'])
def response_manager():
    from datetime import datetime, timezone

    utc_dt = datetime.now(timezone.utc)
    print("Local time {}".format(utc_dt.astimezone().isoformat()))
    res_ = dict(date_time=str(utc_dt))
    return json.dumps(res_)
