let soi = "soi"
let path = expand('%:p:h')

if (stridx(path, soi) > 0)
    autocmd BufNewFile *.cpp            0r ~/.config/nvim/templates/cpp.cpp
    command -nargs=1 -complete=customlist,s:listOfSamples
                \ RunOneSample
                \ call RunSample(<f-args>)
    command
                \ RunAllSamples
                \ call RunAllSamples()
    command
                \ CreateStoml
                \ call CreateStoml()
endif

let s:cppflags = "-Wall -Wextra -fdiagnostics-color=never -Wno-sign-compare -std=c++20 -O2 -static "

function! s:compileCppFile()
    let output = system("g++ " . s:cppflags . expand('%:p') ." -o " . expand("%:p:r"))
    return output
endfunction

function! RunAllSamples()
    let compiler = s:compileCppFile()
    let filename = expand('%:p:r')
    let samples = s:listOfSamples()
    split output
    1,$d
    if trim(compiler) != ""
        execute "normal! iCompiler:\n" . compiler . "\<Esc>"
        let linenum = line('.')
        call matchaddpos("Error", [linenum]) 
    else
        for sample in samples
            call s:runOneSample(sample, filename)
        endfor
    endif
    write
endfunction

function! RunSample(sample)
    let compiler = s:compileCppFile()
    let filename = expand('%:p:r')
    split output
    1,$d

    if trim(compiler) != ""
        execute "normal! iCompiler:\n" . compiler . "\<Esc>"
        let linenum = line('.')
        call matchaddpos("Error", [linenum]) 
    else
        call s:runOneSample(a:sample, filename)
    endif
    write
endfunction

function! s:runOneSample(sample, filename)
    let input = system('stoml ' . a:filename . '.stoml ' . a:sample . '.input')
    let expected = system('stoml ' . a:filename . '.stoml ' . a:sample . '.output')

    let command = 'echo "' . input . '" | ' . a:filename
    let output = system(command)

    " execute "normal! iCommand:\n" . command . "\n\n\<Esc>"
    execute "normal! iRunning sample '" . a:sample . "'\n\<Esc>"
    let linenum = line('.')-1
    call matchaddpos("DiagnosticInfo", [linenum]) 

    if trim(expected) == trim(output)
        execute "normal! iSample '" . a:sample . "' successful!\n\<Esc>"
        let linenum = line('.')-1
        call matchaddpos("Title", [linenum]) 
    else
        execute "normal! i" . a:sample . " failed!\n\<Esc>"
        let linenum = line('.')-1
        call matchaddpos("DiagnosticUnderlineError", [linenum]) 

        execute "normal! iExpected:\n" . expected . "\n\<Esc>"
        call matchaddpos("Todo", [linenum+1]) 
        let currline = line('.')-1
        for line in range(linenum+2, currline)
            call matchaddpos("Function", [line]) 
        endfor
        let linenum = currline
        execute "normal! iActual:\n" . trim(output) . "\n\<Esc>"
        call matchaddpos("Todo", [linenum+1]) 
        let currline = line('.')-1
        for line in range(linenum+2, currline)
            call matchaddpos("Constant", [line]) 
        endfor
        let linenum = currline
        execute "normal! iInput:\n" . input . "\n\<Esc>"
        call matchaddpos("Todo", [linenum+1]) 
        let currline = line('.')-1
        for line in range(linenum+2, currline)
            call matchaddpos("Number", [line]) 
        endfor
    endif
    execute "normal! i\n\<Esc>"
endfunction

function s:listOfSamples(A = "", B = "", C = "")
    let file = readfile(expand('%:p:r') . '.stoml')
    let samples = []
    for line in file
        let pre = stridx(line, '[')
        let post = stridx(line, ']')
        if (pre >= 0 && post >= 0)
            call add(samples, line[pre+1:post-1])
        endif
    endfor
    return samples
endfunction


function! CreateStoml()
    let file = expand('%:p:r') . '.stoml'
    execute 'edit ' . file
    execute "normal! i\<C-r>+\<Esc>"
    write
endfunction
