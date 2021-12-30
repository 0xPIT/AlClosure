## AlClosure
*A Beautiful Professional Aluminum Enclosure*

- **Simple** to make, no bending necessary (machinery is required, though)
- **No visible screws** on front or back panels
- **Parametric**, can be easily customized for almost any size 
- **Sturdy, durable** construction
- **RF shielded**, great for measurement devices
- Removable flat panels **very easy to customize**

![Open View](/images/AlClosure.redered.open.600.png?raw=true)

[Click here for 3D View](/stl/AlClosure.open.stl)

Neccesary parameters in [OpenSCAD](http://openscad.org) file:
```js
// outer dimensions of final enclosure
outerW = 300;
outerH = 60;
outerD = 150;

// sheet metal thickness of top, bottom, front & back panel
panelThickness = 2;

// thickness of sheet metal for sides
sideThickness = 6; 

// plus: uncomment the screw/threads you want to use
```

### Required Materials
- Front- and backpanel: *anodized* sheet aluminum, 1.5mm – 2.5mm
- Top and bottom panel: *regular* sheet aluminum, 1.5 – 2.5mm
- Sides: *thick* sheet aluminum, 5 – 8mm
- 4 countersunk screws, usually M2 – M3, 12mm long

#### Required Capabilites
- for Top, Bottom, Front and Back panels:
  - Precise (+/- 0.1mm) sheet metal cutting
  - Drill press 
  - Countersink tool
- for Sides
  - Precise cutting / milling for **thick** (5 – 8mm) sheet aluminum
  - Drill press, drills and taps for chosen screw size (M2 – M3 usually)
  - Milling machine with side & face milling cutter [like this](https://eshop.wuerth-industrie.com/Side-and-face-milling-cutter-HSCo-cross-toothed-Type-H-METCRCLMILMA-WN-HSCO-D50X20MM/5443601232.sku/en/US/EUR/) with the same with as the sheet metal you choose for front and back panels
    - A regular milling cutter could be used, but it's slow and breaks easily

#### Closed View
![Closed View](/images/AlClosure.redered.closed.600.png?raw=true)

#### Detail View
![Detail View](/images/AlClosure.detail.600.png?raw=true)
