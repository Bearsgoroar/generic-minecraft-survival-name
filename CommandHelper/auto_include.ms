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

proc _headAward(@player, @display, @message, @texture) {
  @date = simple_date(dd/MMMM/yyyy);
  pgive_item(@player, array(
    name: 'PLAYER_HEAD', 
    meta: array(
      display: colorize("&l@display"), 
      lore: array(
        colorize("&#CFFF45@message"), 
        colorize("&#E7FDB7Awarded to @player"), 
        colorize("&#A92890@date")
      ),
      enchants: array(
        'minecraft:lure': 1
      )
      owner: 'Bearsgoroar',
      texture: @texture
    )
  );
}

