property pLink
property pSource
property pBehavior
property pChannel

property pMySound
property pPlaying


on beginSprite me
  pMySound = sound(pChannel)
  pPlaying = TRUE
  sound playFile pChannel, _movie.path&"resources\audio\"&pSource 
  
end

on mouseUp me
  if pPlaying = FALSE then
    sound playFile pChannel, _movie.path&"resources\audio\"&pSource
    pPlaying = TRUE
  else
    sound(pChannel).stop()
    pPlaying = FALSE
  end if
end

on exitFrame me
  -- stop if volume = 0 or idle and link to the next slide.
  if pMySound.volume = 0 OR pMySound.status = 0 then
    pMySound.stop()
    if pBehavior = "Link" then
      if pLink = "Null" then
        _movie.go(marker(pLink))
      end if
    end if
    if pBehavior = "Next" then
      _movie.goNext()
    end if
    if pBehavior = "Pause" then
      _movie.go(_movie.frame)
    end if
  end if
  
end


on getPropertyDescriptionList me
  list = [:]
  addProp list, #pLink, [#comment: "What frame label to link to on completion. Null causes a link to the next marker.", #format: #string, #default: "Null"]
  addProp list, #pSource, [#comment: "The Audio file to link to. Null fails, don't leave null.", #format: #string, #default: "Null"]
  addProp list, #pBehavior, [#comment: "Link behavior - Next, go to next slide. Link - go to linked slide. Pause - Stay on current frame after done.", #format: #string, #default: "Pause"]
  addProp list, #pChannel, [#comment: "The channel to play music in.", #format: #integer, #default: 1]
  return list
end