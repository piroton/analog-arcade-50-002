<?xml version="1.0" encoding="UTF-8"?>
<project name="nim" board="Mojo V3" language="Lucid">
  <files>
    <src>lfsr_rand.luc</src>
    <src>bool.luc</src>
    <src>alu.luc</src>
    <src>bitshift.luc</src>
    <src>storevalues.luc</src>
    <src>addsub.luc</src>
    <src>seven_seg.luc</src>
    <src>multi_seven_seg.luc</src>
    <src top="true">mojo_top.luc</src>
    <src>comparator.luc</src>
    <ucf lib="true">io_shield.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <ucf>custom.ucf</ucf>
    <component>decoder.luc</component>
    <component>reset_conditioner.luc</component>
    <component>pipeline.luc</component>
    <component>button_conditioner.luc</component>
    <component>counter.luc</component>
    <component>edge_detector.luc</component>
  </files>
</project>
