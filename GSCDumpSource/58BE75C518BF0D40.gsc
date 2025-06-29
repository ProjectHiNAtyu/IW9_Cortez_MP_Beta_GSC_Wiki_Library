// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_C9406922E0267F09()
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "squad_utility", "init" ) )
        [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "squad_utility", "init" ) ]]();
}

_id_5A009FE17F688C92( _id_68BB1F110EC06A58, _id_7102F45D5F0B5834 )
{
    if ( scripts\cp_mp\utility\script_utility::issharedfuncdefined( "squad_utility", "getSquadMembers" ) )
        return [[ scripts\cp_mp\utility\script_utility::getsharedfunc( "squad_utility", "getSquadMembers" ) ]]( _id_68BB1F110EC06A58, _id_7102F45D5F0B5834 );

    return [];
}

getsquadleader( team, index )
{
    if ( !istrue( level.usesquadleader ) )
        return undefined;

    return level.squaddata[team][index]._id_D6EE3E704C6731D4;
}

shouldmodesetsquads()
{
    if ( scripts\cp_mp\utility\game_utility::_id_0BEFF479639E6508() )
        return issquadmode();

    switch ( level.gametype )
    {
        case "brtdm":
        case "gwtdm":
        case "gwai":
        case "gwbomb":
        case "pill":
        case "risk":
        case "arena":
        case "missions":
        case "incursion":
        case "ob":
        case "defcon":
        case "arm":
            return issquadmode();
        default:
            return 0;
    }
}

_id_A9CB1BBCE9EB3D1B()
{
    if ( scripts\cp_mp\utility\game_utility::_id_0BEFF479639E6508() )
        return 1;

    switch ( level.gametype )
    {
        case "arena":
            return 1;
        default:
            return 0;
    }
}

issquadmode()
{
    return level.maxsquadsize > 1;
}

_id_6B09C63FEBC4655C( team, index )
{
    if ( !isdefined( level.squaddata[team][index] ) )
        return 0;

    return level.squaddata[team][index].players.size == level.maxsquadsize;
}
