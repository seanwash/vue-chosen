Vue.directive 'chosen',
  twoWay: true
  bind: ->
    # use nextTick to make sure that we're getting the correct starting values
    @vm.$nextTick( =>
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
    )

  update: (nv, ov) ->
    $(@el).trigger 'chosen:updated'
