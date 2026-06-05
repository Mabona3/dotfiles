local naughty = require('naughty')

naughty.config.presets = {
  timeout = 3,
  critical = {
    timeout = 3
  }
}

naughty.notify({
  text= "Reloaded Awesome",
})
