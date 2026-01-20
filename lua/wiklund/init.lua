vim.api.nvim_create_user_command('E', 'Ex', { nargs = 0 })
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.wo.relativenumber = true
vim.filetype.add { extension = { log = 'synkzonelog' } }
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('kickstart-java-format', { clear = true }),
  pattern = '*.java',
  callback = function()
    local root = vim.fs.find({ 'gradlew' }, { upward = true, stop = vim.env.HOME })[1]
    if not root then
      return
    end

    local file = vim.fn.expand '%:p'

    local cmd = string.format("%s/gradlew -p %s spotlessApply -PspotlessIdeHook='%s'", vim.fs.dirname(root), vim.fs.dirname(root), file)

    vim.notify('Running Spotless...', vim.log.levels.INFO)

    local output = vim.fn.system(cmd)

    if vim.v.shell_error ~= 0 then
      vim.notify('Spotless failed:\n' .. output, vim.log.levels.ERROR)
    else
      vim.cmd 'checktime'
      vim.notify('Spotless Applied', vim.log.levels.INFO)
    end
  end,
})
