--Makes stage visible desktop
on prepareMovie
  _movie.stage.visible=1  --don't change!
end

--Search and establish path to Casts
on startMovie
  _player.searchPathList = [_movie.path&"casts"]
  initializeNavigation()
  _global.dontPlay = false
end



on initializeNavigation()
  _global.hc_stop = false
  
end
