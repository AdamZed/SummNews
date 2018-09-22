import requests
import json
from bs4 import BeautifulSoup

def classify(src):
    classes = {
        'bbc': 'faux-block-link__overlay-link',
        'futurism': 'main-link'
    }
    return classes[src]

def get_articles(c, source):
    soup = BeautifulSoup(c)
    article_refs = soup.find_all('a', class_=classify(source))
    data = {}
    for a in article_refs:
        if a.string:
            title = a.string.strip()
            if title[0:12] == "Full article":
                title = title[13:].lstrip()
        else:
            title = a['title']
        if 'http' not in a.attrs['href'] and source is 'bbc':
            a.attrs['href'] = 'http://www.bbc.com'+a.attrs['href']
        data[title] = a.attrs['href']
    print(data)


def open_sources(category, source="none"):
    if category in categories:
        if source is "none":
            for src in categories[category]:
                print(src)
                get_articles(requests.get(categories[category][src]).content, src)
        else:
            get_articles(requests.get(categories[category][source]), source)


if __name__ == "__main__":
    with open('categories.json') as categories_file:
        categories = json.load(categories_file)
    open_sources("tech")
