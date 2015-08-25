SERVER_URL="http://localhost:9200"

echo "creating new index branches-development \n"
curl -XPUT $SERVER_URL/branches-development/ -d '{ 
    "branches-development" : {
    "mappings" : {
      "branch" : {
        "dynamic" : "false",
        "properties" : {
          "business_name" : {
            "type" : "string"
          },
          "coordinates" : {
            "type" : "geo_point",
            "lat_lon": true
          },
          "cuisines" : {
            "type" : "string"
          },
          "opening_times" : {
            "type" : "nested",
            "properties" : {
              "closing" : {
                "type" : "integer"
              },
              "opening" : {
                "type" : "integer"
              }
            }
          }
        }
      }
    }
  }
}'