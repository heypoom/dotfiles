"" Lightline Configuration

let g:lightline = {
\   'colorscheme': 'dracula',
\   'active': {
\     'left': [ [ 'mode', 'paste' ],
\               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
\     'right': [ [ 'lineinfo' ],
\                [ 'filetype' ] ],
\   },
\   'component': {
\     'lineinfo': ' %3l:%-2v',
\   },
\   'component_function': {
\     'readonly': 'LightlineReadonly',
\     'gitbranch': 'LightlineFugitive',
\   },
\   'separator': { 'left': '', 'right': '' },
\   'subseparator': { 'left': '', 'right': '' }
\ }

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

if exists('g:lightline') && exists('g:dracula')
  let s:black    = g:dracula#palette.bg

  " let s:gray     = g:dracula#palette.selection
  let s:gray     = g:dracula#palette.bg

  let s:white    = g:dracula#palette.fg
  let s:darkblue = g:dracula#palette.comment
  let s:cyan     = g:dracula#palette.cyan
  let s:green    = g:dracula#palette.green
  let s:orange   = g:dracula#palette.orange
  let s:purple   = g:dracula#palette.purple
  let s:red      = g:dracula#palette.red
  let s:yellow   = g:dracula#palette.yellow

  let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
  let s:p.normal.left = [ [ s:black, s:purple ], [ s:cyan, s:gray ] ]
  let s:p.normal.right = [ [ s:black, s:purple ], [ s:white, s:darkblue ] ]
  let s:p.inactive.right = [ [ s:black, s:gray ], [ s:white, s:black ] ]
  let s:p.inactive.left =  [ [ s:cyan, s:black ], [ s:white, s:black ] ]
  let s:p.insert.left = [ [ s:black, s:green ], [ s:cyan, s:gray ] ]
  let s:p.replace.left = [ [ s:black, s:red ], [ s:cyan, s:gray ] ]
  let s:p.visual.left = [ [ s:black, s:orange ], [ s:cyan, s:gray ] ]
  let s:p.normal.middle = [ [ s:white, s:gray ] ]
  let s:p.inactive.middle = [ [ s:white, s:gray ] ]
  let s:p.tabline.left = [ [ s:darkblue, s:gray ] ]
  let s:p.tabline.tabsel = [ [ s:cyan, s:black ] ]
  let s:p.tabline.middle = [ [ s:darkblue, s:gray ] ]
  let s:p.tabline.right = copy(s:p.normal.right)
  let s:p.normal.error = [ [ s:red, s:black ] ]
  let s:p.normal.warning = [ [ s:yellow, s:black ] ]

  let g:lightline#colorscheme#dracula#palette = lightline#colorscheme#flatten(s:p)
endif
