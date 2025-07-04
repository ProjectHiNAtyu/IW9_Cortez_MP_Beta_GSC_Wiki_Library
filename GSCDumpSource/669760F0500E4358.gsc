// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_EA36530D601DAE30()
{
    if ( !_id_0FCD65DE73A5FD25() )
        return;

    script_model_anims();
    level._id_CB86CA442250CA58 = getdvarfloat( "dvar_401140680B9E3119", 3.0 );
    level._id_6ACF91BBF5273E8F = getdvarint( "dvar_BD581B3A13B81DB8", 5000 );
    level._id_39F69F7DFC40A323 = getdvarint( "dvar_E466D59282ECB790", 3000 );
    level._id_AB2C4542C95656CB = getdvarint( "dvar_D6193A209D3948A4", 3 );
    level._id_20EBE48820FD70A2 = getdvarint( "dvar_62BA9CF492C77F30", 120 );
    level._id_C5BBB7914CB760CF = getdvarint( "dvar_25AF310C5BC4BC7C", 3 );
    level._id_EB56EA0BFDAA4011 = getdvarint( "dvar_4704CC015DB60AD2", 3 );
    level._id_174FE9ECCE8FB96B = randomintrange( level._id_C5BBB7914CB760CF, level._id_EB56EA0BFDAA4011 + 1 );
    level._id_8703DF33A53750C6 = getdvarint( "dvar_F741C76D2B72D5C5", 1 );
    level._id_81018C8D037DA6C8 = getdvarint( "dvar_D78433447211BC33", 1 );
    level._id_79228B5606945E9F = getdvarint( "dvar_2FD1561A14BC4D7D", 1 );
    level._id_38C78BAB762BFFF6 = [];
    level._id_38C78BAB762BFFF6 = [];
    level._id_A1141D47AB94D2A1 = [];
    scripts\engine\scriptable::scriptable_addusedcallbackbypart( "dmz_uav_tower", ::_id_888A7CB98B23E26A );
    level thread _id_D45B1FDDB87CF6BC();
    thread _id_02A905DA0882C958();

    if ( scripts\common\utility::ismp() )
        scripts\cp_mp\utility\script_utility::registersharedfunc( "uav_tower", "tower_disable", ::_id_CB5F7F3A47B6C95D );
}

#using_animtree("script_model");

script_model_anims()
{
    level.scr_animtree["uav_tower"] = #animtree;
    level.scr_anim["uav_tower"]["use_uav_tower_enter"] = %dmz_uav_tower_enter;
    level.scr_animname["uav_tower"]["use_uav_tower_enter"] = "dmz_uav_tower_enter";
    level.scr_eventanim["uav_tower"]["use_uav_tower_enter"] = "use_uav_tower_enter";
    level.scr_viewmodelanim["uav_tower"]["use_uav_tower_enter"] = "dmz_uav_tower_enter";
    level.scr_anim["uav_tower"]["use_uav_tower_idle"] = %dmz_uav_tower_idle;
    level.scr_animname["uav_tower"]["use_uav_tower_idle"] = "dmz_uav_tower_idle";
    level.scr_eventanim["uav_tower"]["use_uav_tower_idle"] = "use_uav_tower_idle";
    level.scr_viewmodelanim["uav_tower"]["use_uav_tower_idle"] = "dmz_uav_tower_idle";
    level.scr_anim["uav_tower"]["use_uav_tower_exit"] = %dmz_uav_tower_exit;
    level.scr_animname["uav_tower"]["use_uav_tower_exit"] = "dmz_uav_tower_exit";
    level.scr_eventanim["uav_tower"]["use_uav_tower_exit"] = "use_uav_tower_exit";
    level.scr_viewmodelanim["uav_tower"]["use_uav_tower_exit"] = "dmz_uav_tower_exit";
}

