// IW9 GSC SOURCE
// Generated by https://github.com/xensik/gsc-tool

init()
{
    _id_6AFF3948CF4CCA03::init();
    _id_3BD9CB6DC562B494::init();
    _id_74A96A5393D1826C::init();
    _id_4384ABBF498DF6A7::init();
    _id_0ACE04C5C3EE7547::init();
    scripts\mp\flags::gameflaginit( "POIs_spawned", 0 );
    level thread _spawnpois();
}

initplayer()
{
    _id_6AFF3948CF4CCA03::initplayer();
}

onprematchdone()
{
    scripts\mp\flags::gameflagwait( "POIs_spawned" );
    _id_3BD9CB6DC562B494::onprematchdone();
    _id_74A96A5393D1826C::onprematchdone();
    _id_4384ABBF498DF6A7::onprematchdone();
}

getinteractiveoutlineasset()
{
    return "outline_depth_red";
}

_id_96E56767B949C013( _id_61B36239E6C3D026, _id_3D329EBB0D03D6DB, _id_849E91C5E0D0E0DF )
{
    if ( !isdefined( _id_61B36239E6C3D026.angles ) )
        _id_61B36239E6C3D026.angles = ( 0, 0, 0 );

    _id_2FA65F34EB9042F5 = spawnscriptable( "br_plunder_box", _id_61B36239E6C3D026.origin, _id_61B36239E6C3D026.angles );
    _id_2FA65F34EB9042F5 setscriptablepartstate( "br_plunder_box", "visible" );

    if ( isdefined( _id_3D329EBB0D03D6DB ) )
        _id_2FA65F34EB9042F5._id_7940DCDE72827AF7 = _id_3D329EBB0D03D6DB;

    if ( isdefined( _id_3D329EBB0D03D6DB ) )
        _id_2FA65F34EB9042F5._id_DED92CCB217BBAEB = _id_849E91C5E0D0E0DF;

    foreach ( struct in scripts\engine\utility::getstructarray( _id_61B36239E6C3D026.target, "targetname" ) )
    {
        if ( isdefined( struct.script_noteworthy ) && struct.script_noteworthy == "kiosk_spawn_jltv_mg" )
            _id_2FA65F34EB9042F5._id_DB32ABF0A18CADF6 = struct;
    }
}

_id_785D7C2AE5066F66( _id_3D329EBB0D03D6DB, _id_C95404CD83F761B6 )
{
    if ( _id_C95404CD83F761B6.size == 0 )
        return;

    _id_3D329EBB0D03D6DB = _id_3D329EBB0D03D6DB % _id_C95404CD83F761B6.size;
    return _id_C95404CD83F761B6[_id_3D329EBB0D03D6DB];
}

_id_68F55B32AD3368E1()
{
    if ( !isdefined( level._id_68F55B32AD3368E1 ) )
        level._id_68F55B32AD3368E1 = getdvarint( "dvar_CA9C84470EAD8181", 0 );

    return level._id_68F55B32AD3368E1;
}

_id_2FCAA447C4E7D4A0( _id_61B36239E6C3D026, _id_4F95D97A13077392 )
{
    _id_3D329EBB0D03D6DB = undefined;

    if ( isdefined( level._id_6BE7B375EC4A629C ) && level._id_6BE7B375EC4A629C.size > 0 )
        _id_3D329EBB0D03D6DB = _id_785D7C2AE5066F66( _id_4F95D97A13077392, level._id_6BE7B375EC4A629C )["index"];

    _id_849E91C5E0D0E0DF = undefined;

    if ( isdefined( level._id_3899105CEEC08FB8 ) && level._id_3899105CEEC08FB8.size > 0 )
        _id_849E91C5E0D0E0DF = _id_785D7C2AE5066F66( _id_4F95D97A13077392, level._id_3899105CEEC08FB8 )["index"];

    _id_96E56767B949C013( _id_61B36239E6C3D026, _id_3D329EBB0D03D6DB, _id_849E91C5E0D0E0DF );
}

