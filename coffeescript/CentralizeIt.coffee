###
# Copyright (c) 2013, Patrick Finkbeiner <finkbeiner.patrick@gmail.com>
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
# - Redistributions of source code must retain the above copyright notice,
#   this list of conditions and the following disclaimer.
# - Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
# - Neither the name of the kuehlhaus AG nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
###

class CentralizeIt

  # Contains each selector.
  selector:
    base: null

  # Slider default settings
  defaults:
    height: null
    width: null
    horizontal: true
    vertical: true

  # User settings stored…
  settings: {}

  # Constructor…
  constructor: (options, selector) ->
    me = @
    @selector.base = selector
    @settings = jQuery.extend true, @defaults, options
    @validate()
    @centralizeIt()
    (jQuery window).resize ->
      me.centralizeIt()

  # Validate settings,
  # try to catch height or width if not set.
  #
  validate: ->
    me = @
    if @settings.height is null
      me.settings.height = (jQuery me.selector.base).height()
    if @settings.width is null
      me.settings.width = (jQuery me.selector.base).width()

  # centralize it…
  #
  centralizeIt: ->
    me = @
    spaces = @calc()
    if @settings.vertical is true
      (jQuery me.selector.base).css 'margin-top', spaces['top']
    if @settings.horizontal is true
      (jQuery me.selector.base).css 'margin-left', spaces['left']

  # Calucate spaces
  #
  # @return array
  calc: ->
    #not actual the window, cause of default padding.
    windowWidth = parseInt (jQuery @selector.base).parent().width(), 10
    windowHeight = parseInt (jQuery window).height(), 10
    top = (windowHeight - @settings.height) / 2
    left = (windowWidth - @settings.width) / 2
    if top < 0
      top = 0
    if left < 0
      left = 0
    spaces = []
    spaces['top'] = parseInt top, 10
    spaces['left'] = parseInt left, 10
    spaces

jQuery.fn.centralize = (options) ->
  new CentralizeIt(options, @.selector)
