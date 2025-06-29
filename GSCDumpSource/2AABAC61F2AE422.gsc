// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

#using_animtree("script_model");

_id_CFEC51CAC79CA4E6( _id_19163E14365D9264, _id_BDFFC63C4171C131, _id_8FD4D93DD619DA88, _id_91F739C2C51347D4, _id_0D55D8445518099B, _id_F6A32DCC4B19AAD9, _id_67A06B4EA269058E, waittime, skipfirstraise, _id_6A94CF09AA6E486E )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( self isonladder() )
        return 0;

    if ( self ismantling() )
        return 0;

    if ( scripts\cp_mp\utility\player_utility::isusingremote() )
        return 0;

    _id_5C3F9357F11D2223 = "super_remote_device_mp";

    if ( isdefined( _id_F6A32DCC4B19AAD9 ) )
        _id_5C3F9357F11D2223 = _id_F6A32DCC4B19AAD9;

    weaponobj = makeweapon( _id_5C3F9357F11D2223 );
    _id_5F6056D7176B7103 = %vm_ks_tablet_super_remote_raise;
    _id_2ED8C4E06182FD14 = getanimlength( _id_5F6056D7176B7103 ) - getdvarfloat( "dvar_8416696FD33EBF85", 0.433 );

    if ( isdefined( waittime ) )
        _id_2ED8C4E06182FD14 = waittime;

    _id_4F203F286301B4AE( _id_19163E14365D9264 );
    _id_3B64EB40368C1450::set( "superDeploy", "allow_movement", 0 );
    _id_3B64EB40368C1450::set( "superDeploy", "allow_jump", 0 );
    _id_3B64EB40368C1450::set( "superDeploy", "usability", 0 );
    _id_3B64EB40368C1450::set( "superDeploy", "melee", 0 );
    _id_3B64EB40368C1450::set( "superDeploy", "offhand_weapons", 0 );
    _id_3B64EB40368C1450::set( "superDeploy", "supers", 0 );
    _id_3B64EB40368C1450::set( "superDeploy", "killstreaks", 0 );
    _id_41BF9BF4918115AC = _id_323489241CE4764A( weaponobj, _id_19163E14365D9264, ::_id_F3E423CE0923187E, _id_BDFFC63C4171C131, _id_8FD4D93DD619DA88, _id_91F739C2C51347D4, _id_0D55D8445518099B, skipfirstraise, _id_6A94CF09AA6E486E );

    if ( isdefined( self ) && scripts\cp_mp\utility\player_utility::_isalive() )
        _id_3B64EB40368C1450::_id_C9D0B43701BDBA00( "superDeploy" );

    if ( !istrue( _id_41BF9BF4918115AC ) )
    {
        _id_7CC79842967D7AE0( _id_19163E14365D9264 );

        if ( isdefined( self ) )
            scripts\cp_mp\utility\killstreak_utility::stoptabletscreen( _id_19163E14365D9264.staticdata.ref );

        return 0;
    }

    _id_0EABF81B5BE8DDB5 = _id_342F97880F848CAA( _id_19163E14365D9264, _id_2ED8C4E06182FD14, _id_67A06B4EA269058E );
    _id_7CC79842967D7AE0( _id_19163E14365D9264 );
    return istrue( _id_0EABF81B5BE8DDB5 );
}

_id_8300EC48C43363D6( _id_19163E14365D9264, weaponobj, _id_506F2E235EF4BFA8, _id_BDFFC63C4171C131, _id_8FD4D93DD619DA88, _id_91F739C2C51347D4, _id_0D55D8445518099B )
{
    _id_4F203F286301B4AE( _id_19163E14365D9264 );
    _id_819C14E9DC86B8C8 = scripts\engine\utility::ter_op( istrue( _id_506F2E235EF4BFA8 ), ::_id_F3E423CE0923187E, undefined );
    _id_41BF9BF4918115AC = _id_323489241CE4764A( weaponobj, _id_19163E14365D9264, _id_819C14E9DC86B8C8, _id_BDFFC63C4171C131, _id_8FD4D93DD619DA88, _id_91F739C2C51347D4, _id_0D55D8445518099B );

    if ( !istrue( _id_41BF9BF4918115AC ) )
    {
        _id_7CC79842967D7AE0( _id_19163E14365D9264 );
        return 0;
    }
    else
    {
        _id_7CC79842967D7AE0( _id_19163E14365D9264 );
        return 1;
    }
}

