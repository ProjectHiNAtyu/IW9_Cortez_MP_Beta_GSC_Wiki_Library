// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_AACBBE63C26687AE( callback, func )
{
    if ( !isdefined( level._id_EC2C9117BD4B336B ) )
        level._id_EC2C9117BD4B336B = [];

    if ( !isdefined( level._id_EC2C9117BD4B336B[callback] ) )
        level._id_EC2C9117BD4B336B[callback] = [];

    level._id_EC2C9117BD4B336B[callback][level._id_EC2C9117BD4B336B[callback].size] = func;
}

_id_9CE94B15EE6758EE( callback )
{
    if ( !isdefined( level._id_EC2C9117BD4B336B ) )
        return 0;

    if ( !isdefined( level._id_EC2C9117BD4B336B[callback] ) )
        return 0;

    return 1;
}

_id_80820D6D364C1836( callback, data )
{
    if ( !_id_9CE94B15EE6758EE( callback ) )
        return;

    if ( isdefined( data ) )
    {
        for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < level._id_EC2C9117BD4B336B[callback].size; _id_AC0E594AC96AA3A8++ )
            thread [[ level._id_EC2C9117BD4B336B[callback][_id_AC0E594AC96AA3A8] ]]( data );
    }
    else
    {
        for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < level._id_EC2C9117BD4B336B[callback].size; _id_AC0E594AC96AA3A8++ )
            thread [[ level._id_EC2C9117BD4B336B[callback][_id_AC0E594AC96AA3A8] ]]();
    }
}

_id_1B15450E092933CF( basetime )
{
    _id_FBDCFBD6233E2398 = basetime;

    if ( isdefined( level.starttimefrommatchstart ) )
    {
        _id_FBDCFBD6233E2398 = _id_FBDCFBD6233E2398 - level.starttimefrommatchstart;

        if ( _id_FBDCFBD6233E2398 < 0 )
            _id_FBDCFBD6233E2398 = 0;
    }
    else
        _id_FBDCFBD6233E2398 = 0;

    return _id_FBDCFBD6233E2398;
}

_id_1C355F42FAF7F4BB()
{
    _id_BED41D880242E6CD = [];
    teamhasuav = undefined;

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "killstreak", "teamHasUAV" ) )
        teamhasuav = [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "killstreak", "teamHasUAV" ) ]]( self.team );

    _id_497A07FC95E86184 = undefined;
    _id_C50FFD3DDA50EBFC = undefined;

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "perk", "hasPerk" ) )
    {
        _id_497A07FC95E86184 = self [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "perk", "hasPerk" ) ]]( "specialty_quieter" );
        _id_C50FFD3DDA50EBFC = self [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "perk", "hasPerk" ) ]]( "specialty_bulletdamage" );
    }

    if ( istrue( teamhasuav ) )
        _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "UAV_ACTIVE";

    if ( istrue( _id_497A07FC95E86184 ) )
        _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "DEADSILENCE_ACTIVE";

    if ( istrue( _id_C50FFD3DDA50EBFC ) )
        _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "HAS_STOPPING_POWER";

    _id_6B7BEE46F2C6DA28 = gettime();
    enemyhascuav = undefined;

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "killstreak", "enemyHasCUAV" ) )
        enemyhascuav = [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "killstreak", "enemyHasCUAV" ) ]]( self.team );

    ismarked = undefined;

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "killstreak", "helper_drone_isTargetMarked" ) )
        ismarked = self [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "killstreak", "helper_drone_isTargetMarked" ) ]]();

    isflashed = istrue( self.flashbanged );
    isstunned = istrue( self.concussiongrenadefx );
    _id_6FD2D9A208CEF69B = isdefined( self.gastriggerstouching ) && self.gastriggerstouching.size > 0 || isdefined( self.lastgastouchtime ) && self.lastgastouchtime + 5000 > _id_6B7BEE46F2C6DA28;
    _id_96A6AE39774BE3DD = isdefined( self.burninginfo ) || isdefined( self.lastburntime ) && self.lastburntime + 5000 > _id_6B7BEE46F2C6DA28;
    _id_DB1EE1676A83E16E = isdefined( self.lastsnapshotgrenadetime ) && self.lastsnapshotgrenadetime + 5000 > _id_6B7BEE46F2C6DA28;
    _id_B3447ABBB40EBFAB = isdefined( self.lastinsmoketime ) && self.lastinsmoketime + 5000 > _id_6B7BEE46F2C6DA28;
    _id_DF9D4533B4C32B50 = istrue( self.empcount );
    _id_2CA1CC391A5049B1 = istrue( self.wphealthblock );
    baseweapon = undefined;

    if ( isdefined( self.lastweaponused ) )
    {
        currentweapon = self.lastweaponused;
        baseweapon = getweaponbasename( currentweapon );
    }

    if ( istrue( enemyhascuav ) )
        _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "CUAV_ACTIVE";

    if ( istrue( ismarked ) )
        _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "IS_MARKED";

    if ( istrue( isflashed ) )
        _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "IS_FLASHED";

    if ( istrue( isstunned ) )
        _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "IS_STUNNED";

    if ( istrue( _id_6FD2D9A208CEF69B ) )
        _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "IN_GAS";

    if ( istrue( _id_96A6AE39774BE3DD ) )
        _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "IN_BURNING";

    if ( istrue( _id_DB1EE1676A83E16E ) )
        _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "IS_SNAPSHOTTED";

    if ( istrue( _id_B3447ABBB40EBFAB ) )
        _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "IN_SMOKE";

    if ( istrue( _id_DF9D4533B4C32B50 ) )
        _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "IS_EMPED";

    if ( istrue( _id_2CA1CC391A5049B1 ) )
        _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "IN_WHITE_PHOSPHOROUS";

    if ( self isnightvisionon() )
        _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "NVG_ENABLED";

    if ( isdefined( self.modifiers ) )
    {
        if ( istrue( self.modifiers["headshot"] ) )
            _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "HEADSHOT";

        if ( istrue( self.modifiers["avenger"] ) )
            _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "AVENGER";

        if ( istrue( self.modifiers["defender"] ) )
            _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "DEFENDER";

        if ( istrue( self.modifiers["posthumous"] ) )
            _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "POSTHUMOUS";

        if ( istrue( self.modifiers["revenge"] ) )
            _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "REVENGE";

        if ( istrue( self.modifiers["buzzkill"] ) )
            _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "BUZZKILL";

        if ( istrue( self.modifiers["firstblood"] ) )
            _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "FIRSTBLOOD";

        if ( istrue( self.modifiers["comeback"] ) )
            _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "COMEBACK";

        if ( istrue( self.modifiers["longshot"] ) )
            _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "LONGSHOT";

        if ( istrue( self.modifiers["pointblank"] ) )
            _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "POINTBLANK";

        if ( istrue( self.modifiers["assistedsuicide"] ) )
            _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "ASSISTED_SUICIDE";

        if ( isdefined( baseweapon ) && scripts\cp_mp\utility\script_utility::issharedfuncdefined( "killstreak", "isKillstreakWeapon" ) && istrue( [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "killstreak", "isKillstreakWeapon" ) ]]( baseweapon ) ) )
            _id_BED41D880242E6CD[_id_BED41D880242E6CD.size] = "KILLSTREAK";
    }

    return _id_BED41D880242E6CD;
}

