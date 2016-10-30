(in-package :varjo.tests)

;;------------------------------------------------------------
;; Helper macros

(defmacro compile-vert (args version &body body)
  (destructuring-bind (in-args uniforms) (split-arguments args '(&uniform))
    `(first
      (v-compile ',uniforms ,version
                 :vertex '(,in-args ,@body)))))

(defmacro compile-frag (args version &body body)
  (destructuring-bind (in-args uniforms) (split-arguments args '(&uniform))
    `(first
      (v-compile ',uniforms ,version
                 :fragment '(,in-args ,@body)))))

(defmacro finishes-p (form)
  `(is (typep ,form 'varjo-compile-result)))

;;------------------------------------------------------------

(5am:def-suite test-all)

(5am:in-suite test-all)

(5am:test build-0
  (finishes-p
   (compile-vert () :450
     (v! 0 0 0 0))))
%inner-test-build-8
(5am:test build-1
  (finishes-p
    (compile-vert () :450
      (v! 0 0 0 0)
      (v! 0 0 0 0))))

(5am:test build-2
  (finishes-p
    (compile-vert () :450
      (let ((x 1))
	(v! 0 x 1 2))
      (v! 0 0 0 0))))
()
(5am:test build-3
  (finishes-p
    (compile-vert () :450
      (let ((x 1)
	    (y 2))
	(v! x y 1 2))
      (v! 0 0 0 0))))

(5am:test build-4
  (finishes-p
    (compile-vert () :450
      (labels ((test () 1))
	(test))
      (v! 0 0 0 0))))

(5am:test build-5
  (signals varjo-conditions:could-not-find-function
    (compile-vert () :450
      (labels ((test () 1))
	(test))
      (v! 0 (test) 0 0))))

(5am:test build-6
  (signals varjo-conditions:symbol-unidentified
    (compile-vert () :450
      (let ((x 1)
	    (y 2))
	(v! 0 x 1 2))
      (v! 0 0 y 0))))

(5am:test build-7
  (finishes-p
    (compile-vert () :450
      (labels ((test () 1))
	(v! 0 (test) 0 0)))))

(5am:test build-8
  (finishes-p
    (compile-vert () :450
      (let ((x 2))
	(labels ((test () x))
	  (v! 0 (test) 0 0))))))

(5am:test build-9
  (signals varjo-conditions:setq-type-match
    (compile-vert () :450
      ())))

(5am:test build-10
  (finishes-p
    (compile-vert () :450
      (labels ((test ((x :int)) (values x 2)))
	(v! 0 (test 1))
	(v! 0 0 0 0)))))

(5am:test build-11
  (finishes-p
    (compile-vert () :450
      (values (v! 1 2 3 4)
	      (v! 1 2)))))

(5am:test build-12
  (finishes-p
    (compile-vert () :450
      (labels ((test ((x :int)) (values (v! 0 0 0 0) 2)))
	(test 1)))))

(5am:test build-13
  (finishes-p
    (compile-vert () :450
      (labels ((test ((x :int)) (values x 2)))
	(v! 0 (int (test 1)) 0 0)))))


(5am:test build-14
  (finishes-p
    (compile-vert () :450
      (values (v! 1 2 3 4)
	      (v! 1 2))
      (v! 10 20 30 40))))

(5am:test build-15
  (finishes-p
    (compile-vert () :450
      (labels ((test ((x :int)) (values (v! 0 0 0 0) 2)))
	(test 1)
	(v! 10 20 30 40)))))

(5am:test build-16
  (finishes-p
    (compile-vert () :450
      (labels ((test ((x :int)) (values x 2)))
	(v! 0 (int (test 1)) 0 0)
	(v! 10 20 30 40)))))

(5am:test build-17
  (finishes-p
    (compile-vert () :450
      (let ((x 1))
	(let ((y 2)
	      (z 3))
	  (v! x y z)
	  (%if (> x 2)
	       (setq x y)
	       (setq x z))
	  (v! x 2 3 4))))))

(5am:test build-18
  (finishes-p
    (compile-vert () :450
      (let ((x 0)
	    (z 1))
	(v! x z)
	(switch x
	  (0 (setq z 1))
	  (1 (setq z x))
	  (2 z))
	(v! x z 3 4)))))

(5am:test build-19
  (finishes-p
    (compile-vert () :450
      (let ((x 0)
	    (z 1))
	(v! x z)
	(while (< x 10)
	  (setq x z)
	  (setq z (+ 1 1)))
	(v! x z 3 4)))))

(5am:test build-20
  (finishes-p
    (compile-vert () :450
      (let ((x 1)
	    (y 2)
	    (z 3))
	(v! x y 0 0)))))

(5am:test build-21
  (finishes-p
    (compile-vert () :450
      (multiple-value-bind (x y) (values 1 2)
	(v! 0 0 0 0)))))

;; (compile-vert () :450
;;   (let ((x 1))
;;     (v! x x)
;;     (%if (> x 2)
;; 	 1
;; 	 2)
;;     (v! x 2 3 4)))
