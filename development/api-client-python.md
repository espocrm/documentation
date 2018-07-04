# API Client Implementation in Python

```python
import requests


class EspoAPIError(Exception):
    """An exception class for the client"""


class EspoAPI:
    """
    A simple api client for EspoCRM (https://www.espocrm.com) written in Python. Adopted from the PHP api client.
    It needs the requests library. You can install it by command: pip install requests

    Author: Yehor Smoliakov (https://github.com/egorsmkv)
    """

    url_path = '/api/v1/'
    user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743 Safari/537.36'

    def __init__(self, url, username, password):
        self.url = url
        self.username = username
        self.password = password
        self.status_code = None

    def request(self, method, action, params=None):
        if params is None:
            params = {}

        headers = {
            'User-Agent': self.user_agent,
        }

        kwargs = {
            'url': self.normalize_url(action),
            'auth': (self.username, self.password),
            'headers': headers,
        }

        if method in ['POST', 'PATCH', 'PUT']:
            kwargs['json'] = params
        else:
            kwargs['data'] = params

        response = requests.request(method, **kwargs)

        self.status_code = response.status_code

        if self.status_code != 200:
            reason = self.parse_reason(response.headers)
            raise EspoAPIError(f'Wrong request, status code is {response.status_code}, reason is {reason}')

        data = response.content
        if not data:
            raise EspoAPIError('Wrong request, content response is empty')

        return response.json()

    def normalize_url(self, action):
        return self.url + self.url_path + action

    @staticmethod
    def parse_reason(headers):
        if 'X-Status-Reason' not in headers:
            return 'Unknown Error'

        return headers['X-Status-Reason']
```

## Usage

```python
from espo_api_client import EspoAPI

data = {
    'firstName': 'John',
    'lastName': 'Does',
    'phoneNumber': '+11111-22222-33333',
    'emailAddress': '',

    'source': 'Web Site',
    'campaignId': '5b3afb264fddb0e65',
    'assignedUserId': '1',

    'opportunityAmount': '650',
    'opportunityAmountCurrency': 'USD',
    'industry': 'Legal',
}

client = EspoAPI('http://localhost/espocrm', 'bot2000', '****')

# Change an item
# print(client.request('PUT', 'Lead/5b3c37b74b19680f1', {'lastName': 'Alice'}))

# Create a lead
# print(client.request('POST', 'Lead', data))

# Get accounts
# print(client.request('GET', 'Account'))

# Delete an opportunity
# print(client.request('DELETE', 'Opportunity/5b3b0b8c0b2b8bea5'))
```