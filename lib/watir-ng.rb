require "watir-webdriver"
require "watir-ng/version"

#
# Adds AngularJS `ng` directives as identifiers for `Watir::Webdriver` elements.
#
module WatirNg

  #
  # All the ng directives from the AngularJS documentation.
  #
  # @see `https://docs.angularjs.org/api/ng/directive`
  #
  NG_STRINGS = %w(ng_jq ng_app ng_href ng_src ng_srcset ng_disabled ng_checked ng_readonly 
                  ng_selected ng_open ng_form ng_value ng_bind ng_bind_template ng_bind_html 
                  ng_change ng_class ng_class_odd ng_class_even ng_cloak ng_controller ng_csp 
                  ng_click ng_dblclick ng_mousedown ng_mouseup ng_mouseover ng_mouseenter 
                  ng_mouseleave ng_mousemove ng_keydown ng_keyup ng_keypress ng_submit ng_focus
                  ng_blur ng_copy ng_cut ng_paste ng_if ng_include ng_init ng_list ng_model 
                  ng_model_options ng_non_bindable ng_options ng_pluralize ng_repeat ng_show 
                  ng_hide ng_style ng_switch ng_transclude
                 )

  #
  # Inserts `NG_STRINGS` into `cls.attributes` as symbols when included in the class.
  #
  # @param cls [Class]
  # @return [nil]
  #
  def self.included cls
    if cls.respond_to? :attributes
      ng_directives.each { |ng| cls.attributes << ng }
    end
  end

  #
  # Converts `NG_STRINGS` into an array of symbols.
  #
  # @api private
  # @return [Array<Symbol>] directives
  #
  def self.ng_directives
    @ng_directives ||= NG_STRINGS.map(&:to_sym)
  end
end

module Watir
  class HTMLElement
    include WatirNg
  end
end
