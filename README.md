#TopModel a Rails 4 compatible in-memory database using ActiveModel 
**This gem is based on topmodel by Alex Maccaw (maccman). It includes some fixes and is updated to be compatible with Rails 4.**


**Primarily developed for Bowline applications.
http://github.com/maccman/bowline**

##Supports:
  * Serialisation
  * Validations
  * Callbacks
  * Dirty (Changes)
  * Ruby Marshalling to disk
  * Redis

##Examples:

    require "topmodel"
    class Test < TopModel::Base
    end

    t = Test.new
    t.name = "foo"
    t.save #=> true

    Test.all
    Test.first
    Test.last
    Test.find_by_name('foo)

You can use a random ID rather than the object ID:
  
    class Test < TopModel::Base
      include TopModel::RandomID
    end
  
    t = Test.create(:name => "test")
    t.id #=> "7ee935377bb4aecc54ad4f9126"
  
You can marshal objects to disk on startup/shutdown
  
    class Test < TopModel::Base
      include TopModel::Marshal::Model
    end
  
    TopModel::Marshal.path = "dump.db"
    TopModel::Marshal.load

    at_exit {
      TopModel::Marshal.dump
    }
  
You can use Redis, you need the Redis gem installed:

    require "redis"
    class Test < TopModel::Base
      include TopModel::Redis::Model
      attributes :name
      indexes :name
    end
  
    Test.find_or_create_by_name("foo")


;-)
