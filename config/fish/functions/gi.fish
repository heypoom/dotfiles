# Defined in /var/folders/jm/l3mwrkrx7yq8nhxyg1btdzkm0000gn/T//fish.nmPbse/gi.fish @ line 2
function gi --description 'gitignore.io cli for fish'
  set -l params (echo $argv|tr ' ' ',')
  curl -s https://www.toptal.com/developers/gitignore/api/$params
end
