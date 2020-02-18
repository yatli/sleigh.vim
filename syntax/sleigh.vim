" Vim syntax file
" Language: Ghidra SLEIGH specification file
" Maintainer: Yatao Li
" Latest Revision: 18 Feburary 2020

if exists("b:current_syntax")
    finish
endif

let s:cs_cpo_save = &cpo
set cpo&vim


syn keyword sleighKeywords      names noflow unimpl
syn keyword sleighConditionals  if context default
syn keyword sleighOperators     is with attach build call crossbuild dec export goto pcodeop return
syn keyword sleighStorageClass  ram_space register_space local bitrange values variables
syn keyword sleighType          alignment hex big little endian signed offset size space wordsize token type
syn keyword sleighMacro         define macro
" see: https://ghidra.re/courses/languages/html/sleigh_ref.html
syn keyword sleighFunc          zext sext carry scarry sborrow nan abs sqrt int2float float2float trunc ceil floor round cpool newobject ident

" Comments
"
" PROVIDES: @sleighCommentHook
"
syn keyword sleighTODO		contained TODO FIXME XXX NOTE
syn match   sleighComment       "^\s*\#.*$"                   contains=@sleighCommentHook,sleighTODO,@Spell

" Strings and constants
syn region  sleighString        start=+"+  end=+"+ end=+$+ contains=@Spell
syn match   sleighNumber        "\<\(0[0-7]*\|0[xX]\x\+\|0b[0-1]\+\|\d\+\)\>"
syn match   sleighNumber        "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="

" Constructors
syn match   sleighConstructor   "\w*:\w\+"

" Preprocessors
syn match   sleighPreproc       /@\(define\|include\|undef\|ifdef\|ifndef\|if\|elif\|endif\|else\)/

" link to standard groups
hi def link sleighKeywords      Keyword
hi def link sleighConditionals  Conditional
hi def link sleighOperators     Function
hi def link sleighStorageClass  StorageClass
hi def link sleighType          Type
hi def link sleighConstructor   Identifier
hi def link sleighMacro         Macro
hi def link sleighPreproc       Preproc
hi def link sleighTodo          Todo
hi def link sleighComment       Comment
hi def link sleighString        String
hi def link sleighNumber        Number
hi def link sleighFunc          Function

let b:current_syntax = "sleigh"

let &cpo = s:cs_cpo_save
unlet s:cs_cpo_save

" vim: ts=8
