.PHONY: run

castl:
	git clone https://github.com/PaulBernier/castl
	cd castl && npm link

dist: castl src/experiment/core.cljs
	clojure -m cljs.main\
		--target nashorn\
		--optimizations simple\
		--output-dir cljs-out\
		--compile experiment.core
	castl cljs-out/main.js --jit --output dist/main.lua

run: dist
	cd dist && luajit main.lua
