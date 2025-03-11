package.path = './?.lua;' .. package.path
require('./module')

local start = os.clock()

local str = 'hello world'

--case
assert(str:toLowerCase() == 'hello world', 'str:toLowerCase() did not return \'hello world\'')
assert(str:toUpperCase() == 'HELLO WORLD', 'str:toUpperCase() did not return \'HELLO WORLD\'')

--charAt
assert(str:charAt(2) == 'e', 'str:charAt(2) did not return \'e\'')
assert(str:charAt(-1) == '', 'str:charAt(-1) did not return \'\'')
assert(str:charAt(#str + 1) == '', 'str:charAt(#str + 1) did not return \'\'')

--starts/ends
assert(str:startsWith('hello'), 'str:startsWith(\'hello\') did not return true')
assert(str:startsWith(''), 'str:startsWith(\'\') did not return true')
assert(str:startsWith('not hello') == false, 'str:startsWith(\'not hello\') did not return false')

assert(str:endsWith('world'), 'str:endsWith(\'world\') did not return true')
assert(str:endsWith(''), 'str:endsWith(\'\') did not return true')
assert(str:endsWith('not world') == false, 'str:endsWith(\'not world\') did not return false')

--includes
assert(str:includes('hello'), 'str:includes(\'hello\') did not return true')
assert(str:includes('world', 3), 'str:includes(\'world\', 3) did not return true')
assert(str:includes('world', 8) == false, 'str:includes(\'world\', 8) did not return false')

--indexOf/search
assert(str:indexOf('hello') == 1, 'str:indexOf(\'hello\') did not return 1')
assert(str:indexOf('world', 3) == 7, 'str:indexOf(\'world\', 3) did not return 7')
assert(str:indexOf('world', 8) == -1, 'str:indexOf(\'world\', 8) did not return -1')

assert(str:search('hello') == 1, 'str:search(\'hello\') did not return 1')
assert(str:search('world', 3) == 7, 'str:search(\'world\', 3) did not return 7')
assert(str:search('world', 8) == -1, 'str:search(\'world\', 8) did not return -1')

--replace(all)
assert(str:replace('hello', 'goodbye') == 'goodbye world', 'str:replace(\'hello\', \'goodbye\') did not return \'goodbye world\'')
assert(str:replace('nonexistent', 'what') == 'hello world', 'str:replace(\'nonexistent\', \'what\') did not return \'hello world\'')
assert(str:replace('hello world', 'entirely different') == 'entirely different', 'str:replace(\'hello world\', \'entirely different\') did not return \'entirely different\'')
assert(str:replace(' world', '') == 'hello', 'str:replace(\' world\', \'\') did not return \'hello\'')
assert(str:replace('l', 'x') == 'hexlo world', 'str:replace(\'l\', \'x\') did not return \'hexlo world\'')

assert(str:replaceAll('hello', 'goodbye') == 'goodbye world', 'str:replaceAll(\'hello\', \'goodbye\') did not return \'goodbye world\'')
assert(str:replaceAll('nonexistent', 'what') == 'hello world', 'str:replaceAll(\'nonexistent\', \'what\') did not return \'hello world\'')
assert(str:replaceAll('hello world', 'entirely different') == 'entirely different', 'str:replaceAll(\'hello world\', \'entirely different\') did not return \'entirely different\'')
assert(str:replaceAll(' world', '') == 'hello', 'str:replaceAll(\' world\', \'\') did not return \'hello\'')
assert(str:replaceAll('l', 'x') == 'hexxo worxd', 'str:replaceAll(\'l\', \'x\') did not return \'hexxo worxd\'')

--padding
assert(str:padStart(3) == 'hello world', 'str:padStart(3) did not return \'hello world\'')
assert(str:padStart(#str + 1) == ' hello world', 'str:padStart(#str + 1) did not return \' hello world\'')
assert(str:padStart(#str + 1, 'x') == 'xhello world', 'str:padStart(#str + 1, \'x\') did not return \'xhello world\'')

assert(str:padEnd(3) == 'hello world', 'str:padEnd(3) did not return \'hello world\'')
assert(str:padEnd(#str + 1) == 'hello world ', 'str:padEnd(#str + 1) did not return \'hello world \'')
assert(str:padEnd(#str + 1, 'x') == 'hello worldx', 'str:padEnd(#str + 1, \'x\') did not return \'hello worldx\'')

--trimming
assert(('     ' .. str):trimStart() == 'hello world', '(\'     \' .. str):trimStart() did not return \'hello world\'')
assert(str:trimStart() == 'hello world', 'str:trimStart() did not return \'hello world\'')

assert((str .. '     '):trimEnd() == 'hello world', '(str .. \'     \'):trimEnd() did not return \'hello world\'')
assert(str:trimEnd() == 'hello world', 'str:trimEnd() did not return \'hello world\'')

assert(('     ' .. str .. '     '):trim() == 'hello world', '(\'     \' .. str .. \'     \'):trim() did not return \'hello world\'')
assert(str:trim() == 'hello world', 'str:trim() did not return \'hello world\'')

--concat
assert(str:concat(' ', '2') == 'hello world 2', 'str:concat(\' \', \'2\') did not return \'hello world 2\'')

--repeat
assert(str:repeat2(3) == 'hello worldhello worldhello world', 'str:repeat2(\'hello world\', 3) did not return \'hello worldhello worldhello world\'')

--slice
assert(str:slice(1, 5) == 'hello', 'str:slice(1, 5) did not return \'hello\'')
assert(str:slice(-5) == 'world', 'str:slice(-5) did not return \'world\'')
assert(str:slice(-5, 1) == '', 'str:slice(-5, 1) did not return \'\'')
assert(str:slice(5, 1) == '', 'str:slice(5, 1) did not return \'\'')

print('finished tests in ' .. (os.clock() - start) .. 's')