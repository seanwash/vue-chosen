Vue.directive('chosen', {
  twoWay: true,
  bind: function() {
    return this.vm.$nextTick((function(_this) {
      return function() {
        return $(_this.el).chosen({
          inherit_select_classes: false,
          width: '100%'
        }).change(function(ev) {
          var i, len, option, ref, values;
          if (_this.el.hasAttribute('multiple')) {
            values = [];
            ref = _this.el.selectedOptions;
            for (i = 0, len = ref.length; i < len; i++) {
              option = ref[i];
              values.push(option.value);
            }
            return _this.set(values);
          } else {
            return _this.set(_this.el.value);
          }
        });
      };
    })(this));
  },
  update: function(nv, ov) {
    return $(this.el).trigger('chosen:updated');
  }
});
