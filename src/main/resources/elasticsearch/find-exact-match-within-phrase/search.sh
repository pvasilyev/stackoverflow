#!/bin/zsh

curl -XGET http://localhost:9200/my_zoo/_search -d '
    {
        "query": {
            "more_like_this" : {
                "fields" : ["text"],
                "like" : [ {
                    "_index": "my_zoo",
                    "_type": "animal",
                    "doc": {
                        "text": "dog fox quick brown jumps over the lazy"
                    }
                } ],
                "min_term_freq" : 1,
                "min_doc_freq": 1,
                "max_query_terms" : 12,
                "minimum_should_match": "100%",
                "analyzer": "my_analyzer"
            }
        }
    }'

