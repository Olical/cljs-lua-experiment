(ns experiment.core
  (:require [cljs.core.async :as a]))

(def msgs (a/chan))

(a/go-loop []
  (println (a/<! msgs)))

(a/go
  (a/>! msgs "Hello, World! From core.async in ClojureScript -> Lua"))
