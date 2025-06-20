// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    _id_7EC7671A1E0C788F = spawnstruct();
    _id_7EC7671A1E0C788F.weight = getdvarfloat( "dvar_61CEC75D556C8A54", 1.0 );
    _id_7EC7671A1E0C788F.validatefunc = ::validatefunc;
    _id_7EC7671A1E0C788F.activatefunc = ::activatefunc;
    _id_7EC7671A1E0C788F.waitfunc = ::waitfunc;
    _id_7EC7671A1E0C788F._id_C9E871D29702E8CF = ::_id_C9E871D29702E8CF;
    _id_7EC7671A1E0C788F._id_D72A1842C5B57D1D = getdvarint( "dvar_7CE40A5064ED5AAF", 2 );
    _id_7EC7671A1E0C788F._id_F0F6529C88A18128 = _id_337BD370F7C5E6F9::_id_4634160166FB7F8B( "jailbreak", "0    0   5   10   10  10  10  10" );
    _id_7EC7671A1E0C788F._id_B9B56551E1ACFEE2 = _id_294DDA4A4B00FFE3::_id_8BE9BAE8228A91F7( "jailbreak" );
    _id_337BD370F7C5E6F9::registerpublicevent( 3, _id_7EC7671A1E0C788F );
}

_id_C9E871D29702E8CF()
{
    game["dialog"]["public_events_jailbreak_incoming_active"] = "public_events_jailbreak_start_inmatch";
    game["dialog"]["public_events_jailbreak_incoming_active_alt"] = "public_events_jailbreak_start_alive";
    game["dialog"]["public_events_jailbreak_incoming_gulag"] = "public_events_jailbreak_start_gulag";
    game["dialog"]["public_events_jailbreak_incoming_spectate"] = "public_events_jailbreak_start_eliminated";
    game["dialog"]["public_events_jailbreak_now_active"] = "public_events_jailbreak_begin_inmatch";
    game["dialog"]["public_events_jailbreak_now_active_alt"] = "public_events_jailbreak_end_alive";
    game["dialog"]["public_events_jailbreak_now_gulag"] = "public_events_jailbreak_end_gulag";
    game["dialog"]["public_events_jailbreak_now_spectate"] = "public_events_jailbreak_begin_eliminated";
}

validatefunc()
{
    _id_21EB9CE44FFF7E79 = !_id_362C58E8BB39BCDA::isfeaturedisabled( "oneLife" );
    _id_B5C6B5AD4D7C67DD = istrue( level.usegulag );
    return _id_21EB9CE44FFF7E79 || _id_B5C6B5AD4D7C67DD;
}

waitfunc()
{
    level endon( "game_ended" );
    level endon( "cancel_public_event" );
    _id_98489428013A0100 = calculateeventstarttime();
    wait( _id_98489428013A0100 );
}

activatefunc()
{
    level endon( "game_ended" );
    pauseallgulagfights( 1 );
    waitforgulagfightstocomplete();
    _id_337BD370F7C5E6F9::showsplashtoall( "br_pe_jailbreak_incoming" );
    playjailbreakvo( "incoming" );
    eventduration = getdvarfloat( "dvar_9E78730EC3BAA38C", 30.0 );
    _id_91A988004AA42D31 = gettime() + eventduration * 1000;
    setomnvar( "ui_publicevent_timer_type", 2 );
    setomnvar( "ui_publicevent_timer", _id_91A988004AA42D31 );
    _id_FC7BD6576D8C85BE = spawn( "script_origin", ( 0, 0, 0 ) );
    _id_FC7BD6576D8C85BE hide();

    if ( eventduration > 5.0 )
    {
        wait( eventduration - 5.0 );

        for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < 5; _id_AC0E594AC96AA3A8++ )
        {
            _id_FC7BD6576D8C85BE playsound( "ui_mp_fire_sale_timer" );
            wait 1.0;
        }
    }

    _id_337BD370F7C5E6F9::showsplashtoall( "br_pe_jailbreak_active" );
    playjailbreakvo( "now" );
    setomnvar( "ui_publicevent_timer_type", 0 );
    _id_FC7BD6576D8C85BE delete();
    wait 1.0;
    respawnplayers();
    pauseallgulagfights( 0 );
}

calculateeventstarttime()
{
    _id_87940078241E4580 = getdvarfloat( "dvar_5AD075411172856E", 795.0 );
    _id_07AF9598177DC2DE = getdvarfloat( "dvar_5AAD6741114C1EEC", 1110.0 );

    if ( _id_07AF9598177DC2DE > _id_87940078241E4580 )
        return randomfloatrange( _id_87940078241E4580, _id_07AF9598177DC2DE );
    else
        return _id_87940078241E4580;
}

pauseallgulagfights( _id_1FD0410E54D2FFD8 )
{
    _id_67708F418B1FAC79::pausegulag( _id_1FD0410E54D2FFD8 );
}

waitforgulagfightstocomplete()
{
    level endon( "game_ended" );
    wait 1.0;

    for (;;)
    {
        if ( !_id_67708F418B1FAC79::areanygulagfightsactive() )
            break;

        waitframe();
    }
}

