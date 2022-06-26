- clojure
  
  1
  #+BEGIN_QUERY
  2
  {:title "All tasks"
  3
   :query [:find (pull ?b [*])
  4
           :where
  5
           [?b :block/marker _]]}
  6
  #+END_QUERY