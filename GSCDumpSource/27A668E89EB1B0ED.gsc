// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_EDA57308516BFC5F()
{
    return _id_481B7172FB4EC991::_id_BFFB5B682A4EF6A2( ::_id_E0844A2B7F904B14 );
}

_id_E0844A2B7F904B14( bot )
{
    if ( !level.br_armory_kiosk_enabled )
        return -100;

    _id_C065D1CA4804EA3A = _id_1B5842B9B6465162( bot );

    if ( !isdefined( _id_C065D1CA4804EA3A ) )
        return -100;

    self._id_DF9D35D9B4BEE654 = _id_3B7D31A576A8626C::_id_E3D9D27A30E4D693( _id_C065D1CA4804EA3A.target );
    _id_72BB89E60D3674DF = _id_C065D1CA4804EA3A.score * getdvarfloat( "dvar_27624B7FCE20FF0C", 1.0 );
    return _id_72BB89E60D3674DF;
}

_id_1B5842B9B6465162( bot )
{
    _id_69590E67F030F9AA = "teamReviver";
    _id_B6736234A4AC9BD1 = isdefined( level._id_6BE7B375EC4A629C[0]["items"][_id_69590E67F030F9AA] );

    if ( !_id_B6736234A4AC9BD1 )
        return undefined;

    _id_2A70AE11EFAFEA87 = bot.plundercount >= _id_4384ABBF498DF6A7::_id_517B8730DDEC7F59( _id_69590E67F030F9AA );

    if ( !_id_2A70AE11EFAFEA87 )
        return undefined;

    _id_10A39F1A0B6D2AA2 = _id_23DDC5A3E0D509D3::_id_A5786099CA387B00();

    if ( !_id_10A39F1A0B6D2AA2 )
        return undefined;

    _id_6D5ED003AF1F9612 = scripts\mp\utility\teams::getteamdata( bot.team, "players" );
    _id_38882A650F503344 = undefined;

    foreach ( player in _id_6D5ED003AF1F9612 )
    {
        if ( !isdefined( player ) || player == bot )
            continue;

        if ( player _id_40E63DD222434655::_id_A9CBF557DC66D201() )
        {
            _id_38882A650F503344 = player;
            break;
        }
    }

    if ( !isdefined( _id_38882A650F503344 ) )
        return undefined;

    _id_B252AFB1C6D8213C = bot _id_591B0BD31A90089B::_id_7E7DDFA33EFF2C11();

    if ( _id_B252AFB1C6D8213C.size == 0 )
        return undefined;

    _id_0FF4B6D39036010B = bot _id_40E63DD222434655::_id_8A0FA223B19E44F4( _id_B252AFB1C6D8213C, self._id_E889B543C8E054AE._id_87F34CF0D41D251D, self._id_E889B543C8E054AE._id_38A8985512B3E7B3 );

    if ( !isdefined( _id_0FF4B6D39036010B ) )
        return undefined;

    target = spawnstruct();
    target._id_1657E74C9190D2A2 = _id_38882A650F503344._id_3F78C6A0862F9E25 + 1;
    target.itemname = bot.name;
    target._id_7148C1A6F25491F8 = "br_team_revive";
    target.origin = _id_0FF4B6D39036010B.target.origin;
    result = spawnstruct();
    result.target = target;
    result.score = _id_0FF4B6D39036010B.score;
    return result;
}
