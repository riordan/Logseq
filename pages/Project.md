- {:title [:h2 "Project List"]
   :query [:find (pull ?b [*])
         :where
         [?b :block/properties ?p]
         [(get ?p :type) ?t]
         [(= "programming_lang" ?t)]]
   }