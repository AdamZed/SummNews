from __future__ import absolute_import
from __future__ import division, print_function, unicode_literals

from sumy.parsers.html import HtmlParser
from sumy.parsers.plaintext import PlaintextParser
from sumy.nlp.tokenizers import Tokenizer
from sumy.summarizers.lsa import LsaSummarizer as Summarizer
from sumy.nlp.stemmers import Stemmer
from sumy.utils import get_stop_words

LANGUAGE = "english"


def summarize(doc, SENTENCES_COUNT):
    parser = HtmlParser.from_string(doc, None, Tokenizer(LANGUAGE))
    stemmer = Stemmer(LANGUAGE)
    summarizer = Summarizer(stemmer)
    summarizer.stop_words = get_stop_words(LANGUAGE)
    summary = ""
    for sentence in summarizer(parser.document, SENTENCES_COUNT):
        if str(sentence).strip().startswith("Image copyrightGetty") is False:
            summary += (" " + str(sentence))
    return summary
