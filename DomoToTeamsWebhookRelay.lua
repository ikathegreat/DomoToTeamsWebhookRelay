local json = require("json")
local query, err = r.RequestQuery
if err then error(err) end

local request_payload, decodeErr = json.decode(r.RequestBody)
if decodeErr then error(decodeErr) end

local alertName = "(empty name)"
if request_payload["name"] ~= nil then
    alertName = request_payload.name
end
local alertMessage = "(empty message)"
if request_payload["message"] ~= nil then
    alertMessage = request_payload.message
end

local new_payload = 
{
  type= "MessageCard",
  context= "http://schema.org/extensions",
  summary= alertName,
  sections= {
      {
          activityTitle= alertName,
          activityImage= "https://i.imgur.com/Ae6941m.png",
          facts= {
              {
                  name= "Message",
                  value= alertMessage
              }
          }
       }
    },
  potentialAction= {
      {
          type= "OpenUri",
          name= "View Alert",
          targets= {
              {
                  os= "default",
                  uri= "https://cambrio.domo.com/page/1205693031"
              } 
            }          
      }    
    }
}
new_payload ["@type"] = "MessageCard"
new_payload ["@context"] = "http://schema.org/extensions"
new_payload ["potentialAction"][1]["@type"] = "OpenUri"
local result, err = json.encode(new_payload)
if err then error(err) end
r: SetRequestHeader("Content-Type", "application/json")
r: SetRequestMethod("POST")
r: SetRequestBody(result)
