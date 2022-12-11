# TopNotchBottomBar

A beautiful and animated bottom navigation bar. also you are free to customize it way you want.

## Preview

|![](https://github.com/sonal-sithara/top_notch_bottom_bar/blob/master/images/gif_1.gif)|![](https://github.com/sonal-sithara/top_notch_bottom_bar/blob/master/images/gif_2.gif )|

## Customization

### TopNotchBottomBar

##### Required

- `items` - navigation items, required more than one item and less than six
- `onTap` - listen when a item is tapped it provide the selected item's index

##### Optional

- `backgroundColor` - the navigation bar's background color
- `height` - changes the bottom bar height
- `iconSize` - the item icon's size
- `showLabel` - the item's text
- `activeColor` - the item selected color
- `inActiveColor` - the item unselected color
- `showElevation` - if false the bottom bar elevation will be removed
- `animationDuration` - time duration for the notch and text animation
- `initialIndex` - set initial selected item

### TopNotchItem

##### Required

- `icon` - the icon of this item
- `name` - the text under the icon

##### Optional

- `color` - item color

## Getting Started

Add the dependency in `pubspec.yaml`:

```yaml
dependencies:
  top_notch_bottom_bar: ^0.0.1
```

## Basic Usage

Adding the widget

```dart
class _HomePageState extends State<HomePage> {
  static const TextStyle txtstyle = TextStyle(fontSize: 30);

  List<Widget> screens = [
    const Center(child: Text('Home', style: txtstyle)),
    const Center(child: Text('Favourite', style: txtstyle)),
    const Center(child: Text('Messages', style: txtstyle)),
    const Center(child: Text('Settings', style: txtstyle)),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top Notch Bottom Bar')),
      body: screens[index],
      bottomNavigationBar: TopNotchBottomBar(
          height: 56, // changes the bottom bar height -> default = 50
          onTap: ((value) => setState(() {
                index = value;
              })),
          items: [
            TopNotchItem(icon: const Icon(Icons.home), name: 'Home'),
            TopNotchItem(icon: const Icon(Icons.favorite), name: 'Favourite'),
            TopNotchItem(icon: const Icon(Icons.message), name: 'Messages'),
            TopNotchItem(icon: const Icon(Icons.settings), name: 'Settings'),
          ]),
    );
  }
}
```
