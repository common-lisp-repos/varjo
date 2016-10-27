(in-package :varjo)

;;------------------------------------------------------------
;; GLSL Variables
;;----------------

(defclass v-value ()
  ((type :initarg :type :initform nil :accessor v-type)
   (glsl-name :initarg :glsl-name :accessor v-glsl-name)
   (function-scope :initarg :function-scope :initform 0
                   :accessor v-function-scope)
   (read-only :initarg :read-only :initform nil :reader v-read-only)
   (flow-ids :initarg :flow-ids :initform (error 'flow-id-must-be-specified-vv)
	     :reader flow-ids)))

(defmethod v-make-value ((type v-t-type) env
                         &key (glsl-name (gensym))
			   (flow-ids (flow-id!)) function-scope
			   read-only)
  (make-instance 'v-value :type type :glsl-name glsl-name
                 :function-scope (or function-scope (v-function-scope env))
		 :flow-ids flow-ids :read-only read-only))

(defmethod v-make-value ((type t) env
                         &key (glsl-name (gensym))
			   (flow-ids (flow-id!)) function-scope
			   read-only)
  (make-instance 'v-value :type (type-spec->type type) :glsl-name glsl-name
                 :function-scope (or function-scope (v-function-scope env))
		 :flow-ids flow-ids :read-only read-only))

(defun v-value-equal (a b)
  (equal (v-glsl-name a) (v-glsl-name b)))


(defun add-glsl-vars (env source)
  (loop :for (restrict . vars) :in source
     :if (or (equal restrict t)
             (context-ok-given-restriction (v-context env) (listify restrict)))
     :do (loop :for (lisp-name glsl-name type-spec setable) :in vars :do
            (let ((type (type-spec->type type-spec)))
              (%add-var lisp-name (v-make-value
                                   type env :glsl-name glsl-name
                                   :flow-ids (%gl-flow-id!) :read-only (not setable))
			env)
              (add-reserved-lisp-name lisp-name env glsl-name))))
  env)

;;--------------------------------------------------

(defclass mval ()
  ((value :initarg :value :reader multi-val-value)
   (qualifiers :initarg :qualifiers :reader multi-val-qualifiers)))

(defun make-mval (v-value &optional qualifiers)
  (make-instance 'mval :value v-value :qualifiers qualifiers))

(defun mval->out-form (mval env)
  (declare (ignore env))
  (with-slots (value qualifiers) mval
    `(%out (,(gensym "OUT") ,@qualifiers) ,value)))
