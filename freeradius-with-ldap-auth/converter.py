import json

with open("/radius-clients.json", "r") as clients:
    clients = json.load(clients)

with open("/clients.conf", "w") as conf:
    for i in clients:
        conf.write(
            f"client {i['name']}" " {\n" f"\tipaddr = {i['ip']}\n"
            f"\tsecret = {i['secret']}\n" "}\n\n"
        )