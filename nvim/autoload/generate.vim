function! generate#Generate(file)
  " If there is no file extension, do nothing

  let l:ext = fnamemodify(a:file, ':e')
  if empty(l:ext)
    return
  endif

  " Check for a skeleton subdirectory in any of the runtime directories
  let l:skeletons = globpath(&runtimepath, 'skeleton/' . 'file.' . l:ext, 0, 1)
  if empty(skeletons)
    return
  endif

  " Read the skeleton file into the 1st line.
  0 read `=skeletons[-1]`

  let l:class = fnamemodify(a:file, ':t:r')

  " For C/C++ headers, add the class name
  if vim.regex('\<[h]\(pp\)\?\>'):match_str(l:ext) then
    % substitute/ClassName/\=l:class
  " For Java files, add the class name
  elseif l:ext =~ '\<java\>'
    % substitute/ClassName/\=l:class
  endif

  " Delete the trailing newline (caused by :read)
  $ global /^$/ delete

  " Move the cursor back to the top
  call cursor([1, 1])

endfunction
