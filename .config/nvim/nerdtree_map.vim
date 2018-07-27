" This file must be placed in ~/.bundle/nerdtree/nerdtree_plugin/
call NERDTreeAddKeyMap({
       \ 'key': 'l',
       \ 'scope': 'Node',
       \ 'callback': 'NERDTreeMyActivate',
       \ 'quickhelpText': 'open file/directory' })

call NERDTreeAddKeyMap({
       \ 'key': 'h',
       \ 'scope': 'Node',
       \ 'callback': 'NERDTreeMyActivate',
       \ 'quickhelpText': 'open file/directory' })

function! NERDTreeMyActivate(node)
    call a:node.activate()
endfunction

