property pLink
property pStyle
property pHome
property pOrigin


--Go to the label defined in the properties, allowing the back button to work.
on mouseUp me
  _movie.play(marker(pLink))
end



on getPropertyDescriptionList me
  list = [:]
  addProp list, #pLink, [#comment: "What frame label to link to", #format: #string, #default: "Null"]
  addProp list, #pStyle, [#comment: "How to transition: None, Smooth ", #format: #string, #default: "None"]
  addProp list, #pHome, [#comment: "Save history to back button: Off, On", #format: #string, #default: "Off"]
  addProp list, #pOrigin, [#comment: "The frame label that this link calls 'Home'. Should be first frame label where this button occurs.", #format: #string, #default: "Null"]
end
