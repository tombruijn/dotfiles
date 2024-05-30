let lspOpts = #{autoHighlightDiags: v:true}
autocmd User LspSetup call LspOptionsSet(lspOpts)

let lspServers = [#{
  \   name: 'rustlang',
  \   filetype: ['rust'],
  \   path: 'rust-analyzer',
  \   args: [],
  \   syncInit: v:true
  \ },
  \ #{
  \   name: 'rubylang',
  \   filetype: ['ruby'],
  \   path: 'solargraph_wrapper',
  \   args: ['stdio'],
  \   syncInit: v:true
  \ }]
autocmd User LspSetup call LspAddServer(lspServers)
autocmd User LspSetup call LspOptionsSet(#{
        \   aleSupport: v:true,
        \   autoComplete: v:true,
        \   autoHighlight: v:false,
        \   autoHighlightDiags: v:true,
        \   autoPopulateDiags: v:false,
        \   completionMatcher: 'case',
        \   completionMatcherValue: 1,
        \   diagSignErrorText: 'E>',
        \   diagSignHintText: 'H>',
        \   diagSignInfoText: 'I>',
        \   diagSignWarningText: 'W>',
        \   echoSignature: v:false,
        \   hideDisabledCodeActions: v:true,
        \   highlightDiagInline: v:true,
        \   hoverInPreview: v:false,
        \   ignoreMissingServer: v:false,
        \   keepFocusInDiags: v:true,
        \   keepFocusInReferences: v:true,
        \   completionTextEdit: v:true,
        \   diagVirtualTextAlign: 'below',
        \   diagVirtualTextWrap: 'default',
        \   noNewlineInCompletion: v:true,
        \   omniComplete: v:null,
        \   outlineOnRight: v:false,
        \   outlineWinSize: 20,
        \   semanticHighlight: v:false,
        \   showDiagInBalloon: v:true,
        \   showDiagInPopup: v:true,
        \   showDiagOnStatusLine: v:false,
        \   showDiagWithSign: v:true,
        \   showDiagWithVirtualText: v:true,
        \   showInlayHints: v:true,
        \   showSignature: v:true,
        \   snippetSupport: v:false,
        \   ultisnipsSupport: v:true,
        \   useBufferCompletion: v:false,
        \   usePopupInCodeAction: v:true,
        \   useQuickfixForLocations: v:false,
        \   vsnipSupport: v:false,
        \   bufferCompletionTimeout: 100,
        \   customCompletionKinds: v:false,
        \   completionKinds: {},
        \   filterCompletionDuplicates: v:false,
  \ })

nnoremap <silent><leader>o :LspGotoDefinition<CR>
nnoremap <silent><leader>ch :LspHover<CR>
nnoremap <silent><leader>cd :LspDiag here<CR>
nnoremap <silent><leader>cr :LspRename<CR>
nnoremap <silent><leader>ci :LspGotoImpl<CR>
nnoremap <silent><leader>c/ :LspPeekReferences<CR>
nnoremap <silent><leader>c. :LspCodeAction<CR>
