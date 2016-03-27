within Annex60.Experimental.ThermalZones.ReducedOrder.Examples;
model SimpleRoomOneElement "Illustrates the use of ThermalZoneOneElement"
  extends Modelica.Icons.Example;

  BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
    calTSky=Annex60.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation,
    computeWetBulbTemperature=false,
    filNam=Modelica.Utilities.Files.loadResource(
        "modelica://Annex60/Resources/weatherdata/USA_CA_San.Francisco.Intl.AP.724940_TMY3.mos"),
    HSou=Annex60.BoundaryConditions.Types.RadiationDataSource.File,
    pAtmSou=Annex60.BoundaryConditions.Types.DataSource.File,
    ceiHeiSou=Annex60.BoundaryConditions.Types.DataSource.File,
    totSkyCovSou=Annex60.BoundaryConditions.Types.DataSource.File,
    opaSkyCovSou=Annex60.BoundaryConditions.Types.DataSource.File,
    TDryBulSou=Annex60.BoundaryConditions.Types.DataSource.File,
    TDewPoiSou=Annex60.BoundaryConditions.Types.DataSource.File,
    relHumSou=Annex60.BoundaryConditions.Types.DataSource.File,
    winSpeSou=Annex60.BoundaryConditions.Types.DataSource.File,
    winDirSou=Annex60.BoundaryConditions.Types.DataSource.File,
    HInfHorSou=Annex60.BoundaryConditions.Types.DataSource.File,
    TBlaSkySou=Annex60.BoundaryConditions.Types.DataSource.File)
    annotation (Placement(transformation(extent={{-98,52},{-78,72}})));
  BoundaryConditions.SolarIrradiation.DiffusePerez HDifTil[2](each outSkyCon=true,
      each outGroCon=true,
    each til=1.5707963267949,
    each lat=0.87266462599716,
    azi={3.1415926535898,4.7123889803847})
    annotation (Placement(transformation(extent={{-68,20},{-48,40}})));
  BoundaryConditions.SolarIrradiation.DirectTiltedSurface HDirTil[2](
    each til=1.5707963267949,
    each lat=0.87266462599716,
    azi={3.1415926535898,4.7123889803847})
    annotation (Placement(transformation(extent={{-68,52},{-48,72}})));
  CorrectionSolarGain.CorGDoublePane corGDoublePane(n=2, UWin=2.1)
    annotation (Placement(transformation(extent={{6,54},{26,74}})));
  Modelica.Blocks.Math.Sum
            aggWindow(nin=2, k={0.5,0.5})
    annotation (Placement(transformation(extent={{44,57},{58,71}})));
  ROM.ThermalZoneOneElement thermalZoneOneElement(
    VAir=52.5,
    AExt=11.5,
    alphaExt=2.7,
    AWin=14,
    ATransparent=14,
    alphaWin=2.7,
    gWin=1,
    ratioWinConRad=0.09,
    nExt=1,
    RExt={0.00331421908725},
    CExt={5259932.23},
    alphaRad=5,
    RWin=0.01642857143,
    RExtRem=0.1265217391,
    volAir(T_start=295.15),
    T_start=295.15)
    annotation (Placement(transformation(extent={{44,-2},{92,34}})));
  EqAirTemp.EqAirTemp eqAirTemp(n=2,
    wfGround=0,
    wfWall={0.3043478260869566,0.6956521739130435},
    wfWin={0.5,0.5},
    withLongwave=true,
    aExt=0.7,
    alphaExtOut=20,
    alphaRad=5,
    alphaWinOut=20,
    aWin=0.03,
    eExt=0.9,
    TGround=285.15)
    annotation (Placement(transformation(extent={{-24,-14},{-4,6}})));
  Modelica.Blocks.Math.Add solRad[2]
    annotation (Placement(transformation(extent={{-38,6},{-28,16}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
    prescribedTemperature
    annotation (Placement(transformation(extent={{8,-6},{20,6}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
    prescribedTemperature1
    annotation (Placement(transformation(extent={{8,14},{20,26}})));
  Modelica.Thermal.HeatTransfer.Components.Convection       thermalConductorWin
    "Outdoor convective heat transfer of windows"
    annotation (Placement(transformation(extent={{38,16},{28,26}})));
  Modelica.Thermal.HeatTransfer.Components.Convection       thermalConductorWall
    "Outdoor convective heat transfer of walls"
    annotation (Placement(transformation(extent={{36,6},{26,-4}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow personsRad
    annotation (Placement(transformation(extent={{48,-42},{68,-22}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow personsConv
    annotation (Placement(transformation(extent={{48,-62},{68,-42}})));
  Modelica.Blocks.Sources.CombiTimeTable internalGains(
    table=[0,0,0,0; 3600,0,0,0; 7200,0,0,0; 10800,0,0,0; 14400,0,0,0; 18000,0,0,
        0; 21600,0,0,0; 25200,0,0,0; 25200,80,80,200; 28800,80,80,200; 32400,80,
        80,200; 36000,80,80,200; 39600,80,80,200; 43200,80,80,200; 46800,80,80,200;
        50400,80,80,200; 54000,80,80,200; 57600,80,80,200; 61200,80,80,200; 61200,
        0,0,0; 64800,0,0,0; 72000,0,0,0; 75600,0,0,0; 79200,0,0,0; 82800,0,0,0;
        86400,0,0,0],
    columns={2,3,4},
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    annotation (Placement(transformation(extent={{6,-60},{22,-44}})));
  Modelica.Blocks.Sources.Constant const[2](each k=0)
    annotation (Placement(transformation(extent={{-20,14},{-14,20}})));
  BoundaryConditions.WeatherData.Bus weaBus annotation (Placement(
        transformation(extent={{-100,-10},{-66,22}}),iconTransformation(extent={{-70,-12},
            {-50,8}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow machinesConv
    annotation (Placement(transformation(extent={{48,-84},{68,-64}})));

  Modelica.Blocks.Sources.Constant alphaWall(k=25*11.5)
    "Outdoor coefficient of heat transfer for walls" annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={30,-16})));
  Modelica.Blocks.Sources.Constant alphaWin(k=20*14)
    "Outdoor coefficient of heat transfer for windows" annotation (Placement(
        transformation(
        extent={{4,-4},{-4,4}},
        rotation=90,
        origin={32,38})));
equation
  connect(eqAirTemp.TEqAirWindow, prescribedTemperature1.T) annotation (Line(
        points={{-4.2,-1.4},{0,-1.4},{0,20},{6.8,20}}, color={0,0,127}));
  connect(eqAirTemp.TEqAir, prescribedTemperature.T) annotation (Line(points={{
          -4.2,-9.6},{4,-9.6},{4,0},{6.8,0}}, color={0,0,127}));
  connect(corGDoublePane.solarRadWinTrans, aggWindow.u)
    annotation (Line(points={{25,64},{42.6,64}}, color={0,0,127}));
  connect(aggWindow.y, thermalZoneOneElement.solRad) annotation (Line(points={{
          58.7,64},{62,64},{62,44},{40,44},{40,30.8},{45,30.8}}, color={0,0,127}));
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{-78,62},{-74,62},{-74,18},{-84,18},{-84,12},{-83,12},{-83,6}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(weaBus.TDryBul, eqAirTemp.TDryBul) annotation (Line(
      points={{-83,6},{-83,-2},{-38,-2},{-38,-9.8},{-23,-9.8}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(internalGains.y[1], personsRad.Q_flow) annotation (Line(points={{22.8,
          -52},{28,-52},{28,-32},{48,-32}}, color={0,0,127}));
  connect(internalGains.y[2], personsConv.Q_flow)
    annotation (Line(points={{22.8,-52},{36,-52},{48,-52}}, color={0,0,127}));
  connect(internalGains.y[3], machinesConv.Q_flow) annotation (Line(points={{22.8,
          -52},{28,-52},{28,-74},{48,-74}}, color={0,0,127}));
  connect(const.y, eqAirTemp.sunblind) annotation (Line(points={{-13.7,17},{-12,
          17},{-12,8},{-14,8},{-14,5}}, color={0,0,127}));
  connect(HDifTil.HSkyDifTil, corGDoublePane.HSkyDifTil) annotation (Line(
        points={{-47,36},{-28,36},{-6,36},{-6,65.8},{6,65.8}}, color={0,0,127}));
  connect(HDirTil.H, corGDoublePane.HDirTil) annotation (Line(points={{-47,62},{
          -10,62},{-10,70},{6,70}}, color={0,0,127}));
  connect(HDirTil.H,solRad. u1) annotation (Line(points={{-47,62},{-42,62},{-42,
          14},{-39,14}}, color={0,0,127}));
  connect(HDirTil.inc, corGDoublePane.inc)
    annotation (Line(points={{-47,58},{6,58},{6,57.4}}, color={0,0,127}));
  connect(HDifTil.H,solRad. u2) annotation (Line(points={{-47,30},{-44,30},{-44,
          8},{-39,8}}, color={0,0,127}));
  connect(HDifTil.HGroDifTil, corGDoublePane.HGroDifTil) annotation (Line(
        points={{-47,24},{-4,24},{-4,61.6},{6,61.6}}, color={0,0,127}));
  connect(solRad.y, eqAirTemp.HSol) annotation (Line(points={{-27.5,11},{-26,11},
          {-26,0.4},{-23,0.4}}, color={0,0,127}));
  connect(weaDat.weaBus, HDifTil[1].weaBus) annotation (Line(
      points={{-78,62},{-74,62},{-74,30},{-68,30}},
      color={255,204,51},
      thickness=0.5));
  connect(weaDat.weaBus, HDifTil[2].weaBus) annotation (Line(
      points={{-78,62},{-74,62},{-74,30},{-68,30}},
      color={255,204,51},
      thickness=0.5));
  connect(weaDat.weaBus, HDirTil[1].weaBus) annotation (Line(
      points={{-78,62},{-73,62},{-68,62}},
      color={255,204,51},
      thickness=0.5));
  connect(weaDat.weaBus, HDirTil[2].weaBus) annotation (Line(
      points={{-78,62},{-73,62},{-68,62}},
      color={255,204,51},
      thickness=0.5));
  connect(personsRad.port, thermalZoneOneElement.intGainsRad) annotation (Line(
        points={{68,-32},{84,-32},{100,-32},{100,25},{91,25}}, color={191,0,0}));
  connect(thermalConductorWin.solid, thermalZoneOneElement.window) annotation (
      Line(points={{38,21},{40,21},{40,20},{45,20},{45,19.8}}, color={191,0,0}));
  connect(prescribedTemperature1.port, thermalConductorWin.fluid)
    annotation (Line(points={{20,20},{28,20},{28,21}}, color={191,0,0}));
  connect(thermalZoneOneElement.extWall, thermalConductorWall.solid)
    annotation (Line(points={{45,12.4},{40,12.4},{40,1},{36,1}}, color={191,0,0}));
  connect(thermalConductorWall.fluid, prescribedTemperature.port)
    annotation (Line(points={{26,1},{24,1},{24,0},{20,0}}, color={191,0,0}));
  connect(alphaWall.y, thermalConductorWall.Gc)
    annotation (Line(points={{30,-11.6},{30,-4},{31,-4}}, color={0,0,127}));
  connect(alphaWin.y, thermalConductorWin.Gc)
    annotation (Line(points={{32,33.6},{32,26},{33,26}}, color={0,0,127}));
  connect(weaBus.TBlaSky, eqAirTemp.TBlaSky) annotation (Line(
      points={{-83,6},{-58,6},{-58,2},{-32,2},{-32,-4.6},{-23,-4.6}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(machinesConv.port, thermalZoneOneElement.intGainsConv) annotation (
      Line(points={{68,-74},{82,-74},{96,-74},{96,19.8},{91,19.8}}, color={191,
          0,0}));
  connect(personsConv.port, thermalZoneOneElement.intGainsConv) annotation (
      Line(points={{68,-52},{96,-52},{96,19.8},{91,19.8}}, color={191,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Documentation(info="<html>
<p>This example shows the application of <a href=\"Annex60.Experimental.ThermalZones.ReducedOrder.ROM.ThermalZoneOneElement\">ThermalZoneOneElement</a> in combination with <a href=\"Annex60.Experimental.ThermalZones.ReducedOrder.EqAirTemp.EqAirTemp\">EqAirTemp</a> and <a href=\"Annex60.Experimental.ThermalZones.ReducedOrder.CorrectionSolarGain.CorGDoublePane\">CorGDoublePane</a>. Solar radiation on tilted surface is calculated using models of Annex60. The thermal zone is a simple room defined in Guideline VDI 6007 Part 1 (VDI, 2012). All models, parameters and inputs except sunblinds, seperate handling of heat transfer through windows, no wall element for internal walls and solar radiation are similar to the ones defined for the guideline&apos;s test room. For solar radiation, the example relies on the standard weather file in Annex60.</p>
<p>The idea of the example is to show a typical application of all sub-models and to use the example in unit tests. The results are reasonable, but not related to any real use case or measurement data.</p>
<h4>References</h4>
<p>VDI. German Association of Engineers Guideline VDI 6007-1 March 2012. Calculation of transient thermal response of rooms and buildings - modelling of rooms.</p>
</html>", revisions="<html>
<ul>
<li>February 25, 2016,&nbsp; by Moritz Lauster:<br>Implemented. </li>
</ul>
</html>"),
    experiment(StopTime=3.1536e+007, Interval=3600),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})),
__Dymola_Commands(file=
          "modelica://Annex60/Resources/Scripts/Dymola/Experimental/ThermalZones/ReducedOrder/Examples/SimpleRoomOneElement.mos"
        "Simulate and plot"));
end SimpleRoomOneElement;