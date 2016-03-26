within Annex60.Experimental.ThermalZones.ReducedOrder.Validation.VDI6007;
model TestCase2 "VDI 6007 Test Case 2 model"
  extends Modelica.Icons.Example;

  ROM.ThermalZoneTwoElements thermalZoneTwoElements(
    VAir=52.5,
    alphaExt=2.7,
    alphaWin=2.7,
    gWin=1,
    nExt=1,
    nInt=1,
    AWin=0,
    AExt=10.5,
    ATransparent=0,
    ratioWinConRad=0,
    AInt=75.5,
    alphaInt=2.24,
    RWin=0.00000001,
    volAir(X_start={0,0}),
    alphaRad=5,
    RExt={0.00436791293674},
    RExtRem=0.03895919557,
    CExt={1600848.94},
    RInt={0.000595693407511},
    CInt={14836354.6282},
    T_start=295.15)
    annotation (Placement(transformation(extent={{44,-2},{92,34}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature
    prescribedTemperature(T=295.15)
    annotation (Placement(transformation(extent={{8,-6},{20,6}})));
  Modelica.Thermal.HeatTransfer.Components.Convection       thermalConductorWall
    annotation (Placement(transformation(extent={{36,6},{26,-4}})));
  Modelica.Blocks.Sources.CombiTimeTable internalGains(
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    table=[0,0; 3600,0; 7200,0; 10800,0; 14400,0; 18000,0; 21600,0; 21600,1000;
        25200,1000; 28800,1000; 32400,1000; 36000,1000; 39600,1000; 43200,1000;
        46800,1000; 50400,1000; 54000,1000; 57600,1000; 61200,1000; 64800,1000;
        64800,0; 68400,0; 72000,0; 75600,0; 79200,0; 82800,0; 86400,0],
    columns={2})
    annotation (Placement(transformation(extent={{6,-60},{22,-44}})));
  Modelica.Blocks.Sources.CombiTimeTable reference(
    tableOnFile=false,
    columns={2},
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint,
    table=[3600,22; 7200,22; 10800,22; 14400,22; 18000,22; 21600,22; 25200,22.6;
        28800,22.9; 32400,23.1; 36000,23.3; 39600,23.5; 43200,23.7; 46800,23.9;
        50400,24.1; 54000,24.3; 57600,24.6; 61200,24.8; 64800,25; 68400,24.5;
        72000,24.5; 75600,24.5; 79200,24.5; 82800,24.5; 86400,24.5; 781200,37.7;
        784800,37.7; 788400,37.6; 792000,37.5; 795600,37.5; 799200,37.4; 802800,
        38; 806400,38.2; 810000,38.3; 813600,38.5; 817200,38.6; 820800,38.8;
        824400,38.9; 828000,39.1; 831600,39.2; 835200,39.4; 838800,39.5; 842400,
        39.7; 846000,39.2; 849600,39.1; 853200,39.1; 856800,39; 860400,38.9;
        864000,38.9; 5101200,50; 5104800,49.9; 5108400,49.8; 5112000,49.7;
        5115600,49.6; 5119200,49.5; 5122800,50; 5126400,50.1; 5130000,50.2;
        5133600,50.3; 5137200,50.5; 5140800,50.6; 5144400,50.7; 5148000,50.8;
        5151600,50.9; 5155200,51; 5158800,51.1; 5162400,51.2; 5166000,50.7;
        5169600,50.6; 5173200,50.4; 5176800,50.3; 5180400,50.2; 5184000,50.1])
    annotation (Placement(transformation(extent={{76,72},{96,92}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow machinesRad
    annotation (Placement(transformation(extent={{48,-84},{68,-64}})));

  Modelica.Blocks.Sources.Constant alphaWall(k=25*10.5)
    "Outdoor coefficient of heat transfer for walls" annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={30,-18})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{20,26},{30,36}})));
equation
  connect(thermalConductorWall.fluid, prescribedTemperature.port)
    annotation (Line(points={{26,1},{24,1},{24,0},{20,0}}, color={191,0,0}));
  connect(thermalZoneTwoElements.extWall, thermalConductorWall.solid)
    annotation (Line(points={{45,12.4},{40,12.4},{40,1},{36,1}}, color={191,0,0}));
  connect(alphaWall.y, thermalConductorWall.Gc)
    annotation (Line(points={{30,-13.6},{31,-13.6},{31,-4}}, color={0,0,127}));
  connect(const.y, thermalZoneTwoElements.solRad) annotation (Line(points={{
          30.5,31},{37.25,31},{37.25,30.8},{45,30.8}}, color={0,0,127}));
  connect(internalGains.y[1], machinesRad.Q_flow) annotation (Line(points={{
          22.8,-52},{36,-52},{36,-74},{48,-74}}, color={0,0,127}));
  connect(machinesRad.port, thermalZoneTwoElements.intGainsRad) annotation (
      Line(points={{68,-74},{84,-74},{98,-74},{98,25},{91,25}}, color={191,0,0}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), Documentation(info="<html>
<p>Test Case 2 of the VDI 6007 Part 1: Calculation of indoor air temperature excited by a radiative heat source for room version S.</p>
<p>Boundary Condtions:</p>
<ul>
<li>constant outdoor air temperature 22 degC</li>
<li>no solar or short-wave radiation on the exterior wall</li>
<li>no solar or short-wave radiation through the windows</li>
<li>no long-wave radiation exchange between exterior wall, windows and ambient environment</li>
</ul>
<p>This test case is thought to test basic functionalities.</p>
</html>", revisions="<html>
<ul>
<li>January 11, 2016,&nbsp; by Moritz Lauster:<br>Implemented. </li>
</ul>
</html>"),
__Dymola_Commands(file=
          "modelica://Annex60/Resources/Scripts/Dymola/Experimental/ThermalZones/ReducedOrder/Validation/VDI6007/TestCase2.mos"
        "Simulate and plot"));
end TestCase2;
