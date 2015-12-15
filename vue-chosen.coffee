Vue.directive 'chosen',
  twoWay: true
  bind: ->
    $(@el).chosen(
      inherit_select_classes: false
      width: '100%'
    )
    .change((ev) =>
      # If we're using a multi select we should save an array for sending to the server
      if @el.hasAttribute('multiple')
        values = []
        for option in @el.selectedOptions
          values.push option.value

        @set values
      else
        @set @el.value
    )

  update: (nv, ov) ->
    $(@el).trigger 'chosen:updated'
