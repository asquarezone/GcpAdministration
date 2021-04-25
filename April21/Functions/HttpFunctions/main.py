
def hello_http(request):
    request_json = request.get_json()
    request_args = request.args
    if request_json and 'name' in request_json:
        name = request_json['name']
    else:
        name = 'world'
    return 'Hello {}!'.format(name)