_id_761BBFD48FCD5A33()
{
    if ( !istrue( level._id_8DEA6607B3189A60 ) )
        return;

    _id_6AA304E25520289F = undefined;
    _id_D3A06CC30BC1F068 = getdvarint( "dvar_1891A7C9188F098A", 1 );
    _id_AC63CD16A707ECEA = getdvarint( "dvar_1EAAEEC5FBA02706", 3 );
    _id_7DE18EFB644429DC = getdvarint( "dvar_4CC790851BC37D7C", 3 );
    _id_ABD2EABEC6CF5F1E = randomintrange( _id_AC63CD16A707ECEA, _id_7DE18EFB644429DC + 1 );
    _id_6AA304E25520289F = scripts\engine\utility::getstructarray( "buy_station", "targetname" );

    if ( _id_6AA304E25520289F.size == 0 )
        return;

    _id_A165C118F696AA70 = getdvarint( "dvar_4409A87281D77ED1", 0 );
    _id_68F55B32AD3368E1 = _id_68F55B32AD3368E1();

    if ( !_id_A165C118F696AA70 && !_id_68F55B32AD3368E1 )
    {
        _id_A503FF4C72C94AFE = [];
        _id_932BE85924F099D8 = [];
        _id_E97A51E0F9B0C2D1 = _id_6AA304E25520289F.size;

        for ( _id_A0ADD690B201F3AD = 0; _id_A0ADD690B201F3AD < _id_E97A51E0F9B0C2D1; _id_A0ADD690B201F3AD++ )
        {
            _id_2FA65F34EB9042F5 = _id_6AA304E25520289F[_id_A0ADD690B201F3AD];

            if ( !isdefined( _id_2FA65F34EB9042F5._id_B205D90302DA2F07 ) )
                continue;

            if ( !isdefined( _id_A503FF4C72C94AFE[_id_2FA65F34EB9042F5._id_B205D90302DA2F07] ) )
            {
                _id_A503FF4C72C94AFE[_id_2FA65F34EB9042F5._id_B205D90302DA2F07] = [];
                _id_932BE85924F099D8[_id_932BE85924F099D8.size] = _id_2FA65F34EB9042F5._id_B205D90302DA2F07;
            }

            _id_A503FF4C72C94AFE[_id_2FA65F34EB9042F5._id_B205D90302DA2F07][_id_A503FF4C72C94AFE[_id_2FA65F34EB9042F5._id_B205D90302DA2F07].size] = _id_2FA65F34EB9042F5;
        }

        _id_932BE85924F099D8 = scripts\engine\utility::array_randomize( _id_932BE85924F099D8 );
        _id_4F95D97A13077392 = 0;
        _id_97218EEF96CD3102 = 0;

        foreach ( _id_72F29FA8DAC796BB in _id_932BE85924F099D8 )
        {
            if ( _id_97218EEF96CD3102 == _id_ABD2EABEC6CF5F1E )
                break;

            if ( !_id_5DEF7AF2A9F04234::_id_FAA6481E65F14ADE( _id_72F29FA8DAC796BB ) )
                continue;

            _id_8761FECDF09ADDED = _id_A503FF4C72C94AFE[_id_72F29FA8DAC796BB];
            _id_2A980B0531901C38 = _id_D3A06CC30BC1F068;

            if ( _id_2A980B0531901C38 > _id_8761FECDF09ADDED.size )
                _id_2A980B0531901C38 = _id_8761FECDF09ADDED.size;

            _id_8761FECDF09ADDED = scripts\engine\utility::array_slice( scripts\engine\utility::array_randomize( _id_8761FECDF09ADDED ), 0, _id_2A980B0531901C38 );

            for ( _id_A0ADD690B201F3AD = 0; _id_A0ADD690B201F3AD < _id_8761FECDF09ADDED.size; _id_A0ADD690B201F3AD++ )
            {
                _id_2FCAA447C4E7D4A0( _id_8761FECDF09ADDED[_id_A0ADD690B201F3AD], _id_4F95D97A13077392 );
                _id_4F95D97A13077392++;
            }
        }
    }
    else
    {
        if ( !_id_68F55B32AD3368E1 )
            _id_6AA304E25520289F = scripts\engine\utility::array_slice( scripts\engine\utility::array_randomize( _id_6AA304E25520289F ), 0, _id_D3A06CC30BC1F068 );

        _id_E97A51E0F9B0C2D1 = _id_6AA304E25520289F.size;
        _id_4F95D97A13077392 = 0;

        for ( _id_A0ADD690B201F3AD = 0; _id_A0ADD690B201F3AD < _id_E97A51E0F9B0C2D1; _id_A0ADD690B201F3AD++ )
        {
            _id_2FCAA447C4E7D4A0( _id_6AA304E25520289F[_id_A0ADD690B201F3AD], _id_4F95D97A13077392 );
            _id_4F95D97A13077392++;
        }
    }
}

