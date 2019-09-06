
local method = ngx.req.get_method():lower()
local url = ngx.var.uri
local args = ngx.req.get_uri_args()

ngx.log(ngx.STDERR, "'**START**'")

local cjson = require "cjson"
-- make a subrequest, passing the request body
local res = ngx.location.capture("/v", { method = ngx.HTTP_GET })
if res.status == ngx.HTTP_OK then
    ngx.log(ngx.STDERR, "'**RECEIVED**'")
    -- ngx.print(res.body)
else
    ngx.header['Content-Type'] = 'text/plain'
    ngx.status = ngx.HTTP_BAD_REQUEST
    ngx.say("invalid request")
    return
end

-- if we have a valid request, decode response as JSON
local success, response = pcall(cjson.decode, res.body)
ngx.log(ngx.STDERR, "'**SUCCESS**'")
ngx.log(ngx.STDERR, response.request_id)

ngx.header['Content-Disposition'] = 'inline'
ngx.header['Content-Length'] = string.len(response.data.data.content)
ngx.say(response.data.data.content)
return ngx.exit(ngx.HTTP_OK)