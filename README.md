#CentralizeIt v2.0#
CentralizeIt 2.0 is rewritten based on coffeescript.
Works even more solid than before. 

## How to use it ##

First choose your container which should be centralized and activate the plugin with the following snippet.
Replace _yourSelector_ with the ID or Class of your container.

	$(document).ready(function(){
		$('yourSelector').centralizeIt({
      width: 960, 
      height: 760 
    });
	});

That's it.

## Options ##
With version 2.0 you have some options available to configure CentralizeIt.

| option        | type          | default | description                          |
| ------------- |:-------------:| -------:| ------------------------------------:|
| width         | integer       | null    | Enter absolut width like `960`       |
| height        | integer       | null    | Enter absolut height like `500`      |
| vertical      | boolean       | `true`  | If `true` it centralize vertically   |
| horizontal    | boolean       | `true`  | If `true` it centralize horizontally |

Note! If you dont enter a value for `width` / `height` it might be centralize not correctly!