create_player_rig( animname, spawnpos, _id_B7850001037AA074 )
{
    self.animname = animname;

    if ( !isdefined( spawnpos ) )
        spawnpos = ( 0, 0, 0 );

    if ( !isdefined( _id_B7850001037AA074 ) )
        _id_B7850001037AA074 = ( 0, 0, 0 );

    self _meth_8B338BF92F461E6C( spawnpos );
    player_rig = spawn( "script_arms", spawnpos, 0, 0, self );
    player_rig.angles = _id_B7850001037AA074;
    player_rig.player = self;
    self.player_rig = player_rig;
    self.player_rig hide( 1 );
    self.player_rig.animname = animname;
    self.player_rig useanimtree( #animtree );
    self.player_rig.updatedversion = 1;
    self playerlinktoabsolute( self.player_rig, "tag_player", 1.0, 0, 0, 0, 0, 1 );
    self notify( "rig_created" );
    scripts\engine\utility::waittill_any_2( "remove_rig", "player_free_spot" );

    if ( istrue( level.gameended ) )
        return;

    if ( isdefined( self ) )
    {
        self unlink();
        thread scripts\cp_mp\utility\inventory_utility::_id_9897D143C3FEEE05();
    }

    if ( isdefined( player_rig ) )
        player_rig delete();
}

_id_858AF52A8E277A68( _id_73BDEBBC7DA468A3, identifier )
{
    if ( !isdefined( _id_73BDEBBC7DA468A3.angles ) )
        _id_73BDEBBC7DA468A3.angles = ( 0, 0, 0 );

    scriptable = spawnscriptable( "dmz_uav_tower", _id_73BDEBBC7DA468A3.origin, _id_73BDEBBC7DA468A3.angles );
    scriptable setscriptablepartstate( "dmz_uav_tower_laptop", "laptop_closed" );
    _id_73BDEBBC7DA468A3._id_107D6E8FC82A82A8 = scriptable;
    scriptable._id_73BDEBBC7DA468A3 = _id_73BDEBBC7DA468A3;
    scriptable.identifier = identifier;
    level._id_A1141D47AB94D2A1[level._id_A1141D47AB94D2A1.size] = _id_73BDEBBC7DA468A3;
}

_id_FE7E4144E9133C3A()
{
    if ( !isdefined( level._id_FE7E4144E9133C3A ) )
        level._id_FE7E4144E9133C3A = getdvarint( "dvar_7131733D65E51232", 0 );

    return level._id_FE7E4144E9133C3A;
}

_id_D45B1FDDB87CF6BC()
{
    level endon( "game_ended" );

    while ( !isdefined( level.struct_class_names ) )
        waitframe();

    _id_B2C90DC03F470A24 = scripts\engine\utility::getstructarray( "uav_tower", "targetname" );

    if ( !isdefined( _id_B2C90DC03F470A24 ) || _id_B2C90DC03F470A24.size < 1 )
        _id_B2C90DC03F470A24 = scripts\engine\utility::getstructarray( "dmz_uav_tower", "targetname" );

    if ( isdefined( level._id_3E175C0B6527751F ) )
        _id_B2C90DC03F470A24 = [[ level._id_3E175C0B6527751F ]]();

    if ( _id_B2C90DC03F470A24.size == 0 )
        return;

    _id_57F36ABBEAC85747 = getdvarint( "dvar_939AB4119A3DB356", 0 );
    _id_FE7E4144E9133C3A = _id_FE7E4144E9133C3A();

    if ( !_id_57F36ABBEAC85747 && !_id_FE7E4144E9133C3A )
    {
        _id_1A7A45589889FD67 = [];
        _id_34965515AC54E0B5 = [];
        _id_371C833EBA04930E = scripts\cp_mp\utility\script_utility::issharedfuncdefined( "poi", "poi_isPOIActive", 0 );

        for ( _id_33860CCEECB7379A = 0; _id_33860CCEECB7379A < _id_B2C90DC03F470A24.size; _id_33860CCEECB7379A++ )
        {
            _id_D233486A875A4BA8 = _id_B2C90DC03F470A24[_id_33860CCEECB7379A];

            if ( !isdefined( _id_D233486A875A4BA8._id_B205D90302DA2F07 ) )
                continue;

            if ( !isdefined( _id_1A7A45589889FD67[_id_D233486A875A4BA8._id_B205D90302DA2F07] ) )
            {
                _id_1A7A45589889FD67[_id_D233486A875A4BA8._id_B205D90302DA2F07] = [];
                _id_34965515AC54E0B5[_id_34965515AC54E0B5.size] = _id_D233486A875A4BA8._id_B205D90302DA2F07;
            }

            _id_1A7A45589889FD67[_id_D233486A875A4BA8._id_B205D90302DA2F07][_id_1A7A45589889FD67[_id_D233486A875A4BA8._id_B205D90302DA2F07].size] = _id_D233486A875A4BA8;
        }

        _id_34965515AC54E0B5 = scripts\engine\utility::array_randomize( _id_34965515AC54E0B5 );
        _id_4B30D157CDB30549 = 0;
        _id_B9AB8417F086258B = 0;

        foreach ( _id_7E5C3E3C0F4FB904 in _id_34965515AC54E0B5 )
        {
            if ( _id_4B30D157CDB30549 == level._id_174FE9ECCE8FB96B )
                break;

            if ( _id_371C833EBA04930E && ![[ scripts\cp_mp\utility\script_utility::getsharedfunc( "poi", "poi_isPOIActive" ) ]]( _id_7E5C3E3C0F4FB904 ) )
                continue;

            _id_4B30D157CDB30549++;
            _id_DC97BA189A64519E = _id_1A7A45589889FD67[_id_7E5C3E3C0F4FB904];
            _id_8703DF33A53750C6 = getdvarint( _func_2EF675C13CA1C4AF( "dvar_72DE7F7DBAE2D115", _id_7E5C3E3C0F4FB904 ), level._id_8703DF33A53750C6 );
            _id_81018C8D037DA6C8 = getdvarint( _func_2EF675C13CA1C4AF( "dvar_EA59C77E13B98A07", _id_7E5C3E3C0F4FB904 ), level._id_81018C8D037DA6C8 );
            _id_B677145BCE94AEB6 = randomintrange( _id_8703DF33A53750C6, _id_81018C8D037DA6C8 + 1 );

            if ( _id_B677145BCE94AEB6 > _id_DC97BA189A64519E.size )
                _id_B677145BCE94AEB6 = _id_DC97BA189A64519E.size;

            _id_DC97BA189A64519E = scripts\engine\utility::array_slice( scripts\engine\utility::array_randomize( _id_DC97BA189A64519E ), 0, _id_B677145BCE94AEB6 );

            for ( _id_33860CCEECB7379A = 0; _id_33860CCEECB7379A < _id_DC97BA189A64519E.size; _id_33860CCEECB7379A++ )
            {
                _id_73BDEBBC7DA468A3 = _id_DC97BA189A64519E[_id_33860CCEECB7379A];
                _id_858AF52A8E277A68( _id_73BDEBBC7DA468A3, _id_B9AB8417F086258B );
                _id_B9AB8417F086258B++;
            }
        }

        return;
    }
    else if ( !_id_FE7E4144E9133C3A )
    {
        _id_636432A951D1B72F = randomintrange( level._id_8703DF33A53750C6, level._id_81018C8D037DA6C8 + 1 );

        if ( _id_636432A951D1B72F < _id_B2C90DC03F470A24.size )
            _id_B2C90DC03F470A24 = scripts\engine\utility::array_slice( scripts\engine\utility::array_randomize( _id_B2C90DC03F470A24 ), 0, _id_636432A951D1B72F );
    }

    for ( _id_33860CCEECB7379A = 0; _id_33860CCEECB7379A < _id_B2C90DC03F470A24.size; _id_33860CCEECB7379A++ )
    {
        _id_73BDEBBC7DA468A3 = _id_B2C90DC03F470A24[_id_33860CCEECB7379A];
        _id_858AF52A8E277A68( _id_73BDEBBC7DA468A3 );
    }
}

_id_444BBCC637C82FC2( scriptable, playerteam )
{
    scriptable endon( "death" );
    scriptable endon( "tower_disable" );
    level endon( "game_ended" );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "player", "showMiniMap" ) )
    {
        players = level.players;

        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "game", "getTeamData" ) )
            players = [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "game", "getTeamData" ) ]]( playerteam, "players" );

        foreach ( player in players )
            player [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "player", "showMiniMap" ) ]]();
    }

    for (;;)
    {
        triggerportableradarpingteam( scriptable.origin, playerteam, level._id_6ACF91BBF5273E8F, level._id_39F69F7DFC40A323 );
        wait( level._id_AB2C4542C95656CB );
    }
}

