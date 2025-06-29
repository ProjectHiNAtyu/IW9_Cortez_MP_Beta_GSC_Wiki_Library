// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

register_ai_damage_callbacks()
{
    level.agent_funcs["actor_enemy_lw_base_br"]["on_damaged"] = ::callbacksoldieragentdamaged;
    level.agent_funcs["actor_enemy_lw_base_br"]["gametype_on_damage_finished"] = ::callbacksoldieragentgametypedamagefinished;
    level.agent_funcs["actor_enemy_lw_base_br"]["gametype_on_killed"] = ::callbacksoldieragentgametypekilled;
    level.agent_funcs["actor_enemy_lw_base_juggernaut"]["on_damaged"] = ::callbacksoldieragentdamaged;
    level.agent_funcs["actor_enemy_lw_base_juggernaut"]["gametype_on_damage_finished"] = ::callbacksoldieragentgametypedamagefinished;
    level.agent_funcs["actor_enemy_lw_base_juggernaut"]["gametype_on_killed"] = ::callbacksoldieragentgametypekilled;
}

callbacksoldieragentdamaged( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon )
{
    _id_E851FFA44B7E0D54 = self;

    if ( !isdefined( _id_E851FFA44B7E0D54.agent_type ) )
        return;

    if ( !isdefined( objweapon ) )
        objweapon = sweapon;

    if ( smeansofdeath != "MOD_SUICIDE" )
    {
        if ( is_friendly_damage( _id_E851FFA44B7E0D54, einflictor ) )
            return;
    }

    if ( !isdefined( eattacker ) )
        eattacker = _id_E851FFA44B7E0D54;

    _id_99466D795331383A = should_do_damage_checks( eattacker, idamage, smeansofdeath, sweapon, shitloc, _id_E851FFA44B7E0D54 );

    if ( !_id_99466D795331383A )
        return;

    idflags = idflags | 4;
    _id_A95F61E7118777D1 = idamage;
    _id_5C3F9357F11D2223 = objweapon.basename;
    _id_C0B9C9A4FA4EEF84 = objweapon.classname;
    _id_EAC756C4A01AA740 = is_suicide_bomber();
    isinlaststand = istrue( eattacker.inlaststand );
    ismeleedamage = smeansofdeath == "MOD_MELEE";
    _id_A3192D2F80ED4FF8 = scripts\engine\utility::isbulletdamage( smeansofdeath ) || smeansofdeath == "MOD_EXPLOSIVE_BULLET" && shitloc != "none";
    _id_379485F96865DB6D = isdefined( eattacker ) && isplayer( eattacker );
    _id_7543D4FE49C53684 = isdefined( eattacker.owner ) && isplayer( eattacker.owner );
    isjuggernaut = isdefined( _id_E851FFA44B7E0D54.unittype ) && _id_E851FFA44B7E0D54.unittype == "juggernaut";
    headshot = _id_A3192D2F80ED4FF8 && scripts\cp_mp\utility\damage_utility::isheadshot( shitloc, smeansofdeath, eattacker );
    _id_93DDA441E5C43170 = smeansofdeath == "MOD_EXPLOSIVE_BULLET" && ( isdefined( shitloc ) && shitloc == "none" ) || smeansofdeath == "MOD_EXPLOSIVE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_GRENADE";
    _id_F6FCAAA9C3B578A5 = smeansofdeath == "MOD_FIRE";
    _id_417D44697DD9A40F = _id_379485F96865DB6D && eattacker _hasperk( "specialty_bulletdamage" );
    _id_B4A897B1262EA17C = isdefined( eattacker.classname ) && eattacker.classname == "script_vehicle" && isdefined( eattacker.owner ) && isplayer( eattacker.owner );
    _id_F3B5D704CA2A9B3D = _id_B4A897B1262EA17C && smeansofdeath == "MOD_CRUSH";
    _id_B2F70B31E5B3822F = isdefined( eattacker.classname ) && eattacker.classname == "script_vehicle" && !isdefined( eattacker.owner );
    _id_565D1EE9D540FA9E = _id_B2F70B31E5B3822F && smeansofdeath == "MOD_CRUSH";

    if ( ( _id_379485F96865DB6D || _id_7543D4FE49C53684 ) && istrue( _id_E851FFA44B7E0D54.invulnerable ) && smeansofdeath != "MOD_SUICIDE" )
        return;

    if ( isjuggernaut )
    {
        if ( ismeleedamage )
            idamage = 0;
        else
        {
            idamage = idamage * 0.3;

            if ( _id_5C3F9357F11D2223 == "thermite_ap_mp" || _id_5C3F9357F11D2223 == "thermite_proj_cp" )
                idamage = idamage * 15;

            if ( _id_5C3F9357F11D2223 == "cruise_proj_mp" )
                idamage = self.health + 1000;
        }

        if ( _id_F3B5D704CA2A9B3D )
        {
            _id_AC1EB7A473848892 = [ "atv" ];

            if ( scripts\engine\utility::array_contains( _id_AC1EB7A473848892, eattacker.vehiclename ) )
                eattacker dodamage( 10000, eattacker.origin, _id_E851FFA44B7E0D54 );
            else
            {
                playsoundatpos( self.origin + ( 0, 0, 40 ), "gib_fullbody" );
                idamage = self.health + 1000;
            }
        }
    }
    else if ( _id_379485F96865DB6D )
    {
        if ( _id_5C3F9357F11D2223 == "throwingknife_mp" )
            idamage = self.health + 1000;

        if ( _id_5C3F9357F11D2223 == "iw9_tur_light_tank_mp" && smeansofdeath == "MOD_PROJECTILE" )
            idamage = self.health + 1000;
    }

    if ( istrue( self.bhasriotshieldattached ) )
    {
        if ( shouldblockdamage( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon ) )
            return;

        if ( shitloc == "shield" && ( smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_PROJECTILE" ) && idamage > 175 )
        {
            idamage = idamage * 0.05;
            shitloc = "torso_lower";
        }
    }

    if ( _id_EAC756C4A01AA740 )
    {
        if ( _id_5C3F9357F11D2223 == "emp_drone_player_mp" )
            idamage = self.health + 1000;
    }

    if ( _id_F3B5D704CA2A9B3D )
        playsoundatpos( self.origin + ( 0, 0, 40 ), "gib_fullbody" );

    if ( _id_565D1EE9D540FA9E )
    {
        if ( istrue( self.invuln_to_veh_crush ) )
        {
            idamage = 0;
            _id_E851FFA44B7E0D54 notify( "veh_crush_damage", eattacker );
        }
    }

    if ( _id_379485F96865DB6D )
    {
        _id_E851FFA44B7E0D54.damaged_by_player = 1;

        if ( headshot )
        {
            if ( isjuggernaut )
                idamage = adjust_damage_based_on_weaponclass( idamage, sweapon, _id_C0B9C9A4FA4EEF84, smeansofdeath, eattacker );
        }

        if ( _id_417D44697DD9A40F )
            idamage = idamage * 2;

        if ( _id_93DDA441E5C43170 )
        {
            _id_B8693BB74A2FBC11 = idamage * 2.5;

            if ( isdefined( level.explosivedamagemod ) )
                _id_B8693BB74A2FBC11 = _id_B8693BB74A2FBC11 * level.explosivedamagemod;

            idamage = idamage + _id_B8693BB74A2FBC11;
        }

        if ( _id_F6FCAAA9C3B578A5 )
            idamage = idamage + idamage * 3.5;

        if ( ismeleedamage && !isjuggernaut )
        {
            if ( istrue( _id_E851FFA44B7E0D54.immune_to_melee_damage ) )
            {
                idamage = 0;
                _id_E851FFA44B7E0D54 notify( "melee_hit_on_melee_immune", eattacker );
            }
            else
            {
                idamage = 150;

                if ( issubstr( _id_5C3F9357F11D2223, "iw8_knife_mp" ) )
                    idamage = 350;

                if ( issubstr( _id_5C3F9357F11D2223, "iw8_me_" ) )
                    idamage = 350;
                else if ( isdefined( objweapon.muzzle ) )
                {
                    if ( issubstr( objweapon.muzzle, "muzzlemelee" ) )
                        idamage = 350;

                    if ( issubstr( objweapon.muzzle, "bayonet" ) )
                        idamage = 350;
                }
            }
        }

        if ( _id_A3192D2F80ED4FF8 )
        {
            if ( !headshot )
            {
                if ( !isdefined( level.bullet_damage_scalar ) )
                    level.bullet_damage_scalar = 1;

                idamage = idamage * level.bullet_damage_scalar;
            }

            idamage = idamage * 1;
        }
    }

    if ( isdefined( _id_5C3F9357F11D2223 ) && _id_5C3F9357F11D2223 == "iw9_tur_light_tank_mp" && isdefined( smeansofdeath ) && smeansofdeath == "MOD_PROJECTILE_SPLASH" )
        idamage = idamage * 2;

    if ( _id_379485F96865DB6D || _id_7543D4FE49C53684 || _id_F3B5D704CA2A9B3D )
    {
        if ( isdefined( objweapon ) )
        {
            if ( _id_7543D4FE49C53684 )
                eattacker = eattacker.owner;

            addattacker( self, eattacker, einflictor, objweapon, idamage, vpoint, vdir, shitloc, timeoffset, smeansofdeath );
        }

        if ( idamage >= _id_E851FFA44B7E0D54.health )
        {
            if ( objweapon.basename == "none" )
            {
                if ( isdefined( einflictor ) && isdefined( einflictor.weapon_name ) )
                    objweapon = makeweapon( einflictor.weapon_name );
            }

            _id_4D8D96D547DF2E9F = spawnstruct();
            _id_4D8D96D547DF2E9F.einflictor = einflictor;
            _id_4D8D96D547DF2E9F.eattacker = eattacker;
            _id_4D8D96D547DF2E9F.idamage = idamage;
            _id_4D8D96D547DF2E9F.idflags = idflags;
            _id_4D8D96D547DF2E9F.smeansofdeath = smeansofdeath;
            _id_4D8D96D547DF2E9F.sweapon = sweapon;
            _id_4D8D96D547DF2E9F.vpoint = vpoint;
            _id_4D8D96D547DF2E9F.vdir = vdir;
            _id_4D8D96D547DF2E9F.shitloc = shitloc;
            _id_4D8D96D547DF2E9F.timeoffset = timeoffset;
            _id_4D8D96D547DF2E9F.modelindex = modelindex;
            _id_4D8D96D547DF2E9F.partname = partname;
            _id_4D8D96D547DF2E9F.objweapon = objweapon;
        }
    }

    idamage = int( min( idamage, _id_E851FFA44B7E0D54.maxhealth ) );

    if ( is_flashbang( _id_5C3F9357F11D2223, objweapon, einflictor ) && smeansofdeath == "MOD_GRENADE_SPLASH" )
        _id_E851FFA44B7E0D54 notify( "flashbang", shitloc, 1, undefined, eattacker, "allies" );

    if ( is_gas( _id_5C3F9357F11D2223 ) && smeansofdeath == "MOD_GRENADE_SPLASH" )
        _id_E851FFA44B7E0D54 notify( "flashbang", shitloc, 1, undefined, eattacker, "allies" );

    if ( isdefined( _id_E851FFA44B7E0D54.unittype ) && isdefined( level.agent_funcs[_id_E851FFA44B7E0D54.unittype] ) && isdefined( level.agent_funcs[_id_E851FFA44B7E0D54.unittype]["on_damaged_finished"] ) )
        _id_E851FFA44B7E0D54 [[ level.agent_funcs[_id_E851FFA44B7E0D54.unittype]["on_damaged_finished"] ]]( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, 0.0, modelindex, partname );
    else
        _id_E851FFA44B7E0D54 [[ level.agent_funcs[_id_E851FFA44B7E0D54.agent_type]["on_damaged_finished"] ]]( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, 0.0, modelindex, partname );
}

callbacksoldieragentgametypedamagefinished( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, _id_B6F2EA21C3462024, modelindex, partname )
{
    if ( smeansofdeath == "MOD_SUICIDE" )
        return;

    process_damage_feedback( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vdir, vdir, shitloc, timeoffset, self );
    idflags = 0;

    if ( !isdefined( self.painsound ) )
        return;

    if ( gettime() > self.next_dmg_sound )
    {
        if ( soundexists( self.painsound ) )
            self playsound( self.painsound );

        self.next_dmg_sound = gettime() + 500;
    }
}

callbacksoldieragentgametypekilled( einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration )
{
    if ( isdefined( level.spawnloopupdatefunc ) )
        [[ level.spawnloopupdatefunc ]]( eattacker, objweapon );

    if ( smeansofdeath == "MOD_SUICIDE" )
        return;

    if ( istrue( self.marked_for_death ) )
        self.marked_for_death = undefined;

    if ( isdefined( self.death_info_func ) )
    {
        _id_4D8D96D547DF2E9F = spawnstruct();
        _id_4D8D96D547DF2E9F.einflictor = einflictor;
        _id_4D8D96D547DF2E9F.eattacker = eattacker;
        _id_4D8D96D547DF2E9F.idamage = idamage;
        _id_4D8D96D547DF2E9F.smeansofdeath = smeansofdeath;
        _id_4D8D96D547DF2E9F.sweapon = objweapon;
        _id_4D8D96D547DF2E9F.vdir = vdir;
        _id_4D8D96D547DF2E9F.shitloc = shitloc;
        _id_4D8D96D547DF2E9F.timeoffset = timeoffset;
        _id_4D8D96D547DF2E9F.deathanimduration = deathanimduration;
        thread [[ self.death_info_func ]]( _id_4D8D96D547DF2E9F );
    }

    if ( !istrue( level.disablestattracking ) )
    {
        if ( isdefined( eattacker ) && eattacker.classname != "worldspawn" && isplayer( eattacker ) )
        {
            _id_642470E1ABC1BBF9 = spawnstruct();
            _id_642470E1ABC1BBF9.hitloc = shitloc;
            eattacker scripts\mp\events::_id_B7F154368ABBE463( self, objweapon, smeansofdeath, einflictor, _id_642470E1ABC1BBF9 );
            thread scripts\cp_mp\challenges::_id_5A0AE8BC2B80C0C0( einflictor, eattacker, idamage, smeansofdeath, objweapon, shitloc, eattacker.modifiers );
            _id_6A8EC730B2BFA844::_id_AFF49E563A741F1E( self, eattacker, objweapon );
        }
    }

    if ( isplayer( eattacker ) )
    {
        eattacker thread _id_E6D4CD6D0EBC07E1( self, einflictor, objweapon );
        level thread handle_death_sounds( eattacker, self, smeansofdeath );

        if ( !_id_2669878CF5A1B6BC::iskillstreakweapon( objweapon.basename ) && !eattacker scripts\mp\utility\perk::_hasperk( "specialty_explosivebullets" ) )
        {
            eattacker thread scripts\mp\events::killeventtextpopup( "stat_EF9582D72160F199", 0 );

            if ( level._id_0F1F253AEE175FF4 > 0 )
            {
                if ( !isdefined( eattacker.pers["agentsKillstreakCount"] ) )
                    eattacker.pers["agentsKillstreakCount"] = 1;
                else
                    eattacker.pers["agentsKillstreakCount"]++;

                if ( eattacker.pers["agentsKillstreakCount"] == level._id_0F1F253AEE175FF4 )
                {
                    if ( eattacker scripts\cp_mp\utility\player_utility::_isalive() )
                    {
                        event = "stat_EF9582D72160F199";
                        points = scripts\mp\rank::getscoreinfovalue( event );
                        eattacker scripts\mp\killstreaks\killstreaks::givestreakpoints( event, 1, points );
                    }

                    eattacker.pers["agentsKillstreakCount"] = 0;
                }
            }

            if ( isdefined( eattacker.modifiers ) )
            {
                if ( istrue( eattacker.modifiers["oneshotkill"] ) )
                    eattacker thread scripts\mp\utility\points::_id_0366980B6A8796AE( "stat_D3BB96C8BD6EFD71" );

                if ( istrue( eattacker.modifiers["gunbutt"] ) )
                    eattacker thread scripts\mp\utility\points::_id_0366980B6A8796AE( "stat_020FBB2528F21BD3" );

                if ( smeansofdeath == "MOD_MELEE" )
                {
                    if ( objweapon.basename == "iw9_me_fists_mp" )
                        eattacker thread scripts\mp\utility\points::_id_0366980B6A8796AE( "stat_D3DD8A69E4A03838" );
                }

                if ( istrue( eattacker.modifiers["headshot"] ) )
                    eattacker thread scripts\mp\utility\points::_id_0366980B6A8796AE( "stat_FC56E889052D3823" );

                if ( istrue( eattacker.modifiers["pointblank"] ) )
                    eattacker thread scripts\mp\utility\points::_id_0366980B6A8796AE( "stat_A4EE120BD3F61B35" );

                if ( istrue( eattacker.modifiers["longshot"] ) )
                    eattacker thread scripts\mp\utility\points::_id_0366980B6A8796AE( "stat_9501A62017D709D3" );

                if ( istrue( eattacker.modifiers["backstab"] ) )
                {
                    if ( objweapon.basename == "iw8_knife_mp" )
                        eattacker thread scripts\mp\utility\points::_id_0366980B6A8796AE( "stat_ACEEE63CB46A233A" );
                }

                if ( eattacker ismantling() )
                    eattacker thread scripts\mp\utility\points::_id_0366980B6A8796AE( "stat_86C2B3D1FA522F2B" );

                if ( scripts\mp\utility\weapon::isthrowingknife( objweapon.basename ) )
                    eattacker thread scripts\mp\utility\points::_id_0366980B6A8796AE( "stat_123320811BF44B63" );

                if ( istrue( eattacker.modifiers["launcher_impact"] ) )
                    eattacker thread scripts\mp\utility\points::_id_0366980B6A8796AE( "stat_E13C7899C2EED171" );
            }
        }
    }

    if ( smeansofdeath == "MOD_CRUSH" && isdefined( eattacker.classname ) && eattacker.classname == "script_vehicle" )
        self playsound( "vehicle_body_hit" );

    if ( isdefined( level.removefromtargetmarkeronkillfunc ) )
        level thread [[ level.removefromtargetmarkeronkillfunc ]]( self );

    idflags = 0;
    process_damage_feedback( einflictor, eattacker, idamage, idflags, smeansofdeath, objweapon, vdir, vdir, shitloc, timeoffset, self );
}

is_friendly_damage( agent, attacker )
{
    if ( isdefined( attacker ) && isdefined( agent ) && isdefined( agent.team ) )
    {
        if ( isdefined( attacker.team ) && attacker.team == agent.team )
            return 1;

        if ( isdefined( attacker.owner ) && isdefined( attacker.owner.team ) && attacker.owner.team == agent.team )
            return 1;
    }

    return 0;
}

should_do_damage_checks( eattacker, idamage, smeansofdeath, sweapon, shitloc, victim )
{
    if ( !isdefined( sweapon ) )
        return 0;
    else if ( eattacker != victim && isdefined( eattacker.team ) && eattacker.team == victim.team )
        return 0;
    else if ( isdefined( level.should_do_damage_check_func ) && ![[ level.should_do_damage_check_func ]]( eattacker, idamage, smeansofdeath, sweapon, shitloc, victim ) )
        return 0;

    return 1;
}

is_suicide_bomber()
{
    return istrue( isdefined( self.unittype ) && self.unittype == "suicidebomber" );
}

adjust_damage_based_on_weaponclass( idamage, sweapon, weaponclass, type, attacker )
{
    _id_702BFC08FABD86CB = idamage;

    switch ( weaponclass )
    {
        case "rifle":
            _id_702BFC08FABD86CB = min( idamage, 84 );
            break;
        case "smg":
            _id_702BFC08FABD86CB = min( idamage, 110 );
            break;
        case "mg":
            _id_702BFC08FABD86CB = min( idamage, 105 );
            break;
        case "spread":
            _id_702BFC08FABD86CB = min( idamage, 84 );
            break;
        case "pistol":
            _id_702BFC08FABD86CB = min( idamage, 75 );
            break;
        case "sniper":
            _id_702BFC08FABD86CB = min( idamage, 130 );
            break;
        default:
            _id_702BFC08FABD86CB = idamage;
            break;
    }

    return idamage;
}

addattacker( victim, eattacker, einflictor, objweapon, idamage, vpoint, vdir, shitloc, psoffsettime, smeansofdeath )
{
    if ( !isdefined( victim.attackerdata ) )
        victim.attackerdata = [];

    if ( !isdefined( eattacker.guid ) && ( isagent( eattacker ) || isplayer( eattacker ) ) )
        eattacker.guid = eattacker scripts\mp\utility\player::getuniqueid();

    if ( !isdefined( eattacker.guid ) )
        return;

    if ( !isdefined( victim.attackerdata[eattacker.guid] ) )
    {
        victim.attackers[eattacker.guid] = eattacker;
        victim.attackerdata[eattacker.guid] = spawnstruct();
        victim.attackerdata[eattacker.guid].damage = 0;
        victim.attackerdata[eattacker.guid].attackerent = eattacker;
        victim.attackerdata[eattacker.guid].firsttimedamaged = gettime();
        victim.attackerdata[eattacker.guid].hitcount = 1;
    }
    else
        victim.attackerdata[eattacker.guid].hitcount++;

    if ( scripts\mp\utility\weapon::iscacprimaryweapon( objweapon ) && !scripts\mp\utility\weapon::iscacsecondaryweapon( objweapon ) )
        victim.attackerdata[eattacker.guid].diddamagewithprimary = 1;

    if ( isdefined( smeansofdeath ) && smeansofdeath != "MOD_MELEE" )
        victim.attackerdata[eattacker.guid].didnonmeleedamage = 1;

    _id_11D2F075E9A0E643 = scripts\mp\utility\weapon::getequipmenttype( objweapon );

    if ( isdefined( _id_11D2F075E9A0E643 ) )
    {
        if ( _id_11D2F075E9A0E643 == "lethal" )
            victim.attackerdata[eattacker.guid].diddamagewithlethalequipment = 1;

        if ( _id_11D2F075E9A0E643 == "tactical" )
            victim.attackerdata[eattacker.guid].diddamagewithtacticalequipment = 1;
    }

    victim.attackerdata[eattacker.guid].damage = victim.attackerdata[eattacker.guid].damage + idamage;
    victim.attackerdata[eattacker.guid].weapon = getcompleteweaponname( objweapon );
    victim.attackerdata[eattacker.guid].objweapon = objweapon;
    victim.attackerdata[eattacker.guid].vpoint = vpoint;
    victim.attackerdata[eattacker.guid].vdir = vdir;
    victim.attackerdata[eattacker.guid].shitloc = shitloc;
    victim.attackerdata[eattacker.guid].psoffsettime = psoffsettime;
    victim.attackerdata[eattacker.guid].smeansofdeath = smeansofdeath;
    victim.attackerdata[eattacker.guid].attackerent = eattacker;
    victim.attackerdata[eattacker.guid].lasttimedamaged = gettime();

    if ( isdefined( einflictor ) && !isplayer( einflictor ) && isdefined( einflictor.primaryweapon ) )
        victim.attackerdata[eattacker.guid].sprimaryweapon = einflictor.primaryweapon;
    else if ( isdefined( eattacker ) && isplayer( eattacker ) && !isnullweapon( eattacker getcurrentprimaryweapon() ) )
        victim.attackerdata[eattacker.guid].sprimaryweapon = getcompleteweaponname( eattacker getcurrentprimaryweapon() );
    else
        victim.attackerdata[eattacker.guid].sprimaryweapon = undefined;
}

is_flashbang( weaponname, objweapon, inflictor )
{
    return weaponname == "flash_grenade_mp";
}

is_gas( weaponname )
{
    return weaponname == "gas_mp";
}

handle_death_sounds( attacker, victim, smeansofdeath )
{
    if ( !scripts\engine\utility::isbulletdamage( smeansofdeath ) )
        return;

    if ( isdefined( victim.deathsound ) && soundexists( victim.deathsound ) )
        playsoundatpos( victim.origin, victim.deathsound );

    ent = victim;

    if ( smeansofdeath == "MOD_HEAD_SHOT" )
    {
        ent playsoundtoplayer( "bullet_impact_headshot", attacker );
        ent playsoundtoteam( "bullet_impact_headshot_npc", attacker.team, attacker );
    }
    else
    {
        ent playsoundtoplayer( "mp_kill_alert", attacker );
        ent playsoundtoteam( "mp_hit_alert_final_npc", attacker.team, attacker );
    }
}

process_damage_feedback( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, victim )
{
    _id_168973EAF883AEA1 = isdefined( eattacker ) && isdefined( eattacker.classname ) && isdefined( eattacker.classname ) && !isdefined( eattacker.gunner ) && ( eattacker.classname == "script_vehicle" || eattacker.classname == "misc_turret" || eattacker.classname == "script_model" );
    _id_91EBB035A259E76A = undefined;

    if ( _id_168973EAF883AEA1 && isdefined( eattacker.gunner ) )
        _id_91EBB035A259E76A = eattacker.gunner;
    else if ( isdefined( eattacker ) && isdefined( eattacker.owner ) )
        _id_91EBB035A259E76A = eattacker.owner;
    else
        _id_91EBB035A259E76A = eattacker;

    isbulletdamage = scripts\engine\utility::isbulletdamage( smeansofdeath );
    _id_CDCEDB142F61B43E = scripts\engine\utility::ter_op( isbulletdamage && scripts\mp\utility\weapon::isprimaryweapon( sweapon ), "standardspread", "standard" );
    _id_59AD6A29257C9F49 = 0;

    if ( isdefined( eattacker ) && isdefined( eattacker.class ) && eattacker.class == "engineer" )
    {
        if ( isdefined( smeansofdeath ) && scripts\engine\utility::isbulletdamage( smeansofdeath ) )
            _id_59AD6A29257C9F49 = 1;
    }

    if ( isdefined( _id_91EBB035A259E76A ) && _id_91EBB035A259E76A != victim && idamage > 0 && ( !isdefined( shitloc ) || shitloc != "shield" ) )
    {
        _id_4FFE32F42D51A763 = !isalive( victim ) || isagent( victim ) && idamage >= victim.health;

        if ( istrue( victim.isjuggernaut ) )
            _id_CDCEDB142F61B43E = "hitjuggernaut";
        else if ( idflags & level.idflags_stun )
            _id_CDCEDB142F61B43E = "stun";
        else if ( scripts\mp\utility\damage::istacticaldamage( sweapon, smeansofdeath ) && victim _hasperk( "specialty_stun_resistance" ) )
            _id_CDCEDB142F61B43E = "hittacresist";
        else if ( isexplosivedamagemod( smeansofdeath ) && victim _hasperk( "specialty_blastshield" ) && !scripts\mp\utility\damage::damage_should_ignore_blast_shield( eattacker, victim, sweapon, smeansofdeath, einflictor, shitloc ) )
            _id_CDCEDB142F61B43E = "hitblastshield";
        else if ( victim _hasperk( "specialty_pistoldeath" ) && isdefined( victim.inlaststand ) && victim.inlaststand == 1 && !victim.hasshownlaststandicon )
        {
            victim.hasshownlaststandicon = 1;
            _id_CDCEDB142F61B43E = "hitlaststand";
        }

        if ( isdefined( victim.focus_fire_attackers ) && victim.focus_fire_attackers.size > 1 )
            _id_CDCEDB142F61B43E = "cp_relic_buff";

        _id_B98146816886D3C4 = "standard";
        _id_0DD6BF5F9DBA888C = weaponclass( sweapon );
        isspreadweapon = _id_0DD6BF5F9DBA888C == "spread";
        headshot = !isspreadweapon && scripts\cp_mp\utility\damage_utility::isheadshot( shitloc, smeansofdeath, eattacker );
        _id_14B8F2EEBA6A3E78 = 1;
        _id_62CF84636D4CEF2C = smeansofdeath == "MOD_MELEE";
        _id_748DFD5F88E890D1 = "" + gettime();

        if ( !_id_62CF84636D4CEF2C && isspreadweapon && isdefined( _id_91EBB035A259E76A.pelletdmg ) && isdefined( _id_91EBB035A259E76A.pelletdmg[_id_748DFD5F88E890D1] ) && isdefined( _id_91EBB035A259E76A.pelletdmg[_id_748DFD5F88E890D1][victim.guid] ) && _id_91EBB035A259E76A.pelletdmg[_id_748DFD5F88E890D1][victim.guid] > 1 )
        {
            if ( _id_4FFE32F42D51A763 )
                _id_62CF84636D4CEF2C = 1;
            else
                _id_14B8F2EEBA6A3E78 = 0;
        }

        _id_D7198CEB7D51DB5B = undefined;

        if ( victim.health <= idamage )
            _id_D7198CEB7D51DB5B = 1;

        headshot = scripts\cp_mp\utility\damage_utility::isheadshot( shitloc, smeansofdeath, eattacker );

        if ( istrue( _id_D7198CEB7D51DB5B ) )
        {
            if ( isdefined( eattacker ) )
            {
                if ( isdefined( eattacker.owner ) && isplayer( eattacker.owner ) )
                    eattacker.owner thread scripts\mp\utility\points::_id_0366980B6A8796AE( "stat_EF9582D72160F199", sweapon, undefined, undefined, self, undefined, undefined, 1, undefined, 1 );
                else if ( isplayer( eattacker ) )
                    eattacker thread scripts\mp\utility\points::_id_0366980B6A8796AE( "stat_EF9582D72160F199", sweapon, undefined, undefined, self, undefined, undefined, 1, undefined, 1 );
            }
        }

        if ( istrue( _id_14B8F2EEBA6A3E78 ) )
        {
            if ( isdefined( eattacker ) )
            {
                if ( isdefined( eattacker.owner ) )
                    eattacker.owner thread _id_5762AC2F22202BA2::updatedamagefeedback( _id_CDCEDB142F61B43E, _id_D7198CEB7D51DB5B, headshot );
                else
                    eattacker thread _id_5762AC2F22202BA2::updatedamagefeedback( _id_CDCEDB142F61B43E, _id_D7198CEB7D51DB5B, headshot );
            }
        }
    }

    if ( isdefined( level._id_484F1A4BDB5CDA1E ) && isdefined( eattacker ) )
    {
        if ( isdefined( eattacker.owner ) )
            eattacker = eattacker.owner;

        level [[ level._id_484F1A4BDB5CDA1E ]]( eattacker, victim );
    }
}

_hasperk( perkname )
{
    perks = self.perks;

    if ( !isdefined( perks ) )
        return 0;

    if ( isdefined( perks[perkname] ) )
        return 1;

    return 0;
}

shouldblockdamage( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon )
{
    _id_5C3F9357F11D2223 = objweapon.basename;
    _id_83A06097F54C024B = 0;

    if ( isdefined( einflictor ) && ( issubstr( _id_5C3F9357F11D2223, "thermite" ) || isdefined( objweapon.magazine ) && issubstr( objweapon.magazine, "boltfire" ) || isdefined( einflictor.weapon_name ) && issubstr( einflictor.weapon_name, "incendiary" ) ) )
    {
        _id_83A06097F54C024B = 1;
        _id_35AF7DAE0105A3E3 = shitloc == "shield";

        if ( _id_35AF7DAE0105A3E3 )
        {
            contents = scripts\engine\trace::create_character_contents();
            _id_759CADFD4D74BFFD = vectornormalize( vdir );
            startpos = vpoint - _id_759CADFD4D74BFFD * 12;
            endpos = vpoint + _id_759CADFD4D74BFFD * 12;
            results = scripts\engine\trace::ray_trace_detail( startpos, endpos, undefined, contents );

            if ( results["fraction"] > 0 && results["fraction"] < 1 )
            {
                _id_1B4FD8D84CA96180 = vpoint - self.origin;
                _id_1B4FD8D84CA96180 = ( _id_1B4FD8D84CA96180[0], _id_1B4FD8D84CA96180[1], 0 );

                if ( vectordot( _id_1B4FD8D84CA96180, results["normal"] ) < 0 )
                    _id_35AF7DAE0105A3E3 = 0;
            }
            else
                _id_35AF7DAE0105A3E3 = 0;
        }

        if ( _id_35AF7DAE0105A3E3 )
        {
            parent = einflictor getlinkedparent();

            if ( isdefined( parent ) && parent == self )
            {
                self.bhasthermitestucktoshield = 1;
                self.thermitestuckpains = 0;
            }
        }
        else if ( shitloc != "none" )
        {
            self.bhasthermitestucktoshield = 0;
            self.thermitestuckpains = undefined;
        }
    }

    if ( shitloc == "shield" )
    {
        if ( _id_83A06097F54C024B )
            return 1;
    }
    else if ( shitloc == "none" && isdefined( einflictor ) )
    {
        _id_AFCDB89D9C3E8439 = einflictor getlinkedparent();

        if ( self.bhasthermitestucktoshield && _id_83A06097F54C024B && isdefined( _id_AFCDB89D9C3E8439 ) && _id_AFCDB89D9C3E8439 == self )
        {
            if ( !isdefined( self.thermitestucktoshield ) )
                self.thermitestucktoshield = [ einflictor ];
            else if ( !scripts\engine\utility::array_contains( self.thermitestucktoshield, einflictor ) )
                self.thermitestucktoshield[self.thermitestucktoshield.size] = einflictor;

            self.thermitestuckpains++;
            return 1;
        }
        else if ( issubstr( _id_5C3F9357F11D2223, "molotov" ) )
        {
            _id_289CB9FCBD6AA7C8 = einflictor.origin - self.origin;
            _id_8B5B7D7C1E6793DE = vectornormalize( ( _id_289CB9FCBD6AA7C8[0], _id_289CB9FCBD6AA7C8[1], 0 ) );
            _id_289CB9FCBD6AA7C8 = vectornormalize( _id_289CB9FCBD6AA7C8 );

            if ( vectordot( anglestoforward( self.angles ), _id_8B5B7D7C1E6793DE ) > 0.5 && -0.98 < _id_289CB9FCBD6AA7C8[2] && _id_289CB9FCBD6AA7C8[2] < 0.98 )
                return 1;
        }
    }

    if ( smeansofdeath == "MOD_MELEE" )
    {
        if ( isdefined( eattacker ) )
            _id_392A20AB0D4853FB = vectornormalize( eattacker.origin - self.origin );
        else
            _id_392A20AB0D4853FB = vectornormalize( vpoint - self.origin );

        _id_C4182E9C211FF588 = anglestoforward( self.angles );

        if ( vectordot( _id_C4182E9C211FF588, _id_392A20AB0D4853FB ) > 0.5 )
            return 1;
    }

    return 0;
}

_id_42BAA3BB97D2D1D7( player, _id_A3732517126407B2, idamage, vpoint, _id_ECBB293AAA7A43B0 )
{
    idamage = int( clamp( idamage, 0, 1000000 ) );
    player setclientomnvar( "ui_dmg_num_amount", idamage );
    player setclientomnvar( "ui_dmg_num_x", int( vpoint[0] ) );
    player setclientomnvar( "ui_dmg_num_y", int( vpoint[1] ) );
    player setclientomnvar( "ui_dmg_num_z", int( vpoint[2] ) );
    player setclientomnvar( "ui_dmg_num_state", _id_A3732517126407B2 );
    player setclientomnvar( "ui_dmg_num_element", _id_ECBB293AAA7A43B0 );
}

_id_C54B2CC2E762C201( eattacker, _id_11467C69AA950E0A, shitloc, smeansofdeath, sweapon, idamage, vpoint, _id_DA71C7321BC0A0F6, _id_B1468C561460431E )
{
    _id_AB501F397D3CD312 = _id_2669878CF5A1B6BC::getweaponrootname( sweapon );

    if ( !isdefined( level._id_1A2B600A06EC21F4._id_DDAED03EBCC9CCF9 ) )
        return;

    weaponclass = tablelookup( level._id_1A2B600A06EC21F4._id_DDAED03EBCC9CCF9, 4, _id_AB501F397D3CD312, 1 );
    _id_A3732517126407B2 = 1;
    _id_C9C7E8D091B092ED = 0;

    if ( istrue( _id_DA71C7321BC0A0F6 ) )
        _id_A3732517126407B2 = 4;
    else
    {
        if ( isdefined( _id_B1468C561460431E ) && isdefined( _id_11467C69AA950E0A._id_691B16F55274B1C5 ) && isarray( _id_11467C69AA950E0A._id_691B16F55274B1C5 ) && istrue( _id_11467C69AA950E0A._id_691B16F55274B1C5[_id_B1468C561460431E] ) )
            _id_C9C7E8D091B092ED = 1 + level._id_7843C346BAFF928F[_id_B1468C561460431E];

        if ( _id_11467C69AA950E0A scripts\cp_mp\utility\damage_utility::isheadshot( shitloc, smeansofdeath, eattacker ) && weaponclass != "weapon_projectile" )
            _id_A3732517126407B2 = 2;
    }

    if ( shitloc == "none" && smeansofdeath != "MOD_MELEE" )
    {
        _id_DAF8775C1297460F = scripts\engine\utility::_id_53C4C53197386572( _id_11467C69AA950E0A._id_2BE88729DA6FDBC5, ( 0, 0, 12 ) );

        if ( isalive( _id_11467C69AA950E0A ) )
        {
            _id_E4C943D63E229D1C = scripts\engine\utility::_id_53C4C53197386572( _id_11467C69AA950E0A._id_52DCDBA485E7CEEB, "j_head" );
            vpoint = _id_11467C69AA950E0A gettagorigin( _id_E4C943D63E229D1C ) + _id_DAF8775C1297460F;
        }
        else
            vpoint = _id_11467C69AA950E0A.origin + _id_DAF8775C1297460F;
    }

    thread _id_7A6BBB24289296E7( eattacker, _id_A3732517126407B2, idamage, vpoint, _id_C9C7E8D091B092ED );
}

_id_7A6BBB24289296E7( player, _id_A3732517126407B2, idamage, vpoint, _id_ECBB293AAA7A43B0 )
{
    level endon( "game_ended" );
    player endon( "death_or_disconnect" );

    if ( !isdefined( player._id_A0F98FFC22B158E3 ) )
        player._id_A0F98FFC22B158E3 = 0;

    if ( !isdefined( _id_ECBB293AAA7A43B0 ) )
        _id_ECBB293AAA7A43B0 = 0;

    player._id_A0F98FFC22B158E3++;
    wait( 0.05 * player._id_A0F98FFC22B158E3 );
    _id_42BAA3BB97D2D1D7( player, _id_A3732517126407B2, idamage, vpoint, _id_ECBB293AAA7A43B0 );
    player._id_A0F98FFC22B158E3--;
}

_id_E6D4CD6D0EBC07E1( victim, einflictor, objweapon )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "updateRecentAgentKills" );
    self endon( "updateRecentAgentKills" );

    if ( !isdefined( self._id_05431D89A36B0936 ) )
        self._id_05431D89A36B0936 = 0;

    self._id_05431D89A36B0936++;
    _id_366B0ECC2F28AEAD = undefined;

    if ( isdefined( objweapon ) )
    {
        if ( isdefined( objweapon.basename ) && objweapon.basename == "none" )
        {
            if ( isdefined( einflictor ) && isdefined( einflictor.weapon_name ) )
                _id_366B0ECC2F28AEAD = einflictor.weapon_name;
        }
        else
            _id_366B0ECC2F28AEAD = getcompleteweaponname( objweapon );
    }

    scripts\mp\utility\script::bufferednotify( "update_rapid_agent_kill_buffered", self._id_05431D89A36B0936, _id_366B0ECC2F28AEAD );
    wait 4.0;
    self._id_05431D89A36B0936 = 0;
}