buildrespawnlist( _id_827C53020F6F228F )
{
    respawnplayers = [];
    _id_A11643FDEEDEE81B = isdefined( level.gulag ) && !istrue( level.gulag.shutdown );

    foreach ( _id_F90358454413407F in level.teamnamelist )
    {
        _id_6BA9B6124F692DFA = level.teamdata[_id_F90358454413407F]["aliveCount"] > 0;

        if ( _id_827C53020F6F228F )
            _id_6BA9B6124F692DFA = level.teamdata[_id_F90358454413407F]["teamCount"] > 0;

        if ( _id_6BA9B6124F692DFA )
        {
            foreach ( player in level.teamdata[_id_F90358454413407F]["players"] )
            {
                _id_87FE48F5F9047E82 = _id_A11643FDEEDEE81B && player _id_2CEDCC356F1B9FC8::isplayerinorgoingtogulag();

                if ( !isalive( player ) && !_id_87FE48F5F9047E82 )
                {
                    respawnplayers[respawnplayers.size] = player;
                    continue;
                }

                if ( isalive( player ) && _id_87FE48F5F9047E82 )
                    respawnplayers[respawnplayers.size] = player;
            }
        }
    }

    return respawnplayers;
}

respawnplayer()
{
    _id_1B7F5108008D55B6 = isalive( self ) && isdefined( level.gulag ) && !istrue( level.gulag.shutdown ) && _id_2CEDCC356F1B9FC8::isplayerinorgoingtogulag();

    if ( _id_1B7F5108008D55B6 )
        thread _id_67708F418B1FAC79::jailbreakeventplayer();
    else
        thread _id_67708F418B1FAC79::playergulagautowin( "jailbreak", undefined, undefined, 1, 1 );
}

respawnplayers()
{
    level endon( "game_ended" );
    _id_827C53020F6F228F = getdvarint( "dvar_C622900A5FA1E2C6", 1 );
    playerlist = buildrespawnlist( _id_827C53020F6F228F );

    foreach ( player in playerlist )
    {
        if ( !isdefined( player ) )
            continue;

        if ( _id_827C53020F6F228F )
            player resetplayerdataforrespawningplayer();

        player thread respawnplayer();
        waitframe();
    }
}

resetplayerdataforrespawningplayer()
{
    self.placementstatsset = undefined;
    self.brplacementchallengeallowed = undefined;
    self.processlobbydataforclient = undefined;
    self.brbonusxpallowed = undefined;
    self.br_spectatorinitialized = undefined;
    self setclientomnvar( "ui_br_player_position", 155 );
    self setclientomnvar( "ui_br_squad_eliminated_active", 0 );
    self setclientomnvar( "ui_round_end_title", 0 );
    self setclientomnvar( "ui_round_end_reason", 0 );
}

playjailbreakvo( aliasname )
{
    activeplayers = [];
    _id_F7A309109C19A8EB = [];
    _id_5624BF9A85CE0294 = [];
    _id_A11643FDEEDEE81B = isdefined( level.gulag ) && !istrue( level.gulag.shutdown );
    _id_827C53020F6F228F = getdvarint( "dvar_C622900A5FA1E2C6", 1 );

    foreach ( _id_F90358454413407F in level.teamnamelist )
    {
        _id_6BA9B6124F692DFA = level.teamdata[_id_F90358454413407F]["aliveCount"] > 0;

        if ( _id_827C53020F6F228F )
            _id_6BA9B6124F692DFA = level.teamdata[_id_F90358454413407F]["teamCount"] > 0;

        if ( _id_6BA9B6124F692DFA )
        {
            foreach ( player in level.teamdata[_id_F90358454413407F]["players"] )
            {
                _id_87FE48F5F9047E82 = _id_A11643FDEEDEE81B && player _id_2CEDCC356F1B9FC8::isplayerinorgoingtogulag();

                if ( !isalive( player ) && !_id_87FE48F5F9047E82 )
                {
                    _id_5624BF9A85CE0294[_id_5624BF9A85CE0294.size] = player;
                    continue;
                }

                if ( isalive( player ) && _id_87FE48F5F9047E82 )
                {
                    _id_F7A309109C19A8EB[_id_F7A309109C19A8EB.size] = player;
                    continue;
                }

                if ( isalive( player ) )
                    activeplayers[activeplayers.size] = player;
            }
        }
    }

    if ( activeplayers.size > 0 )
    {
        _id_45E1DF88D472EFF6 = scripts\engine\utility::ter_op( scripts\engine\utility::cointoss(), "_active", "_active_alt" );
        _id_2CEDCC356F1B9FC8::brleaderdialog( "public_events_jailbreak_" + aliasname + _id_45E1DF88D472EFF6, 0, activeplayers, 1 );
    }

    if ( _id_F7A309109C19A8EB.size > 0 )
    {
        _id_35C7A746AA1C8E9E = "_gulag";
        _id_2CEDCC356F1B9FC8::brleaderdialog( "public_events_jailbreak_" + aliasname + _id_35C7A746AA1C8E9E, 0, _id_F7A309109C19A8EB, 1 );
    }

    if ( _id_5624BF9A85CE0294.size > 0 )
    {
        _id_D3DC73C3AAFD6303 = "_spectate";
        _id_2CEDCC356F1B9FC8::brleaderdialog( "public_events_jailbreak_" + aliasname + _id_D3DC73C3AAFD6303, 0, _id_5624BF9A85CE0294, 1 );
    }
}
