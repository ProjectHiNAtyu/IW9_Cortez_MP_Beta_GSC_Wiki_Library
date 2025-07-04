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

    _id_14F8998B9E6F6BBA = _id_5B0291AEAB99561B( bot );

    if ( !isdefined( _id_14F8998B9E6F6BBA ) )
        return -100;

    _id_72BB89E60D3674DF = _id_14F8998B9E6F6BBA.score;
    target = _id_14F8998B9E6F6BBA.target;
    self._id_DF9D35D9B4BEE654 = _id_3B7D31A576A8626C::_id_E3D9D27A30E4D693( target );
    return _id_72BB89E60D3674DF;
}

_id_5B0291AEAB99561B( bot )
{
    _id_B252AFB1C6D8213C = bot _id_591B0BD31A90089B::_id_7E7DDFA33EFF2C11();

    if ( _id_B252AFB1C6D8213C.size == 0 )
        return undefined;

    target = spawnstruct();
    _id_AD2F80C3D8D4E44E = -100;
    _id_EFABC1F8231CC4F9 = undefined;
    _id_343466BBC23688C9 = level._id_6BE7B375EC4A629C[0];

    foreach ( _id_CB325DDB4A764623, cost in _id_343466BBC23688C9["items"] )
    {
        if ( bot.plundercount < cost )
            continue;

        _id_17BEC417681D2AF0 = _id_400A728B86054272( bot, _id_CB325DDB4A764623 );

        if ( !isdefined( _id_17BEC417681D2AF0 ) )
            continue;

        if ( _id_17BEC417681D2AF0 > _id_AD2F80C3D8D4E44E )
        {
            _id_AD2F80C3D8D4E44E = _id_17BEC417681D2AF0;
            _id_EFABC1F8231CC4F9 = _id_CB325DDB4A764623;
        }
    }

    if ( !isdefined( _id_EFABC1F8231CC4F9 ) )
        return undefined;

    target._id_1657E74C9190D2A2 = _id_4384ABBF498DF6A7::_id_FE176342ED52B44F( _id_EFABC1F8231CC4F9 );
    target._id_7148C1A6F25491F8 = "br_item_purchase";
    target.itemname = _id_EFABC1F8231CC4F9;
    _id_0FF4B6D39036010B = bot _id_40E63DD222434655::_id_8A0FA223B19E44F4( _id_B252AFB1C6D8213C, self._id_E889B543C8E054AE._id_EA186A77C016A88D, self._id_E889B543C8E054AE._id_09551C1A2C6F5863 );

    if ( !isdefined( _id_0FF4B6D39036010B ) )
        return undefined;

    _id_9073E5955EAEBE2C = _id_40E63DD222434655::_id_9D1AB012058221BB( _id_40E63DD222434655::_id_1C51F7C46A848DDD(), self._id_E889B543C8E054AE._id_E23500DBD314BAE2, self._id_E889B543C8E054AE._id_E58A5E1EFEB78937 );
    _id_8AEE78BD838BA612 = _id_40E63DD222434655::_id_9D1AB012058221BB( bot.plundercount, self._id_E889B543C8E054AE._id_8E95BDA6C02D6964, self._id_E889B543C8E054AE._id_2A7A0C76F330E72D );
    _id_0FF4B6D39036010B.score = _id_0FF4B6D39036010B.score + _id_9073E5955EAEBE2C;
    _id_0FF4B6D39036010B.score = _id_0FF4B6D39036010B.score + _id_8AEE78BD838BA612;
    target.origin = _id_0FF4B6D39036010B.target.origin;
    result = spawnstruct();
    result.target = target;
    result.score = _id_AD2F80C3D8D4E44E + _id_0FF4B6D39036010B.score;
    return result;
}

_id_400A728B86054272( bot, _id_BF09A57AF008ACD6 )
{
    _id_A1093166DE09E6B8 = self._id_E889B543C8E054AE._id_E34F223C4F415ED0[_id_BF09A57AF008ACD6];

    if ( isdefined( _id_A1093166DE09E6B8 ) && bot _id_40E63DD222434655::_id_0BBC2D6967287DC7( _id_A1093166DE09E6B8 ) )
        return self._id_E889B543C8E054AE._id_7D0FD6FF10EDEFD6[_id_BF09A57AF008ACD6];
    else
        return undefined;
}
