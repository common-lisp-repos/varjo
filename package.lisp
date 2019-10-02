(uiop:define-package #:%varjo.usings (:use)
  ;; We use a few symbols from other projects
  ;; so we just localize that here
  (:import-from :alexandria
                :compose
                :curry
                :emptyp
                :ensure-list
                :flatten
                :hash-table-keys
                :hash-table-values
                :iota
                :mappend
                :rcurry
                :with-gensyms)
  (:import-from :named-readtables
                :in-readtable)
  (:export
   :compose
   :curry
   :emptyp
   :ensure-list
   :flatten
   :hash-table-keys
   :hash-table-values
   :in-readtable
   :iota
   :mappend
   :rcurry
   :with-gensyms))

(uiop:define-package #:varjo.utils
    (:use #:cl #:%varjo.usings)
  (:export
   :case-member
   :case=
   :dbind
   :pipe->
   :vbind
   :vlist
   :assocr
   :cons-end
   :elt*
   :find-duplicates
   :find-similarly-named-symbol
   :group
   :group-by
   :kwd
   :lambda-list-get-names
   :lambda-list-split
   :last1
   :listify
   :nth-or-self
   :n-of
   :p-symb
   :positions-if
   :split-arguments
   :symb
   :a-get
   :a-get1
   :a-add
   :a-set
   :a-remove-all
   :%peek))

(uiop:define-package #:vari.types
    (:use #:cl #:varjo.utils #:%varjo.usings)
  (:export :v-type
           :v-stemcell
           :v-shadow-type
           :v-ephemeral-type
           :v-ephemeral-array
           :v-unrepresentable-value
           :v-block-array
           :v-block-struct
           :v-or
           :v-any-one-of
           :v-error
           ;;
           :v-container
           :v-array
           :v-number
           :v-real
           :v-integer
           :v-rational
           :v-vector
           :v-fvector
           :v-bvector
           :v-uvector
           :v-ivector
           :v-dvector
           :v-matrix
           :v-dmatrix
           :v-dmat4x4
           :v-struct
           :v-user-struct
           :v-sampler
           :v-complex
           :v-ratio
           ;;
           :v-function-type
           :v-user-function
           ;;
           :v-discarded
           :v-returned
           :v-void
           :v-bool
           :v-int
           :v-uint
           :v-float
           :v-short-float
           :v-double
           :v-mat2
           :v-mat3
           :v-mat4
           :v-dmat2
           :v-dmat2x2
           :v-dmat2x3
           :v-dmat2x4
           :v-dmat3
           :v-dmat3x2
           :v-dmat3x3
           :v-dmat3x4
           :v-dmat4
           :v-dmat4x2
           :v-dmat4x3
           :v-mat2x2
           :v-mat2x3
           :v-mat2x4
           :v-mat3x2
           :v-mat3x3
           :v-mat3x4
           :v-mat4x2
           :v-mat4x3
           :v-mat4x4
           :v-vec2
           :v-vec3
           :v-vec4
           :v-bvec2
           :v-bvec3
           :v-bvec4
           :v-uvec2
           :v-uvec3
           :v-uvec4
           :v-ivec2
           :v-ivec3
           :v-ivec4
           :v-dvec2
           :v-dvec3
           :v-dvec4
           :v-isampler-1d
           :v-isampler-1d-array
           :v-isampler-2d
           :v-isampler-2d-array
           :v-isampler-2d-ms
           :v-isampler-2d-ms-array
           :v-isampler-2d-rect
           :v-isampler-3d
           :v-isampler-buffer
           :v-isampler-cube
           :v-isampler-cube-array
           :v-sampler-1d
           :v-sampler-1d-array
           :v-sampler-1d-array-shadow
           :v-sampler-1d-shadow
           :v-sampler-2d
           :v-sampler-2d-array
           :v-sampler-2d-array-shadow
           :v-sampler-2d-ms
           :v-sampler-2d-ms-array
           :v-sampler-2d-rect
           :v-sampler-2d-rect-shadow
           :v-sampler-2d-shadow
           :v-sampler-3d
           :v-sampler-buffer
           :v-sampler-cube
           :v-sampler-cube-array
           :v-sampler-cube-array-shadow
           :v-sampler-cube-shadow
           :v-usampler-1d
           :v-usampler-1d-array
           :v-usampler-2d
           :v-usampler-2d-array
           :v-usampler-2d-ms
           :v-usampler-2d-ms-array
           :v-usampler-2d-rect
           :v-usampler-3d
           :v-usampler-buffer
           :v-usampler-cube
           :v-usampler-cube-array
           :v-usampler-rect
           :v-isampler-rect
           :v-sampler-rect
           ;;
           :v-atomic-uint
           ;;
           :v-uimage-buffer
           :v-iimage-buffer
           :v-buffer-image
           :v-ibuffer-image
           :v-iimage-1d
           :v-iimage-1d-array
           :v-iimage-2d
           :v-iimage-2d-array
           :v-iimage-2d-ms
           :v-iimage-2d-ms-array
           :v-iimage-2d-rect
           :v-iimage-3d
           :v-iimage-cube
           :v-iimage-cube-array
           :v-iimage-rect
           :v-image-1d
           :v-image-1d-array
           :v-image-2d
           :v-image-2d-array
           :v-image-2d-ms
           :v-image-2d-ms-array
           :v-image-2d-rect
           :v-image-3d
           :v-image-buffer
           :v-image-cube
           :v-image-cube-array
           :v-image-rect
           :v-ubuffer-image
           :v-uimage-1d
           :v-uimage-1d-array
           :v-uimage-2d
           :v-uimage-2d-array
           :v-uimage-2d-ms
           :v-uimage-2d-ms-array
           :v-uimage-2d-rect
           :v-uimage-3d
           :v-uimage-cube
           :v-uimage-cube-array
           :v-uimage-rect))

;;;; package.lisp
(uiop:define-package #:varjo-conditions
    (:use #:cl #:varjo.utils #:%varjo.usings)
  (:export :problem-with-the-compiler
           :cannot-compile
           :invalid-form-list
           :no-function-returns
           :not-core-type-error
           :invalid-function-return-spec
           :unknown-type-spec
           :duplicate-name
           :clone-global-env-error
           :cannot-swizzle-this-type
           :clean-global-env-error
           :could-not-find-function
           :could-not-find-any
           :no-valid-function
           :return-type-mismatch
           :emit-type-mismatch
           :non-place-assign
           :setq-readonly
           :assigning-to-readonly
           :assignment-type-match
           :setq-type-match
           :cannot-not-shadow-core
           :out-var-name-taken
           :unknown-variable-type
           :var-type-mismatch
           :switch-type-error
           :loop-will-never-halt
           :for-loop-simple-expression
           :for-loop-only-one-var
           :invalid-for-loop-type
           :no-version-in-context
           :name-unsuitable
           :unable-to-resolve-func-type
           :out-var-type-mismatch
           :fake-type-global
           :invalid-context-symbol
           :args-incompatible
           :invalid-shader-stage
           :swizzle-keyword
           :multi-func-stemcells
           :uniform-in-sfunc
           :invalid-v-defun-template
           :keyword-in-function-position
           :invalid-symbol-macro-form
           :stage-order-error
           :multi-val-bind-mismatch
           :merge-env-func-scope-mismatch
           :merge-env-parent-mismatch
           :env-parent-context-mismatch
           :symbol-unidentified
           :if-form-type-mismatch
           :bad-make-function-args
           :none-type-in-out-vars
           :body-block-empty
           :flow-ids-mandatory
           :flow-id-must-be-specified-vv
           :flow-id-must-be-specified-co
           :multiple-flow-ids-regular-func
           :if-branch-type-mismatch
           :if-test-type-mismatch
           :cross-scope-mutate
           :illegal-implicit-args
           :invalid-flow-id-multi-return
           :loop-flow-analysis-failure
           :invalid-env-vars
           :values-safe-wasnt-safe
           :empty-progn
           :name-clash
           :name-mismatch
           :function-with-no-return-type
           :external-function-invalid-in-arg-types
           :invalid-special-function-arg-spec
           :closures-not-supported
           :cannot-establish-exact-function
           :dup-name-in-let
           :dup-names-in-let
           :uninitialized-var
           :global-uninitialized-var
           :nil-return-set
           :with-fresh-env-scope-missing-env
           :stage-primary-type-mismatch
           :multi-dimensional-array
           :make-array-mandatory-args
           :make-array-conflicting-args
           :make-array-conflicting-lengths
           :make-array-cant-cast-args
           :make-array-cant-establish-default-value
           :should-be-quoted
           :should-be-constant
           :stage-in-context
           :invalid-stage-kind
           :invalid-primitive-for-geometry-stage
           :rolling-translate-invalid-stage
           :couldnt-convert-primitive-for-geometry-stage
           :test-translate-failed
           :returns-in-geometry-stage
           :primitives-dont-match
           :tessellation-control-expects-patches
           :tessellation-evaluation-invalid-primitive
           :emit-not-in-geometry-stage
           :inline-glsl-vertex-stage-not-supported
           :clashes-found-between-input-and-output-names
           :user-func-invalid-x
           :invalid-inline-glsl-stage-arg-layout
           :return-set-mismatch
           :funcall-of-special-operator
           :slot-value-on-non-struct
           :slot-not-found
           :v-def-template-arg-mismatch
           :cannot-take-reference-to-&rest-func
           :illegal-&rest-in-args
           :illegal-&uniform-in-args
           :attempted-transform-feedback-in-fragment-shader
           :transform-feedback-incorrect-stage
           :invalid-feedback-qualifier-form
           :invalid-primitive-for-compute-stage
           :compute-pipeline-may-only-contain-one-stage
           :stage-must-have-local-size-declaration
           :stage-must-have-output-prim-declaration
           :stage-must-have-output-patch-declaration
           :compute-stage-with-in-args
           :uniform-ubo-and-ssbo
           :ubo-ssbo-type-limitation
           :compute-stage-must-be-void
           :unknown-layout-specifier
           :find-mutual-type-bug
           :void-type-for-conditional-test
           :discarded-for-conditional-test
           :discard-not-in-fragment-stage
           :opaque-data-found
           :invalid-output-primitive-for-geometry
           :let-or
           :let-or-functions
           :let-void
           :let-discarded
           :let-returned
           :conditional-return-type-mismatch
           :if-form-multiple-vals-mismatch
           :v-deprecated
           :fragment-integer-inputs-not-flat
           :invalid-coerce
           :conditional-multiple-vals-mismatch
           :primitive-in-context
           :no-args-remove-in-unrep-inlining
           :invalid-glsl-numeric-literal
           :invalid-the-declaration
           :invalid-type-for-dummy-function
           :struct-cannot-hold-ephemeral-types
           :arrays-cannot-hold-ephemeral-types
           :incorrect-stage-for-shared-variables
           :shared-opaque
           :alt-type-name-already-taken
           :unknown-alt-type-name
           :invalid-arguments-for-special-op
           :constant-arg-names
           :failed-to-inline-with-slots-block-expression
           :with-slots-inline-form-invalid-syntax
           :slot-value-count-not-find-slot
           :invalid-gs-invocation-count
           :invalid-stage-for-instancing

           ;; restarts
           :setq-supply-alternate-type))

(uiop:define-package #:varjo.internals
    (:use #:cl #:varjo.utils #:vari.types #:%varjo.usings
          #:varjo-conditions)
  (:export :%gen-assignment-string
           :%glsl-decl
           :%merge-multi-env-progn
           :%synthesize
           :%values-for-return
           :*default-version*
           :*emit-var-name-base*
           :*return-var-name-base*
           :*stage-names*
           :*stage-type-names*
           :*supported-versions*
           :valid-primitive-name-p
           :%uniform-name
           :a-add
           :add-alternate-type-name
           :add-equivalent-name
           :add-external-function
           :add-form-binding
           :add-form-bindings
           :add-global-form-binding
           :add-symbol-binding
           :add-type-to-stemcell-code
           :all-functions
           :allows-stemcellsp
           :args
           :arg-num
           :arguments
           :base-environment
           :binding-accesible-p
           :block-name
           :block-name-string
           :build-function
           :calc-place-tree
           :captured-vars
           :cast-for-array-literal
           :checkpoint-flow-ids
           :code
           :combine-metadata
           :compile-declares
           :compile-external-func-returning-ref
           :compile-form
           :compile-forms-not-propagating-env-returning-list-of-compiled
           :compile-forms-propagating-env-returning-list-of-compiled
           :compile-let
           :compile-list-form
           :compile-literal
           :compile-place
           :compile-progn
           :compiled
           :compiled-stage
           :compiled-vertex-stage
           :compiled-tessellation-control-stage
           :compiled-tessellation-evaluation-stage
           :compiled-geometry-stage
           :compiled-fragment-stage
           :compiled-compute-stage
           :compiler-macro-expansion-environment
           :context
           :copy-compiled
           :core-typep
           :cpu-side-transform
           :current-line
           :def-metadata-infer
           :define-metadata-infer
           :def-metadata-kind
           :define-metadata-kind
           :def-shadow-type-constructor
           :define-shadow-type-constructor
           :define-vari-trait
           :define-vari-trait-implementation
           :define-vari-function
           :define-glsl-template-function
           :define-vari-struct
           :define-vari-type
           :define-vari-macro
           :define-vari-compiler-macro
           :define-alternate-type-name
           :default-value
           :delete-external-function
           :dynamic
           :emit-set
           :end-line
           :end-line-str
           :env
           :env->
           :env-depth
           :env-merge-history
           :env-prune*
           :env-prune-many
           :env-replace-parent
           :env-replace-symbol-bindings
           :ephemeral-p
           :expanded-input-variables
           :expansion
           :ext-func-compile-chain
           :external-function
           :external-function-p
           :extract-declares
           :extract-declares-and-doc-string
           :extract-details-from-problematic-closures
           :extract-value-qualifiers
           :extended-environment
           :find-env-bindings
           :find-form-binding-by-literal
           :find-mutual-cast-type
           :flow-id!
           :flow-identifier
           :flow-ids
           :flow-id-scope
           :format-external-func-for-error
           :fragment-stage
           :fresh-env
           :fresh-environment
           :func
           :function-obj
           :functions
           :gen-array-literal-string
           :gen-bin-op-string
           :gen-bool-and-string
           :gen-bool-or-string
           :gen-for-loop-chunk
           :gen-macro-function-code
           :gen-or-type
           :gen-setq-assignment-string
           :gen-switch-chunk
           :gen-swizzle-string
           :gen-while-chunk
           :geometry-stage
           :get-primitive-type-from-context
           :get-stage-kind-from-context
           :get-stemcell-name-for-flow-id
           :get-symbol-binding
           :glsl-chunk
           :glsl-chunk*
           :glsl-chunk-emptyp
           :glsl-chunk-from-compiled
           :glsl-chunk-lines
           :glsl-chunk-splicing
           :glsl-code
           :glsl-line
           :glsl-name
           :glsl-string
           :glsl-to-compile-result
           :glsl-versions
           :id=
           :ids
           :id~=
           :implicit-args
           :implicit-return
           :implicit-uniforms
           :in-arg-flow-ids
           :in-args
           :in-declarations
           :in-out-args
           :indent
           :inject-implicit-uniform
           :input-variable-glsl
           :input-variables
           :input-variable
           :shader-variable
           :implicit-uniform-variable
           :join-glsl-chunks
           :join-glsl-of-compiled
           :line-loop
           :line-strip
           :line-strip-adjacency
           :lines
           :lines-adjacency
           :lisp-code
           :lisp-name
           :lisp-name->glsl-name
           :location
           :macro-expansion-environment
           :main-metadata
           :make-compiled
           :make-dummy-function-from-type
           :make-env-with-place-modification
           :make-function-set
           :make-regular-macro
           :make-stage
           :create-stage
           :make-symbol-macro
           :make-type-set
           :make-type-set*
           :merge-compiled
           :merge-multi-env-progn
           :merge-progn
           :metadata-for-flow-id
           :macro-obj
           :name
           :nth-return-name
           :origin-env
           :out-declarations
           :out-of-scope-args
           :out-set
           :output-variable-glsl
           :output-variables
           :p-env
           :patches
           :place-tree
           :points
           :postfix-glsl-index
           :prefix-type-to-string
           :previous-stage
           :primary-type
           :primitive
           :primitive-in
           :primitive-name-to-instance
           :primitive-out
           :pure-p
           :quads
           :qualifiers
           :qualifier
           :qualifier=
           :feedback-qualifier
           :feedback-group
           :qualify-type
           :raw-out-set
           :remove-alternate-type-name
           :register-reserved-name
           :replace-flow-id
           :replace-flow-ids-for-single-var
           :replace-flow-ids-for-specific-value
           :reset-flow-ids-to-checkpoint
           :resolve-name-from-alternative
           :return-set
           :rolling-translate
           :safe-glsl-name-string
           :score
           :secondary-score
           :set-flow-id
           :signatures
           :stage
           :stage-kind
           :stage-where-first-return-is-position-p
           :starting-stage
           :stemcellp
           :stemcells
           :stemcells-allowed
           :swizzlable-p
           :tessellation-control-stage
           :tessellation-evaluation-stage
           :compute-stage
           :test-translate-function-split-details
           :to-arg-form
           :to-block
           :top-level-scoped-metadata
           :translate
           :triangle-fan
           :triangle-strip
           :triangle-strip-adjacency
           :triangles
           :triangles-adjacency
           :try-compile-arg
           :type->type-spec
           :type-set
           :type-set-to-type-list
           :type-sets-equal
           :type-spec->type
           :type-specp
           :uniform-variables
           :uniform-variable
           :uniforms
           :used-external-functions
           :used-types
           :used-user-structs
           :user-function-p
           :v-allowed-outer-vars
           :v-argument-spec
           :v-array-type-of
           :v-casts-to
           :v-casts-to-p
           :v-code
           :v-compile
           :v-compiler-macro
           :v-context
           :v-def-glsl-template-fun
           :v-define-compiler-macro
           :v-defmacro
           :v-declaim
           :v-defspecial
           :v-defstruct
           :v-deftype
           :v-defun
           :v-dimensions
           :v-doc-string
           :v-element-type
           :v-errorp
           :v-global-form-bindings
           :v-function
           :v-function-scope
           :v-function-set
           :v-glsl-size
           :v-glsl-string
           :v-macro-function
           :v-macros
           :v-make-value
           :v-multi-val-base
           :v-multi-val-safe
           :v-parent-env
           :v-place-index
           :v-primary-type-eq
           :v-read-only
           :v-regular-macro
           :v-return-spec
           :v-slots
           :v-special-functionp
           :v-symbol-bindings
           :v-symbol-macro
           :v-terminated-p
           :v-type-eq
           :v-type-of
           :v-typep
           :v-uniforms
           :v-value
           :v-versions
           :v-voidp
           :v-discarded-p
           :v-returned-p
           :values-safe
           :vec-of
           :vertex-count
           :vertex-stage
           :with-constant-inject-hook
           :with-fresh-env-scope
           :with-stemcell-infer-hook
           :with-unknown-first-class-functions-allowed
           :with-v-arg
           :with-v-let-spec
           :parse-qualifier
           :*in-qualifier*
           :*out-qualifier*
           :check-args-for-constant-names))

(uiop:define-package #:varjo.api
    (:use #:cl #:varjo.utils #:varjo.internals #:%varjo.usings)
  (:export
   ;;
   ;; globals
   :*default-version*
   :*stage-names*
   :*stage-type-names*
   :*supported-versions*
   ;;
   ;; stages
   :vertex-stage
   :tessellation-control-stage
   :tessellation-evaluation-stage
   :geometry-stage
   :fragment-stage
   :compute-stage
   ;;
   ;; primitives, etc
   :valid-primitive-name-p
   :dynamic
   :line-loop
   :line-strip
   :line-strip-adjacency
   :lines
   :lines-adjacency
   :patches
   :points
   :quads
   :triangle-fan
   :triangle-strip
   :triangle-strip-adjacency
   :triangles
   :triangles-adjacency
   :vertex-count
   ;;
   ;; functions/macros
   :add-external-function
   :define-glsl-template-function
   :define-vari-compiler-macro
   :define-vari-function
   :define-vari-macro
   :delete-external-function
   :v-def-glsl-template-fun
   :v-define-compiler-macro
   :v-defmacro
   :v-defstruct
   :v-defun
   ;;
   ;; types
   :add-equivalent-name
   :define-alternate-type-name
   :add-alternate-type-name
   :remove-alternate-type-name
   :combine-metadata
   :core-typep
   :def-metadata-infer
   :def-metadata-kind
   :def-shadow-type-constructor
   :define-alternate-type-name
   :define-metadata-infer
   :define-metadata-kind
   :define-shadow-type-constructor
   :define-vari-struct
   :define-vari-type
   :ephemeral-p
   :feedback-group
   :feedback-qualifier
   :find-mutual-cast-type
   :make-type-set
   :qualifier
   :type->type-spec
   :type-spec->type
   :type-specp
   :v-casts-to
   :v-casts-to-p
   :v-deftype
   :v-dimensions
   :v-element-type
   :v-errorp
   :v-special-functionp
   :v-type-eq
   :v-typep
   ;;
   ;; environment
   :add-lisp-form-as-uniform
   :all-bound-symbols
   :argument-is-uniform-p
   :argument-type
   :argument-uniform-name
   :metadata-for-argument
   :metadata-for-variable
   :variable-in-scope-p
   :variable-is-uniform-p
   :variable-type
   :variable-uniform-name
   :variables-in-scope
   ;;
   ;; stages
   :make-stage
   :create-stage
   :stage-kind
   :lisp-code
   :input-variables
   :uniform-variables
   :context
   :stemcells-allowed
   :primitive-in
   :input-variable
   :uniform-variable
   :shader-variable
   :implicit-uniform-variable
   ;;
   ;; compilation
   :translate
   :rolling-translate
   :v-compile
   ;;
   ;; test compilation
   :test-translate-function-split-details
   ;;
   ;; compiled stages
   :compiled-stage
   :compiled-vertex-stage
   :compiled-tessellation-control-stage
   :compiled-tessellation-evaluation-stage
   :compiled-geometry-stage
   :compiled-fragment-stage
   :compiled-compute-stage
   :glsl-code
   :output-variables
   :implicit-uniforms
   :used-external-functions
   :primitive-out
   :block-name-string
   ;;
   ;; compiled vars
   :name
   :qualifiers
   :glsl-name
   :v-type-of
   :location
   :v-glsl-size
   :cpu-side-transform
   ;;
   ;; hooks
   :with-stemcell-infer-hook
   :with-constant-inject-hook
   ;;
   ;; testing
   :with-unknown-first-class-functions-allowed
   ;;
   ;; to sort
   :lisp-name))

(uiop:define-package #:vari.glsl
    (:use #:cl #:varjo.utils #:varjo.internals #:vari.types
          #:%varjo.usings #:varjo-conditions
          #:glsl-symbols.types
          #:glsl-symbols.functions
          #:glsl-symbols.variables)
  (:import-from :varjo.internals
                :define-v-type-class)
  (:reexport #:glsl-symbols.types
             #:glsl-symbols.functions
             #:glsl-symbols.variables)
  (:export
   ;; functions
   :atomic-counter
   :bool
   :double
   :int
   :uint
   :v-equal
   :v-not
   :v-not-equal

   ;; statements

   :continue

   ;; struct slot names
   :near
   :far
   :diff

   ;; special operators
   :switch
   :for
   :while

   ;; vector constructors {TODO} move to glsl-spec
   :vec3
   :vec4
   :vec2
   :bvec3
   :bvec4
   :bvec2
   :ivec2
   :ivec3
   :ivec4
   :uvec3
   :uvec4
   :uvec2
   :dvec3
   :dvec4
   :dvec2
   :dvec4

   ;; matrix constructors {TODO} move to glsl-spec
   :mat2
   :mat3
   :mat4

   ;; things not in glsl-spec
   :gl-in
   :discard))

(uiop:define-package #:vari.cl
    (:use #:cl #:varjo.utils #:vari.glsl #:varjo.internals
          #:named-readtables #:varjo-conditions #:vari.types)
  (:import-from :alexandria
                :ensure-list
                :flatten
                :iota)
  (:import-from :varjo.internals
                :define-v-type-class)
  (:export
   ;; special functions
   :labels-no-implicit
   :swizzle
   :%break
   :%peek
   :glsl-expr
   :lisp-code-as-uniform

   :emit-data
   :emit
   :multf
   :divf
   :v-defun
   :v-def-glsl-template-fun
   :v-defmacro
   :v-define-compiler-macro
   :v-defstruct
   :v-deftype
   :def-metadata-infer
   :define-metadata-infer
   :def-metadata-kind
   :define-metadata-kind

   :output-primitive
   :instancing
   :invocations
   :kind
   :max-vertices
   :output-patch
   :vertices
   :tessellate-to
   :local-size
   :primitive
   :spacing
   :order

   :vari-describe))

(uiop:define-package #:vari
    (:use #:vari.types #:vari.glsl #:vari.cl)
  (:reexport :vari.types :vari.glsl :vari.cl))

(uiop:define-package #:varjo
    (:use #:cl #:varjo.utils #:vari.types #:varjo.api
          #:%varjo.usings)
  (:reexport :vari.types :varjo.api))
