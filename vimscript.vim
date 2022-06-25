" https://learnxinyminutes.com/docs/vimscript/



" ##############
"  Introduction
" ##############
function! Introduction()
  echo 'Hello, ' | echo 'World!'
  echo 'Hello
        \ world'
  echo [1,
        \ 2]
endfunction



" ##########
"  Booleans
" ##########
function! Booleans()
  " `v:true` evaluates to 1 or the string 'v:true'
  " `v:false` evaluates to 0 or the string 'v:false'
  echo v:true != v:false | " '1'
  echo v:false | " 'v:false'

  if !v:false
    echo "It's true!"
  endif

  " echo x is y             | " Instance identity (lists and dictionaries)
  " echo x isnot y          | " Instance non-identity (lists and dictionaries)
endfunction



" #########
"  Strings
" #########
function! Strings()
  echo  'Let''s go!'      | " Two single quotes become one quote character"

  " Strings are compared based on their alphanumerical ordering.
  " Case sensitivity depends on the setting of 'ignorecase'.
  echo 'a' < 'b'
  " Explicit case-sensitivity is specified by appending '#' (match case) or '?'
  " (ignore case) to the operator. Prefer explicity case sensitivity when
  " writing portable scripts.
  echo  'a' <  'B'         | " True or false depending on 'ignorecase'
  echo  'a' <? 'B'         | " True
  echo  'a' <# 'B'         | " False

  " Regular expression matching:
  echo  "hi" =~  "hello"    | " Regular expression match, uses 'ignorecase'
  echo  "hi" =~# "hello"    | " Regular expression match, case sensitive
  echo  "hi" =~? "hello"    | " Regular expression match, case insensitive
  echo  "hi" !~  "hello"    | " Regular expression unmatch, use 'ignorecase'
  echo  "hi" !~# "hello"    | " Regular expression unmatch, case sensitive
  echo  "hi" !~? "hello"    | " Regular expression unmatch, case insensitive

  echo 'Hello'[1:-2]
  " An ordered zero-indexed sequence of bytes. The encoding of text into bytes
  " depends on the option |'encoding'|.
  echo  'Hellö'[4]           | " Returns a byte, not the character 'ö'
endfunction



" #######
"  Lists
" #######
function! Lists()
  " An ordered zero-indexed heterogeneous sequence of arbitrary Vim script
  " objects.

  echo [1, 2] + [2, 4]
  " NOTE [start:end] - all boundaries included!
  " Shallow copy of entire list
  echo [1, 2, 3, 4][:]
  " All slicing operations create new lists. To modify a list in-place use list
  " functions (|list-functions|) or assign directly to an item.
  " NOTE No error (just print the whole list):
  echo ['a', 'b', 'c', 'd', 'e'][0:100000]
  " NOTE You can't use negative bare indices with strings. However, you can use
  " negative indices when slicing strings though!
  echo "abcd"[-1] . "abcd"[-2:] | " <=> '' . 'cd'
endfunction



" ################
"  List Functions
" ################
function! ListFunctions()
  let foo = ['a']
  call add(foo, 'b') | " after that: ['a', 'b']
  echo len(foo) | " 2
  echo get(foo, 0, 'default') | " 'a'
  echo get(foo, 100, 'default') | " 'default'
  echo index(foo, 'b') | " 1
  echo index(foo, 'nope') | " -1
  echo join(foo) | " 'a b'
  echo join(foo, '---') | " 'a---b'
  call reverse(foo) | " after that: ['b', 'a']
endfunction



" ##############
"  Dictionaries
" ##############
function! Dictionaries()
  " An UNORDERED sequence of key-value pairs, keys are always STRINGS (numbers
  " are implicitly converted to strings).

  echo  {'a': 1, 'b': 2, }       | " Trailing comma permitted
  echo  {'a': 1, 'b': 2}.a
  " Syntactic sugar for simple keys
  echo  {'a': 1, 'b': 2}['a']
endfunction



