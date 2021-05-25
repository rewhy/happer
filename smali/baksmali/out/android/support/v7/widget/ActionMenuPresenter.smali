.class Landroid/support/v7/widget/ActionMenuPresenter;
.super Landroid/support/v7/view/menu/BaseMenuPresenter;
.source "ActionMenuPresenter.java"

# interfaces
.implements Landroid/support/v4/view/ActionProvider$SubUiVisibilityListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/ActionMenuPresenter$ActionMenuPopupCallback;,
        Landroid/support/v7/widget/ActionMenuPresenter$OpenOverflowRunnable;,
        Landroid/support/v7/widget/ActionMenuPresenter$PopupPresenterCallback;,
        Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;,
        Landroid/support/v7/widget/ActionMenuPresenter$OverflowPopup;,
        Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;,
        Landroid/support/v7/widget/ActionMenuPresenter$SavedState;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ActionMenuPresenter"


# instance fields
.field private final mActionButtonGroups:Landroid/util/SparseBooleanArray;

.field mActionButtonPopup:Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;

.field private mActionItemWidthLimit:I

.field private mExpandedActionViewsExclusive:Z

.field private mMaxItems:I

.field private mMaxItemsSet:Z

.field private mMinCellSize:I

.field mOpenSubMenuId:I

.field mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

.field mOverflowPopup:Landroid/support/v7/widget/ActionMenuPresenter$OverflowPopup;

.field private mPendingOverflowIcon:Landroid/graphics/drawable/Drawable;

.field private mPendingOverflowIconSet:Z

.field private mPopupCallback:Landroid/support/v7/widget/ActionMenuPresenter$ActionMenuPopupCallback;

.field final mPopupPresenterCallback:Landroid/support/v7/widget/ActionMenuPresenter$PopupPresenterCallback;

.field mPostedOpenRunnable:Landroid/support/v7/widget/ActionMenuPresenter$OpenOverflowRunnable;

.field private mReserveOverflow:Z

.field private mReserveOverflowSet:Z

.field private mScrapActionButtonView:Landroid/view/View;

.field private mStrictWidthLimit:Z

.field private mWidthLimit:I

.field private mWidthLimitSet:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    sget v0, Landroid/support/v7/appcompat/R$layout;->abc_action_menu_layout:I

    sget v1, Landroid/support/v7/appcompat/R$layout;->abc_action_menu_item_layout:I

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/view/menu/BaseMenuPresenter;-><init>(Landroid/content/Context;II)V

    new-instance p1, Landroid/util/SparseBooleanArray;

    invoke-direct {p1}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mActionButtonGroups:Landroid/util/SparseBooleanArray;

    new-instance p1, Landroid/support/v7/widget/ActionMenuPresenter$PopupPresenterCallback;

    invoke-direct {p1, p0}, Landroid/support/v7/widget/ActionMenuPresenter$PopupPresenterCallback;-><init>(Landroid/support/v7/widget/ActionMenuPresenter;)V

    iput-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPopupPresenterCallback:Landroid/support/v7/widget/ActionMenuPresenter$PopupPresenterCallback;

    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/widget/ActionMenuPresenter;)Landroid/support/v7/view/menu/MenuBuilder;
    .registers 1

    iget-object p0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    return-object p0
.end method

.method static synthetic access$100(Landroid/support/v7/widget/ActionMenuPresenter;)Landroid/support/v7/view/menu/MenuBuilder;
    .registers 1

    iget-object p0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    return-object p0
.end method

.method static synthetic access$200(Landroid/support/v7/widget/ActionMenuPresenter;)Landroid/support/v7/view/menu/MenuView;
    .registers 1

    iget-object p0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    return-object p0
.end method

.method static synthetic access$300(Landroid/support/v7/widget/ActionMenuPresenter;)Landroid/support/v7/view/menu/MenuBuilder;
    .registers 1

    iget-object p0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    return-object p0
.end method

.method static synthetic access$400(Landroid/support/v7/widget/ActionMenuPresenter;)Landroid/support/v7/view/menu/MenuBuilder;
    .registers 1

    iget-object p0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    return-object p0
.end method

.method static synthetic access$500(Landroid/support/v7/widget/ActionMenuPresenter;)Landroid/support/v7/view/menu/MenuView;
    .registers 1

    iget-object p0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    return-object p0
.end method