_id_CB5F7F3A47B6C95D( scriptable )
{
    player = scriptable._id_27E49251BB3376EA;

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "player", "hideMiniMap" ) && isdefined( player ) )
    {
        players = level.players;

        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "game", "getTeamData" ) )
            players = [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "game", "getTeamData" ) ]]( player.team, "players" );

        foreach ( _id_736D8D9188CCBD45 in players )
            _id_736D8D9188CCBD45 [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "player", "hideMiniMap" ) ]]();
    }

    _id_1F97A44D1761C919::_id_9793A81BC3BC19E9( "uav_tower_duration_ended", player.team );
    scriptable setscriptablepartstate( "dmz_uav_tower_antenna", "active_end" );
    scriptable notify( "tower_disable" );
    scriptable._id_27E49251BB3376EA = undefined;
}

_id_9A71DD352FE6DA4B( scriptable )
{
    scriptable endon( "death" );
    scriptable endon( "tower_disable" );
    level endon( "game_ended" );
    wait( level._id_20EBE48820FD70A2 );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "uav_tower", "tower_disable" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "uav_tower", "tower_disable" ) ]]( scriptable );
}

_id_550DEEAC761AB7B9( scriptable )
{
    scriptable endon( "death" );
    level endon( "game_ended" );
    level._id_38C78BAB762BFFF6[scriptable.index] = 1;
    wait( level._id_20EBE48820FD70A2 + level._id_79228B5606945E9F );
    level._id_38C78BAB762BFFF6[scriptable.index] = 0;
}