" ###########
"  Variables
" ###########
function! Variables()
  " `let`, `const`
  " let g:my_var = 1        | " Global variable
  " let l:my_var = 1        | " Local to current function (see functions below)
  " let s:my_var = 1        | " Local to current script file
  " let a:my_arg = 1        | " Function argument (see functions below)
  " let b:my_var = 1        | " Local to current buffer
  " let w:my_var = 1        | " Local to current window
  " let t:my_var = 1        | " Local to current tab page
  let kek = 123
  unlet kek

  " The Vim scope is read-only
  " echo  v:true            | " Special built-in Vim variables (|v:var|)"
  " echo  g:                | " All `g` (or `b`, `w`, `t`, `l`, `s`, `a`) vars"

  " Access special Vim memory like variables:
  " let @a = 'Hello'        | " Register
  " let $PATH=''            | " Environment variable
  " let &textwidth = 79     | " Option
  " let &l:textwidth = 79   | " Local option
  " let &g:textwidth = 79   | " Global option

  " Function reference variables have the same restrictions as function names
  let IsString = {x -> type(x) == type('')}    | " Global: capital letter
  let s:isNumber = {x -> type(x) == type(0)}   | " Local: any name allowed

  " Assign values of list to multiple variables (number of items must match)
  let [x, y] = [1, 2]
  " Assign the remainer to a rest variable
  let [mother, father; children] = ['Alice', 'Bob', 'Carol', 'Dennis', 'Emily']
endfunction



" #######
"  Loops
" #######
function! Loops()
  for person in ['Alice', 'Bob', 'Carol', 'Dennis', 'Emily']
  endfor

  for [x, y] in [[1, 0], [0, 1], [-1, 0], [0, -1]]
    " echo 'Position: x ='  .. x .. ', y = ' .. y
  endfor

  " NOTE [start, end]
  for i in range(10, 0, -1)
  endfor

  for symbol in keys({'π': 3.14, 'e': 2.71})
  endfor

  for value in values({'π': 3.14, 'e': 2.71})
  endfor

  for [symbol, value] in items({'π': 3.14, 'e': 2.71})
  endfor
endfunction



" ####################
"  Regular expression
" ####################

" A regular expression pattern can be a string.
" Substitute 'arbidol' for 'arbidol':
" substitute/"/'/



" ###########################
"  Implicit type conversions
" ###########################
function! ImplicitTypeConversions()
  " A string becomes its numerical value if it can be parsed to a number,
  " otherwise it becomes zero.
  echo '1' + 1 | " 2
  echo '1' . 1 | " '11'
  echo 'kek' + 228 | " 228
endfunction



" ############
"  Exceptions
" ############
function! Exceptions()
  " Throw only STRINGS. Catch them by pattern-matching a REGULAR EXPRESSION.

  try
    source path/to/file
  catch /Cannot open/
    echo 'Looks like that file does not exist'
    " The second catch matches any exception
  catch /.*/
    echo 'Something went wrong, but I do not know what'
  finally
    echo 'I am done trying'
  endtry
endfunction



" ###########
"  Functions
" ###########
function! Functions()
  echo function('type')                   | " Reference to function `type()`"
  " `funcref('type')` will throw an error because the argument must be a
  " user-defined function.
  " echo funcref('type')                    | " Reference by identity, not name"
  echo  {x -> x * x}                       | " Anonymous function"
  echo  function('substitute', ['hello'])  | " Partial function"

  " " Range functions define two implicit arguments, which will be set to the range
  " " of the ex-command
  " function! FirstAndLastLine() range
  "     echo [a:firstline, a:lastline]
  " endfunction
  "
  " " Prints the first and last line that match a pattern (|cmdline-ranges|)
  " /^#!/,/!#$/call FirstAndLastLine()

  " NOTE If you do not specify an abortion command, the function will continue
  " its execution.
  function! SourceMyFile() abort
    echo 'Сalmly printed...'
    source my-file.vim        | " Try sourcing non-existing file
    echo 'This will never be printed'
  endfunction

  call SourceMyFile()

  " Closures, functions carrying values from outer scope (|:func-closure|)
  function! MakeAdder(x)
    function! Adder(n) closure
      return a:n + a:x
    endfunction
    return funcref('Adder')
  endfunction
  let AddFive = MakeAdder(5)
  echo AddFive(3)               | " Prints 8
endfunction
