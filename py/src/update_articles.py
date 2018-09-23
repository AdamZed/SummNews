import pyrebase
import get_articles

with open('api_key.txt') as f:
    API_KEY = f.read()

config = {
    "apiKey": API_KEY,
    "authDomain": "newsumm-70f1d.firebaseapp.com",
    "databaseURL": "https://newsumm-70f1d.firebaseio.com",
    "projectId": "newsumm-70f1d",
    "storageBucket": "newsumm-70f1d.appspot.com",
    "messagingSenderId": "20446372973"
}

db = pyrebase.initialize_app(config).database()
# data = get_articles.main("tech")
# print(data)
db.child("articles").set(get_articles.main("tech"))