.method private findViewForItem(Landroid/view/MenuItem;)Landroid/view/View;
    .registers 8

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return-object v1

    :cond_8
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    :goto_d
    if-ge v3, v2, :cond_24

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    instance-of v5, v4, Landroid/support/v7/view/menu/MenuView$ItemView;

    if-eqz v5, :cond_21

    move-object v5, v4

    check-cast v5, Landroid/support/v7/view/menu/MenuView$ItemView;

    invoke-interface {v5}, Landroid/support/v7/view/menu/MenuView$ItemView;->getItemData()Landroid/support/v7/view/menu/MenuItemImpl;

    move-result-object v5

    if-ne v5, p1, :cond_21

    return-object v4

    :cond_21
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    :cond_24
    return-object v1
.end method


# virtual methods
.method public bindItemView(Landroid/support/v7/view/menu/MenuItemImpl;Landroid/support/v7/view/menu/MenuView$ItemView;)V
    .registers 4

    const/4 v0, 0x0

    invoke-interface {p2, p1, v0}, Landroid/support/v7/view/menu/MenuView$ItemView;->initialize(Landroid/support/v7/view/menu/MenuItemImpl;I)V

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    check-cast p1, Landroid/support/v7/widget/ActionMenuView;

    check-cast p2, Landroid/support/v7/view/menu/ActionMenuItemView;

    invoke-virtual {p2, p1}, Landroid/support/v7/view/menu/ActionMenuItemView;->setItemInvoker(Landroid/support/v7/view/menu/MenuBuilder$ItemInvoker;)V

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPopupCallback:Landroid/support/v7/widget/ActionMenuPresenter$ActionMenuPopupCallback;

    if-nez p1, :cond_18

    new-instance p1, Landroid/support/v7/widget/ActionMenuPresenter$ActionMenuPopupCallback;

    invoke-direct {p1, p0}, Landroid/support/v7/widget/ActionMenuPresenter$ActionMenuPopupCallback;-><init>(Landroid/support/v7/widget/ActionMenuPresenter;)V

    iput-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPopupCallback:Landroid/support/v7/widget/ActionMenuPresenter$ActionMenuPopupCallback;

    :cond_18
    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPopupCallback:Landroid/support/v7/widget/ActionMenuPresenter$ActionMenuPopupCallback;

    invoke-virtual {p2, p1}, Landroid/support/v7/view/menu/ActionMenuItemView;->setPopupCallback(Landroid/support/v7/view/menu/ActionMenuItemView$PopupCallback;)V

    return-void
.end method

.method public dismissPopupMenus()Z
    .registers 3

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuPresenter;->hideOverflowMenu()Z

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuPresenter;->hideSubMenus()Z

    move-result v1

    or-int/2addr v0, v1

    return v0
.end method

.method public filterLeftoverView(Landroid/view/ViewGroup;I)Z
    .registers 5

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    if-ne v0, v1, :cond_a

    const/4 p1, 0x0

    return p1

    :cond_a
    invoke-super {p0, p1, p2}, Landroid/support/v7/view/menu/BaseMenuPresenter;->filterLeftoverView(Landroid/view/ViewGroup;I)Z

    move-result p1

    return p1
.end method

