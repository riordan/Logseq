- Project List
  query-table:: false
  #+BEGIN_QUERY
  {:title [:h2 "Project List"]
   :query [:find (pull ?b [*])
         :where
         [?b :block/properties ?p]
         [(get ?p :type) ?t]
         [(= "project" ?t)]]
   }
  #+END_QUERY
-