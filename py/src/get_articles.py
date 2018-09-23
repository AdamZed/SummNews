import requests
import json
from bs4 import BeautifulSoup
import summ
import re

with open('categories.json') as categories_file:
    categories = json.load(categories_file)


def get_date(src, content):
    attrs = {
        'bbc': 'data-datetime',
        'futurism': ['story-author-container', 'author-container']
    }
    # list of sources using <div> tags for publication time
    div_src = ['bbc']
    soup = BeautifulSoup(content)
    if src in div_src:
        return soup.find('div', {attrs[src]: True})[attrs[src]]
    elif src == 'futurism':
        return soup.find_all('div', class_=attrs[src])[0].findChildren('span', recrusive=False)[1].text


def get_img(src, content):
    classes = {
        'bbc': 'js-image-replace',
        'futurism': 'post-header-full'
    }
    # list of sources using <img> tags
    img_src = ['bbc']
    # list of sources using <div> tags
    div_src = ['futurism']
    soup = BeautifulSoup(content)
    if src in img_src:
        return soup.find('img', class_=classes[src])['src']
    elif src in div_src:
        return re.findall(
            r'http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\), ]|(?:%[0-9a-fA-F][0-9a-fA-F]))+',
            soup.find('div', class_=classes[src])['style']
        )[0][:-2]


def classify_a(src):
    classes = {
        'bbc': 'faux-block-link__overlay-link',
        'futurism': 'main-link'
    }
    return classes[src]


def get_articles(c, source, category):
    soup = BeautifulSoup(c)
    article_refs = soup.find_all('a', class_=classify_a(source))
    data = []
    for a in article_refs:
        if a.string:
            title = a.string.strip()
            if title.startswith("Full article"):
                title = title[13:].lstrip()
        else:
            title = a['title']
        if a.attrs['href'].startswith('http') is False and source == 'bbc':
            a.attrs['href'] = 'http://www.bbc.com'+a.attrs['href']
        article_content = requests.get(a.attrs['href']).content
        try:
            data.append({
                "title": title,
                "url": a.attrs['href'],
                "summary": summ.summarize(article_content, 8),
                "image": get_img(source, article_content),
                "source": source,
                "date_published": get_date(source, article_content),
                "category": category
            })
            if len(data) == 3:
                break
        except:  # if there is an error, we cannot do much at the moment to support the formatting so just ignore the article
            pass
    return data


def main(category, source="none"):
    if category in categories:
        if source is "none":
            articles = []
            for src in categories[category]:
                for article in (get_articles(requests.get(
                    categories[category][src]).content, src, category)):
                    articles.append(article)
            return articles
        else:
            return get_articles(requests.get(categories[category][source]), source, category)