.method public flagActionItems()Z
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    const/4 v2, 0x0

    if-eqz v1, :cond_12

    iget-object v1, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v1}, Landroid/support/v7/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    goto :goto_14

    :cond_12
    const/4 v1, 0x0

    const/4 v3, 0x0

    :goto_14
    iget v4, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mMaxItems:I

    iget v5, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mActionItemWidthLimit:I

    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    iget-object v7, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    check-cast v7, Landroid/view/ViewGroup;

    move v11, v4

    const/4 v4, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    :goto_25
    if-ge v4, v3, :cond_4e

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {v13}, Landroid/support/v7/view/menu/MenuItemImpl;->requiresActionButton()Z

    move-result v14

    if-eqz v14, :cond_36

    add-int/lit8 v8, v8, 0x1

    goto :goto_40

    :cond_36
    invoke-virtual {v13}, Landroid/support/v7/view/menu/MenuItemImpl;->requestsActionButton()Z

    move-result v14

    if-eqz v14, :cond_3f

    add-int/lit8 v10, v10, 0x1

    goto :goto_40

    :cond_3f
    const/4 v9, 0x1

    :goto_40
    iget-boolean v12, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mExpandedActionViewsExclusive:Z

    if-eqz v12, :cond_4b

    invoke-virtual {v13}, Landroid/support/v7/view/menu/MenuItemImpl;->isActionViewExpanded()Z

    move-result v12

    if-eqz v12, :cond_4b

    const/4 v11, 0x0

    :cond_4b
    add-int/lit8 v4, v4, 0x1

    goto :goto_25

    :cond_4e
    iget-boolean v4, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mReserveOverflow:Z

    if-eqz v4, :cond_59

    if-nez v9, :cond_57

    add-int/2addr v10, v8

    if-le v10, v11, :cond_59

    :cond_57
    add-int/lit8 v11, v11, -0x1

    :cond_59
    sub-int/2addr v11, v8

    iget-object v4, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mActionButtonGroups:Landroid/util/SparseBooleanArray;

    invoke-virtual {v4}, Landroid/util/SparseBooleanArray;->clear()V

    iget-boolean v8, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mStrictWidthLimit:Z

    if-eqz v8, :cond_70

    iget v8, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mMinCellSize:I

    div-int v8, v5, v8

    iget v9, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mMinCellSize:I

    rem-int v9, v5, v9

    iget v10, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mMinCellSize:I

    div-int/2addr v9, v8

    add-int/2addr v9, v10

    goto :goto_72

    :cond_70
    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_72
    move v10, v5

    const/4 v5, 0x0

    const/4 v13, 0x0

    :goto_75
    if-ge v5, v3, :cond_165

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {v14}, Landroid/support/v7/view/menu/MenuItemImpl;->requiresActionButton()Z

    move-result v15

    if-eqz v15, :cond_ba

    iget-object v15, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mScrapActionButtonView:Landroid/view/View;

    invoke-virtual {v0, v14, v15, v7}, Landroid/support/v7/widget/ActionMenuPresenter;->getItemView(Landroid/support/v7/view/menu/MenuItemImpl;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v15

    iget-object v12, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mScrapActionButtonView:Landroid/view/View;

    if-nez v12, :cond_8f

    iput-object v15, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mScrapActionButtonView:Landroid/view/View;

    :cond_8f
    iget-boolean v12, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mStrictWidthLimit:Z

    if-eqz v12, :cond_99

    invoke-static {v15, v9, v8, v6, v2}, Landroid/support/v7/widget/ActionMenuView;->measureChildForCells(Landroid/view/View;IIII)I

    move-result v12

    sub-int/2addr v8, v12

    goto :goto_9c

    :cond_99
    invoke-virtual {v15, v6, v6}, Landroid/view/View;->measure(II)V

    :goto_9c
    invoke-virtual {v15}, Landroid/view/View;->getMeasuredWidth()I

    move-result v12

    sub-int/2addr v10, v12

    if-nez v13, :cond_a4

    goto :goto_a5

    :cond_a4
    move v12, v13

    :goto_a5
    invoke-virtual {v14}, Landroid/support/v7/view/menu/MenuItemImpl;->getGroupId()I

    move-result v13

    if-eqz v13, :cond_b0

    const/4 v15, 0x1

    invoke-virtual {v4, v13, v15}, Landroid/util/SparseBooleanArray;->put(IZ)V

    goto :goto_b1

    :cond_b0
    const/4 v15, 0x1

    :goto_b1
    invoke-virtual {v14, v15}, Landroid/support/v7/view/menu/MenuItemImpl;->setIsActionButton(Z)V

    move/from16 v17, v3

    move v13, v12

    :goto_b7
    const/4 v0, 0x0

    goto/16 :goto_15c

    :cond_ba
    invoke-virtual {v14}, Landroid/support/v7/view/menu/MenuItemImpl;->requestsActionButton()Z

    move-result v12

    if-eqz v12, :cond_156

    invoke-virtual {v14}, Landroid/support/v7/view/menu/MenuItemImpl;->getGroupId()I

    move-result v12

    invoke-virtual {v4, v12}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v15

    if-gtz v11, :cond_cc

    if-eqz v15, :cond_d6

    :cond_cc
    if-lez v10, :cond_d6

    iget-boolean v2, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mStrictWidthLimit:Z

    if-eqz v2, :cond_d4

    if-lez v8, :cond_d6

    :cond_d4
    const/4 v2, 0x1

    goto :goto_d7

    :cond_d6
    const/4 v2, 0x0

    :goto_d7
    if-eqz v2, :cond_11a

    move/from16 v16, v2

    iget-object v2, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mScrapActionButtonView:Landroid/view/View;

    invoke-virtual {v0, v14, v2, v7}, Landroid/support/v7/widget/ActionMenuPresenter;->getItemView(Landroid/support/v7/view/menu/MenuItemImpl;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    move/from16 v17, v3

    iget-object v3, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mScrapActionButtonView:Landroid/view/View;

    if-nez v3, :cond_e9

    iput-object v2, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mScrapActionButtonView:Landroid/view/View;

    :cond_e9
    iget-boolean v3, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mStrictWidthLimit:Z

    if-eqz v3, :cond_f9

    const/4 v3, 0x0

    invoke-static {v2, v9, v8, v6, v3}, Landroid/support/v7/widget/ActionMenuView;->measureChildForCells(Landroid/view/View;IIII)I

    move-result v18

    sub-int v8, v8, v18

    if-nez v18, :cond_fc

    const/16 v16, 0x0

    goto :goto_fc

    :cond_f9
    invoke-virtual {v2, v6, v6}, Landroid/view/View;->measure(II)V

    :cond_fc
    :goto_fc
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    sub-int/2addr v10, v2

    if-nez v13, :cond_104

    move v13, v2

    :cond_104
    iget-boolean v2, v0, Landroid/support/v7/widget/ActionMenuPresenter;->mStrictWidthLimit:Z

    if-eqz v2, :cond_110

    if-ltz v10, :cond_10c

    const/4 v2, 0x1

    goto :goto_10d

    :cond_10c
    const/4 v2, 0x0

    :goto_10d
    and-int v2, v16, v2

    goto :goto_11e

    :cond_110
    add-int v2, v10, v13

    if-lez v2, :cond_116

    const/4 v2, 0x1

    goto :goto_117

    :cond_116
    const/4 v2, 0x0

    :goto_117
    and-int v2, v16, v2

    goto :goto_11e

    :cond_11a
    move/from16 v16, v2

    move/from16 v17, v3

    :goto_11e
    if-eqz v2, :cond_127

    if-eqz v12, :cond_127

    const/4 v3, 0x1

    invoke-virtual {v4, v12, v3}, Landroid/util/SparseBooleanArray;->put(IZ)V

    goto :goto_14d

    :cond_127
    if-eqz v15, :cond_14d

    const/4 v3, 0x0

    invoke-virtual {v4, v12, v3}, Landroid/util/SparseBooleanArray;->put(IZ)V

    const/4 v3, 0x0

    :goto_12e
    if-ge v3, v5, :cond_14d

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {v15}, Landroid/support/v7/view/menu/MenuItemImpl;->getGroupId()I

    move-result v0

    if-ne v0, v12, :cond_148

    invoke-virtual {v15}, Landroid/support/v7/view/menu/MenuItemImpl;->isActionButton()Z

    move-result v0

    if-eqz v0, :cond_144

    add-int/lit8 v11, v11, 0x1

    :cond_144
    const/4 v0, 0x0

    invoke-virtual {v15, v0}, Landroid/support/v7/view/menu/MenuItemImpl;->setIsActionButton(Z)V

    :cond_148
    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    goto :goto_12e

    :cond_14d
    :goto_14d
    if-eqz v2, :cond_151

    add-int/lit8 v11, v11, -0x1

    :cond_151
    invoke-virtual {v14, v2}, Landroid/support/v7/view/menu/MenuItemImpl;->setIsActionButton(Z)V

    goto/16 :goto_b7

    :cond_156
    move/from16 v17, v3

    const/4 v0, 0x0

    invoke-virtual {v14, v0}, Landroid/support/v7/view/menu/MenuItemImpl;->setIsActionButton(Z)V

    :goto_15c
    add-int/lit8 v5, v5, 0x1

    move/from16 v3, v17

    move-object/from16 v0, p0

    const/4 v2, 0x0

    goto/16 :goto_75

    :cond_165
    const/4 v2, 0x1

    return v2
.end method

.method public getItemView(Landroid/support/v7/view/menu/MenuItemImpl;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 6

    invoke-virtual {p1}, Landroid/support/v7/view/menu/MenuItemImpl;->getActionView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_c

    invoke-virtual {p1}, Landroid/support/v7/view/menu/MenuItemImpl;->hasCollapsibleActionView()Z

    move-result v1

    if-eqz v1, :cond_10

    :cond_c
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/view/menu/BaseMenuPresenter;->getItemView(Landroid/support/v7/view/menu/MenuItemImpl;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    :cond_10
    invoke-virtual {p1}, Landroid/support/v7/view/menu/MenuItemImpl;->isActionViewExpanded()Z

    move-result p1

    if-eqz p1, :cond_19

    const/16 p1, 0x8

    goto :goto_1a

    :cond_19
    const/4 p1, 0x0

    :goto_1a
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    check-cast p3, Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/support/v7/widget/ActionMenuView;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result p2

    if-nez p2, :cond_30

    invoke-virtual {p3, p1}, Landroid/support/v7/widget/ActionMenuView;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_30
    return-object v0
.end method

.method public getMenuView(Landroid/view/ViewGroup;)Landroid/support/v7/view/menu/MenuView;
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    invoke-super {p0, p1}, Landroid/support/v7/view/menu/BaseMenuPresenter;->getMenuView(Landroid/view/ViewGroup;)Landroid/support/v7/view/menu/MenuView;

    move-result-object p1

    if-eq v0, p1, :cond_e

    move-object v0, p1

    check-cast v0, Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/ActionMenuView;->setPresenter(Landroid/support/v7/widget/ActionMenuPresenter;)V

    :cond_e
    return-object p1
.end method

.method public getOverflowIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0

    :cond_b
    iget-boolean v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPendingOverflowIconSet:Z

    if-eqz v0, :cond_12

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPendingOverflowIcon:Landroid/graphics/drawable/Drawable;

    return-object v0

    :cond_12
    const/4 v0, 0x0

    return-object v0
.end method

.method public hideOverflowMenu()Z
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPostedOpenRunnable:Landroid/support/v7/widget/ActionMenuPresenter$OpenOverflowRunnable;

    const/4 v1, 0x1

    if-eqz v0, :cond_16

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    if-eqz v0, :cond_16

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    check-cast v0, Landroid/view/View;

    iget-object v2, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPostedOpenRunnable:Landroid/support/v7/widget/ActionMenuPresenter$OpenOverflowRunnable;

    invoke-virtual {v0, v2}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPostedOpenRunnable:Landroid/support/v7/widget/ActionMenuPresenter$OpenOverflowRunnable;

    return v1

    :cond_16
    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowPopup:Landroid/support/v7/widget/ActionMenuPresenter$OverflowPopup;

    if-eqz v0, :cond_1e

    invoke-virtual {v0}, Landroid/support/v7/view/menu/MenuPopupHelper;->dismiss()V

    return v1

    :cond_1e
    const/4 v0, 0x0

    return v0
.end method

.method public hideSubMenus()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mActionButtonPopup:Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mActionButtonPopup:Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;->dismiss()V

    const/4 v0, 0x1

    return v0

    :cond_b
    const/4 v0, 0x0

    return v0
.end method

.method public initForMenu(Landroid/content/Context;Landroid/support/v7/view/menu/MenuBuilder;)V
    .registers 7
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v7/view/menu/MenuBuilder;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1, p2}, Landroid/support/v7/view/menu/BaseMenuPresenter;->initForMenu(Landroid/content/Context;Landroid/support/v7/view/menu/MenuBuilder;)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {p1}, Landroid/support/v7/view/ActionBarPolicy;->get(Landroid/content/Context;)Landroid/support/v7/view/ActionBarPolicy;

    move-result-object p1

    iget-boolean v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mReserveOverflowSet:Z

    if-nez v0, :cond_15

    invoke-virtual {p1}, Landroid/support/v7/view/ActionBarPolicy;->showsOverflowMenuButton()Z

    move-result v0

    iput-boolean v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mReserveOverflow:Z

    :cond_15
    iget-boolean v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mWidthLimitSet:Z

    if-nez v0, :cond_1f

    invoke-virtual {p1}, Landroid/support/v7/view/ActionBarPolicy;->getEmbeddedMenuWidthLimit()I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mWidthLimit:I

    :cond_1f
    iget-boolean v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMaxItemsSet:Z

    if-nez v0, :cond_29

    invoke-virtual {p1}, Landroid/support/v7/view/ActionBarPolicy;->getMaxActionButtons()I

    move-result p1

    iput p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMaxItems:I

    :cond_29
    iget p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mWidthLimit:I

    iget-boolean v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mReserveOverflow:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_5e

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    if-nez v0, :cond_56

    new-instance v0, Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    iget-object v2, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mSystemContext:Landroid/content/Context;

    invoke-direct {v0, p0, v2}, Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;-><init>(Landroid/support/v7/widget/ActionMenuPresenter;Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    iget-boolean v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPendingOverflowIconSet:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_4d

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    iget-object v3, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPendingOverflowIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iput-object v1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPendingOverflowIcon:Landroid/graphics/drawable/Drawable;

    iput-boolean v2, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPendingOverflowIconSet:Z

    :cond_4d
    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iget-object v2, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    invoke-virtual {v2, v0, v0}, Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;->measure(II)V

    :cond_56
    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;->getMeasuredWidth()I

    move-result v0

    sub-int/2addr p1, v0

    goto :goto_60

    :cond_5e
    iput-object v1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    :goto_60
    iput p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mActionItemWidthLimit:I

    const/high16 p1, 0x42600000    # 56.0f

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    mul-float p2, p2, p1

    float-to-int p1, p2

    iput p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMinCellSize:I

    iput-object v1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mScrapActionButtonView:Landroid/view/View;

    return-void
.end method

.method public isOverflowMenuShowPending()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPostedOpenRunnable:Landroid/support/v7/widget/ActionMenuPresenter$OpenOverflowRunnable;

    if-nez v0, :cond_d

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuPresenter;->isOverflowMenuShowing()Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_d

    :cond_b
    const/4 v0, 0x0

    goto :goto_e

    :cond_d
    :goto_d
    const/4 v0, 0x1

    :goto_e
    return v0
.end method

.method public isOverflowMenuShowing()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowPopup:Landroid/support/v7/widget/ActionMenuPresenter$OverflowPopup;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowPopup:Landroid/support/v7/widget/ActionMenuPresenter$OverflowPopup;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter$OverflowPopup;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method public isOverflowReserved()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mReserveOverflow:Z

    return v0
.end method

.method public onCloseMenu(Landroid/support/v7/view/menu/MenuBuilder;Z)V
    .registers 3

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuPresenter;->dismissPopupMenus()Z

    invoke-super {p0, p1, p2}, Landroid/support/v7/view/menu/BaseMenuPresenter;->onCloseMenu(Landroid/support/v7/view/menu/MenuBuilder;Z)V

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    iget-boolean p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMaxItemsSet:Z

    if-nez p1, :cond_10

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/support/v7/view/ActionBarPolicy;->get(Landroid/content/Context;)Landroid/support/v7/view/ActionBarPolicy;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v7/view/ActionBarPolicy;->getMaxActionButtons()I

    move-result p1

    iput p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMaxItems:I

    :cond_10
    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    if-eqz p1, :cond_1a

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/support/v7/view/menu/MenuBuilder;->onItemsChanged(Z)V

    :cond_1a
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 3

    instance-of v0, p1, Landroid/support/v7/widget/ActionMenuPresenter$SavedState;

    if-nez v0, :cond_5

    return-void

    :cond_5
    check-cast p1, Landroid/support/v7/widget/ActionMenuPresenter$SavedState;

    iget v0, p1, Landroid/support/v7/widget/ActionMenuPresenter$SavedState;->openSubMenuId:I

    if-lez v0, :cond_1e

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    iget p1, p1, Landroid/support/v7/widget/ActionMenuPresenter$SavedState;->openSubMenuId:I

    invoke-virtual {v0, p1}, Landroid/support/v7/view/menu/MenuBuilder;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-eqz p1, :cond_1e

    invoke-interface {p1}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object p1

    check-cast p1, Landroid/support/v7/view/menu/SubMenuBuilder;

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ActionMenuPresenter;->onSubMenuSelected(Landroid/support/v7/view/menu/SubMenuBuilder;)Z

    :cond_1e
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 3

    new-instance v0, Landroid/support/v7/widget/ActionMenuPresenter$SavedState;

    invoke-direct {v0}, Landroid/support/v7/widget/ActionMenuPresenter$SavedState;-><init>()V

    iget v1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOpenSubMenuId:I

    iput v1, v0, Landroid/support/v7/widget/ActionMenuPresenter$SavedState;->openSubMenuId:I

    return-object v0
.end method

.method public onSubMenuSelected(Landroid/support/v7/view/menu/SubMenuBuilder;)Z
    .registers 9

    invoke-virtual {p1}, Landroid/support/v7/view/menu/SubMenuBuilder;->hasVisibleItems()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    move-object v0, p1

    :goto_9
    invoke-virtual {v0}, Landroid/support/v7/view/menu/SubMenuBuilder;->getParentMenu()Landroid/view/Menu;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    if-eq v2, v3, :cond_18

    invoke-virtual {v0}, Landroid/support/v7/view/menu/SubMenuBuilder;->getParentMenu()Landroid/view/Menu;

    move-result-object v0

    check-cast v0, Landroid/support/v7/view/menu/SubMenuBuilder;

    goto :goto_9

    :cond_18
    invoke-virtual {v0}, Landroid/support/v7/view/menu/SubMenuBuilder;->getItem()Landroid/view/MenuItem;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/ActionMenuPresenter;->findViewForItem(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_23

    return v1

    :cond_23
    invoke-virtual {p1}, Landroid/support/v7/view/menu/SubMenuBuilder;->getItem()Landroid/view/MenuItem;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    iput v2, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOpenSubMenuId:I

    invoke-virtual {p1}, Landroid/support/v7/view/menu/SubMenuBuilder;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_32
    const/4 v4, 0x1

    if-ge v3, v2, :cond_4a

    invoke-virtual {p1, v3}, Landroid/support/v7/view/menu/SubMenuBuilder;->getItem(I)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/MenuItem;->isVisible()Z

    move-result v6

    if-eqz v6, :cond_47

    invoke-interface {v5}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    if-eqz v5, :cond_47

    const/4 v1, 0x1

    goto :goto_4a

    :cond_47
    add-int/lit8 v3, v3, 0x1

    goto :goto_32

    :cond_4a
    :goto_4a
    new-instance v2, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;

    iget-object v3, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mContext:Landroid/content/Context;

    invoke-direct {v2, p0, v3, p1, v0}, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;-><init>(Landroid/support/v7/widget/ActionMenuPresenter;Landroid/content/Context;Landroid/support/v7/view/menu/SubMenuBuilder;Landroid/view/View;)V

    iput-object v2, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mActionButtonPopup:Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mActionButtonPopup:Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;->setForceShowIcon(Z)V

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mActionButtonPopup:Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter$ActionButtonSubmenu;->show()V

    invoke-super {p0, p1}, Landroid/support/v7/view/menu/BaseMenuPresenter;->onSubMenuSelected(Landroid/support/v7/view/menu/SubMenuBuilder;)Z

    return v4
.end method

.method public onSubUiVisibilityChanged(Z)V
    .registers 3

    if-eqz p1, :cond_7

    const/4 p1, 0x0

    invoke-super {p0, p1}, Landroid/support/v7/view/menu/BaseMenuPresenter;->onSubMenuSelected(Landroid/support/v7/view/menu/SubMenuBuilder;)Z

    goto :goto_11

    :cond_7
    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    if-eqz p1, :cond_11

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/view/menu/MenuBuilder;->close(Z)V

    :cond_11
    :goto_11
    return-void
.end method

.method public setExpandedActionViewsExclusive(Z)V
    .registers 2

    iput-boolean p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mExpandedActionViewsExclusive:Z

    return-void
.end method

.method public setItemLimit(I)V
    .registers 2

    iput p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMaxItems:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMaxItemsSet:Z

    return-void
.end method

.method public setMenuView(Landroid/support/v7/widget/ActionMenuView;)V
    .registers 3

    iput-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/ActionMenuView;->initialize(Landroid/support/v7/view/menu/MenuBuilder;)V

    return-void
.end method

.method public setOverflowIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    if-eqz v0, :cond_a

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_f

    :cond_a
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPendingOverflowIconSet:Z

    iput-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPendingOverflowIcon:Landroid/graphics/drawable/Drawable;

    :goto_f
    return-void
.end method

.method public setReserveOverflow(Z)V
    .registers 2

    iput-boolean p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mReserveOverflow:Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mReserveOverflowSet:Z

    return-void
.end method

.method public setWidthLimit(IZ)V
    .registers 3

    iput p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mWidthLimit:I

    iput-boolean p2, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mStrictWidthLimit:Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mWidthLimitSet:Z

    return-void
.end method

.method public shouldIncludeItem(ILandroid/support/v7/view/menu/MenuItemImpl;)Z
    .registers 3

    invoke-virtual {p2}, Landroid/support/v7/view/menu/MenuItemImpl;->isActionButton()Z

    move-result p1

    return p1
.end method

.method public showOverflowMenu()Z
    .registers 8

    iget-boolean v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mReserveOverflow:Z

    if-eqz v0, :cond_46

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuPresenter;->isOverflowMenuShowing()Z

    move-result v0

    if-nez v0, :cond_46

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    if-eqz v0, :cond_46

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    if-eqz v0, :cond_46

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPostedOpenRunnable:Landroid/support/v7/widget/ActionMenuPresenter$OpenOverflowRunnable;

    if-nez v0, :cond_46

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/MenuBuilder;->getNonActionItems()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_46

    new-instance v0, Landroid/support/v7/widget/ActionMenuPresenter$OverflowPopup;

    iget-object v3, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mContext:Landroid/content/Context;

    iget-object v4, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    iget-object v5, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    const/4 v6, 0x1

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Landroid/support/v7/widget/ActionMenuPresenter$OverflowPopup;-><init>(Landroid/support/v7/widget/ActionMenuPresenter;Landroid/content/Context;Landroid/support/v7/view/menu/MenuBuilder;Landroid/view/View;Z)V

    new-instance v1, Landroid/support/v7/widget/ActionMenuPresenter$OpenOverflowRunnable;

    invoke-direct {v1, p0, v0}, Landroid/support/v7/widget/ActionMenuPresenter$OpenOverflowRunnable;-><init>(Landroid/support/v7/widget/ActionMenuPresenter;Landroid/support/v7/widget/ActionMenuPresenter$OverflowPopup;)V

    iput-object v1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPostedOpenRunnable:Landroid/support/v7/widget/ActionMenuPresenter$OpenOverflowRunnable;

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    check-cast v0, Landroid/view/View;

    iget-object v1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mPostedOpenRunnable:Landroid/support/v7/widget/ActionMenuPresenter$OpenOverflowRunnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    invoke-super {p0, v0}, Landroid/support/v7/view/menu/BaseMenuPresenter;->onSubMenuSelected(Landroid/support/v7/view/menu/SubMenuBuilder;)Z

    const/4 v0, 0x1

    return v0

    :cond_46
    const/4 v0, 0x0

    return v0
.end method

.method public updateMenuView(Z)V
    .registers 6

    invoke-super {p0, p1}, Landroid/support/v7/view/menu/BaseMenuPresenter;->updateMenuView(Z)V

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    const/4 v0, 0x0

    if-eqz p1, :cond_2e

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {p1}, Landroid/support/v7/view/menu/MenuBuilder;->getActionItems()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_1a
    if-ge v2, v1, :cond_2e

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {v3}, Landroid/support/v7/view/menu/MenuItemImpl;->getSupportActionProvider()Landroid/support/v4/view/ActionProvider;

    move-result-object v3

    if-eqz v3, :cond_2b

    invoke-virtual {v3, p0}, Landroid/support/v4/view/ActionProvider;->setSubUiVisibilityListener(Landroid/support/v4/view/ActionProvider$SubUiVisibilityListener;)V

    :cond_2b
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    :cond_2e
    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    if-eqz p1, :cond_39

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {p1}, Landroid/support/v7/view/menu/MenuBuilder;->getNonActionItems()Ljava/util/ArrayList;

    move-result-object p1

    goto :goto_3a

    :cond_39
    const/4 p1, 0x0

    :goto_3a
    iget-boolean v1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mReserveOverflow:Z

    if-eqz v1, :cond_57

    if-eqz p1, :cond_57

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_54

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {p1}, Landroid/support/v7/view/menu/MenuItemImpl;->isActionViewExpanded()Z

    move-result p1

    xor-int/lit8 v0, p1, 0x1

    goto :goto_57

    :cond_54
    if-lez v1, :cond_57

    const/4 v0, 0x1

    :cond_57
    :goto_57
    if-eqz v0, :cond_87

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    if-nez p1, :cond_66

    new-instance p1, Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mSystemContext:Landroid/content/Context;

    invoke-direct {p1, p0, v0}, Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;-><init>(Landroid/support/v7/widget/ActionMenuPresenter;Landroid/content/Context;)V

    iput-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    :cond_66
    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    invoke-virtual {p1}, Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    if-eq p1, v0, :cond_9e

    if-eqz p1, :cond_79

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_79
    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    check-cast p1, Landroid/support/v7/widget/ActionMenuView;

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    invoke-virtual {p1}, Landroid/support/v7/widget/ActionMenuView;->generateOverflowButtonLayoutParams()Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/support/v7/widget/ActionMenuView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_9e

    :cond_87
    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    if-eqz p1, :cond_9e

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    invoke-virtual {p1}, Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    if-ne p1, v0, :cond_9e

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    check-cast p1, Landroid/view/ViewGroup;

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mOverflowButton:Landroid/support/v7/widget/ActionMenuPresenter$OverflowMenuButton;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_9e
    :goto_9e
    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mMenuView:Landroid/support/v7/view/menu/MenuView;

    check-cast p1, Landroid/support/v7/widget/ActionMenuView;

    iget-boolean v0, p0, Landroid/support/v7/widget/ActionMenuPresenter;->mReserveOverflow:Z

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/ActionMenuView;->setOverflowReserved(Z)V

    return-void
.end method
