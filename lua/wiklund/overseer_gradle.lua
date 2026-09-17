local overseer = require 'overseer'

local kotlin_efm = table.concat({
  'e: file://%f:%l:%c %m',
  'w: file://%f:%l:%c %m',
  'e: %f: (%l, %c): %m',
  'w: %f: (%l, %c): %m',
  '%-G%.%#',
}, ',')

local function gradle_task(name, args, desc)
  overseer.register_template {
    name = name,
    builder = function()
      return {
        cmd = { './gradlew' },
        args = vim.list_extend({ '--console=plain' }, args),
        components = {
          { 'on_output_quickfix', errorformat = kotlin_efm, open_on_match = true },
          'default',
        },
      }
    end,
    desc = desc,
    condition = {
      callback = function()
        return vim.fn.filereadable(vim.fn.getcwd() .. '/gradlew') == 1
      end,
    },
  }
end

gradle_task('gradle: assembleDebug', { 'assembleDebug' }, 'Build debug APK')
gradle_task('gradle: installDebug', { 'installDebug' }, 'Build + install')
gradle_task('gradle: unit tests', { 'testDebugUnitTest' }, 'JVM tests')
gradle_task('gradle: instrumented', { 'connectedDebugAndroidTest' }, 'Device tests')
gradle_task('gradle: lint', { 'lintDebug' }, 'Android lint')
gradle_task('gradle: clean', { 'clean' }, 'Nuke build dir')
