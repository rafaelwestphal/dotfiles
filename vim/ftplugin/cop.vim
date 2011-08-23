" Vim syntax file
" Language: Jam M/R file
" Maintainer: Matt Armstrong <matt@lickey.com>
" URL:    none
" Last Change:  Feb 10, 2000

" Remove any old syntax stuff hanging around
syn clear

syn case match

" Jam keywords
syn keyword copKeywords    component module meta_component contained 
syn keyword copActionModifiers   test start stop data process
syn keyword copBuiltinVars  dispatcher guru log the_log void the_void undetermined notifier stderr stdout debugger interactive dispatcher_start
syn keyword copINIKeywords scalar array contained
" syn keyword copBuiltins    

" Jambase stuff
" syn keyword copJambase   

" Comments
syn match  copComment  "^\s*#.*"

syn match copStringError "\"[^"]*"
syn match copString "\"[^"]*\"" contained
syn match copArrayBegin "\["
syn match copArrayEnd "\]"
syn match copNumber "[0-9][0-9]*" contained
" syn match copAssignment "\.[A-Za-z_0-9]*\s*=\s*"
syn match copConnect "\.[A-Za-z_0-9]*\s*->"

" Errors
" syn match copError "[^ \t];"hs=s+1
" syn match copGrist /<\([^>]*\)>[^ ]*/ contains=jamstyleJambase

" syn match copArrayError "\[[^\]]*"
" syn match copArray "\[[^\]]*\]"
syn match copINIString "[A-Za-z_0-9]*:[A-Za-z_0-9]*:scalar(:\"[^"]*\"){0,1}" contains=copString,copINIKeywords contained 
syn region copINIStringRegion start="<" end=">" contains=copINIString,copString,copINIKeywords,copConcat contained
syn match copINIArray "[A-Za-z_0-9]*:[A-Za-z_0-9]*:array(:){0,1}" contained contains=copINIArray,copString,copNumber
syn region copINIArrayRegion start="<[^{]" end="[^}]>" contains=copINIArray,copArray,copINIKeywords,copConcat,copString,copNumber contained

syn region copConcat start="<{" end="}>" contains=copINIArray,copArray,copString,copINIString,copINIKeywords,copNumber

syn region copArray start="\[" end="\]" contains=copConcat,copINIArrayRegion,copINIStringRegion,copStringError,copString,copNumber,
syn match copComponentString "component\s*[A-Za-z_0-9]*\s*:\s*[A-Za-z_0-9${}]*\/[A-Za-z_0-9]*" contains=copKeywords
syn match copAssignmentStr "\.[A-Za-z_0-9]*\s*" contained
syn match copModuleString "module\s*[A-Za-z_0-9]*\s*:\s*[A-Za-z_0-9]*\.so" contains=copKeywords
syn region copAssignment start="\.[A-Za-z_0-9]*\s*=\s*" end="$" contains=copAssignmentStr,copConcat,copINIArray,copINIStringRegion,copArray,copString,copNumber
syn region copMetaComponent start="meta_component\s*[A-Za-z_0-9]\+(.*)\s*{" end="^}$" contains=copKeywords,copModuleString,copArray,copConcat,copINIArrayRegion,copINIStringRegion,copINIStringRegion,copINIArray,copAssignmentStr,copAssignment,copComponentString

" syn match copVariable "\$([^)]*)" 



if !exists("did_cop_syntax_inits")
  let did_cop_syntax_inits = 1

  hi link copGrist     Special
"  hi link copVariable     Special
  hi link copPoo     String
  hi link copKeywords    Keyword 
  hi link copINIKeywords    Keyword 
  hi link copActionModifiers   Keyword
  " hi link copBuiltins    Special
  hi link copBuiltinVars   Special
  hi link copError     Error

  hi link copComment     Comment
  hi link copString     String
  hi link copNumber     Number
  hi link copStringError     Error

  " hi link copJambase     Identifier
  "hi link copOption     String
  "hi link copTag      Special
  "hi link copTagN     Identifier
  "hi link copTagError     Error
  "hi link copArrayError     Error
  "hi link copMetaComponent Special
  hi link copConnect Identifier
  hi link copComponentString Special
  hi link copComponentString2 Special
  hi link copModuleString Special
  hi link copArray Special

  hi link copINIString Identifier
  hi link copINIStringRegion Special
  hi link copINIArray Identifier
  hi link copINIArrayRegion Special
  hi link copAssignmentStr Identifier
  hi link copAssignment Identifier
  hi link copConcat Special

"  hi link copArrayError Error
endif

let b:current_syntax = "cop"
