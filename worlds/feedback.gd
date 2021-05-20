extends Node

func make_post_request(url, data_to_send, use_ssl):
	# Convert data to json string:
	var query = data_to_send
	print(query)
	# Add 'Content-Type' header:
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url, headers, use_ssl, HTTPClient.METHOD_POST, query)


func _on_send_feddback_pressed():
	var text = $send_feddback/TextEdit.text
	var thing = '{"content" : "' + text + '"}' 
	make_post_request("https://discord.com/api/webhooks/844885760347865099/SUgWJcmmNAsuEi2ZMQ8d_6jM8f0kbQ30hc4xfi3UrBGgiydOy80v_y9rTIpOZ8FFqoqY", thing, true)


func _on_send_feddback2_pressed():
	get_tree().change_scene("res://worlds/start menue.tscn")
