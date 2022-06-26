- #+BEGIN_QUERY
  	{:title "Find: TODO or DOING MyTag"
  	:query [:find (pull ?b [*])
  	:where
  [?b :block/marker ?marker]
  [(contains? #{"TODO" "DOING"} ?marker)]
  - [?p :block/name "MyTag"]
  [?b :block/ref-pages ?p]]
  	}
  	#+END_QUERY
-