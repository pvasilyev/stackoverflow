#!/usr/local/bin/zsh

curl -XGET 'http://localhost:8983/solr/gettingstarted/select?wt=json&indent=true&q=*:*&sfield=location_p&pt=36.722484,-4.371908&d=50&fq=%7B!geofilt%7D&fl=*,dist:geodist()&sort=geodist()+asc'

curl -XPOST -H 'Content-type: application/x-www-form-urlencoded' 'http://localhost:8983/solr/gettingstarted/select' -d 'wt=json&indent=true&q=*:*&sfield=location_p&pt=36.722484,-4.371908&d=50&fq={!geofilt}&fl=*,dist:geodist()&sort=geodist()+asc'