_id_888A7CB98B23E26A( instance, part, state, player, _id_A5B2C541413AA895, _id_CC38472E36BE1B61 )
{
    if ( !isdefined( level._id_38C78BAB762BFFF6[instance.index] ) || !level._id_38C78BAB762BFFF6[instance.index] )
    {
        instance setscriptablepartstate( "dmz_uav_tower", "unusable" );
        instance._id_B14A331BA425C286 = 0;
        instance _id_678EA4319B42DFED( player );
        player setclientomnvar( "ui_dmz_uav_tower_screen", 0 );
        instance setscriptablepartstate( "dmz_uav_tower", "usable" );

        if ( isdefined( instance._id_B14A331BA425C286 ) && instance._id_B14A331BA425C286 )
        {
            players = level.players;
            instance thread _id_A301051F63FBBFF9( instance, part, state, player, _id_A5B2C541413AA895, _id_CC38472E36BE1B61, players );
        }
        else
            instance setscriptablepartstate( "dmz_uav_tower", "usable" );
    }
    else if ( isdefined( level.showerrormessagefunc ) )
        player [[ level.showerrormessagefunc ]]( "DMZ/INACTIVE_UAV_TOWER" );
}

_id_678EA4319B42DFED( player )
{
    player endon( "death_or_disconnect" );
    player endon( "interact_interrupt" );
    player playlocalsound( "uav_tower_foley" );
    thread _id_796D1DA742E2A88A( player );
    _id_649D5137F5852321( player );
    player setclientomnvar( "ui_dmz_uav_tower_screen", 1 );
    thread _id_667FD79F2B5D6436( player );
    _id_E71D6089EBD93181( player );
    _id_B61464B3867D7BA3( player );
    player notify( "interact_finished" );
    waitframe();
    player _id_3C288BBDD4016FD4( 1 );

    if ( istrue( level.gameended ) )
        return;

    if ( isdefined( player ) )
        player notify( "remove_rig" );
}

_id_649D5137F5852321( player )
{
    player endon( "death_or_disconnect" );
    player _id_3C288BBDD4016FD4( 0 );
    player.linktoent = player scripts\engine\utility::spawn_tag_origin( player.origin, player getplayerangles( 0 ) );
    player playerlinktodelta( player.linktoent, "tag_origin", 1, 0, 0, 30, 30, 1, 1 );
    _id_9A2E0B6F009D8682 = self.angles + ( 0, -90, 0 );
    goalpos = self.origin + rotatevector( ( 55.632, -1.279, 0 ), _id_9A2E0B6F009D8682 );
    forward = ( 0, 0, 0 ) - anglestoforward( _id_9A2E0B6F009D8682 );
    up = ( 0, 0, 1 );
    right = vectorcross( forward, up );
    _id_8003B0D4F9FBEE0E = axistoangles( forward, right, up );
    _id_57C87883AE437750 = 0.5;
    player.linktoent moveto( goalpos, _id_57C87883AE437750, 0.1, 0.1 );
    player.linktoent rotateto( _id_8003B0D4F9FBEE0E, _id_57C87883AE437750, 0.1, 0.1 );
    player setstance( "crouch" );
    _id_CD9982ADB17761A8 = gettime();
    player scripts\cp_mp\utility\inventory_utility::_id_FC6A5B145563BE33();
    _id_698CC218E4ADE75F = gettime();
    _id_218F64CB035D54BE = max( 0, _id_57C87883AE437750 - ( _id_698CC218E4ADE75F - _id_CD9982ADB17761A8 ) / 1000.0 );
    wait( _id_218F64CB035D54BE );
    player unlink();
    player.linktoent delete();
    player.linktoent = undefined;
    player setorigin( goalpos );
    player setplayerangles( _id_8003B0D4F9FBEE0E );
    animname = "use_uav_tower_enter";
    player thread create_player_rig( "uav_tower", player.origin, player.angles );
    player.player_rig showonlytoplayer( player );

    if ( !isdefined( self.animstruct ) )
    {
        animstruct = spawnstruct();
        animstruct.origin = self.origin;
        animstruct.angles = _id_9A2E0B6F009D8682;
        self.animstruct = animstruct;
    }

    self.animstruct scripts\mp\anim::anim_player_solo( player, player.player_rig, animname );
}

