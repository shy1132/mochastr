package = "mochastr"
version = "1.0.0-1"
source = {
   url = "git+https://github.com/shy1132/mochastr.git",
   branch = "main"
}

description = {
   summary = "most of the javascript string lib implemented in lua5.1+",
   homepage = "https://github.com/shy1132/mochastr",
   license = "MIT"
}

build = {
   type = "builtin",
   modules = {

   }
}

dependencies = {
   "lua >= 5.1"
}
