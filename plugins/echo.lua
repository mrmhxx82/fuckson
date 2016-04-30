local function run(msg, matches)
 local text = matches[2]
 if matches[1] == "echo" then
  return text
 else
  local file = io.open("./data/file/"..matches[1], "w")
  file:write(text)
  file:flush()
  file:close()
  return send_document("channel#id"..msg.to.id,"./data/file/"..matches[1], ok_cb, false)
 end
end

return {
 description = "Simplest plugin ever!",
 usage = {
  "echo [text] : return text",
  "echo> [ext] [text] : save text to file",
 },
 patterns = {
  "^[#!/][Ee](cho) (.*)$",
  "^[#!/][Ee]cho> ([^%s]+) (.*)$",
 },
 run = run
}
