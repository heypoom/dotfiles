# Gitignore CLI
function gi --description 'gitignore.io cli for fish'
  set -l params (echo $argv|tr ' ' ',')
  curl -s https://www.gitignore.io/api/$params
end
