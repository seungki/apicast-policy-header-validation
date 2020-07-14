local policy = require('apicast.policy')
local _M = policy.new('Header Validation', '0.1')

local new = _M.new

local default_err_msg = 'Header not allowed!'

function _M.new(config)
  local self = new(config)

  local conf = config or {}

  self.header_name = conf.header_name
  self.header_value = conf.header_value
  self.error_msg = conf.error_msg or default_err_msg

  return self
end

function _M:access()
  if self.header_name ~= nil then
    local h_value = ngx.req.get_headers()[self.header_name]

    if h_value ~= self.header_value then
      ngx.status = ngx.HTTP_UNAUTHORIZED
      ngx.say(self.error_msg)
      ngx.exit(ngx.status)
    end
  end

end

return _M
