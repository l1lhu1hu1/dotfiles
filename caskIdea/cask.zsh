# https://stackoverflow.com/questions/61218987/list-up-my-apps-installable-with-brew-cask

ls /Applications | \grep '\.app$' | jq -Rsc 'split("\n")[:-1]|map({(.):1})|add'

cat allcasks.json | jq -r --argjson list '{"Alfred 4.app":1,"BetterTouchTool.app":1,"GarageBand.app":1,"Google Chrome.app":1,"iMovie.app":1,"iTerm.app":1,"Karabiner-Elements.app":1,"Karabiner-EventViewer.app":1,"Keynote.app":1,"LINE.app":1,"Numbers.app":1,"Pages.app":1,"Safari.app":1,"Slack.app":1,"Spotify.app":1,"Twitter.app":1}' '.[]|(.artifacts|map(.[]?|select(type=="string")|select(in($list)))|first) as $app|select($app)|"\(.token): \($app)"' > cask-list.txt
