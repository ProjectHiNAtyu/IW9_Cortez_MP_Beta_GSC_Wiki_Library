// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

_id_EDA57308516BFC5F()
{
    return _id_481B7172FB4EC991::_id_BFFB5B682A4EF6A2( ::_id_E0844A2B7F904B14 );
}

_id_E0844A2B7F904B14( bot )
{
    _id_CED0426E7E729ED5 = _id_1613F016AF44E830( bot );

    if ( !isdefined( _id_CED0426E7E729ED5 ) || !isdefined( _id_CED0426E7E729ED5.target ) )
        return 0;

    target = _id_CED0426E7E729ED5.target;
    self._id_DF9D35D9B4BEE654 = _id_481B7172FB4EC991::_id_FF35A4D756374EDE( "sniper_combat", target, "main", target.name + "/" + target getentitynumber(), ::_id_35671B7B1A04BF58, self, ::_id_F4CAAE7E8AF9D32C );
    return _id_CED0426E7E729ED5.score;
}

_id_1613F016AF44E830( bot )
{
    _id_49FFFC1CE970E26D = isdefined( bot.primaryweaponobj ) && bot _id_40E63DD222434655::_id_813A1A6F2C5ABDDB( bot.primaryweaponobj, self._id_E889B543C8E054AE._id_D0708C53F9AEDBBE );

    if ( !_id_49FFFC1CE970E26D )
        return undefined;

    _id_0B01971EF554BAC8 = bot _id_3065BDD0A8339A4D::_id_7E7DDFA33EFF2C11();
    _id_80D16926274A0F94 = scripts\engine\utility::getclosest( bot.origin, _id_0B01971EF554BAC8 );

    if ( !isdefined( _id_80D16926274A0F94 ) )
        return undefined;

    _id_3B3D162CE953D1DC = _id_80D16926274A0F94 scripts\engine\utility::get_target_array();
    _id_5DEBF83062CF0194 = scripts\engine\utility::getclosest( bot.origin, _id_3B3D162CE953D1DC, self._id_E889B543C8E054AE._id_B9DE038ABD473868 );

    if ( !isdefined( _id_5DEBF83062CF0194 ) )
        return undefined;

    _id_FDF6F26ABEE82B42 = bot _id_6CE54536515E5DF1::_id_7E7DDFA33EFF2C11();
    _id_FDF6F26ABEE82B42 _id_6CE54536515E5DF1::_id_2F1735D1CB737A0C( bot );
    maxdistance = self._id_E889B543C8E054AE._id_96AF88C97DB9ED21[self._id_E889B543C8E054AE._id_96AF88C97DB9ED21.size - 1];
    _id_FDF6F26ABEE82B42 _id_6CE54536515E5DF1::_id_8500E6AE452B1E19( maxdistance );
    _id_72BB89E60D3674DF = 0;
    target = undefined;

    foreach ( player in _id_FDF6F26ABEE82B42.result )
    {
        _id_DF8E0358F6E2B842 = distance( bot.origin, player.origin );
        basescore = _id_40E63DD222434655::_id_9D1AB012058221BB( _id_DF8E0358F6E2B842, self._id_E889B543C8E054AE._id_96AF88C97DB9ED21, self._id_E889B543C8E054AE._id_49E2976CA0C853EF );
        _id_6CA288CA3F0CA3A0 = bot _id_40E63DD222434655::_id_6CA288CA3F0CA3A0( player );

        if ( _id_6CA288CA3F0CA3A0 )
            basescore = basescore + self._id_E889B543C8E054AE._id_ED9B346626F27A7F;

        if ( basescore > _id_72BB89E60D3674DF && ( _id_6CA288CA3F0CA3A0 || bot botcanseeentity( player ) ) )
        {
            _id_72BB89E60D3674DF = basescore;
            target = player;
        }
    }

    result = spawnstruct();
    result.score = _id_72BB89E60D3674DF;
    result.target = target;
    return result;
}

_id_35671B7B1A04BF58( bot )
{
    target = self._id_EC02147FEE952CE2;
    bot allowmovement( 0 );
    bot botsetstance( bot getstance() );
    bot _id_40E63DD222434655::_id_2C2B5B435027F895( target );

    while ( _id_40E63DD222434655::isvalidplayer( target ) )
    {
        if ( getdvarint( "dvar_05DE54678999F50E", 0 ) )
            bot _id_40E63DD222434655::_id_CF1A9E98122E3931( target );

        wait 1;
    }
}

_id_F4CAAE7E8AF9D32C( action )
{
    if ( !_id_40E63DD222434655::_id_DED80385EA7471DB( self ) )
        return;

    self botsetstance( "none" );
    self allowmovement( 1 );
}
