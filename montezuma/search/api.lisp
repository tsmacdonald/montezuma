(in-package montezuma)

(defgeneric length-norm (similarity field num-terms)
  (:documentation ""))

(defgeneric query-norm (similarity sum-of-squared-weights)
  (:documentation ""))

(defgeneric tf (similarity freq)
  (:documentation "Term frequency"))

(defgeneric sloppy-freq (similarity distance)
  (:documentation ""))

(defgeneric idf-term (similarity term searcher)                 
  (:documentation ""))

(defgeneric idf-phrase (similarity terms searcher)
  (:documentation "Computes a score factor for a phrase.

The default implementation sums the #idf(Term,Searcher) factor for each term in the phrase.

terms:: the terms in the phrase
searcher:: the document collection being searched
Return:: a score factor for the phrase"))

(defgeneric idf (similarity doc-freq num-docs)
  (:documentation ""))

(defgeneric coord (similarity overlap max-overlap)
  (:documentation ""))

(defgeneric hit (similarity)
  (:documentation "Expert: Iterates over matching all documents, yielding the document number and the score."))

(defgeneric hits-up-to (similarity max-docs)
  (:documentation "Expert: Iterates over matching documents in a range.
max:: Do not score documents past this. Default will search all documents avaliable.
returns:: true if more matching documents may remain."))

(defgeneric next? (similarity)
  (:documentation "Advances to the next document matching the query.
returns:: true iff there is another document matching the query.
When this method is used the #explain(int) method should not be used.
"))

(defgeneric doc (similarity)
  (:documentation "Returns the current document number matching the query. Initially invalid, until #next?() is called the first time.
"))

(defgeneric score (similarity)
  (:documentation "Returns the score for the current document matching the query. Initially invalid, until #next?() is called the first time.
"))

(defgeneric skip-to (similarit target)
  (:documentation "Skips to the first match beyond the current whose document number is greater than or equal to a given target.

When this method is used the #explain(int) method should not be used.

target:: The target document number.
returns:: true iff there is such a match.

Behaves as if written:

  def skip_to(target) 
    begin 
      return false if not next?()
    end while (target > doc())
    return true
  end

Most implementations are considerably more efficient than that."))


(defgeneric explain-score (similarity document-number)
  (:documentation "Returns an explanation of the score for a document. When this method is used, the #next?(), #skip_to(int) and #score(HitCollector) methods should not be used.
doc:: The document number for the explanation.
"))

;;; ---------------------------------------------------------------------------

(defgeneric create-weight (query searcher)
  (:documentation ""))

(defgeneric weight (query searcher)
  (:documentation "Expert: Constructs and initializes a Weight for a top-level query. "))

(defgeneric rewrite (query reader)
  (:documentation " Expert: called to re-write queries into primitive queries."))

(defgeneric compare (query queries)
  (:documentation "Expert: called when re-writing queries under MultiSearcher. Only implemented by derived queries, with no #create_weight() implementatation."))

(defgeneric extract-terms (qyery terms)
  (:documentation "Expert: adds all terms occuring in this query to the terms set"))

(defgeneric merge-boolean-queries (query queries)
  (:documentation "Expert: merges the clauses of a set of BooleanQuery's into a single BooleanQuery. A utility for use by #combine() implementations."))

(defgeneric similarity-implementation (query searcher)
  (:documentation "Expert: Returns the Similarity implementation to be used for this query.  Subclasses may override this method to specify their own Similarity implementation, perhaps one that delegates through that of the Searcher.  By default the Searcher's Similarity implementation is returned."))

(defgeneric term-doc-freq (searcher term)
  (:documentation ""))
