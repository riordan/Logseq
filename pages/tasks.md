- ## Active
	- #+BEGIN_QUERY
	  {:title "🟢 ACTIVE"
	    :query [:find (pull ?b [*])
	            :in $ ?start ?today
	            :where
	            (task ?b #{"NOW" "DOING"})
	            (between ?b ?start ?today)]
	    :inputs [:14d :today]
	    :result-transform (fn [result]
	                        (sort-by (fn [h]
	                                   (get h :block/priority "Z")) result))
	    :collapsed? false}
	  #+END_QUERY
- ## Overdue
	- query-table:: false
	  #+BEGIN_QUERY
	   {:title "⚠️ OVERDUE"
	    :query [:find (pull ?b [*])
	            :in $ ?start ?today
	            :where
	            (task ?b #{"NOW" "LATER" "TODO" "DOING"})
	            (between ?b ?start ?today)]
	    :inputs [:56d :today]
	    :collapsed? false}
	  #+END_QUERY
- ## Next
	- #+BEGIN_QUERY
	      {:title "📅 NEXT"
	    :query [:find (pull ?b [*])
	            :in $ ?start ?next
	            :where
	            (task ?b #{"NOW" "LATER" "TODO" "DOING"})
	            (between ?b ?start ?next)]
	    :inputs [:today :10d-after]
	    :collapsed? false}
	  #+END_QUERY
- ## Slipping
	- #+BEGIN_QUERY
	     {:title "🟠 SLIPPING"
	    :query [:find (pull ?b [*])
	            :in $ ?start ?today
	            :where
	            (task ?b #{"NOW" "LATER" "TODO" "DOING"})
	            (between ?b ?start ?today)]
	    :inputs [:7d :today]
	    :result-transform (fn [result]
	                        (sort-by (fn [h]
	                                   (get h :block/created-at)) result))
	    :collapsed? true}
	  #+END_QUERY
	-
- ## Stalled
	- #+BEGIN_QUERY
	  {:title "🔴 STALLED"
	    :query [:find (pull ?h [*])
	            :in $ ?start ?today
	            :where
	            (task ?b #{"NOW" "LATER" "TODO" "DOING"})
	            (between ?b ?start ?today)]
	    :inputs [:56d :8d]
	    :result-transform (fn [result]
	                        (sort-by (fn [h]
	                                   (get h :block/created-at)) result))
	    :collapsed? true}
	   ]}
	  #+END_QUERY
- ## Next 7 Days
	- #+BEGIN_QUERY
	  {:title "next 7 days' deadline or schedule"
	    :query [:find (pull ?block [*])
	            :in $ ?start ?next
	            :where
	            (or
	              [?block :block/scheduled ?d]
	              [?block :block/deadline ?d])
	            [(> ?d ?start)]
	            [(< ?d ?next)]]
	    :inputs [:today :7d-after]
	    :collapsed? false}
	  #+END_QUERY
- ## Next Month
	- #+BEGIN_QUERY
	  {:title "next 28 days' deadline or schedule"
	    :query [:find (pull ?block [*])
	            :in $ ?start ?next
	            :where
	            (or
	              [?block :block/scheduled ?d]
	              [?block :block/deadline ?d])
	            [(> ?d ?start)]
	            [(< ?d ?next)]]
	    :inputs [:today :28d-after]
	    :collapsed? false}
	  #+END_QUERY
- ## Possible Tasks
	- #+BEGIN_QUERY
	  {:title "Blocks containing TODO that are not tasks"
	   :query [:find (pull ?b [*])
	           :in $ ?query %
	           :where
	           (block-content ?b ?query)
	           (not-task ?b)]
	           :inputs ["TODO"
	                    [[(not-task ?b)
	                      (not [?b :block/marker _])]]]}
	  #+END_QUERY
-