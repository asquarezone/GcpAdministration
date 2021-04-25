from googleapiclient import discovery

def hello_http(request):
    request_json = request.get_json()
    if request_json and 'zone' in request_json and 'projectid' in request_json:
        service = discovery.build('compute', 'v1')
        # get the instances and stop them
        service.instances()
