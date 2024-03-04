import 'package:flutter/material.dart';

import '../../../generic/exports/models_exports.dart' show ItemDetails;

class HomeItems {
  HomeItems._();

  static List<ItemDetails> _menuCategoriesInRow = [];

  static List<ItemDetails> getCategoriesInRow(
    BuildContext context, {
    String? searchString,
  }) {
    _menuCategoriesInRow = [];
    _menuCategoriesInRow.addAll(
      [
        ItemDetails(
          itemId: 'menu_item_01',
          itemName: 'Food & Beverages',
          itemImage: 'IconAssets.PICKING_ICON',
          onTap: () {},
        ),
        ItemDetails(
          itemId: 'menu_item_02',
          itemName: 'Apparel & Footwear',
          itemImage: 'IconAssets.PICKING_ICON',
          onTap: () {},
        ),
        ItemDetails(
          itemId: 'menu_item_03',
          itemName: 'Accessories',
          itemImage: 'IconAssets.PICKING_ICON',
          onTap: () {},
        ),
        ItemDetails(
          itemId: 'menu_item_01',
          itemName: 'Health & Beauty',
          itemImage: 'IconAssets.PICKING_ICON',
          onTap: () {},
        ),
        ItemDetails(
          itemId: 'menu_item_01',
          itemName: 'Salons & Spas',
          itemImage: 'IconAssets.PICKING_ICON',
          onTap: () {},
        ),
        ItemDetails(
          itemId: 'menu_item_01',
          itemName: 'Leisure & Entertainment',
          itemImage: 'IconAssets.PICKING_ICON',
          onTap: () {},
        ),
        ItemDetails(
          itemId: 'menu_item_01',
          itemName: 'Home & Living',
          itemImage: 'IconAssets.PICKING_ICON',
          onTap: () {},
        ),
        ItemDetails(
          itemId: 'menu_item_01',
          itemName: 'Education',
          itemImage: 'IconAssets.PICKING_ICON',
          onTap: () {},
        ),
        ItemDetails(
          itemId: 'menu_item_01',
          itemName: 'Electronics',
          itemImage: 'IconAssets.PICKING_ICON',
          onTap: () {},
        ),
        ItemDetails(
          itemId: 'menu_item_01',
          itemName: 'Toys & Gifts',
          itemImage: 'IconAssets.PICKING_ICON',
          onTap: () {},
        ),
        ItemDetails(
          itemId: 'menu_item_01',
          itemName: 'Travel & Tours',
          itemImage: 'IconAssets.PICKING_ICON',
          onTap: () {},
        ),
        ItemDetails(
          itemId: 'menu_item_01',
          itemName: 'Other Services',
          itemImage: 'IconAssets.PICKING_ICON',
          onTap: () {},
        ),
      ],
    );
    if (searchString != null) {
      final filteredList = _menuCategoriesInRow
          .where((menuItem) => menuItem.itemName
              .toLowerCase()
              .contains(searchString.toLowerCase()))
          .toList();
      return filteredList;
    }
    return _menuCategoriesInRow;
  }
}