_id_667FD79F2B5D6436( player )
{
    player endon( "interact_interrupt" );
    waitframe();
    player notifyonplayercommand( "interact_cancelled", "+weapnext" );
    self._id_A4CF15C49F3E9EEF = 0;
    msg = player scripts\engine\utility::waittill_any_timeout_1( level._id_CB86CA442250CA58, "interact_cancelled" );
    self._id_A4CF15C49F3E9EEF = 1;
    player notifyonplayercommandremove( "interact_cancelled", "+weapnext" );

    if ( msg == "interact_cancelled" )
    {
        player stoplocalsound( "uav_tower_foley" );
        wait 0.25;
        player setclientomnvar( "ui_dmz_uav_tower_screen", 0 );
    }
    else
    {
        self._id_B14A331BA425C286 = 1;
        player notify( "interact_begin_exit" );
    }
}

_id_796D1DA742E2A88A( player )
{
    player endon( "interact_cancelled" );
    player endon( "interact_finished" );
    player scripts\engine\utility::waittill_any_2( "death_or_disconnect", "last_stand_start" );
    player notify( "interact_interrupt" );
    player stopanimscriptsceneevent();
    player stoplocalsound( "uav_tower_foley" );

    if ( isdefined( player.linktoent ) )
    {
        player unlink();
        player.linktoent delete();
        player.linktoent = undefined;
    }

    player notify( "remove_rig" );
    player _id_3C288BBDD4016FD4( 1 );
}

_id_E71D6089EBD93181( player, instance )
{
    player endon( "death_or_disconnect" );
    player endon( "interact_begin_exit" );
    player endon( "interact_cancelled" );

    while ( scripts\mp\utility\player::isreallyalive( player ) )
        self.animstruct scripts\mp\anim::anim_player_solo( player, player.player_rig, "use_uav_tower_idle" );
}

_id_B61464B3867D7BA3( player )
{
    player endon( "death_or_disconnect" );
    player endon( "interact_interrupt" );

    if ( scripts\mp\utility\player::isreallyalive( player ) )
        self.animstruct scripts\mp\anim::anim_player_solo( player, player.player_rig, "use_uav_tower_exit" );
}

_id_3C288BBDD4016FD4( _id_BD138DE99B3B3507 )
{
    if ( !_id_BD138DE99B3B3507 )
    {
        _id_3B64EB40368C1450::set( "typing", "allow_jump", 0 );
        _id_3B64EB40368C1450::set( "typing", "gesture", 0 );
        _id_3B64EB40368C1450::set( "typing", "melee", 0 );
        _id_3B64EB40368C1450::set( "typing", "mantle", 0 );
        _id_3B64EB40368C1450::set( "typing", "offhand_weapons", 0 );
        _id_3B64EB40368C1450::set( "typing", "allow_movement", 0 );
        _id_3B64EB40368C1450::set( "typing", "sprint", 0 );
        _id_3B64EB40368C1450::set( "typing", "fire", 0 );
        _id_3B64EB40368C1450::set( "typing", "reload", 0 );
        _id_3B64EB40368C1450::set( "typing", "weapon_pickup", 0 );
        _id_3B64EB40368C1450::set( "typing", "weapon_switch", 0 );
        _id_3B64EB40368C1450::set( "typing", "offhand_weapons", 0 );
        self _meth_35501B42058D4DE9();
    }
    else
    {
        _id_3B64EB40368C1450::_id_C9D0B43701BDBA00( "typing" );
        self _meth_BB04491D50D9E43E();
    }
}

