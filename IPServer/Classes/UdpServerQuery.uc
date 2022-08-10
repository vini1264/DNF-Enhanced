/*******************************************************************************
 * UdpServerQuery generated by Eliot.UELib using UELib.CLI.
 * Eliot.UELib © 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class UdpServerQuery extends UdpLink
	transient
	config
	collapsecategories
	hidecategories(movement,Collision,Lighting,LightColor);

var() name QueryName;
var int CurrentQueryNum;
var globalconfig string GameName;

function PreBeginPlay()
{
	local int boundport;

	__NFUN_567__(QueryName);
	boundport = __NFUN_1135__(Level.Game.GetServerPort(), true);
	// End:0x62
	if(__NFUN_173__(boundport, 0))
	{
		__NFUN_355__("UdpServerQuery: Port failed to bind.");
		return;
	}
	__NFUN_355__(__NFUN_302__(__NFUN_302__("UdpServerQuery: Port ", string(boundport)), " successfully bound."));
	return;
}

function PostBeginPlay()
{
	local UdpBeacon Beacon;

	// End:0x26
	foreach __NFUN_747__(class'UdpBeacon', Beacon)
	{
		Beacon.UdpServerQueryPort = Port;		
	}	
	super(Actor).PostBeginPlay();
	return;
}

event ReceivedText(IpAddr Addr, string Text)
{
	local string Query;
	local bool QueryRemaining;
	local int QueryNum, PacketNum;

	__NFUN_184__(CurrentQueryNum);
	// End:0x1A
	if(__NFUN_170__(CurrentQueryNum, 100))
	{
		CurrentQueryNum = 1;
	}
	QueryNum = CurrentQueryNum;
	Query = Text;
	// End:0x48
	if(__NFUN_308__(Query, ""))
	{
		QueryRemaining = false;		
	}
	else
	{
		QueryRemaining = true;
	}
	J0x50:

	// End:0x9C [Loop If]
	if(QueryRemaining)
	{
		Query = ParseQuery(Addr, Query, QueryNum, PacketNum);
		// End:0x91
		if(__NFUN_308__(Query, ""))
		{
			QueryRemaining = false;			
		}
		else
		{
			QueryRemaining = true;
		}
		// [Loop Continue]
		goto J0x50;
	}
	return;
}

function bool ParseNextQuery(string Query, out string QueryType, out string QueryValue, out string QueryRest, out string FinalPacket)
{
	local string TempQuery;
	local int ClosingSlash;

	// End:0x0F
	if(__NFUN_308__(Query, ""))
	{
		return false;
	}
	// End:0x17A
	if(__NFUN_308__(__NFUN_317__(Query, 1), "\\"))
	{
		ClosingSlash = __NFUN_315__(__NFUN_318__(Query, __NFUN_166__(__NFUN_314__(Query), 1)), "\\");
		// End:0x4D
		if(__NFUN_173__(ClosingSlash, 0))
		{
			return false;
		}
		TempQuery = Query;
		QueryType = __NFUN_318__(Query, __NFUN_166__(__NFUN_314__(Query), 1));
		QueryType = __NFUN_317__(QueryType, ClosingSlash);
		QueryRest = __NFUN_318__(Query, __NFUN_166__(__NFUN_314__(Query), __NFUN_165__(__NFUN_314__(QueryType), 2)));
		// End:0xD7
		if(__NFUN_150__(__NFUN_308__(QueryRest, ""), __NFUN_173__(__NFUN_314__(QueryRest), 1)))
		{
			FinalPacket = "final";
			return true;			
		}
		else
		{
			// End:0xEB
			if(__NFUN_308__(__NFUN_317__(QueryRest, 1), "\\"))
			{
				return true;
			}
		}
		ClosingSlash = __NFUN_315__(QueryRest, "\\");
		// End:0x11D
		if(__NFUN_172__(ClosingSlash, 0))
		{
			QueryValue = __NFUN_317__(QueryRest, ClosingSlash);			
		}
		else
		{
			QueryValue = QueryRest;
		}
		QueryRest = __NFUN_318__(Query, __NFUN_166__(__NFUN_314__(Query), __NFUN_165__(__NFUN_165__(__NFUN_314__(QueryType), __NFUN_314__(QueryValue)), 3)));
		// End:0x175
		if(__NFUN_308__(QueryRest, ""))
		{
			FinalPacket = "final";
			return true;			
		}
		else
		{
			return true;
		}		
	}
	else
	{
		return false;
	}
	return;
}

function string ParseQuery(IpAddr Addr, coerce string Query, int QueryNum, out int PacketNum)
{
	local string QueryType, QueryValue, QueryRest, ValidationString;
	local bool Result;
	local string FinalPacket;

	Result = ParseNextQuery(Query, QueryType, QueryValue, QueryRest, FinalPacket);
	// End:0x34
	if(__NFUN_145__(Result))
	{
		return "";
	}
	// End:0x72
	if(__NFUN_308__(QueryType, "basic"))
	{
		Result = SendQueryPacket(Addr, GetBasic(), QueryNum, __NFUN_182__(PacketNum), FinalPacket);		
	}
	else
	{
		// End:0xAF
		if(__NFUN_308__(QueryType, "info"))
		{
			Result = SendQueryPacket(Addr, GetInfo(), QueryNum, __NFUN_182__(PacketNum), FinalPacket);			
		}
		else
		{
			// End:0xED
			if(__NFUN_308__(QueryType, "rules"))
			{
				Result = SendQueryPacket(Addr, GetRules(), QueryNum, __NFUN_182__(PacketNum), FinalPacket);				
			}
			else
			{
				// End:0x16A
				if(__NFUN_308__(QueryType, "players"))
				{
					// End:0x144
					if(__NFUN_170__(Level.Game.NumPlayers, 0))
					{
						Result = SendPlayers(Addr, QueryNum, PacketNum, FinalPacket);						
					}
					else
					{
						Result = SendQueryPacket(Addr, "", QueryNum, PacketNum, FinalPacket);
					}					
				}
				else
				{
					// End:0x25E
					if(__NFUN_308__(QueryType, "status"))
					{
						Result = SendQueryPacket(Addr, GetBasic(), QueryNum, __NFUN_182__(PacketNum), "");
						Result = SendQueryPacket(Addr, GetInfo(), QueryNum, __NFUN_182__(PacketNum), "");
						// End:0x214
						if(__NFUN_173__(Level.Game.NumPlayers, 0))
						{
							Result = SendQueryPacket(Addr, GetRules(), QueryNum, __NFUN_182__(PacketNum), FinalPacket);							
						}
						else
						{
							Result = SendQueryPacket(Addr, GetRules(), QueryNum, __NFUN_182__(PacketNum), "");
							Result = SendPlayers(Addr, QueryNum, PacketNum, FinalPacket);
						}						
					}
					else
					{
						// End:0x2A5
						if(__NFUN_308__(QueryType, "echo"))
						{
							Result = SendQueryPacket(Addr, __NFUN_302__("\\echo\\", QueryValue), QueryNum, __NFUN_182__(PacketNum), FinalPacket);							
						}
						else
						{
							// End:0x305
							if(__NFUN_308__(QueryType, "secure"))
							{
								ValidationString = __NFUN_302__("\\validate\\", __NFUN_1133__(QueryValue, GameName));
								Result = SendQueryPacket(Addr, ValidationString, QueryNum, __NFUN_182__(PacketNum), FinalPacket);								
							}
							else
							{
								// End:0x351
								if(__NFUN_308__(QueryType, "level_property"))
								{
									Result = SendQueryPacket(Addr, GetLevelProperty(QueryValue), QueryNum, __NFUN_182__(PacketNum), FinalPacket);									
								}
								else
								{
									// End:0x39C
									if(__NFUN_308__(QueryType, "game_property"))
									{
										Result = SendQueryPacket(Addr, GetGameProperty(QueryValue), QueryNum, __NFUN_182__(PacketNum), FinalPacket);										
									}
									else
									{
										// End:0x3E9
										if(__NFUN_308__(QueryType, "player_property"))
										{
											Result = SendQueryPacket(Addr, GetPlayerProperty(QueryValue), QueryNum, __NFUN_182__(PacketNum), FinalPacket);											
										}
										else
										{
											__NFUN_355__(__NFUN_302__("UdpServerQuery: Unknown query: ", QueryType));
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	// End:0x44F
	if(__NFUN_145__(Result))
	{
		__NFUN_355__("UdpServerQuery: Error responding to query.");
	}
	return QueryRest;
	return;
}

function bool SendQueryPacket(IpAddr Addr, coerce string SendString, int QueryNum, int PacketNum, string FinalPacket)
{
	local bool Result;

	// End:0x29
	if(__NFUN_308__(FinalPacket, "final"))
	{
		SendString = __NFUN_302__(SendString, "\\final\\");
	}
	SendString = __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(SendString, "\\queryid\\"), string(QueryNum)), "."), string(PacketNum));
	Result = __NFUN_1136__(Addr, SendString);
	return Result;
	return;
}

function string GetBasic()
{
	local string ResultSet;

	ResultSet = __NFUN_302__("\\gamename\\", GameName);
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\gamever\\"), Level.EngineVersion);
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\minnetver\\"), Level.MinNetVersion);
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\location\\"), string(Level.Game.GameReplicationInfo.GameRegion));
	return ResultSet;
	return;
}

function string GetInfo()
{
	local string ResultSet;

	ResultSet = __NFUN_302__("\\hostname\\", Level.Game.GameReplicationInfo.ServerName);
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\hostport\\"), string(Level.Game.GetServerPort()));
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\maptitle\\"), Level.Title);
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\mapname\\"), __NFUN_317__(string(Level), __NFUN_315__(string(Level), ".")));
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\gametype\\"), Level.Game.GameName);
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\numplayers\\"), string(Level.Game.NumPlayers));
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\maxplayers\\"), string(Level.Game.MaxPlayers));
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\numbots\\"), string(Level.Game.NumBots));
	ResultSet = __NFUN_302__(ResultSet, "\\gamemode\\openplaying");
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\gamever\\"), Level.EngineVersion);
	ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\minnetver\\"), Level.MinNetVersion);
	ResultSet = __NFUN_302__(ResultSet, Level.Game.GetInfo());
	return ResultSet;
	return;
}

function string GetRules()
{
	local string ResultSet;

	ResultSet = Level.Game.GetRules();
	// End:0x8C
	if(__NFUN_309__(Level.Game.GameReplicationInfo.AdminName, ""))
	{
		ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\AdminName\\"), Level.Game.GameReplicationInfo.AdminName);
	}
	// End:0xF9
	if(__NFUN_309__(Level.Game.GameReplicationInfo.AdminEmail, ""))
	{
		ResultSet = __NFUN_302__(__NFUN_302__(ResultSet, "\\AdminEMail\\"), Level.Game.GameReplicationInfo.AdminEmail);
	}
	return ResultSet;
	return;
}

function string GetPlayer(PlayerPawn P, int PlayerNum)
{
	local string ResultSet, SkinName, FaceName;

	ResultSet = __NFUN_302__(__NFUN_302__(__NFUN_302__("\\player_", string(PlayerNum)), "\\"), P.PlayerReplicationInfo.PlayerName);
	ResultSet = __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(ResultSet, "\\frags_"), string(PlayerNum)), "\\"), string(P.PlayerReplicationInfo.Score));
	ResultSet = __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(ResultSet, "\\ping_"), string(PlayerNum)), "\\"), P.ConsoleCommand("GETPING"));
	ResultSet = __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(ResultSet, "\\team_"), string(PlayerNum)), "\\"), string(P.PlayerReplicationInfo.Team));
	ResultSet = __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(ResultSet, "\\mesh_"), string(PlayerNum)), "\\"), P.MenuName);
	return ResultSet;
	return;
}

function bool SendPlayers(IpAddr Addr, int QueryNum, out int PacketNum, string FinalPacket)
{
	local Pawn P;
	local int i;
	local bool Result, SendResult;

	i = 0;
	Result = false;
	P = Level.PawnList;
	J0x24:

	// End:0x118 [Loop If]
	if(__NFUN_340__(P, none))
	{
		// End:0x100
		if(P.__NFUN_358__('PlayerPawn'))
		{
			// End:0xAC
			if(__NFUN_148__(__NFUN_339__(P.NextPawn, none), __NFUN_308__(FinalPacket, "final")))
			{
				SendResult = SendQueryPacket(Addr, GetPlayer(PlayerPawn(P), i), QueryNum, __NFUN_182__(PacketNum), "final");				
			}
			else
			{
				SendResult = SendQueryPacket(Addr, GetPlayer(PlayerPawn(P), i), QueryNum, __NFUN_182__(PacketNum), "");
			}
			__NFUN_184__(i);
			Result = __NFUN_150__(Result, SendResult);
		}
		P = P.NextPawn;
		// [Loop Continue]
		goto J0x24;
	}
	// End:0x172
	if(__NFUN_174__(i, Level.Game.NumPlayers))
	{
		Warn("Level.PawnList out of sync with Game.NumPlayers");
	}
	return Result;
	return;
}

function string GetLevelProperty(string Prop)
{
	local string ResultSet;

	ResultSet = __NFUN_302__(__NFUN_302__(__NFUN_302__("\\", Prop), "\\"), Level.__NFUN_363__(Prop));
	return ResultSet;
	return;
}

function string GetGameProperty(string Prop)
{
	local string ResultSet;

	ResultSet = __NFUN_302__(__NFUN_302__(__NFUN_302__("\\", Prop), "\\"), Level.Game.__NFUN_363__(Prop));
	return ResultSet;
	return;
}

function string GetPlayerProperty(string Prop)
{
	local string ResultSet;
	local int i;
	local PlayerPawn P;

	// End:0x5B
	foreach __NFUN_747__(class'PlayerPawn', P)
	{
		__NFUN_184__(i);
		ResultSet = __NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(__NFUN_302__(ResultSet, "\\"), Prop), "_"), string(i)), "\\"), P.__NFUN_363__(Prop));		
	}	
	return ResultSet;
	return;
}

defaultproperties
{
	QueryName=MasterUplink
	GameName="dnf"
}