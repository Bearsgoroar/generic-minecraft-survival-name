@server_name = 'Generic Minecraft Survival Name';

if(is_channel_registered('BungeeCord')) {
  unregister_channel('BungeeCord');
}
register_channel('BungeeCord');
bind('plugin_message_received', null, null, @event) {
    #Debug
    #broadcast(@event);

    @one = ba_get_string(@event['bytes']);
    @two = ba_get_string(@event['bytes']);
    @message = ba_get_string(@event['bytes']);
    #broadcast(@one);
    #broadcast(@two);
    #@displayName = set_placeholders(@player, '%player_displayname%');
    broadcast(colorize(@message));
}


# Bind an event to the player join, and tell ops hello.
# We send in @server_name, so we can use it inside the event handler
bind('player_join', null, null, @event) {
  modify_event('join_message', null);
  #modify_event('message', 'carrot');
  set_timeout(50, closure(){
    @player = @event['player'];
    #modify_event('join_message', '');
    #broadcast(@event);

    @compiled = byte_array();
    @payload = byte_array();

    @DisplayName = set_placeholders(@player, '%player_displayname%');
    @message = "@DisplayName &eglides into the server!";

            #Debug
            #broadcast(@message);

    ba_put_string(@payload, @message);

    ba_put_string(@compiled, 'Forward');
    ba_put_string(@compiled, 'ALL');
    ba_put_string(@compiled, 'Join');
    ba_put_string(@compiled, array_size(@payload));

    ba_put_bytes(@compiled, @payload);

            if(is_channel_registered('BungeeCord')) {
                send_plugin_message(@player, 'BungeeCord', @compiled);
                #unregister_channel('BungeeCord');
            } else {
                register_channel('BungeeCord');
                send_plugin_message(@player, 'BungeeCord', @compiled);
                #unregister_channel('BungeeCord');
            }
    broadcast(colorize(@message));
    })
  #modify_event('join_message', @message);
}


# Bind an event to the player join, and tell ops hello.
# We send in @server_name, so we can use it inside the event handler
bind('player_quit', null, null, @event) {
    #@player = @event['player'];
    #@DisplayName = set_placeholders(@player, '%player_displayname%');
    #@message = "@DisplayName &escatters to the cosmic winds!";
    modify_event('message', null);
}
# If the player is an op, let's send them a welcome message
        #if(pisop(@event['player'])) {
        #       msg('Welcome to '.@server_name.' (Change this message in plugins/CommandHelper/main.ms)');