_spawnpois()
{
    level endon( "game_ended" );
    _id_4B52CEA8CFCF246E = 0.05;
    _id_BD889CF87F50ABBD = 5;
    _id_D318F12E1C67D749 = 5;
    _id_EBE0ECFBA3880C6A = 65;
    _id_EE39B6FA3A924128 = 7;
    _id_AAF40E524177E096 = 7;

    if ( getdvar( "dvar_7611A2790A0BF7FE", "" ) == "plunder" || getdvar( "dvar_7611A2790A0BF7FE", "" ) == "risk" )
    {
        level.adjusteventdistributionpadding = getdvarint( "dvar_325DD950793B218D", 35 );
        level.pushdistributiontowardoppositecorner = getdvarint( "dvar_E8812B2C1B71911E", 1 );
        level.buystationsusepaddingdistribution = getdvarint( "dvar_2BD779EC50609B29", 0 );
        level thread setupmapquadrantcornersandgrid();
    }

    level.minplunderextractions = getdvarint( "dvar_EAACC4689DD5D721", _id_AAF40E524177E096 );
    level.maxplunderextractions = getdvarint( "dvar_23F4EAE3AEEBEFD3", _id_EE39B6FA3A924128 );

    if ( level.minplunderextractions < level.maxplunderextractions )
        level.maxplunderextractions = randomintrange( level.minplunderextractions, level.maxplunderextractions + 1 );

    if ( istrue( level._id_8DEA6607B3189A60 ) )
        _id_761BBFD48FCD5A33();
    else
    {
        _id_9D5A5091F02C88BD = getdvarint( "dvar_4AEA002979A25696", _id_EBE0ECFBA3880C6A );
        _id_D3DB633BF63A5134 = _id_4384ABBF498DF6A7::getallspawninstances();

        if ( isdefined( _id_D3DB633BF63A5134 ) && _id_D3DB633BF63A5134.size > 0 )
        {
            _id_D3DB633BF63A5134 = _getlocationscircleinfluencedwithnoise( _id_D3DB633BF63A5134, _id_9D5A5091F02C88BD, level.buystationsusepaddingdistribution );

            if ( isdefined( _id_D3DB633BF63A5134 ) && _id_D3DB633BF63A5134.size > 0 )
                _id_4384ABBF498DF6A7::setspawninstances( _id_D3DB633BF63A5134 );
        }
    }

    _id_EB398F94F1B5B0F2 = _id_6AFF3948CF4CCA03::getallextractspawninstances();

    if ( isdefined( _id_EB398F94F1B5B0F2 ) && _id_EB398F94F1B5B0F2.size > 0 )
    {
        _id_EB398F94F1B5B0F2 = _getlocationscircleinfluencedwithnoise( _id_EB398F94F1B5B0F2, level.maxplunderextractions, 1 );

        if ( isdefined( _id_EB398F94F1B5B0F2 ) && _id_EB398F94F1B5B0F2.size > 0 )
            _id_6AFF3948CF4CCA03::setextractspawninstances( _id_EB398F94F1B5B0F2 );
    }

    _id_AA43B883CBA2C7FD = scripts\engine\utility::getstructarray( "br_respawn_station", "targetname" );

    for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < _id_AA43B883CBA2C7FD.size; _id_AC0E594AC96AA3A8++ )
    {
        wait( _id_4B52CEA8CFCF246E );
        _id_123A6F38785CDF2D::spawnambulance( _id_AA43B883CBA2C7FD[_id_AC0E594AC96AA3A8] );
    }

    _id_3EAAFD9E0DB44BA4 = getdvarint( "dvar_3A7E96B56579724D", _id_BD889CF87F50ABBD );
    _id_4486795EA11DC6E9 = scripts\engine\utility::getstructarray( "br_mobile_armory_location", "targetname" );

    if ( _id_4486795EA11DC6E9.size > 0 )
    {
        _id_0909064F7BD37EB5 = _getrandomlocations( _id_4486795EA11DC6E9, _id_3EAAFD9E0DB44BA4 );

        for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < _id_0909064F7BD37EB5.size; _id_AC0E594AC96AA3A8++ )
        {
            wait( _id_4B52CEA8CFCF246E );
            _id_3BD9CB6DC562B494::spawnmobilearmory( _id_0909064F7BD37EB5[_id_AC0E594AC96AA3A8] );
        }
    }

    _id_11D1CC3ED3670979 = getdvarint( "dvar_8B6E7B7F2FA8C4A5", _id_D318F12E1C67D749 );
    _id_CCACDC005B2F9BDC = scripts\engine\utility::getstructarray( "br_satellite_truck_location", "targetname" );

    if ( _id_CCACDC005B2F9BDC.size > 0 )
    {
        _id_BBECEB885D5618B5 = _getrandomlocations( _id_CCACDC005B2F9BDC, _id_11D1CC3ED3670979 );

        for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < _id_BBECEB885D5618B5.size; _id_AC0E594AC96AA3A8++ )
        {
            wait( _id_4B52CEA8CFCF246E );
            _id_74A96A5393D1826C::spawnsatellitetruck( _id_BBECEB885D5618B5[_id_AC0E594AC96AA3A8] );
        }
    }

    scripts\mp\flags::gameflagset( "POIs_spawned" );
}

