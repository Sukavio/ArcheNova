extends Node

var accept: String = "application/json"

func _ready():
	%http.request_completed.connect(_http_request_completed)
	var error = %http.request("http://localhost:8080/monster", ["Accept: " + accept], HTTPClient.METHOD_GET)
	if error != OK:
		push_error("An http request error")
		
func _http_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)
