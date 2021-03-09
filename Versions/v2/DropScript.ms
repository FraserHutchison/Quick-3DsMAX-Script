try
(
fileIn "RolloutLibrary.ms"
MessageBox("Quick! installed!                                                                                      GO TO: Customize> Customize User Interface> Keyboard> Category> Quick! - To set a shortcut!")
)
catch
(
MessageBox("Something went wrong...")
print "Could not find RolloutLibrary.ms"
)