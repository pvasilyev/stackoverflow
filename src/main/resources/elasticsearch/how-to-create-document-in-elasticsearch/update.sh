#!/bin/zsh

curl -XDELETE http://localhost:9200/my_tasks

curl -XPUT http://localhost:9200/my_tasks -d '
{
  "mappings": {
    "task": {
      "properties": {
        "task_id": {
          "type":     "integer"
        },
        "priority": {
          "type":     "integer"
        },
        "queue": {
          "type":     "string"
        },
        "process": {
          "type":     "string"
        },
        "task": {
          "type":     "string"
        },
        "status": {
          "type":     "string"
        },
        "user": {
          "type":     "string"
        },
        "description": {
          "type":     "string"
        },
        "due_date": {
          "type":     "date"
        },
        "created_on": {
          "type":     "date"
        },
        "updated_on": {
          "type":     "date"
        }
      }
    }
  }
}'

curl -XPOST http://localhost:9200/my_tasks/task/ -d '
{
  "task_id": "64123",
  "priority": "2",
  "queue": "Implementation",
  "process": "Project Sample",
  "task": "Feature-64123",
  "status": "In Progress",
  "user": "John Smith",
  "description": "Set-up basic ElasticSearch task",
  "due_date": "2017-03-24T00:00:00Z",
  "created_on": "2017-03-21T01:51:12Z",
  "updated_on": "2017-03-21T01:56:54Z"
}'

