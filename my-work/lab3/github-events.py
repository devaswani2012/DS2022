#!/Library/Frameworks/Python.framework/Versions/3.12/bin/python3

import os
import json
import requests

GHUSER = os.getenv('GITHUB_USER')
url = f'https://api.github.com/users/{GHUSER}/events'

response = requests.get(url)
r = json.loads(response.text)

for x in r[:5]:
    event = f"{x['type']} :: {x['repo']['name']}"
    print(event)

print(r)
