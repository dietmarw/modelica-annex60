within Annex60.Experimental.ThermalZones;
model ThermalZoneThreeElements
  "Thermal Zone with three elements for thermal masses (two times external and one internal) with variable order"
    extends ThermalZoneTwoElements(ASum=AExtInd+AWinInd+AInt+AGroundInd,
                             thermSplitterIntGains(splitFactor=if not AExtInd > 0 and AWinInd > 0 and not AInt > 0 and not AGroundInd > 0 then {AWinInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if not AWinInd > 0 and AExtInd > 0 and not AInt > 0 and not AGroundInd > 0 then {AExtInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if not AWinInd > 0 and not AExtInd > 0 and AInt > 0 and not AGroundInd > 0 then {AInt/(AExtInd + AWinInd + AInt + AGroundInd)} else if not AExtInd > 0 and not AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then {AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if not AExtInd > 0 and AWinInd > 0 and AInt > 0 and not AGroundInd > 0 then {
  AWinInd/(AExtInd + AWinInd + AInt + AGroundInd),AInt/(AExtInd + AWinInd + AInt + AGroundInd)} else if AExtInd > 0 and not AWinInd > 0 and AInt > 0 and not AGroundInd > 0 then {
  AExtInd/(AExtInd + AWinInd + AInt + AGroundInd),AInt/(AExtInd + AWinInd + AInt + AGroundInd)} else if AExtInd > 0 and AWinInd > 0 and not AInt > 0 and not AGroundInd > 0 then {
  AExtInd/(AExtInd + AWinInd + AInt + AGroundInd),AWinInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if not AExtInd > 0 and AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then {
  AWinInd/(AExtInd + AWinInd + AInt + AGroundInd),AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if AExtInd > 0 and not AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then {
  AExtInd/(AExtInd + AWinInd + AInt + AGroundInd),AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if not AExtInd > 0 and not AWinInd > 0 and AInt > 0 and AGroundInd > 0 then {
  AInt/(AExtInd + AWinInd + AInt + AGroundInd),AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if not AExtInd > 0 and AWinInd > 0 and AInt > 0 and AGroundInd > 0 then {
  AWinInd/(AExtInd + AWinInd + AInt + AGroundInd),AInt/(AExtInd + AWinInd + AInt + AGroundInd),AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if AExtInd > 0 and not AWinInd > 0 and AInt > 0 and AGroundInd > 0 then {
  AExtInd/(AExtInd + AWinInd + AInt + AGroundInd),AInt/(AExtInd + AWinInd + AInt + AGroundInd),AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if AExtInd > 0 and AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then {
  AExtInd/(AExtInd + AWinInd + AInt + AGroundInd),AWinInd/(AExtInd + AWinInd + AInt + AGroundInd),AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if AExtInd > 0 and AWinInd > 0 and AInt > 0 and not AGroundInd > 0 then {
  AExtInd/(AExtInd + AWinInd + AInt + AGroundInd),AWinInd/(AExtInd + AWinInd + AInt + AGroundInd),AInt/(AExtInd + AWinInd + AInt + AGroundInd)} else {
  AExtInd/(AExtInd + AWinInd + AInt + AGroundInd),AWinInd/(AExtInd + AWinInd + AInt + AGroundInd),AInt/(AExtInd + AWinInd + AInt + AGroundInd),AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)}, dimension=if not AExtInd > 0 and not AWinInd > 0 and not AInt > 0 and not AGroundInd > 0 then 0 else if not AExtInd > 0 and AWinInd > 0 and not AInt > 0 and not AGroundInd > 0 then 1 else if not AWinInd > 0 and AExtInd > 0 and not AInt > 0 and not AGroundInd > 0 then 1 else if not AExtInd > 0 and not AWinInd > 0 and AInt > 0 and not AGroundInd > 0 then 1 else if not AExtInd > 0 and not AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then 1 else if AExtInd > 0 and AWinInd > 0 and not AInt > 0 and not AGroundInd > 0 then 2 else if not AExtInd > 0 and AWinInd > 0 and AInt > 0 and not AGroundInd > 0 then 2 else if AExtInd > 0 and not AWinInd > 0 and AInt > 0 and not AGroundInd > 0 then 2 else if not AExtInd > 0 and not AWinInd > 0 and AInt > 0 and AGroundInd > 0 then 2 else if not AExtInd > 0 and AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then 2 else if AExtInd > 0 and not AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then 2 else if not AExtInd > 0 and AWinInd > 0 and AInt > 0 and AGroundInd > 0 then 3 else if AExtInd > 0 and not AWinInd > 0 and AInt > 0 and AGroundInd > 0 then 3 else if AExtInd > 0 and AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then 3 else if AExtInd > 0 and AWinInd > 0 and AInt > 0 and not AGroundInd > 0 then 3 else 4),
      thermSplitterSolRad(splitFactor=if not AExtInd > 0 and AWinInd > 0 and not AInt > 0 and not AGroundInd > 0 then {AWinInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if not AWinInd > 0 and AExtInd > 0 and not AInt > 0 and not AGroundInd > 0 then {AExtInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if not AWinInd > 0 and not AExtInd > 0 and AInt > 0 and not AGroundInd > 0 then {AInt/(AExtInd + AWinInd + AInt + AGroundInd)} else if not AExtInd > 0 and not AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then {AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if not AExtInd > 0 and AWinInd > 0 and AInt > 0 and not AGroundInd > 0 then {
  AWinInd/(AExtInd + AWinInd + AInt + AGroundInd),AInt/(AExtInd + AWinInd + AInt + AGroundInd)} else if AExtInd > 0 and not AWinInd > 0 and AInt > 0 and not AGroundInd > 0 then {
  AExtInd/(AExtInd + AWinInd + AInt + AGroundInd),AInt/(AExtInd + AWinInd + AInt + AGroundInd)} else if AExtInd > 0 and AWinInd > 0 and not AInt > 0 and not AGroundInd > 0 then {
  AExtInd/(AExtInd + AWinInd + AInt + AGroundInd),AWinInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if not AExtInd > 0 and AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then {
  AWinInd/(AExtInd + AWinInd + AInt + AGroundInd),AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if AExtInd > 0 and not AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then {
  AExtInd/(AExtInd + AWinInd + AInt + AGroundInd),AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if not AExtInd > 0 and not AWinInd > 0 and AInt > 0 and AGroundInd > 0 then {
  AInt/(AExtInd + AWinInd + AInt + AGroundInd),AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if not AExtInd > 0 and AWinInd > 0 and AInt > 0 and AGroundInd > 0 then {
  AWinInd/(AExtInd + AWinInd + AInt + AGroundInd),AInt/(AExtInd + AWinInd + AInt + AGroundInd),AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if AExtInd > 0 and not AWinInd > 0 and AInt > 0 and AGroundInd > 0 then {
  AExtInd/(AExtInd + AWinInd + AInt + AGroundInd),AInt/(AExtInd + AWinInd + AInt + AGroundInd),AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if AExtInd > 0 and AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then {
  AExtInd/(AExtInd + AWinInd + AInt + AGroundInd),AWinInd/(AExtInd + AWinInd + AInt + AGroundInd),AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)} else if AExtInd > 0 and AWinInd > 0 and AInt > 0 and not AGroundInd > 0 then {
  AExtInd/(AExtInd + AWinInd + AInt + AGroundInd),AWinInd/(AExtInd + AWinInd + AInt + AGroundInd),AInt/(AExtInd + AWinInd + AInt + AGroundInd)} else {
  AExtInd/(AExtInd + AWinInd + AInt + AGroundInd),AWinInd/(AExtInd + AWinInd + AInt + AGroundInd),AInt/(AExtInd + AWinInd + AInt + AGroundInd),AGroundInd/(AExtInd + AWinInd + AInt + AGroundInd)}, dimension=if not AExtInd > 0 and not AWinInd > 0 and not AInt > 0 and not AGroundInd > 0 then 0 else if not AExtInd > 0 and AWinInd > 0 and not AInt > 0 and not AGroundInd > 0 then 1 else if not AWinInd > 0 and AExtInd > 0 and not AInt > 0 and not AGroundInd > 0 then 1 else if not AExtInd > 0 and not AWinInd > 0 and AInt > 0 and not AGroundInd > 0 then 1 else if not AExtInd > 0 and not AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then 1 else if AExtInd > 0 and AWinInd > 0 and not AInt > 0 and not AGroundInd > 0 then 2 else if not AExtInd > 0 and AWinInd > 0 and AInt > 0 and not AGroundInd > 0 then 2 else if AExtInd > 0 and not AWinInd > 0 and AInt > 0 and not AGroundInd > 0 then 2 else if not AExtInd > 0 and not AWinInd > 0 and AInt > 0 and AGroundInd > 0 then 2 else if not AExtInd > 0 and AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then 2 else if AExtInd > 0 and not AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then 2 else if not AExtInd > 0 and AWinInd > 0 and AInt > 0 and AGroundInd > 0 then 3 else if AExtInd > 0 and not AWinInd > 0 and AInt > 0 and AGroundInd > 0 then 3 else if AExtInd > 0 and AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then 3 else if AExtInd > 0 and AWinInd > 0 and AInt > 0 and not AGroundInd > 0 then 3 else 4));
  parameter Modelica.SIunits.Area AGroundInd = 0.1
    "Indoor surface area of ground thermal mass" annotation(Dialog(group="Thermal mass"));
  parameter Modelica.SIunits.CoefficientOfHeatTransfer alphaGroundInd
    "Coefficient of heat transfer for surface of ground thermal mass" annotation(Dialog(group="Thermal mass"));
  parameter Integer nGround(min = 1) "Number of RC-elements for thermal mass" annotation(Dialog(group="Thermal mass"));
  parameter Modelica.SIunits.ThermalResistance RGround[nExt]
    "Vector of resistances for each RC-element fpr ground, from inside to outside"
                                                                                   annotation(Dialog(group="Thermal mass"));
  parameter Modelica.SIunits.ThermalResistance RGroundRem
    "Resistance of remaining resistor RGroundRem between capacitance n and outside"
                                                                                    annotation(Dialog(group="Thermal mass"));
  parameter Modelica.SIunits.HeatCapacity CGround[nExt]
    "Vector of heat capacity of ground thermal masses for each RC-element, from inside to outside"
                                                                                                   annotation(Dialog(group="Thermal mass"));
  BaseClasses.ExtMassVarRC groundMassVarRC(
    n=nGround,
    RExt=RGround,
    RExtRem=RGroundRem,
    CExt=CGround) if AGroundInd > 0   annotation (Placement(transformation(
        extent={{10,-11},{-10,11}},
        rotation=90,
        origin={46,-91})));
  Modelica.Thermal.HeatTransfer.Components.ConvectiveResistor heatConGround if AGroundInd > 0
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={46,-64})));
  Modelica.Blocks.Sources.Constant alphaGround(k=1/(AGroundInd*alphaGroundInd)) if AGroundInd > 0
    annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={80,-68})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResRadExtGround(R=1/(min(
        AExtInd, AGroundInd)*alphaRad)) if AExtInd > 0 and AGroundInd > 0
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-80,-49})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResRadIntGround(R=1/(min(
        AGroundInd, AInt)*alphaRad)) if AInt > 0 and AGroundInd > 0
                           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={102,-62})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a portGroundAmb if AGroundInd > 0 annotation (
     Placement(transformation(extent={{36,-122},{56,-102}}), iconTransformation(
          extent={{36,-122},{56,-102}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalResistor thermalResRadWinGround(R=1/(min(
        AWinInd, AGroundInd)*alphaRad)) if AWinInd > 0 and AGroundInd > 0 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-44,-50})));
equation
  connect(groundMassVarRC.port_a, heatConGround.solid) annotation (Line(
      points={{46,-82.6},{46,-74}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heatConGround.fluid, volAir.heatPort) annotation (Line(
      points={{46,-54},{46,-48},{22,-48},{22,-18},{18,-18},{18,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(alphaGround.y, heatConGround.Rc) annotation (Line(
      points={{74.5,-68},{66,-68},{66,-64},{56,-64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(groundMassVarRC.port_a, thermalResRadExtGround.port_b) annotation (
      Line(
      points={{46,-82.6},{46,-78},{-80,-78},{-80,-59}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(groundMassVarRC.port_a, thermalResRadIntGround.port_b) annotation (
      Line(
      points={{46,-82.6},{46,-78},{102,-78},{102,-72}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalResRadIntGround.port_a, intMassVarRC.port_a) annotation (Line(
      points={{102,-52},{102,-24},{90,-24},{90,0},{96.8,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(groundMassVarRC.port_b, portGroundAmb) annotation (Line(
      points={{46,-101.2},{46,-112}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalResRadExtGround.port_a, extMassVarRC.port_a) annotation (Line(
      points={{-80,-39},{-80,-30},{-54.6,-30},{-54.6,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalResRadWinGround.port_a, heatConWin.solid) annotation (Line(
      points={{-44,-40},{-44,36},{-10,36}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalResRadWinGround.port_b, thermalResRadExtGround.port_b)
    annotation (Line(
      points={{-44,-60},{-44,-78},{-80,-78},{-80,-59}},
      color={191,0,0},
      smooth=Smooth.None));
  if not AExtInd > 0 and not AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then
    connect(thermSplitterIntGains.signalOutput[1], groundMassVarRC.port_a)
      annotation (Line(
        points={{72,-36},{72,-82.6},{46,-82.6}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(groundMassVarRC.port_a, thermSplitterSolRad.signalOutput[1])
      annotation (Line(
        points={{46,-82.6},{46,-82},{-28,-82},{-28,4},{-28,4},{-28,46},{-28,46},{
            -28,68},{-28,68},{-28,78},{-28,78},{-28,86},{-28,86},{-28,88},{-30,88},
            {-30,88}},
        color={191,0,0},
        smooth=Smooth.None));
  elseif AExtInd > 0 and not AWinInd > 0 and not AInt > 0 and AGroundInd > 0 or not AExtInd > 0 and AWinInd > 0 and not AInt > 0 and AGroundInd > 0 or not AExtInd > 0 and not AWinInd > 0 and AInt > 0 and AGroundInd > 0 then
    connect(thermSplitterIntGains.signalOutput[2], groundMassVarRC.port_a)
      annotation (Line(
        points={{72,-36},{72,-82.6},{46,-82.6}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(groundMassVarRC.port_a, thermSplitterSolRad.signalOutput[2])
      annotation (Line(
        points={{46,-82.6},{46,-82},{-28,-82},{-28,4},{-28,4},{-28,46},{-28,46},{
            -28,68},{-28,68},{-28,78},{-28,78},{-28,86},{-28,86},{-28,88},{-30,88},
            {-30,88}},
        color={191,0,0},
        smooth=Smooth.None));
  elseif not AExtInd > 0 and AWinInd > 0 and AInt > 0 and AGroundInd > 0 or AExtInd > 0 and not AWinInd > 0 and AInt > 0 and AGroundInd > 0 or AExtInd > 0 and AWinInd > 0 and not AInt > 0 and AGroundInd > 0 then
    connect(thermSplitterIntGains.signalOutput[3], groundMassVarRC.port_a)
      annotation (Line(
        points={{72,-36},{72,-82.6},{46,-82.6}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(groundMassVarRC.port_a, thermSplitterSolRad.signalOutput[3])
      annotation (Line(
        points={{46,-82.6},{46,-82},{-28,-82},{-28,4},{-28,4},{-28,46},{-28,46},{
            -28,68},{-28,68},{-28,78},{-28,78},{-28,86},{-28,86},{-28,88},{-30,88},
            {-30,88}},
        color={191,0,0},
        smooth=Smooth.None));
  elseif AExtInd > 0 and AWinInd > 0 and AInt > 0 and AGroundInd > 0 then
    connect(thermSplitterIntGains.signalOutput[4], groundMassVarRC.port_a)
      annotation (Line(
        points={{72,-36},{72,-82.6},{46,-82.6}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(groundMassVarRC.port_a, thermSplitterSolRad.signalOutput[4])
      annotation (Line(
        points={{46,-82.6},{46,-82},{-28,-82},{-28,4},{-28,4},{-28,46},{-28,46},{
            -28,68},{-28,68},{-28,78},{-28,78},{-28,86},{-28,86},{-28,88},{-30,88},
            {-30,88}},
        color={191,0,0},
        smooth=Smooth.None));
  end if;
  annotation (Diagram(coordinateSystem(extent={{-120,-120},{120,100}},
          preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-58,-32},{-29,-72}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-21,14},{21,-14}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          origin={104,-65},
          rotation=90),
        Rectangle(
          extent={{-100,-32},{-60,-72}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{30,-52},{88,-106}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{61,-94},{86,-110}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="Ground Plate"),
        Text(
          extent={{-98,-55},{-60,-81}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="Radiation Exchange"),
        Text(
          extent={{96,-78},{114,-87}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="Rad Exch"),
        Text(
          extent={{-52,-65},{-34,-74}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="Rad Exch")}),              Icon(coordinateSystem(extent={{-120,
            -120},{120,100}}, preserveAspectRatio=false), graphics),
    Documentation(revisions="<html>
<ul>
<li>
July 15, 2015 by Moritz Lauster:<br/>
First Implementation.
</li>
</ul>
</html>"));
end ThermalZoneThreeElements;