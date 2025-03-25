# mochastr
a port of the javascript string lib to lua5.1+, covering most of the useful non-deprecated string functions in js:

`charAt`  
`startsWith`  
`endsWith`  
`includes`  
`indexOf`  
`search`  
`split`  
`replace`  
`replaceAll`  
`padStart`  
`padEnd`  
`trimStart` (`trimLeft`)  
`trimEnd` (`trimRight`)  
`trim`  
`concat`  
`repeat` (named `repeat2` because `repeat` is a keyword)  
`toLowerCase`  
`toUpperCase`

the only difference you should notice is that numbers differ from js to lua, since lua counts from 1 instead of 0
