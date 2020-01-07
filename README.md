# README

## Interactor Pattern Conventions

### Context

It might be unclear what's in a `context` object at a particular point in the code.
Therefore, only attaching values to the `context` at the end of the call method or within the `if something.save...` block.

```ruby
def call
  new_object = some_object.associated_object.build(
    param1: context[:param1],
    param2: context[:param2],
    param3: context[:param3]
  )

  if new_object.save
    context.new_object = new_object
  else
    context.fail!(errors: new_object.errors)
  end
end
```

### Delegate

To make it easier to quickly understand what parameters we erxpect the interactor to have, use `delegate` call at the top of our class.

```ruby
class Something
  include Interactor

  delegate :param1, :param2, :param3, :param4, to: :context

  def call
    # do stuff ...
  end

end
```
