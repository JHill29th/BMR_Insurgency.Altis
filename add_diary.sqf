player createDiaryRecord ["Diary", ["3rd Party Credits","
	<br />Original insurgency by pogoman, Fireball, and Kol9yN.
	<br />Insurgency is based off the game mode created by the Project
	<br />	Reality team, originally released for
	<br />	Arma 2 Operation Arrowhead.
	<br />
	<br />----------------------------- Scripts -----------------------------
	<br />EOS v1.98 by BangaBob (H8erMaker)
	<br />=BTC=_revive v.98, =BTC= Logistics,
	<br />=BTC= Quick Revive and =BTC=_TK_punishment
	<br />	by BTC Giallustio
	<br />TAW view Distance v1.4 by Tonic
	<br />randomWeather2.sqf by Meatball.
	<br />real_weather.sqf v1.3 Original Release by team code34
	<br />	nicolas_boiteux@yahoo.fr.
	<br />vehRespawn.sqf, and ICE_HUD by Iceman77
	<br />repetitive_cleanup.sqf v1.7, player_markers.sqf v2.6,
	<br />JW Custom Close Air Support v0.1b.by JW Custom
	<br />Display Heading Script v3 by GeneralCarver.
	<br />Halo =ATM= Airdrop v6.0 by pokertour.
	<br />Traffic by MAD T.
	<br />Randomly generated roadside IED's by brians200
	<br />v1g Fast Rope by [STELS]Zealot
	<br />x_reload by Xeno
	<br />ghst_PutinBuild.sqf and ghst_PutinBuildIntel.sqf cores by Ghost
	<br />ghst_ugvsupport.sqf by Ghost
	<br />T-Helmetcam by Tajin
	<br />HuntIR script v1.0 by Bardosy
	<br />tky_evo_performance report by GITS Tankbuster
	<br />SHK_buildingpos.sqf v0.12 and shk_taskmaster v0.44 by Shuko
	<br />BTK Cargo Drop v1.92 by sxp2high
	<br />zbe_cache_script_v4.6a by zorrobyte
	<br />Bon's Infantry Recruitment Redux -- by Moser
	<br />Mine Detector Script version alpha 0.6 by Lala14
	<br />Fog script v1.62 by Rockhount[BAfH]
	<br />ASOR Vehicle Selector v1.4 by Lecks
	<br />INS_SuicideBomber.sqf recruit civilian modification by SupahG33K
	<br />fn_Battle.sqf by Mikey74
	<br />ADF_helipadLights.sqf by Whiztler
	<br />Advanced Sling Loading by Duda
	<br />
	<br />-------------------------- Functions ----------------------------
	<br />remove_carcass_fnc code by BIS
	<br />Ambient radio chatter code by TPW
	<br />BTC_m_fnc_only_server, BTC_AI_init and BTC_repair_wreck,
	<br />	by BTC Giallustio
	<br />fnc_ghst_build_positions and fnc_ghst_rand_position by Ghost
	<br />X_fnc_returnVehicleTurrets by Joris-Jan van 't Land
	<br />find_west_target_fnc based on example by Mattar_Tharkari in
	<br />	BIS Community Forums
	<br />rej_fnc_bezier by Rejenorst
	<br />Boat push - v0.1  by BearBison
	<br />find_civ_bomber_fnc by SupahG33K
	<br />killed_ss_bmbr_fnc modified by SupahG33K
	<br />INS_Brighter_Nights ocde by Ralian
	<br />
	<br />------------------------ Development --------------------------
	<br />Thanks to BIS for such a great platform.
	<br />Thanks to BIS Community and BIS Community Forums
	<br />AJAX and Onion Gamers for hosting, testing and feedback.
	<br />All the Black Mamba Rangers
	<br />Thanks to all the Forum members who provided feedback.
	<br />Mr.Ripley for extensive long run testing, analyzing
	<br />	and feedback especially in Headless Client addition.
	<br />BMR_Insurgency_v1_44 release in Honor and Memory of
	<br />	Robert Lynn Lewellen. AKA Spectrum Warrior of Elite Arma Warriors
	<br />	who exposed me to scripting, Insurgency and Evolution game modes back in Arma 1.
	<br />
	"]];
player createDiaryRecord ["Diary", ["Credits","
	<br />Mission Author - Jigsor =BMR=
	<br />
	<br />OPTRE Port by Costno
	<br />Many original functions and scripts by Jigsor =BMR=.
	<br />Several functions and scripts by BTC Giallustio and Ghost
	<br />were modified by Jigsor =BMR=.
	<br/><br/><img image='images\bmrbw.paa' widwidth='256' height='256'/>"]];
player createDiaryRecord ["Diary", ["INFO","
	--------------------
	<br />-- Settings --
	<br />
	--------------------
	<br />Press Y key for Graphic Settings, Digital Heading, FPS/Stamina/Health HUD and Ambient Wild Life toggle.
	<br />
	<br />Join, Create, or Leave Squads/Groups with U key menu. Only squad leaders can recuit AI if option enabled by admin.
	<br />
	<br />Supported PIP live feeds from the helmet-cameras of their fellow group members. Requires Tactical Glasses and helmet with camera. * - Activates camera / switches to next group member. Alt+* - Deactivates camera. Shift+* - Toggles size of the display.
	<br />
	<br />Press F3 or Assigned User Action 3 to reverse planes when stoped.
	<br />
	-------------------
	<br />-- Support --
	<br />
	-------------------
	<br />JTAC and Team leader CAS1 can call for Close Air Support. UAV Operators can call for air dropped UGV and launch parachute camera by firing a white flare from 203 grenade launcher. Engineer can build a FARP to repair, rearm and flip vehicles if he has a Bobcat or Repair Truck close by. Medics can build a small sandbag wall to provide cover. Team Leader CAS1 can call for squad heli evac. Sniper, Marksmen and Spotter classes can enable/disable bullet cam.
	<br />
	-------------------
	<br />-- Vehicles --
	<br />
	-------------------
	<br />Vehicles from base will respawn if destroyed. All Blufor Mobile Head Quarters have Virtual Arsenal. Opfor MHQ has deploy option to move ammo crates to MHQ location. The Bobcat can Tow other vehicles. GhostHawks can lift light vehicles. Mohawk and Huron can lift heavy and light vehicles. Earn a Vehicle Reward of any type by destroying an ammo cache if Enemy Armor Probability parameter is set above 0%. After destroying ammo cache, scroll and click Vehicle Reward action. Mapclick desired position for reward. Wait until vehicle icon appears in top left corner. Click icon to view full list of available vehicles. Scroll then click on vehicle to view some information about it. After selection click close button and look for Vehicle Reward map marker to find the vehicle. You may postpone reward at vehicle menu by pressing escape. Be warned if you die before you spawn the vehicle you will loose the reward action.
	<br />
	<br />Non DLC owner can enter driver or gunner of most DLC vehicles without restriction - complete vehicle list is W.I.P.
	<br />
	-------------------
	<br />-- Respawn --
	<br />
	-------------------
	<br /> The following Repawn, MHQ, and Teleport options can vary depending lobby parameter -Revive system- settings.
	<br />
	<br />Blufor -- Can choose to respawn at BASE, MHQ_1, MHQ_2, or MHQ_3 if no one revives you. You may also choose teleport to MHQs or Halo from Flag Pole at base.
	<br />
	<br />Opfor -- Choose Base to respawn in vicinity of Blufor players who have activated zones. If no zones are activated you will spawn in center of map or Choose Opfor_MHQ to spawn on your MHQ. If MHQ system enabled, teleport to MHQ from base flagpole is available.
	<br />
	<br />While waiting for a revive you can spectate and control camera with usual movement controls.
	<br />
	<br />To have a fully restored loadout/kit after respawn or revive, use scroll action Save Respawn Loadout at main ammo box.
	<br />
	------------------------
	<br />-- Gas Grenades --
	<br />
	------------------------
	Vanilla Arma 3 Yellow hand and GL smoke grenades are Toxic and can kill players or AI.
	<br />
	<br />For immunity wear A3 Heli Crew, Pilot, CRTG Combat Stealth or Viper Green Hex helmets.
	<br />
	<br />Moded support for gas masks include masks from from Hidden Identity Pack v2, Identity Pack v3, NATO SF and Russian Spetsnaz Weapons, FM-12 strapless from AVON FM12 Respirator Pack, OPTRE_UNSC_CH252_Helmet_Vacuum_DES and OPTRE_UNSC_ODST_Helmet_CBRN from Operation TREBUCHET.
	<br />
	<br />Adim can disable gas grenades from lobby parameter.
	<br />
	----------------------------------------------
	<br />-- Transfer / HALO Flag Pole Actions --
	<br />
	----------------------------------------------
	<br />Transfer to MHQ_1, MHQ_2, and MHQ_3. This will teleport you to an emty seat inside of these vehicles where as transferring to MHQs from respawn menu will put you outside of the vehicles.
	<br />
	<br />HALO- set drop height to desired height and/or assign a key to cut away ropes incase you chuts gets hung on an object. You can skip this step and close the dialoge box. In this case the default drop height is 500 and no key is assigned to cut away ropes.
	<br />
	<br />Click on map the location you wish to HALO. Do not open or click any other user interface at this step. It will result in HALO at undesired location.
	<br />
	<br />A parachute will automatically be provided for you and will move your back pack to ventril position. Chute automatically open at 150 meters and backpack returned to back when landed.
	<br />
  "]];
player createDiaryRecord ["Diary", ["Briefing","Gather Intel on Ammo Cache location by picking up suitcases. Destroy Ammo Caches with satchel or demo charges. Clear all red zones of enemy forces. Complete random objectives. Get Some!"]];