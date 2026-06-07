## GSN
proc _checkStaff(@rank = 'mod', @msg = 'You do not have permission to run this command.') {
  switch_ic(@rank) {
    case 'chatmod':
      if(!has_permission('gsn.chatmod')) {
        die(color('GREEN') . @msg);
      }
    case 'mod':
      if(!has_permission('gsn.mod')) {
        die(color('GREEN') . @msg);
      }
    case 'admin':
      if(!has_permission('gsn.admin')) {
        die(color('GREEN') . @msg);
      }
  }
}

proc _rankUp(@player, @rank) {
  broadcast(colorize("[GSNBot]&e @player has leveled up to @rank!"));
  @cmd = "/lpv user"
  @other = 'parent set'
  run('/lpv user Bearsgoroar parent set player');
}
