" Vim plugin of checking words spell on the code.
" Version 1.0.0
" Author kamykn
" License VIM LICENSE

scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! whiteList#initWhiteList()
	if !exists('g:CCSpellCheckWhiteList')
		let l:wl = []

		" Programming language keywords
		" Common
		let l:wl += ['elseif', 'elsif', 'elif', 'endif', 'endfor', 'endforeach', 'endswitch']
		let l:wl += ['endwhile', 'endfunction', 'xor']

		" JS: https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Reserved_Words
		let l:wl += ['let', 'const', 'var', 'typeof', 'instanceof']

		" PHP: http://php.net/manual/ja/reserved.keywords.php
		let l:wl += ['foreach', 'enddeclare', 'insteadof', 'isset']

		" Go: http://golang.jp/go_spec#Keywords
		let l:wl += ['func', 'chan', 'fallthrough', 'iota', 'imag', 'println']

		" Rust: https://qnighy.hatenablog.com/entry/2017/05/28/070000
		let l:wl += ['struct', 'impl', 'pub', 'mut', 'ref', 'fn', 'extern', 'mod', 'priv', 'proc', 'sizeof']

		" Ruby: http://secret-garden.hatenablog.com/entry/2015/06/30/000000
		let l:wl += ['nil', 'def', 'undef']

		" Clang: https://ja.wikipedia.org/wiki/キーワード_(C言語)
		let l:wl += ['typedef', 'noreturn']

		" C++: https://ja.wikipedia.org/wiki/%E3%82%AD%E3%83%BC%E3%83%AF%E3%83%BC%E3%83%89_(C%2B%2B)
		let l:wl += ['nullptr', 'wchar', 'constexpr', 'alignof', 'decltype', 'typeid']
		let l:wl +=	['noexcept', 'typename', 'alignas', 'asm', 'bitand', 'bitor', 'compl']

		" C#: https://docs.microsoft.com/ja-jp/dotnet/csharp/language-reference/keywords/
		let l:wl += ['readonly', 'sbyte', 'stackalloc', 'ascending']

		" Python: https://www.lifewithpython.com/2013/03/python-reserved-words.html
		" Java: https://ja.wikipedia.org/wiki/%E3%82%AD%E3%83%BC%E3%83%AF%E3%83%BC%E3%83%89_(Java)

		" Types
		" Common
		let l:wl += ['str', 'char', 'int', 'bool', 'dict', 'enum', 'void', 'uint', 'ulong', 'ushort']
		" Rust: https://qnighy.hatenablog.com/entry/2017/05/28/070000
		let l:wl += ['isize', 'usize', 'vec']
		" Go: http://golang.jp/go_spec#Constants
		let l:wl += ['uintptr']

		" Commands
		let l:wl += ['sudo', 'grep', 'awk', 'curl', 'wget', 'mkdir', 'rmdir', 'pwd']
		let l:wl += ['chmod', 'chown', 'apropos']

		" Famous OSS or products
		let l:wl += ['apache', 'nginx', 'github', 'wikipedia', 'linux', 'unix']
		let l:wl += ['mysql', 'postgresql', 'postgre', 'vim', 'gvim', 'emacs', 'vscode']
		let l:wl += ['csh', 'bash', 'zsh', 'ksh', 'iphone', 'redis', 'memcached', 'aws', 'gcp']

		" Programming language name: https://ja.wikipedia.org/wiki/%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0%E8%A8%80%E8%AA%9E%E4%B8%80%E8%A6%A7
		let l:wl += ['php', 'kotlin', 'clojure', 'ecma', 'lisp', 'erlang', 'clang', 'golang']
		let l:wl += ['fortran', 'haskell', 'jsx', 'lua', 'matlab', 'scala', 'html', 'css']
		let l:wl += ['less', 'sass', 'scss']

		" Top level domain: https://ja.wikipedia.org/wiki/%E3%83%88%E3%83%83%E3%83%97%E3%83%AC%E3%83%99%E3%83%AB%E3%83%89%E3%83%A1%E3%82%A4%E3%83%B3
		let l:wl += ['com', 'org', 'biz', 'xxx', 'gov', 'edu', 'tel', 'arpa', 'bitnet', 'csnet']

		" Acronyms and abbreviations
		let l:wl += ['config', 'goto', 'eval', 'exec', 'init', 'calc', 'iter']
		let l:wl += ['auth', 'sync', 'err', 'env', 'del', 'wasm', 'uniq', 'ttl', 'sec']
		let l:wl += ['tls', 'ssl']

		" Comment
		let l:wl += ['todo', 'fixme', 'fyi']

		" Protocols
		let l:wl += ['ssh', 'http', 'https', 'tcp', 'udp', 'ftp', 'ftps', 'sftp', 'imap', 'scp']

		" Other
		let l:wl += ['referer', 'localhost', 'serializer', 'mutex', 'autoload']

		let g:CCSpellCheckWhiteList = l:wl
	endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
