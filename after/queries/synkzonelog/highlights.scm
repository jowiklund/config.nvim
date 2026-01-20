; ~/.config/nvim/after/queries/synkzonelog/highlights.scm

(timestamp) @number

(thread_name) @string

; Default highlight for all log levels
(log_level) @keyword

; --- THIS IS THE FIXED PART ---
; Use predicates to check the text of the node
((log_level) @warning
  (#eq? @warning "WARN"))

((log_level) @error
  (#eq? @error "ERROR"))

((log_level) @error ; Also highlight FATAL as an error
  (#eq? @error "FATAL"))
; --- END FIX ---

(logger_name) @type

; Highlight the regular message parts
(message_text) @text

; Highlight the stack frames
(stack_frame) @comment