_getlocationscircleinfluencedwithnoise( _id_1EB07A39FF244CD5, maxinstancecount, _id_395F0C06F7ABDCC1 )
{
    if ( _id_1EB07A39FF244CD5.size == 0 || maxinstancecount == 0 )
        return undefined;

    if ( maxinstancecount > _id_1EB07A39FF244CD5.size )
        maxinstancecount = _id_1EB07A39FF244CD5.size;

    if ( getdvar( "dvar_7611A2790A0BF7FE", "" ) == "plunder" || getdvar( "dvar_7611A2790A0BF7FE", "" ) == "risk" )
        return _id_56055017E5E588FE::_getplunderextractlocations( _id_1EB07A39FF244CD5, maxinstancecount, _id_395F0C06F7ABDCC1 );
    else if ( !isdefined( level.br_circle ) || !isdefined( level.br_level ) )
        return _getrandomlocations( _id_1EB07A39FF244CD5, maxinstancecount );

    _id_6756BD882736E8BC = level.br_level.br_circlecenters.size - 1;
    _id_CA10D004515B90A1 = int( max( 1, _id_6756BD882736E8BC * getdvarfloat( "dvar_5455E317C3719308", 1.0 ) ) );

    for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < _id_1EB07A39FF244CD5.size; _id_AC0E594AC96AA3A8++ )
    {
        instance = _id_1EB07A39FF244CD5[_id_AC0E594AC96AA3A8];
        noise = randomintrange( -1 * _id_CA10D004515B90A1, _id_CA10D004515B90A1 + 1 );
        instance.score = _id_2695A20D4011076D::getcircleindexforpoint( instance.origin ) + noise;
    }

    _id_52ED016B11ED960E = scripts\engine\utility::array_sort_with_func( _id_1EB07A39FF244CD5, ::comparescore );
    _id_FDCAC90056ED9215 = [];

    for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < maxinstancecount; _id_AC0E594AC96AA3A8++ )
        _id_FDCAC90056ED9215[_id_AC0E594AC96AA3A8] = _id_52ED016B11ED960E[_id_AC0E594AC96AA3A8];

    return scripts\engine\utility::array_slice( _id_52ED016B11ED960E, 0, maxinstancecount );
}

comparescore( left, right )
{
    return left.score > right.score;
}

_getrandomlocations( _id_532388C61E12B9DF, _id_E296217C9FCD337F )
{
    if ( _id_532388C61E12B9DF.size == 0 || _id_E296217C9FCD337F == 0 )
        return;

    _id_BFE291B401A9BF2A = [];

    if ( _id_532388C61E12B9DF.size > 0 )
    {
        _id_532388C61E12B9DF = scripts\engine\utility::array_randomize( _id_532388C61E12B9DF );
        _id_FFAE32B49DF07DBF = int( min( _id_E296217C9FCD337F, _id_532388C61E12B9DF.size ) );

        for ( _id_AC0E594AC96AA3A8 = 0; _id_AC0E594AC96AA3A8 < _id_FFAE32B49DF07DBF; _id_AC0E594AC96AA3A8++ )
            _id_BFE291B401A9BF2A[_id_BFE291B401A9BF2A.size] = _id_532388C61E12B9DF[_id_AC0E594AC96AA3A8];
    }

    return _id_BFE291B401A9BF2A;
}

showmiscmessagetoteam( team, messageref, _id_E951F1CF3374883D, _id_8796BA8BDF940AB2 )
{
    if ( isdefined( team ) )
    {
        _id_15C9A60395ADB62F = "mp/hints.csv";
        _id_2A8F7B0DEB4D3D93 = 1;
        _id_975CBD2E24CFC56C = tablelookuprownum( _id_15C9A60395ADB62F, _id_2A8F7B0DEB4D3D93, messageref );
        _id_37690F69E01D6F71 = undefined;

        if ( isdefined( _id_8796BA8BDF940AB2 ) )
            _id_37690F69E01D6F71 = gettime() + _id_8796BA8BDF940AB2;

        _id_A6AB8D0FDA441DC2 = scripts\mp\utility\teams::getteamdata( team, "players" );

        foreach ( _id_89C718895A5117B3 in _id_A6AB8D0FDA441DC2 )
            _id_89C718895A5117B3 scripts\mp\utility\lower_message::setlowermessageomnvar( messageref, _id_37690F69E01D6F71, _id_E951F1CF3374883D );
    }
}

initstatemachineforpoitype( _id_04B725A40897F25F )
{
    if ( !isdefined( level.poistates ) )
        level.poistates = [];

    level.poistates[_id_04B725A40897F25F] = [];
}

registerstatecallbacksforpoitype( _id_04B725A40897F25F, _id_A8CB22A5334BE44F, onentercallback, _id_BAFEFCB94D8333AE, onexitcallback )
{
    level.poistates[_id_04B725A40897F25F][_id_A8CB22A5334BE44F] = spawnstruct();
    level.poistates[_id_04B725A40897F25F][_id_A8CB22A5334BE44F].onenter = onentercallback;
    level.poistates[_id_04B725A40897F25F][_id_A8CB22A5334BE44F].onupdate = _id_BAFEFCB94D8333AE;
    level.poistates[_id_04B725A40897F25F][_id_A8CB22A5334BE44F].onexit = onexitcallback;
}