_id_50989A55805A440B()
{
    _id_D3513ADD1F8263D7 = self playermounttype();

    if ( isdefined( _id_D3513ADD1F8263D7 ) )
    {
        switch ( _id_D3513ADD1F8263D7 )
        {
            case "mount_left":
                return "MOUNT_LEFT";
            case "mount_right":
                return "MOUNT_RIGHT";
            case "mount_top":
                return "MOUNT_TOP";
        }
    }

    return "MOUNT_NONE";
}

_id_0892570944F6B6A2( _id_2C6CA80E296FED3A )
{
    if ( istrue( game["isLaunchChunk"] ) )
        return 0;

    if ( !isdefined( _id_2C6CA80E296FED3A ) )
        return 0;
    else if ( isagent( _id_2C6CA80E296FED3A ) )
        return 0;
    else if ( !isplayer( _id_2C6CA80E296FED3A ) )
        return 0;

    return 1;
}

_id_3B981C2545637C9A( _id_934DC135AAF6F953 )
{
    switch ( _id_934DC135AAF6F953 )
    {
        case "EXE/SERVERCOMMANDOVERFLOW":
            return "MOD_DISCONNECTED";
        case "EXE/DISCONNECTED":
            return "MOD_QUIT";
        case "EXE/TIMEDOUT":
            return "MOD_TIMED_OUT";
        case "EXE/DISCONNECT":
            return "MOD_ONLINE_ENFORCEMENT_KICK";
        case "Sv_DirectConnect":
            return "MOD_SERVER_DROPPED_CLIENT";
        case "EXE/PLAYERKICKED_INACTIVE":
            return "MOD_INACTIVITY";
        default:
            return _id_934DC135AAF6F953;
    }
}

_id_4B974D822D418A06( data )
{
    if ( !isdefined( data.player ) )
        return 0;

    if ( !isdefined( data.player.pers ) )
        return 0;

    if ( !isdefined( data.player.pers["telemetry"] ) )
        return 0;

    if ( !isdefined( data.player.pers["telemetry"].life ) )
        return 0;

    return 1;
}

get_objective_type()
{
    _id_3985F515E9F06D2C = "hub";

    if ( isdefined( level.active_objectives_string ) )
        _id_3985F515E9F06D2C = level.active_objectives_string;
    else if ( isdefined( level._id_A1C29F4029327195 ) && isdefined( level._id_A1C29F4029327195._id_1EF9D4ABEA418A7E ) )
    {
        instance = level._id_A1C29F4029327195._id_1EF9D4ABEA418A7E;
        location = instance.targetname;

        if ( isdefined( location ) )
            _id_3985F515E9F06D2C = location;
    }
    else if ( isdefined( level._id_9FF590CA18F468B8 ) )
        _id_3985F515E9F06D2C = level._id_9FF590CA18F468B8;

    return _id_3985F515E9F06D2C;
}

_id_0FF48D255C865806( _id_2C6CA80E296FED3A )
{
    if ( _id_0892570944F6B6A2( _id_2C6CA80E296FED3A ) )
        return _id_2C6CA80E296FED3A.clientid < level.maxlogclients;
    else
        return 0;
}
