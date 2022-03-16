local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

local virtual_text_ok, virtual_text = pcall(require, "nvim-dap-virtual-text")
if not virtual_text_ok then
  return
end

local dapgo_ok, dapgo = pcall(require, "dap-go")
if not dapgo_ok then
  return
end

local dapui_ok, dapui = pcall(require, "dapui")
if not dapui_ok then
  return
end

virtual_text.setup()
dapgo.setup()
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
