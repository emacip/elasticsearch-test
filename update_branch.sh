SERVER_URL="http://localhost:9200"
curl -XDELETE $SERVER_URL/branches-development/

 
echo "creating new index branches-development \n"
curl -XPUT $SERVER_URL/branches-development/ -d '{
  "mappings": {
    "branch": {
      "dynamic": false,
      "properties": {
        "business_name": {
          "type": "string"
        },
        "coordinates": {
          "type": "geo_point"
        },
        "cuisines": {
          "type": "string"
        },
        "opening_times": {
          "type": "nested",
          "properties": {
            "closing": {
              "type": "integer"
            },
            "opening": {
              "type": "integer"
            }
          }
        }
      }
    }
  }
}'