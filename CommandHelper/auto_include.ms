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
  broadcast(colorize("[GSNBot] @player has leveled up to @rank!"));
  runas('~console', "/lpv user @player parent set @rank");
}
