/// The Syncfusion Flutter DataGrid is used to display and manipulate data in a
/// tabular view. Its rich feature set includes different types of columns,
/// selections, column sizing, etc.
///
/// To use, import `package:syncfusion_flutter_datagrid/custom_sf_grid_view.dart`.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=-ULsEfjxFuY}
///
/// See also:
///
/// * [Syncfusion Flutter DataGrid product page](https://www.syncfusion.com/flutter-widgets/flutter-datagrid)
/// * [User guide documentation](https://help.syncfusion.com/flutter/datagrid/overview)
/// * [Knowledge base](https://www.syncfusion.com/kb/flutter/sfdatagrid)
library custom_sf_grid_view;

import 'package:custom_sf_grid_view/src/datagrid_widget/helper/datagrid_configuration.dart';
import 'package:custom_sf_grid_view/src/datagrid_widget/helper/enums.dart';
import 'package:custom_sf_grid_view/src/datagrid_widget/runtime/column.dart';
export 'package:custom_sf_grid_view/src/datagrid_widget/runtime/column.dart';
import 'package:custom_sf_grid_view/src/datagrid_widget/sfdatagrid.dart';
import 'package:flutter/material.dart';
export '../src/datagrid_widget/sfdatagrid.dart'
    hide
        updateSelectedIndex,
        updateSelectedRow,
        updateVerticalOffset,
        updateHorizontalOffset,
        notifyDataGridPropertyChangeListeners,
        handleLoadMoreRows,
        handleRefresh,
        updateDataSource,
        effectiveRows,
        setPageCount,
        setChildColumnIndexes,
        getChildColumnIndexes,
        addFilterConditions,
        removeFilterConditions,
        refreshEffectiveRows,
        performSorting,
        updateDataPager,
        getRowsPerPage,
        DataGridThemeHelper;
export '../src/localizations/global_localizations.dart';
export '../src/datapager/sfdatapager.dart'
    hide SfDataPagerState, DataPagerThemeHelper;
export '../src/grid_common/row_column_index.dart';
export '../src/datagrid_widget/helper/callbackargs.dart'
    hide setColumnSizerInRowHeightDetailsArgs;
export '../src/datagrid_widget/helper/enums.dart'
    hide FilteredFrom, AdvancedFilterType;
export '../src/datagrid_widget/runtime/column.dart'
    hide
        ColumnResizeController,
        refreshColumnSizer,
        initialRefresh,
        resetAutoCalculation,
        updateColumnSizerLoadedInitiallyFlag,
        getSortIconWidth,
        getFilterIconWidth,
        getAutoFitRowHeight,
        setStateDetailsInColumnSizer,
        isColumnSizerLoadedInitially,
        FilterElement,
        GridCheckboxColumn,
        DataGridFilterHelper,
        DataGridCheckboxFilterHelper,
        DataGridAdvancedFilterHelper,
        ColumnDragAndDropController;
export '../src/datagrid_widget/selection/selection_manager.dart'
    show RowSelectionManager, SelectionManagerBase;
export '../src/datagrid_widget/widgets/cell_widget.dart'
    show GridHeaderCellElement;

class CustomizedGridView extends SfDataGrid {
  final Future Function(GridColumn gridColumn,DataGridFilterHelper filterHelper)? onClickFilter;

  CustomizedGridView({
    required super.source,
    required super.columns,
    super.key,
    this.onClickFilter,
    required super.shrinkWrapRows,
    required super.allowFiltering,
    super.rowHeight = double.nan,
    super.headerRowHeight = double.nan,
    super.defaultColumnWidth = double.nan,
    super.gridLinesVisibility = GridLinesVisibility.horizontal,
    super.headerGridLinesVisibility = GridLinesVisibility.horizontal,
    super.columnWidthMode = ColumnWidthMode.none,
    super.columnSizer,
    super.columnWidthCalculationRange = ColumnWidthCalculationRange.visibleRows,
    super.selectionMode = SelectionMode.none,
    super.navigationMode = GridNavigationMode.row,
    super.frozenColumnsCount = 0,
    super.footerFrozenColumnsCount = 0,
    super.frozenRowsCount = 0,
    super.footerFrozenRowsCount = 0,
    super.allowSorting = false,
    super.allowMultiColumnSorting = false,
    super.allowTriStateSorting = false,
    super.showSortNumbers = false,
    super.sortingGestureType = SortingGestureType.tap,
    super.stackedHeaderRows = const <StackedHeaderRow>[],
    super.selectionManager,
    super.controller,
    super.onQueryRowHeight,
    super.onSelectionChanged,
    super.onSelectionChanging,
    super.onCurrentCellActivating,
    super.onCurrentCellActivated,
    super.onCellTap,
    super.onCellDoubleTap,
    super.onCellSecondaryTap,
    super.onCellLongPress,
    super.isScrollbarAlwaysShown = false,
    super.horizontalScrollPhysics = const AlwaysScrollableScrollPhysics(),
    super.verticalScrollPhysics = const AlwaysScrollableScrollPhysics(),
    super.loadMoreViewBuilder,
    super.allowPullToRefresh = false,
    super.refreshIndicatorDisplacement = 40.0,
    super.refreshIndicatorStrokeWidth = 2.0,
    super.allowSwiping = false,
    super.swipeMaxOffset = 200.0,
    super.horizontalScrollController,
    super.verticalScrollController,
    super.onSwipeStart,
    super.onSwipeUpdate,
    super.onSwipeEnd,
    super.startSwipeActionsBuilder,
    super.endSwipeActionsBuilder,
    super.highlightRowOnHover = true,
    super.allowColumnsResizing = false,
    super.columnResizeMode = ColumnResizeMode.onResize,
    super.onColumnResizeStart,
    super.onColumnResizeUpdate,
    super.onColumnResizeEnd,
    super.allowEditing = false,
    super.editingGestureType = EditingGestureType.doubleTap,
    super.footer,
    super.footerHeight = 49.0,
    super.showCheckboxColumn = false,
    super.checkboxColumnSettings = const DataGridCheckboxColumnSettings(),
    super.tableSummaryRows = const <GridTableSummaryRow>[],
    super.rowsPerPage,
    super.shrinkWrapColumns = false,
    super.rowsCacheExtent,
    super.onFilterChanging,
    super.onFilterChanged,
    super.checkboxShape,
    super.showHorizontalScrollbar = true,
    super.showVerticalScrollbar = true,
    super.showFilterIconOnHover = false,
    super.allowColumnsDragging = false,
    super.onColumnDragging,
    super.columnDragFeedbackBuilder,
  })  : assert(frozenColumnsCount >= 0),
        assert(footerFrozenColumnsCount >= 0),
        assert(frozenRowsCount >= 0),
        assert(footerFrozenRowsCount >= 0),
        super(dataGridConfiguration: DataGridConfiguration()) {
    super.dataGridConfiguration.okFilterActionButton = onClickFilter;
  }
}