_id_342F97880F848CAA( _id_19163E14365D9264, animlength, _id_67A06B4EA269058E )
{
    level endon( "game_ended" );
    self endon( "disconnect" );

    if ( !isdefined( _id_67A06B4EA269058E ) )
        _id_67A06B4EA269058E = 1;

    alias = "iw9_killstreak_tablet_gear";
    self playlocalsound( alias );
    scripts\cp_mp\utility\player_utility::setusingremote( _id_19163E14365D9264.staticdata.ref );

    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "game", "objectiveUnPinPlayer" ) && isdefined( self.pinnedobjid ) )
    {
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "game", "objectiveUnPinPlayer" ) ]]( self.pinnedobjid, self );
        self.remoteunpinned = 1;
    }

    scripts\cp_mp\utility\player_utility::_freezecontrols( 1, undefined, "superDeploy" );
    thread _id_C46CE93718743BF6();

    if ( istrue( _id_67A06B4EA269058E ) )
        thread _id_A74D2CEE7557D7B1( animlength - 0.3 );

    thread _id_B351E53752CDB017( _id_19163E14365D9264 );
    thread _id_1A0D50CC1357BDAE();

    if ( animlength > 0 )
        scripts\cp_mp\utility\killstreak_utility::starttabletscreen( _id_19163E14365D9264.staticdata.ref, 0.05 );

    result = scripts\engine\utility::waittill_any_timeout_3( animlength, "death", "weapon_change", "cancel_all_super_deployments" );
    self notify( "super_freeze_end" );
    scripts\cp_mp\utility\player_utility::_freezecontrols( 0, undefined, "superDeploy" );

    if ( !isdefined( result ) || result != "timeout" || !self isonground() || self isonladder() )
    {
        self notify( "super_finished_with_deploy_weapon" );
        self stoplocalsound( "mp_killstreak_tablet_gear" );
        scripts\cp_mp\utility\killstreak_utility::stoptabletscreen( _id_19163E14365D9264.staticdata.ref );
        self notify( "cancel_remote_sequence" );
        return 0;
    }

    self notify( "deploy_weapon_anim_successful" );
    return 1;
}

_id_B351E53752CDB017( _id_19163E14365D9264 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self waittill( "super_finished_with_deploy_weapon" );

    if ( scripts\cp_mp\utility\player_utility::isusingremote() )
        scripts\cp_mp\utility\player_utility::clearusingremote( 1 );
}

_id_1A0D50CC1357BDAE()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "deploy_weapon_anim_successful" );
    self endon( "cancel_remote_sequence" );

    for (;;)
    {
        if ( !self isonground() )
        {
            self notify( "cancel_all_super_deployments" );
            break;
        }

        waitframe();
    }
}

_id_A74D2CEE7557D7B1( _id_3702CBA57F844507 )
{
    self endon( "disconnect" );
    result = scripts\engine\utility::waittill_any_timeout_1( _id_3702CBA57F844507, "cancel_remote_sequence" );

    if ( !isdefined( result ) || result == "cancel_remote_sequence" )
        return;

    if ( scripts\cp_mp\utility\player_utility::_isalive() )
    {
        self playlocalsound( "mp_killstreak_transition_whoosh" );
        level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer( self, 1, 0.3 );
        result = scripts\engine\utility::waittill_any_timeout_1( 0.7, "death" );

        if ( !isdefined( result ) || result == "death" )
            self stoplocalsound( "mp_killstreak_transition_whoosh" );

        level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer( self, 0, 0.3 );
    }
}

_id_7CC79842967D7AE0( _id_19163E14365D9264 )
{
    _id_19163E14365D9264.isdeploying = 0;
    _id_3B64EB40368C1450::_id_C9D0B43701BDBA00( "deployStart" );
}

_id_C46CE93718743BF6()
{
    self endon( "disconnect" );
    self endon( "super_freeze_end" );
    level waittill( "round_switch" );
    scripts\cp_mp\utility\player_utility::_freezecontrols( 0, undefined, "superDeploy" );
}

