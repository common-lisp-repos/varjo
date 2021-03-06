(in-package :varjo.tests)
(5am:in-suite stemcell-tests)

;;------------------------------------------------------------
;; Helper data

(defvar *some-test-var* 20)

(defun try-guessing-a-type-for-symbol (name)
  (when (boundp name)
    (typecase (symbol-value name)
      (single-float :float)
      (double-float :double)
      ((signed-byte 32) :int)
      ((unsigned-byte 32) :uint)
      (t (error "Cant guess a suitable type for ~s" name)))))

;;------------------------------------------------------------
;; Tests


(5am:def-test stemcells-0 (:suite stemcell-tests)
  (varjo:with-stemcell-infer-hook #'try-guessing-a-type-for-symbol
    (finishes-p
     (compile-vert () :410 t
       (v! *some-test-var* 0 0 1)))))

(5am:def-test stemcells-1 (:suite stemcell-tests)
  (labels ((test-returning-nil (name)
             (declare (ignore name))
             nil))
    (varjo:with-stemcell-infer-hook #'test-returning-nil
      (signals varjo-conditions:symbol-unidentified
       (compile-vert () :410 t
         (v! *some-test-var* 0 0 1))))))