gotopoistate( _id_04B725A40897F25F, _id_9B1941CB7354665E )
{
    _id_5297AC440C92A444 = self;

    if ( isdefined( _id_5297AC440C92A444.currentstate ) )
    {
        _id_E7C7DE60A5EA2F52 = level.poistates[_id_04B725A40897F25F][_id_5297AC440C92A444.currentstate];

        if ( isdefined( _id_E7C7DE60A5EA2F52 ) && isdefined( _id_E7C7DE60A5EA2F52.onexit ) )
            level [[ _id_E7C7DE60A5EA2F52.onexit ]]( _id_5297AC440C92A444 );
    }

    _id_5297AC440C92A444 notify( "poi_state_change" );
    _id_5297AC440C92A444.currentstate = _id_9B1941CB7354665E;
    _id_E7C7DE60A5EA2F52 = level.poistates[_id_04B725A40897F25F][_id_5297AC440C92A444.currentstate];

    if ( isdefined( _id_E7C7DE60A5EA2F52 ) )
    {
        if ( isdefined( _id_E7C7DE60A5EA2F52.onenter ) )
            level [[ _id_E7C7DE60A5EA2F52.onenter ]]( _id_5297AC440C92A444 );

        if ( isdefined( _id_E7C7DE60A5EA2F52.onupdate ) )
            _id_5297AC440C92A444 thread _poistateupdate( _id_E7C7DE60A5EA2F52.onupdate );
    }
}

gotopoistateontimer( _id_04B725A40897F25F, _id_9B1941CB7354665E, _id_DDB222C7FAF5AB50 )
{
    _id_5297AC440C92A444 = self;
    _id_5297AC440C92A444 endon( "death" );
    _id_5297AC440C92A444 endon( "poi_state_change" );
    wait( _id_DDB222C7FAF5AB50 );
    _id_5297AC440C92A444 thread gotopoistate( _id_04B725A40897F25F, _id_9B1941CB7354665E );
}

getcurrentpoistate()
{
    _id_5297AC440C92A444 = self;
    return _id_5297AC440C92A444.currentstate;
}

_poistateupdate( _id_BAFEFCB94D8333AE )
{
    _id_5297AC440C92A444 = self;
    _id_5297AC440C92A444 endon( "death" );
    _id_B7449EE1B53AFD8C = _id_5297AC440C92A444.currentstate;

    while ( _id_B7449EE1B53AFD8C == _id_5297AC440C92A444.currentstate )
    {
        level [[ _id_BAFEFCB94D8333AE ]]( _id_5297AC440C92A444 );
        waitframe();
    }
}