_id_323489241CE4764A( deployweaponobj, _id_19163E14365D9264, _id_819C14E9DC86B8C8, _id_BDFFC63C4171C131, _id_8FD4D93DD619DA88, _id_91F739C2C51347D4, _id_0D55D8445518099B, skipfirstraise, _id_6A94CF09AA6E486E )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );

    if ( self hasweapon( deployweaponobj ) )
        return 0;

    if ( !scripts\cp_mp\utility\game_utility::_id_0BEFF479639E6508() )
    {
        if ( getcompleteweaponname( self getcurrentweapon() ) == "iw8_lm_dblmg_mp" )
        {
            self notify( "switched_from_minigun" );

            while ( getcompleteweaponname( self getcurrentweapon() ) == "iw8_lm_dblmg_mp" )
                waitframe();
        }
    }

    if ( !isdefined( skipfirstraise ) )
        skipfirstraise = 1;

    scripts\cp_mp\utility\inventory_utility::_giveweapon( deployweaponobj, 0, 0, skipfirstraise );
    _id_137E8CA1E47954DC = _id_DFC98A2DE8E662A6( _id_19163E14365D9264, _id_BDFFC63C4171C131 );

    if ( !istrue( _id_137E8CA1E47954DC ) )
    {
        scripts\cp_mp\utility\inventory_utility::_takeweapon( deployweaponobj );
        return 0;
    }

    thread _id_12BD106B0DD9B11D( _id_19163E14365D9264, deployweaponobj );
    thread _id_6CE6B67D4D0FF91B( _id_19163E14365D9264, deployweaponobj );
    _id_41BF9BF4918115AC = scripts\cp_mp\utility\inventory_utility::domonitoredweaponswitch( deployweaponobj, istrue( _id_6A94CF09AA6E486E ) );
    _id_19163E14365D9264 notify( "deploy_weapon_switch_ended" );

    if ( isdefined( _id_8FD4D93DD619DA88 ) )
        self thread [[ _id_8FD4D93DD619DA88 ]]( _id_19163E14365D9264, _id_41BF9BF4918115AC );

    waitframe();

    if ( !_id_41BF9BF4918115AC )
        _id_819C14E9DC86B8C8 = undefined;

    if ( !scripts\cp_mp\utility\player_utility::_isalive() )
        return 0;

    thread _id_0E65B31E6948C503( _id_41BF9BF4918115AC, _id_19163E14365D9264, deployweaponobj, _id_819C14E9DC86B8C8, _id_91F739C2C51347D4, _id_0D55D8445518099B );
    return _id_41BF9BF4918115AC;
}

_id_0E65B31E6948C503( _id_41BF9BF4918115AC, _id_19163E14365D9264, deployweaponobj, _id_819C14E9DC86B8C8, _id_91F739C2C51347D4, _id_0D55D8445518099B )
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );

    if ( isdefined( _id_819C14E9DC86B8C8 ) )
        self [[ _id_819C14E9DC86B8C8 ]]( _id_19163E14365D9264 );

    if ( self hasweapon( deployweaponobj ) )
    {
        _id_CD5C5AC9105AB0D7 = _id_B04CBD5DB8951229( deployweaponobj.basename );
        _id_3B64EB40368C1450::set( "cleanupDeployWeapon", "melee", 0 );
        _id_3B64EB40368C1450::set( "cleanupDeployWeapon", "offhand_weapons", 0 );

        if ( _id_CD5C5AC9105AB0D7 )
        {
            _id_3B64EB40368C1450::set( "cleanupDeployWeapon", "mantle", 0 );
            _id_3B64EB40368C1450::set( "cleanupDeployWeapon", "allow_movement", 0 );
            _id_524D5D1E26C664C5 = 0.5;

            if ( !scripts\cp_mp\utility\player_utility::isreallyalive( self ) )
                _id_524D5D1E26C664C5 = 0.0;

            scripts\cp_mp\utility\killstreak_utility::stoptabletscreen( _id_19163E14365D9264.staticdata.ref, _id_524D5D1E26C664C5, 1 );
            scripts\cp_mp\utility\player_utility::_freezelookcontrols( 1 );
        }

        if ( isdefined( _id_91F739C2C51347D4 ) )
            self [[ _id_91F739C2C51347D4 ]]( _id_19163E14365D9264, _id_41BF9BF4918115AC, deployweaponobj );
        else
            _id_B22D2E6D02D50B21( deployweaponobj );

        _id_3B64EB40368C1450::_id_C9D0B43701BDBA00( "cleanupDeployWeapon" );

        if ( _id_CD5C5AC9105AB0D7 )
            scripts\cp_mp\utility\player_utility::_freezelookcontrols( 0 );
    }

    if ( isdefined( _id_0D55D8445518099B ) )
        self [[ _id_0D55D8445518099B ]]( _id_19163E14365D9264 );
}

