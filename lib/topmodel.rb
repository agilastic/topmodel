gem "activesupport"
gem "activemodel"

require "active_support/core_ext/class/attribute_accessors"
require "active_support/core_ext/hash/indifferent_access"
require "active_support/core_ext/kernel/reporting"
require "active_support/core_ext/module/delegation"
require "active_support/core_ext/module/aliasing"
require "active_support/core_ext/object/blank"
require "active_support/core_ext/object/try"
require "active_support/core_ext/object/to_query"
require "active_support/core_ext/class/attribute"
require "active_support/json"

require "active_model"

module TopModel
  class TopModelError < StandardError; end
  class UnknownRecord < TopModelError; end
  class InvalidRecord < TopModelError; end
end

$:.unshift(File.dirname(__FILE__))
require "topmodel/ext/array"

module TopModel
  autoload :Association, "topmodel/association"
  autoload :Callbacks,   "topmodel/callbacks"
  #autoload :Observing,   "topmodel/observing"
  autoload :Marshal,     "topmodel/marshal"
  autoload :RandomID,    "topmodel/random_id"
  autoload :Timestamp,   "topmodel/timestamp"
  autoload :Validations, "topmodel/validations"
  autoload :Dirty,       "topmodel/dirty"
  autoload :Redis,       "topmodel/redis"
  autoload :Base,        "topmodel/base"
end