# What you see here is a coffee-based javascript widget template.
# It's based off a few JS implementations floating around the net.
# To use, simply create a div on a page with an id of "widget" and 
# load the JS output by this coffee.

# declare this up here so it's scoped properly
jQuery = undefined

# widget starts here
main = () ->
  jQuery(document).ready(($) ->
    # load CSS
    $('<link>',
        rel: 'stylesheet',
        type: 'text/css',
        href: 'http://devinfoley.com/cv/screen.css'
    ).appendTo('head')

    # this is where the magic happens
    $('#widget').html('jQuery and CSS are loaded and we can start doing fun things now.')
  )

# load jQuery
if (window.jQuery == undefined || window.jQuery.fn.jquery != '1.7.2')
  loadCallback = () ->
    jQuery = window.jQuery.noConflict(true)
    main()

  scriptTag = document.createElement('script')
  scriptTag.setAttribute('type','text/javascript')
  scriptTag.setAttribute('src', 'http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js')

  if (scriptTag.readyState)
    scriptTag.onreadystatechange = () -> # old IE compatibility
      if (this.readyState == 'complete' || this.readyState == 'loaded')
        loadCallback()
  else
    scriptTag.onload = loadCallback

  (document.getElementsByTagName("head")[0] || document.documentElement).appendChild(scriptTag)
else
  jQuery = window.jQuery
  main()