_id_B22D2E6D02D50B21( deployweaponobj )
{
    scripts\cp_mp\utility\inventory_utility::getridofweapon( deployweaponobj, istrue( self._id_4A2F2F50A9020E2E ) );
    self._id_4A2F2F50A9020E2E = undefined;
    currentweapon = self getcurrentweapon();

    if ( currentweapon.basename == "none" )
        scripts\cp_mp\utility\inventory_utility::forcevalidweapon();
}

_id_12BD106B0DD9B11D( _id_19163E14365D9264, deployweaponobj )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    _id_19163E14365D9264 endon( "deploy_weapon_switch_ended" );
    self waittill( "cancel_all_super_deployments" );

    if ( scripts\cp_mp\utility\inventory_utility::isswitchingtoweaponwithmonitoring( deployweaponobj ) )
        scripts\cp_mp\utility\inventory_utility::abortmonitoredweaponswitch( deployweaponobj );
}

_id_B04CBD5DB8951229( weaponname )
{
    _id_CD5C5AC9105AB0D7 = 0;

    switch ( weaponname )
    {
        case "super_remote_device_mp":
            _id_CD5C5AC9105AB0D7 = 1;
            break;
    }

    return _id_CD5C5AC9105AB0D7;
}

_id_6CE6B67D4D0FF91B( _id_19163E14365D9264, deployweaponobj )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    _id_19163E14365D9264 endon( "deploy_weapon_switch_ended" );
    self waittill( "melee_swipe_start" );

    if ( scripts\cp_mp\utility\inventory_utility::isswitchingtoweaponwithmonitoring( deployweaponobj ) )
        scripts\cp_mp\utility\inventory_utility::abortmonitoredweaponswitch( deployweaponobj );
    else
    {
        scripts\cp_mp\utility\inventory_utility::_takeweapon( deployweaponobj );
        thread scripts\cp_mp\utility\inventory_utility::domonitoredweaponswitch( self.lastdroppableweaponobj );
    }
}

_id_4F203F286301B4AE( _id_19163E14365D9264 )
{
    _id_19163E14365D9264.isdeploying = 1;
    _id_3B64EB40368C1450::set( "deployStart", "crate_use", 0 );
    _id_3B64EB40368C1450::set( "deployStart", "ascender_use", 0 );
}

_id_DFC98A2DE8E662A6( _id_19163E14365D9264, _id_BDFFC63C4171C131 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "cancel_all_super_deployments" );

    if ( isdefined( _id_BDFFC63C4171C131 ) )
        return self [[ _id_BDFFC63C4171C131 ]]( _id_19163E14365D9264 );

    return 1;
}

_id_F3E423CE0923187E( _id_19163E14365D9264 )
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    childthread _id_AFB1BE43E272A00A( self, "super_finished_with_deploy_weapon" );
    childthread _id_AFB1BE43E272A00A( self, "cancel_all_super_deployments" );
    childthread _id_AFB1BE43E272A00A( self, "weapon_change" );

    for (;;)
    {
        self waittill( "super_finished_with_deploy_weapon", result );

        if ( isdefined( result ) && result == "weapon_change" )
        {
            if ( scripts\cp_mp\utility\player_utility::isusingremote() )
                continue;
        }

        break;
    }
}

_id_AFB1BE43E272A00A( ent, _id_F36C0162774A45FA )
{
    self endon( "super_finished_with_deploy_weapon" );
    ent waittill( _id_F36C0162774A45FA );
    self notify( "super_finished_with_deploy_weapon", _id_F36C0162774A45FA );
}
