" Vim syntax file
" Language: Jam M/R file
" Maintainer: Matt Armstrong <matt@lickey.com>
" URL:    none
" Last Change:  Feb 10, 2000

" Remove any old syntax stuff hanging around
syn clear

syn case match

" Jam keywords
syn keyword jamstyleKeywords    all if else for in actions rule local switch include case on default
syn keyword jamstyleActionModifiers   bind existing ignore piecemeal quietly together updated
syn keyword jamstyleBuiltinVars   UNIX NT VMS MAC OS2 OS OS OSVER OSPLAT JAMVERSION JAMUNAME HDRSCAN

syn keyword jamstyleBuiltins    ALWAYS DEPENDS ECHO EXIT DIE INCLUDES LEAVES NOCARE NOTFILE NOUPDATE TEMPORARY SEARCH LOCATE HDRRULE

" Jambase stuff
syn keyword jamstyleJambase   first shell files lib exe obj dirs clean uninstall Archive As BULK Bulk C++ Cc CcMv Chgrp Chmod Chown Clean CreLib FILE File Fortran GenFile GenFile1 HDRRULE HardLink HdrRule Install InstallBin InstallFile InstallInto InstallLib InstallMan InstallShell Lex Library LibraryFromObjects Link Link LinkLibraries Main MainFromObjects MakeLocate MkDir MkDir1 Object ObjectC++Flags ObjectCcFlags ObjectHdrs Objects Ranlib RmTemps Setuid Shell SubDir SubDirC++Flags SubDirCcFlags SubDirHdrs SubInclude Undefines UserObject Yacc Yacc1 addDirName makeCommon makeDirName makeGrist makeGristedName makeRelPath makeString makeSubDir makeSuffixed unmakeDir AR ARFLAGS AS ASFLAGS AWK BINDIR C++ C++FLAGS CC CCFLAGS CHMOD CP CRELIB CW CWGUSI CWMAC CWMSL DOT DOTDOT EXEMODE FILEMODE FORTRAN FORTRANFLAGS HDRS INSTALL JAMFILE JAMRULES JAMSHELL LEX LIBDIR LINK LINKFLAGS LINKLIBS LN MANDIR MKDIR MSIMPLIB MSLIB MSLINK MSRC MV NOARSCAN OPTIM RANLIB RCP RM RSH RUNVMS SED SHELLHEADER SHELLMODE SLASH STDHDRS STDLIBPATH SUFEXE SUFLIB SUFOBJ UNDEFFLAG WATCOM YACC YACCFILES YACCFLAGS SUBDIRCCFLAGS RELOCATE SEARCH_SOURCE SUBDIRHDRS MODE OSFULL SUBDIRASFLAGS SUBDIR_TOKENS LOCATE_SOURCE LOCATE_TARGET UNDEFS SOURCE_GRIST GROUP OWNER NEEDLIBS SLASHINC subinclude project project-root bin lib dll define template

" Comments
syn match  jamstyleComment  "^\s*#.*"

" Errors
syn match jamstyleError "[^ \t];"hs=s+1
syn match jamstyleGrist /<\([^>]*\)>[^ ]*/ contains=jamstyleJambase
syn match jamstylePoo "\$([^)]*)"me=e-1,hs=s+2
" syn match jamstyleVariable "\$([^)]*)" 



if !exists("did_jamstyle_syntax_inits")
  let did_jamstyle_syntax_inits = 1

  hi link jamstyleGrist     Special
"  hi link jamstyleVariable     Special
  hi link jamstylePoo     String
  hi link jamstyleKeywords    Keyword 
  hi link jamstyleActionModifiers   Keyword
  hi link jamstyleBuiltins    Special
  hi link jamstyleBuiltinVars   Special
  hi link jamstyleError     Error

  hi link jamstyleComment     Comment

  hi link jamstyleJambase     Identifier
  "hi link jamstyleOption     String
  "hi link jamstyleTag      Special
  "hi link jamstyleTagN     Identifier
  "hi link jamstyleTagError     Error
endif

let b:current_syntax = "jamstyle"
set makeprg=bjam
