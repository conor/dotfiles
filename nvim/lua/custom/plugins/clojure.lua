return {
  'Olical/conjure',
  ft = { 'clojure', 'clojurescript' },
  config = function()
    require('conjure.main').main()
    require('conjure.mapping')['on-filetype']()
    
    -- Conjure configuration
    vim.g['conjure#mapping#doc_word'] = 'K'
    vim.g['conjure#client#clojure#nrepl#eval#auto_require'] = false
    vim.g['conjure#client#clojure#nrepl#connection#auto_repl#enabled'] = false
    vim.g['conjure#log#hud#enabled'] = true
    vim.g['conjure#log#hud#width'] = 0.42
    vim.g['conjure#log#hud#height'] = 0.3
    vim.g['conjure#log#botright'] = true
  end,
}