-- Debugger ui setup

require('dapui').setup()

-- Go Support

require('dap-go').setup()

-- Python Support
require('dap-python').setup('~/.virtualenvs/debugpy/python')