setupmapquadrantcornersandgrid()
{
    if ( !isdefined( level.mapcorners ) )
        waitframe();

    _id_4E9BDD57294562FD = level.mapcorners[0].origin[0];
    _id_4E78E757291F3143 = level.mapcorners[1].origin[0];
    _id_7BA4DEE5CC4C1DCC = ( level.mapcorners[0].origin[0], level.mapcorners[0].origin[1], level.mapcorners[0].origin[2] );
    _id_7BA4DFE5CC4C1FFF = ( level.mapcorners[1].origin[0], level.mapcorners[0].origin[1], level.mapcorners[1].origin[2] );

    if ( _id_4E78E757291F3143 < _id_4E9BDD57294562FD )
    {
        _id_7BA4DEE5CC4C1DCC = ( level.mapcorners[1].origin[0], level.mapcorners[0].origin[1], level.mapcorners[1].origin[2] );
        _id_7BA4DFE5CC4C1FFF = ( level.mapcorners[0].origin[0], level.mapcorners[0].origin[1], level.mapcorners[0].origin[2] );
    }

    _id_A056773A8AB0B014 = level.mapcorners[0].origin[1];
    _id_A07A653A8AD90336 = level.mapcorners[1].origin[1];
    _id_7BA4E0E5CC4C2232 = ( level.mapcorners[0].origin[0], level.mapcorners[1].origin[1], level.mapcorners[0].origin[2] );
    _id_7BA4E1E5CC4C2465 = ( level.mapcorners[1].origin[0], level.mapcorners[1].origin[1], level.mapcorners[1].origin[2] );

    if ( _id_A07A653A8AD90336 < _id_A056773A8AB0B014 )
    {
        _id_7BA4E0E5CC4C2232 = ( level.mapcorners[1].origin[0], level.mapcorners[1].origin[1], level.mapcorners[1].origin[2] );
        _id_7BA4E1E5CC4C2465 = ( level.mapcorners[0].origin[0], level.mapcorners[1].origin[1], level.mapcorners[0].origin[2] );
    }

    quadgridcenterpoints = [];

    if ( scripts\cp_mp\utility\game_utility::isdonetskmap() )
    {
        level.corner3to0dist = abs( distance( _id_7BA4E1E5CC4C2465, _id_7BA4DEE5CC4C1DCC ) );
        _id_0F40B5C2409B628B = level.corner3to0dist / 10;
        _id_7BA4DEE5CC4C1DCC = ( _id_7BA4DEE5CC4C1DCC[0] + _id_0F40B5C2409B628B, _id_7BA4DEE5CC4C1DCC[1] - _id_0F40B5C2409B628B, _id_7BA4DEE5CC4C1DCC[2] );
        _id_7BA4DFE5CC4C1FFF = ( _id_7BA4DFE5CC4C1FFF[0] - _id_0F40B5C2409B628B, _id_7BA4DFE5CC4C1FFF[1] - _id_0F40B5C2409B628B, _id_7BA4DFE5CC4C1FFF[2] );
        _id_7BA4E0E5CC4C2232 = ( _id_7BA4E0E5CC4C2232[0] - _id_0F40B5C2409B628B, _id_7BA4E0E5CC4C2232[1] + _id_0F40B5C2409B628B, _id_7BA4E0E5CC4C2232[2] );
        _id_7BA4E1E5CC4C2465 = ( _id_7BA4E1E5CC4C2465[0] + _id_0F40B5C2409B628B, _id_7BA4E1E5CC4C2465[1] + _id_0F40B5C2409B628B, _id_7BA4E1E5CC4C2465[2] );
        level.corner3to0dist = abs( distance( _id_7BA4E1E5CC4C2465, _id_7BA4DEE5CC4C1DCC ) );

        for ( _id_AC0E594AC96AA3A8 = 1; _id_AC0E594AC96AA3A8 < 4; _id_AC0E594AC96AA3A8 = _id_AC0E594AC96AA3A8 + 2 )
        {
            _id_5CAABC9F456B8007 = _id_AC0E594AC96AA3A8 * level.corner3to0dist / 2;

            for ( _id_AC0E5C4AC96AAA41 = 1; _id_AC0E5C4AC96AAA41 < 4; _id_AC0E5C4AC96AAA41 = _id_AC0E5C4AC96AAA41 + 2 )
            {
                _id_5CAABB9F456B7DD4 = _id_AC0E5C4AC96AAA41 * level.corner3to0dist / 2;
                _id_DBC2014289D0BCBD = ( _id_7BA4E1E5CC4C2465[0] + _id_5CAABC9F456B8007 / 2, _id_7BA4E1E5CC4C2465[1] + _id_5CAABB9F456B7DD4 / 2, 0 );
                quadgridcenterpoints[quadgridcenterpoints.size] = _id_DBC2014289D0BCBD;
            }
        }
    }

    level.quadgridcenterpoints = [];

    if ( level.mapname == "mp_br_mechanics" )
    {
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = ( 3965, 4054, 0 );
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = ( 4069, -4150, 0 );
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = ( -4035, -4074, 0 );
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = ( -4009, 4105, 0 );
    }
    else if ( level.mapname == "mp_br_money" )
    {
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = ( 46569.5, -8170, 0 );
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = ( 56849.5, -8170, 0 );
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = ( 67081.5, -17919.5, 0 );
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = ( 46593, -17919.5, 0 );
    }
    else
    {
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = ( -21299.2, 41779.2, 0 );
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = ( 37683.2, 41779.2, 0 );
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = ( 37683.2, -17203.2, 0 );
        level.quadgridcenterpoints[level.quadgridcenterpoints.size] = ( -21299.2, -17203.2, 0 );
    }

    level.quadgridcenterpoints = scripts\engine\utility::array_randomize( level.quadgridcenterpoints );
    _id_6E7C192FFEF59AC0 = 33704;
    level.quadgridradius2dsq = abs( _id_6E7C192FFEF59AC0 * _id_6E7C192FFEF59AC0 );

    if ( level.adjusteventdistributionpadding > 0 && scripts\cp_mp\utility\game_utility::isdonetskmap() )
    {
        level.randomcorner = randomintrange( 0, 5 );
        _id_0F40B5C2409B628B = level.corner3to0dist / 10;
        _id_62090C76DAB8D45A = level.corner3to0dist / ( 100 / level.adjusteventdistributionpadding );

        switch ( level.randomcorner )
        {
            case 0:
                _id_5CA607E4C447781D = ( _id_7BA4DEE5CC4C1DCC[0] + _id_0F40B5C2409B628B, _id_7BA4DEE5CC4C1DCC[1] - _id_0F40B5C2409B628B, _id_7BA4DEE5CC4C1DCC[2] );
                _id_5CA606E4C44775EA = ( _id_7BA4DFE5CC4C1FFF[0] - _id_62090C76DAB8D45A, _id_7BA4DFE5CC4C1FFF[1] - _id_0F40B5C2409B628B, _id_7BA4DFE5CC4C1FFF[2] );
                _id_5CA605E4C44773B7 = ( _id_7BA4E0E5CC4C2232[0] - _id_62090C76DAB8D45A, _id_7BA4E0E5CC4C2232[1] + _id_62090C76DAB8D45A, _id_7BA4E0E5CC4C2232[2] );
                _id_5CA604E4C4477184 = ( _id_7BA4E1E5CC4C2465[0] + _id_0F40B5C2409B628B, _id_7BA4E1E5CC4C2465[1] + _id_62090C76DAB8D45A, _id_7BA4E1E5CC4C2465[2] );
                break;
            case 1:
                _id_5CA607E4C447781D = ( _id_7BA4DEE5CC4C1DCC[0] + _id_62090C76DAB8D45A, _id_7BA4DEE5CC4C1DCC[1] - _id_0F40B5C2409B628B, _id_7BA4DEE5CC4C1DCC[2] );
                _id_5CA606E4C44775EA = ( _id_7BA4DFE5CC4C1FFF[0] - _id_0F40B5C2409B628B, _id_7BA4DFE5CC4C1FFF[1] - _id_0F40B5C2409B628B, _id_7BA4DFE5CC4C1FFF[2] );
                _id_5CA605E4C44773B7 = ( _id_7BA4E0E5CC4C2232[0] - _id_62090C76DAB8D45A, _id_7BA4E0E5CC4C2232[1] + _id_0F40B5C2409B628B, _id_7BA4E0E5CC4C2232[2] );
                _id_5CA604E4C4477184 = ( _id_7BA4E1E5CC4C2465[0] + _id_62090C76DAB8D45A, _id_7BA4E1E5CC4C2465[1] + _id_62090C76DAB8D45A, _id_7BA4E1E5CC4C2465[2] );
                break;
            case 2:
                _id_5CA607E4C447781D = ( _id_7BA4DEE5CC4C1DCC[0] + _id_62090C76DAB8D45A, _id_7BA4DEE5CC4C1DCC[1] - _id_62090C76DAB8D45A, _id_7BA4DEE5CC4C1DCC[2] );
                _id_5CA606E4C44775EA = ( _id_7BA4DFE5CC4C1FFF[0] - _id_0F40B5C2409B628B, _id_7BA4DFE5CC4C1FFF[1] - _id_62090C76DAB8D45A, _id_7BA4DFE5CC4C1FFF[2] );
                _id_5CA605E4C44773B7 = ( _id_7BA4E0E5CC4C2232[0] - _id_0F40B5C2409B628B, _id_7BA4E0E5CC4C2232[1] + _id_0F40B5C2409B628B, _id_7BA4E0E5CC4C2232[2] );
                _id_5CA604E4C4477184 = ( _id_7BA4E1E5CC4C2465[0] + _id_62090C76DAB8D45A, _id_7BA4E1E5CC4C2465[1] + _id_0F40B5C2409B628B, _id_7BA4E1E5CC4C2465[2] );
                break;
            case 3:
                _id_5CA607E4C447781D = ( _id_7BA4DEE5CC4C1DCC[0] + _id_0F40B5C2409B628B, _id_7BA4DEE5CC4C1DCC[1] - _id_62090C76DAB8D45A, _id_7BA4DEE5CC4C1DCC[2] );
                _id_5CA606E4C44775EA = ( _id_7BA4DFE5CC4C1FFF[0] - _id_62090C76DAB8D45A, _id_7BA4DFE5CC4C1FFF[1] - _id_62090C76DAB8D45A, _id_7BA4DFE5CC4C1FFF[2] );
                _id_5CA605E4C44773B7 = ( _id_7BA4E0E5CC4C2232[0] - _id_62090C76DAB8D45A, _id_7BA4E0E5CC4C2232[1] + _id_0F40B5C2409B628B, _id_7BA4E0E5CC4C2232[2] );
                _id_5CA604E4C4477184 = ( _id_7BA4E1E5CC4C2465[0] + _id_0F40B5C2409B628B, _id_7BA4E1E5CC4C2465[1] + _id_0F40B5C2409B628B, _id_7BA4E1E5CC4C2465[2] );
                break;
            case 4:
                _id_5CA607E4C447781D = ( _id_7BA4DEE5CC4C1DCC[0] + _id_62090C76DAB8D45A, _id_7BA4DEE5CC4C1DCC[1] - _id_62090C76DAB8D45A, _id_7BA4DEE5CC4C1DCC[2] );
                _id_5CA606E4C44775EA = ( _id_7BA4DFE5CC4C1FFF[0] - _id_62090C76DAB8D45A, _id_7BA4DFE5CC4C1FFF[1] - _id_62090C76DAB8D45A, _id_7BA4DFE5CC4C1FFF[2] );
                _id_5CA605E4C44773B7 = ( _id_7BA4E0E5CC4C2232[0] - _id_62090C76DAB8D45A, _id_7BA4E0E5CC4C2232[1] + _id_62090C76DAB8D45A, _id_7BA4E0E5CC4C2232[2] );
                _id_5CA604E4C4477184 = ( _id_7BA4E1E5CC4C2465[0] + _id_62090C76DAB8D45A, _id_7BA4E1E5CC4C2465[1] + _id_62090C76DAB8D45A, _id_7BA4E1E5CC4C2465[2] );
                break;
            default:
                _id_5CA607E4C447781D = ( _id_7BA4DEE5CC4C1DCC[0] + _id_62090C76DAB8D45A, _id_7BA4DEE5CC4C1DCC[1] - _id_62090C76DAB8D45A, _id_7BA4DEE5CC4C1DCC[2] );
                _id_5CA606E4C44775EA = ( _id_7BA4DFE5CC4C1FFF[0] - _id_62090C76DAB8D45A, _id_7BA4DFE5CC4C1FFF[1] - _id_62090C76DAB8D45A, _id_7BA4DFE5CC4C1FFF[2] );
                _id_5CA605E4C44773B7 = ( _id_7BA4E0E5CC4C2232[0] - _id_62090C76DAB8D45A, _id_7BA4E0E5CC4C2232[1] + _id_62090C76DAB8D45A, _id_7BA4E0E5CC4C2232[2] );
                _id_5CA604E4C4477184 = ( _id_7BA4E1E5CC4C2465[0] + _id_62090C76DAB8D45A, _id_7BA4E1E5CC4C2465[1] + _id_62090C76DAB8D45A, _id_7BA4E1E5CC4C2465[2] );
                break;
        }

        _id_6F5B4BC105542115 = [];
        level.paddedquadgridcenterpoints = [];
        level.padcorner3to0dist = abs( distance( _id_5CA604E4C4477184, _id_5CA607E4C447781D ) );
        level.pointinsquarewidth = level.padcorner3to0dist / 2;

        for ( _id_AC0E594AC96AA3A8 = 1; _id_AC0E594AC96AA3A8 < 4; _id_AC0E594AC96AA3A8 = _id_AC0E594AC96AA3A8 + 2 )
        {
            _id_5CAABC9F456B8007 = _id_AC0E594AC96AA3A8 * level.padcorner3to0dist / 2;

            for ( _id_AC0E5C4AC96AAA41 = 1; _id_AC0E5C4AC96AAA41 < 4; _id_AC0E5C4AC96AAA41 = _id_AC0E5C4AC96AAA41 + 2 )
            {
                _id_5CAABB9F456B7DD4 = _id_AC0E5C4AC96AAA41 * level.padcorner3to0dist / 2;
                _id_DBC2014289D0BCBD = ( _id_5CA604E4C4477184[0] + _id_5CAABC9F456B8007 / 2, _id_5CA604E4C4477184[1] + _id_5CAABB9F456B7DD4 / 2, 0 );
                _id_6F5B4BC105542115[_id_6F5B4BC105542115.size] = _id_DBC2014289D0BCBD;
            }
        }

        if ( level.pushdistributiontowardoppositecorner == 2 )
            level.paddedquadgridcenterpoints = scripts\engine\utility::array_randomize( _id_6F5B4BC105542115 );
        else
        {
            switch ( level.randomcorner )
            {
                case 0:
                    if ( level.pushdistributiontowardoppositecorner )
                    {
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[2];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[3];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[1];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[0];
                    }
                    else
                    {
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[1];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[3];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[2];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[0];
                    }

                    break;
                case 1:
                    if ( level.pushdistributiontowardoppositecorner )
                    {
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[0];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[2];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[3];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[1];
                    }
                    else
                    {
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[3];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[2];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[0];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[1];
                    }

                    break;
                case 2:
                    if ( level.pushdistributiontowardoppositecorner )
                    {
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[1];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[0];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[2];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[3];
                    }
                    else
                    {
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[2];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[0];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[1];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[3];
                    }

                    break;
                case 3:
                    if ( level.pushdistributiontowardoppositecorner )
                    {
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[3];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[1];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[0];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[2];
                    }
                    else
                    {
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[0];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[1];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[3];
                        level.paddedquadgridcenterpoints[level.paddedquadgridcenterpoints.size] = _id_6F5B4BC105542115[2];
                    }

                    break;
                case 4:
                    level.paddedquadgridcenterpoints = scripts\engine\utility::array_randomize( _id_6F5B4BC105542115 );
                    break;
                default:
                    level.paddedquadgridcenterpoints = scripts\engine\utility::array_randomize( _id_6F5B4BC105542115 );
                    break;
            }
        }

        _id_671BBD330E59016E = abs( distance( _id_5CA607E4C447781D, _id_5CA605E4C44773B7 ) );
        level.corner0to2dist = _id_671BBD330E59016E;
        _id_9F62E2EC55D8476E = _id_671BBD330E59016E / 4.5;
        level.paddedquadgridradius2dsq = _id_9F62E2EC55D8476E * _id_9F62E2EC55D8476E;
    }
}