_id_A301051F63FBBFF9( instance, part, state, player, _id_A5B2C541413AA895, _id_CC38472E36BE1B61, streakinfo, players )
{
    player endon( "death_or_disconnect" );
    level notify( "uav_tower_activated", instance );

    if ( isdefined( instance._id_27E49251BB3376EA ) )
    {
        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "uav_tower", "tower_disable" ) )
            [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "uav_tower", "tower_disable" ) ]]( instance );
    }

    instance._id_B9C2A0C83178D652 = 1;
    instance setscriptablepartstate( "dmz_uav_tower_antenna", "active_start" );
    instance thread _id_550DEEAC761AB7B9( instance );
    instance._id_27E49251BB3376EA = player;
    playsoundatpos( instance.origin + ( 0, 0, 24 ), "uav_tower_siren" );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "pmc_missions", "onUAVTowerUsed" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "pmc_missions", "onUAVTowerUsed" ) ]]( player, instance.identifier );

    instance thread _id_444BBCC637C82FC2( instance, player.team );
    instance thread _id_9A71DD352FE6DA4B( instance );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "game", "getSquadmates" ) )
    {
        _id_607DA387F3617ED1 = [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "game", "getSquadmates" ) ]]( player.team, player._id_0FF97225579DE16A, 1 );
        players = undefined;

        if ( isdefined( instance._id_73BDEBBC7DA468A3._id_B205D90302DA2F07 ) )
        {
            players = level._id_B205D90302DA2F07[instance._id_73BDEBBC7DA468A3._id_B205D90302DA2F07]["players"];
            players = scripts\engine\utility::array_remove_array( players, _id_607DA387F3617ED1 );
            _id_1F97A44D1761C919::_id_D87D5DEB069BF8E5( "uav_tower_used_others", players );
        }

        _id_1F97A44D1761C919::_id_D87D5DEB069BF8E5( "uav_tower_used", _id_607DA387F3617ED1 );

        if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "hud", "showDMZSplash" ) )
        {
            if ( isdefined( players ) )
                [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "hud", "showDMZSplash" ) ]]( "dmz_uav_tower_activated_others", players, instance._id_73BDEBBC7DA468A3._id_B205D90302DA2F07 );

            [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "hud", "showDMZSplash" ) ]]( "dmz_uav_tower_activated_team", _id_607DA387F3617ED1, instance._id_73BDEBBC7DA468A3._id_B205D90302DA2F07 );
        }
    }
}

_id_02A905DA0882C958()
{
    level endon( "game_ended" );

    for (;;)
    {
        for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < level._id_A1141D47AB94D2A1.size; _id_AC0E594AC96AA3A8++ )
        {
            if ( isdefined( level._id_A1141D47AB94D2A1[_id_AC0E594AC96AA3A8] ) && isdefined( level._id_A1141D47AB94D2A1[_id_AC0E594AC96AA3A8]._id_107D6E8FC82A82A8 ) )
            {
                instance = level._id_A1141D47AB94D2A1[_id_AC0E594AC96AA3A8]._id_107D6E8FC82A82A8;
                state = instance getscriptablepartstate( "dmz_uav_tower_laptop" );

                if ( !istrue( instance._id_B9C2A0C83178D652 ) || state == "laptop_closed" )
                {
                    players = scripts\common\utility::playersnear( instance.origin, 400 );

                    if ( isdefined( players ) && players.size > 0 )
                    {
                        if ( state == "laptop_closed" )
                            instance setscriptablepartstate( "dmz_uav_tower_laptop", "laptop_opened" );
                    }
                    else if ( state == "laptop_opened" && !istrue( instance._id_B9C2A0C83178D652 ) )
                        instance setscriptablepartstate( "dmz_uav_tower_laptop", "laptop_closed" );
                }
            }

            wait 0.25;
        }

        wait 0.25;
    }
}

_id_0FCD65DE73A5FD25()
{
    return getdvarint( "dvar_5AF0F9B3AEA8FDA6", 1 ) == 1;
}
