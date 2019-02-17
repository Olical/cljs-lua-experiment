.PHONY: compile run

castl:
	git clone https://github.com/PaulBernier/castl
	cd castl && npm link

compile: castl
	clojure -m cljs.main\
		--target nashorn\
		--optimizations simple\
		--output-dir cljs-out\
		--compile experiment.core
	castl cljs-out/main.js --jit --output dist/main.lua

run: compile
	cd dist && luajit main.lua
