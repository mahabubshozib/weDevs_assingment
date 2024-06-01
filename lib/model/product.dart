import 'attribute.dart';
import 'category.dart';
import 'dimensions.dart';
import 'download.dart';
import 'image.dart';
import 'meta_data.dart';
import 'store.dart';

class Product {
  final int id;
  final String name;
  final String slug;
  final String postAuthor;
  final String permalink;
  final String dateCreated;
  final String dateCreatedGmt;
  final String dateModified;
  final String dateModifiedGmt;
  final String type;
  final String status;
  final bool featured;
  final String catalogVisibility;
  final String description;
  final String shortDescription;
  final String sku;
  final String price;
  final String regularPrice;
  final String salePrice;
  final DateTime? dateOnSaleFrom;
  final DateTime? dateOnSaleFromGmt;
  final DateTime? dateOnSaleTo;
  final DateTime? dateOnSaleToGmt;
  final String priceHtml;
  final bool onSale;
  final bool purchasable;
  final int totalSales;
  final bool virtual;
  final bool downloadable;
  final List<Download> downloads;
  final int downloadLimit;
  final int downloadExpiry;
  final String externalUrl;
  final String buttonText;
  final String taxStatus;
  final String taxClass;
  final bool manageStock;
  final int? stockQuantity;
  // final int lowStockAmount;
  final bool inStock;
  final String backorders;
  final bool backordersAllowed;
  final bool backordered;
  final bool soldIndividually;
  final String weight;
  final Dimensions dimensions;
  final bool shippingRequired;
  final bool shippingTaxable;
  final String shippingClass;
  final int shippingClassId;
  final bool reviewsAllowed;
  final String averageRating;
  final int ratingCount;
  final List<int> relatedIds;
  final List<int> upsellIds;
  final List<int> crossSellIds;
  final int parentId;
  final String purchaseNote;
  final List<Category> categories;
  final List<dynamic> tags;
  final List<Image> images;
  final List<Attribute> attributes;
  final List<dynamic> defaultAttributes;
  final List<dynamic> variations;
  final List<dynamic> groupedProducts;
  final int menuOrder;
  final List<MetaData> metaData;
  final Store store;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.postAuthor,
    required this.permalink,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.type,
    required this.status,
    required this.featured,
    required this.catalogVisibility,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    required this.priceHtml,
    required this.onSale,
    required this.purchasable,
    required this.totalSales,
    required this.virtual,
    required this.downloadable,
    required this.downloads,
    required this.downloadLimit,
    required this.downloadExpiry,
    required this.externalUrl,
    required this.buttonText,
    required this.taxStatus,
    required this.taxClass,
    required this.manageStock,
    this.stockQuantity,
    // required this.lowStockAmount,
    required this.inStock,
    required this.backorders,
    required this.backordersAllowed,
    required this.backordered,
    required this.soldIndividually,
    required this.weight,
    required this.dimensions,
    required this.shippingRequired,
    required this.shippingTaxable,
    required this.shippingClass,
    required this.shippingClassId,
    required this.reviewsAllowed,
    required this.averageRating,
    required this.ratingCount,
    required this.relatedIds,
    required this.upsellIds,
    required this.crossSellIds,
    required this.parentId,
    required this.purchaseNote,
    required this.categories,
    required this.tags,
    required this.images,
    required this.attributes,
    required this.defaultAttributes,
    required this.variations,
    required this.groupedProducts,
    required this.menuOrder,
    required this.metaData,
    required this.store,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      postAuthor: json['post_author'],
      permalink: json['permalink'],
      dateCreated: json['date_created'],
      dateCreatedGmt: json['date_created_gmt'],
      dateModified: json['date_modified'],
      dateModifiedGmt: json['date_modified_gmt'],
      type: json['type'],
      status: json['status'],
      featured: json['featured'],
      catalogVisibility: json['catalog_visibility'],
      description: json['description'],
      shortDescription: json['short_description'],
      sku: json['sku'],
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      dateOnSaleFrom: json['date_on_sale_from'] != null
          ? DateTime.parse(json['date_on_sale_from'])
          : null,
      dateOnSaleFromGmt: json['date_on_sale_from_gmt'] != null
          ? DateTime.parse(json['date_on_sale_from_gmt'])
          : null,
      dateOnSaleTo: json['date_on_sale_to'] != null
          ? DateTime.parse(json['date_on_sale_to'])
          : null,
      dateOnSaleToGmt: json['date_on_sale_to_gmt'] != null
          ? DateTime.parse(json['date_on_sale_to_gmt'])
          : null,
      priceHtml: json['price_html'],
      onSale: json['on_sale'],
      purchasable: json['purchasable'],
      totalSales: json['total_sales'],
      virtual: json['virtual'],
      downloadable: json['downloadable'],
      downloads:
          (json['downloads'] as List).map((e) => Download.fromJson(e)).toList(),
      downloadLimit: json['download_limit'],
      downloadExpiry: json['download_expiry'],
      externalUrl: json['external_url'],
      buttonText: json['button_text'],
      taxStatus: json['tax_status'],
      taxClass: json['tax_class'],
      manageStock: json['manage_stock'],
      stockQuantity: json['stock_quantity'],
      // lowStockAmount: json['low_stock_amount'],
      inStock: json['in_stock'],
      backorders: json['backorders'],
      backordersAllowed: json['backorders_allowed'],
      backordered: json['backordered'],
      soldIndividually: json['sold_individually'],
      weight: json['weight'],
      dimensions: Dimensions.fromJson(json['dimensions']),
      shippingRequired: json['shipping_required'],
      shippingTaxable: json['shipping_taxable'],
      shippingClass: json['shipping_class'],
      shippingClassId: json['shipping_class_id'],
      reviewsAllowed: json['reviews_allowed'],
      averageRating: json['average_rating'],
      ratingCount: json['rating_count'],
      relatedIds: List<int>.from(json['related_ids']),
      upsellIds: List<int>.from(json['upsell_ids']),
      crossSellIds: List<int>.from(json['cross_sell_ids']),
      parentId: json['parent_id'],
      purchaseNote: json['purchase_note'],
      categories: (json['categories'] as List)
          .map((e) => Category.fromJson(e))
          .toList(),
      tags: json['tags'],
      images: (json['images'] as List).map((e) => Image.fromJson(e)).toList(),
      attributes: (json['attributes'] as List)
          .map((e) => Attribute.fromJson(e))
          .toList(),
      defaultAttributes: json['default_attributes'],
      variations: json['variations'],
      groupedProducts: json['grouped_products'],
      menuOrder: json['menu_order'],
      metaData:
          (json['meta_data'] as List).map((e) => MetaData.fromJson(e)).toList(),
      store: Store.fromJson(json['store']),
    );
  }
}
