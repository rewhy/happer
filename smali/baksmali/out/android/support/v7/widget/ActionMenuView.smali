.class public Landroid/support/v7/widget/ActionMenuView;
.super Landroid/support/v7/widget/LinearLayoutCompat;
.source "ActionMenuView.java"

# interfaces
.implements Landroid/support/v7/view/menu/MenuBuilder$ItemInvoker;
.implements Landroid/support/v7/view/menu/MenuView;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/ActionMenuView$LayoutParams;,
        Landroid/support/v7/widget/ActionMenuView$ActionMenuChildView;,
        Landroid/support/v7/widget/ActionMenuView$ActionMenuPresenterCallback;,
        Landroid/support/v7/widget/ActionMenuView$MenuBuilderCallback;,
        Landroid/support/v7/widget/ActionMenuView$OnMenuItemClickListener;
    }
.end annotation


# static fields
.field static final GENERATED_ITEM_PADDING:I = 0x4

.field static final MIN_CELL_SIZE:I = 0x38

.field private static final TAG:Ljava/lang/String; = "ActionMenuView"


# instance fields
.field private mActionMenuPresenterCallback:Landroid/support/v7/view/menu/MenuPresenter$Callback;

.field private mFormatItems:Z

.field private mFormatItemsWidth:I

.field private mGeneratedItemPadding:I

.field private mMenu:Landroid/support/v7/view/menu/MenuBuilder;

.field mMenuBuilderCallback:Landroid/support/v7/view/menu/MenuBuilder$Callback;

.field private mMinCellSize:I

.field mOnMenuItemClickListener:Landroid/support/v7/widget/ActionMenuView$OnMenuItemClickListener;

.field private mPopupContext:Landroid/content/Context;

.field private mPopupTheme:I

.field private mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

.field private mReserveOverflow:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/ActionMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/LinearLayoutCompat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Landroid/support/v7/widget/ActionMenuView;->setBaselineAligned(Z)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x42600000    # 56.0f

    mul-float v1, v1, v0

    float-to-int v1, v1

    iput v1, p0, Landroid/support/v7/widget/ActionMenuView;->mMinCellSize:I

    const/high16 v1, 0x40800000    # 4.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    iput v0, p0, Landroid/support/v7/widget/ActionMenuView;->mGeneratedItemPadding:I

    iput-object p1, p0, Landroid/support/v7/widget/ActionMenuView;->mPopupContext:Landroid/content/Context;

    iput p2, p0, Landroid/support/v7/widget/ActionMenuView;->mPopupTheme:I

    return-void
.end method

.method static measureChildForCells(Landroid/view/View;IIII)I
    .registers 10

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    sub-int/2addr v1, p4

    invoke-static {p3}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p3

    invoke-static {v1, p3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p3

    instance-of p4, p0, Landroid/support/v7/view/menu/ActionMenuItemView;

    if-eqz p4, :cond_1b

    move-object p4, p0

    check-cast p4, Landroid/support/v7/view/menu/ActionMenuItemView;

    goto :goto_1c

    :cond_1b
    const/4 p4, 0x0

    :goto_1c
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p4, :cond_28

    invoke-virtual {p4}, Landroid/support/v7/view/menu/ActionMenuItemView;->hasText()Z

    move-result p4

    if-eqz p4, :cond_28

    const/4 p4, 0x1

    goto :goto_29

    :cond_28
    const/4 p4, 0x0

    :goto_29
    const/4 v3, 0x2

    if-lez p2, :cond_4d

    if-eqz p4, :cond_30

    if-lt p2, v3, :cond_4d

    :cond_30
    mul-int p2, p2, p1

    const/high16 v4, -0x80000000

    invoke-static {p2, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-virtual {p0, p2, p3}, Landroid/view/View;->measure(II)V

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p2

    div-int v4, p2, p1

    rem-int/2addr p2, p1

    if-eqz p2, :cond_46

    add-int/lit8 v4, v4, 0x1

    :cond_46
    if-eqz p4, :cond_4b

    if-ge v4, v3, :cond_4b

    goto :goto_4e

    :cond_4b
    move v3, v4

    goto :goto_4e

    :cond_4d
    const/4 v3, 0x0

    :goto_4e
    iget-boolean p2, v0, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->isOverflowButton:Z

    if-nez p2, :cond_55

    if-eqz p4, :cond_55

    goto :goto_56

    :cond_55
    const/4 v1, 0x0

    :goto_56
    iput-boolean v1, v0, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->expandable:Z

    iput v3, v0, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->cellsUsed:I

    mul-int p1, p1, v3

    const/high16 p2, 0x40000000    # 2.0f

    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-virtual {p0, p1, p3}, Landroid/view/View;->measure(II)V

    return v3
.end method

.method private onMeasureExactFormat(II)V
    .registers 37

    move-object/from16 v0, p0

    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ActionMenuView;->getPaddingLeft()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ActionMenuView;->getPaddingRight()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ActionMenuView;->getPaddingTop()I

    move-result v5

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ActionMenuView;->getPaddingBottom()I

    move-result v6

    add-int/2addr v5, v6

    const/4 v6, -0x2

    move/from16 v7, p2

    invoke-static {v7, v5, v6}, Landroid/support/v7/widget/ActionMenuView;->getChildMeasureSpec(III)I

    move-result v6

    sub-int/2addr v2, v4

    iget v4, v0, Landroid/support/v7/widget/ActionMenuView;->mMinCellSize:I

    div-int v4, v2, v4

    iget v7, v0, Landroid/support/v7/widget/ActionMenuView;->mMinCellSize:I

    rem-int v7, v2, v7

    const/4 v8, 0x0

    if-nez v4, :cond_37

    invoke-virtual {v0, v2, v8}, Landroid/support/v7/widget/ActionMenuView;->setMeasuredDimension(II)V

    return-void

    :cond_37
    iget v9, v0, Landroid/support/v7/widget/ActionMenuView;->mMinCellSize:I

    div-int/2addr v7, v4

    add-int/2addr v9, v7

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ActionMenuView;->getChildCount()I

    move-result v7

    move v14, v4

    const/4 v4, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const-wide/16 v19, 0x0

    :goto_49
    if-ge v4, v7, :cond_d6

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v8

    move/from16 v21, v3

    const/16 v3, 0x8

    if-ne v8, v3, :cond_5d

    move/from16 v23, v2

    goto/16 :goto_cd

    :cond_5d
    instance-of v3, v11, Landroid/support/v7/view/menu/ActionMenuItemView;

    add-int/lit8 v13, v13, 0x1

    if-eqz v3, :cond_70

    iget v8, v0, Landroid/support/v7/widget/ActionMenuView;->mGeneratedItemPadding:I

    move/from16 v22, v13

    iget v13, v0, Landroid/support/v7/widget/ActionMenuView;->mGeneratedItemPadding:I

    move/from16 v23, v2

    const/4 v2, 0x0

    invoke-virtual {v11, v8, v2, v13, v2}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_75

    :cond_70
    move/from16 v23, v2

    move/from16 v22, v13

    const/4 v2, 0x0

    :goto_75
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    iput-boolean v2, v8, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->expanded:Z

    iput v2, v8, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->extraPixels:I

    iput v2, v8, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->cellsUsed:I

    iput-boolean v2, v8, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->expandable:Z

    iput v2, v8, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->leftMargin:I

    iput v2, v8, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->rightMargin:I

    if-eqz v3, :cond_94

    move-object v2, v11

    check-cast v2, Landroid/support/v7/view/menu/ActionMenuItemView;

    invoke-virtual {v2}, Landroid/support/v7/view/menu/ActionMenuItemView;->hasText()Z

    move-result v2

    if-eqz v2, :cond_94

    const/4 v2, 0x1

    goto :goto_95

    :cond_94
    const/4 v2, 0x0

    :goto_95
    iput-boolean v2, v8, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->preventEdgeOffset:Z

    iget-boolean v2, v8, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->isOverflowButton:Z

    if-eqz v2, :cond_9d

    const/4 v2, 0x1

    goto :goto_9e

    :cond_9d
    move v2, v14

    :goto_9e
    invoke-static {v11, v9, v2, v6, v5}, Landroid/support/v7/widget/ActionMenuView;->measureChildForCells(Landroid/view/View;IIII)I

    move-result v2

    invoke-static {v15, v2}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget-boolean v13, v8, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->expandable:Z

    if-eqz v13, :cond_ac

    add-int/lit8 v16, v16, 0x1

    :cond_ac
    iget-boolean v8, v8, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->isOverflowButton:Z

    if-eqz v8, :cond_b1

    const/4 v12, 0x1

    :cond_b1
    sub-int/2addr v14, v2

    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    invoke-static {v10, v8}, Ljava/lang/Math;->max(II)I

    move-result v10

    const/4 v8, 0x1

    if-ne v2, v8, :cond_c7

    shl-int v2, v8, v4

    move/from16 v24, v3

    int-to-long v2, v2

    or-long v2, v19, v2

    move-wide/from16 v19, v2

    goto :goto_c9

    :cond_c7
    move/from16 v24, v3

    :goto_c9
    move/from16 v13, v22

    move/from16 v15, v24

    :goto_cd
    add-int/lit8 v4, v4, 0x1

    move/from16 v3, v21

    move/from16 v2, v23

    const/4 v8, 0x0

    goto/16 :goto_49

    :cond_d6
    move/from16 v23, v2

    move/from16 v21, v3

    const/4 v2, 0x2

    if-eqz v12, :cond_e1

    if-ne v13, v2, :cond_e1

    const/4 v3, 0x1

    goto :goto_e2

    :cond_e1
    const/4 v3, 0x0

    :goto_e2
    const/4 v4, 0x0

    :goto_e3
    const-wide/16 v24, 0x1

    if-lez v16, :cond_182

    if-lez v14, :cond_182

    const v5, 0x7fffffff

    const/4 v5, 0x0

    const/4 v8, 0x0

    const v11, 0x7fffffff

    const-wide/16 v26, 0x0

    :goto_f3
    if-ge v5, v7, :cond_123

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v22

    move-object/from16 v2, v22

    check-cast v2, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    move/from16 v28, v4

    iget-boolean v4, v2, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->expandable:Z

    if-nez v4, :cond_108

    goto :goto_11d

    :cond_108
    iget v4, v2, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->cellsUsed:I

    if-ge v4, v11, :cond_113

    iget v2, v2, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->cellsUsed:I

    shl-long v26, v24, v5

    move v11, v2

    const/4 v8, 0x1

    goto :goto_11d

    :cond_113
    iget v2, v2, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->cellsUsed:I

    if-ne v2, v11, :cond_11d

    shl-long v29, v24, v5

    or-long v26, v26, v29

    add-int/lit8 v8, v8, 0x1

    :cond_11d
    :goto_11d
    add-int/lit8 v5, v5, 0x1

    move/from16 v4, v28

    const/4 v2, 0x2

    goto :goto_f3

    :cond_123
    move/from16 v28, v4

    or-long v19, v19, v26

    if-le v8, v14, :cond_130

    :goto_129
    move/from16 v32, v6

    move/from16 v33, v7

    move/from16 v31, v10

    goto :goto_185

    :cond_130
    add-int/lit8 v11, v11, 0x1

    const/4 v2, 0x0

    :goto_133
    if-ge v2, v7, :cond_17e

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    move/from16 v31, v10

    const/4 v8, 0x1

    shl-int v10, v8, v2

    move/from16 v32, v6

    move/from16 v33, v7

    int-to-long v6, v10

    and-long v24, v26, v6

    const-wide/16 v17, 0x0

    cmp-long v8, v24, v17

    if-nez v8, :cond_158

    iget v4, v5, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->cellsUsed:I

    if-ne v4, v11, :cond_175

    or-long v19, v19, v6

    goto :goto_175

    :cond_158
    if-eqz v3, :cond_16b

    iget-boolean v6, v5, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->preventEdgeOffset:Z

    if-eqz v6, :cond_16b

    const/4 v6, 0x1

    if-ne v14, v6, :cond_16c

    iget v7, v0, Landroid/support/v7/widget/ActionMenuView;->mGeneratedItemPadding:I

    add-int/2addr v7, v9

    iget v8, v0, Landroid/support/v7/widget/ActionMenuView;->mGeneratedItemPadding:I

    const/4 v10, 0x0

    invoke-virtual {v4, v7, v10, v8, v10}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_16c

    :cond_16b
    const/4 v6, 0x1

    :cond_16c
    :goto_16c
    iget v4, v5, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->cellsUsed:I

    add-int/2addr v4, v6

    iput v4, v5, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->cellsUsed:I

    iput-boolean v6, v5, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->expanded:Z

    add-int/lit8 v14, v14, -0x1

    :cond_175
    :goto_175
    add-int/lit8 v2, v2, 0x1

    move/from16 v10, v31

    move/from16 v6, v32

    move/from16 v7, v33

    goto :goto_133

    :cond_17e
    const/4 v2, 0x2

    const/4 v4, 0x1

    goto/16 :goto_e3

    :cond_182
    move/from16 v28, v4

    goto :goto_129

    :goto_185
    if-nez v12, :cond_18c

    const/4 v2, 0x1

    if-ne v13, v2, :cond_18d

    const/4 v3, 0x1

    goto :goto_18e

    :cond_18c
    const/4 v2, 0x1

    :cond_18d
    const/4 v3, 0x0

    :goto_18e
    if-lez v14, :cond_248

    const-wide/16 v4, 0x0

    cmp-long v6, v19, v4

    if-eqz v6, :cond_248

    sub-int/2addr v13, v2

    if-lt v14, v13, :cond_19d

    if-nez v3, :cond_19d

    if-le v15, v2, :cond_248

    :cond_19d
    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->bitCount(J)I

    move-result v2

    int-to-float v2, v2

    if-nez v3, :cond_1de

    and-long v3, v19, v24

    const/high16 v5, 0x3f000000    # 0.5f

    const-wide/16 v6, 0x0

    cmp-long v8, v3, v6

    if-eqz v8, :cond_1bf

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    iget-boolean v4, v4, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->preventEdgeOffset:Z

    if-nez v4, :cond_1c0

    sub-float/2addr v2, v5

    goto :goto_1c0

    :cond_1bf
    const/4 v3, 0x0

    :cond_1c0
    :goto_1c0
    add-int/lit8 v7, v33, -0x1

    const/4 v4, 0x1

    shl-int v6, v4, v7

    int-to-long v10, v6

    and-long v10, v19, v10

    const-wide/16 v12, 0x0

    cmp-long v4, v10, v12

    if-eqz v4, :cond_1df

    invoke-virtual {v0, v7}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    iget-boolean v4, v4, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->preventEdgeOffset:Z

    if-nez v4, :cond_1df

    sub-float/2addr v2, v5

    goto :goto_1df

    :cond_1de
    const/4 v3, 0x0

    :cond_1df
    :goto_1df
    const/4 v4, 0x0

    cmpl-float v4, v2, v4

    if-lez v4, :cond_1ea

    mul-int v14, v14, v9

    int-to-float v4, v14

    div-float/2addr v4, v2

    float-to-int v8, v4

    goto :goto_1eb

    :cond_1ea
    const/4 v8, 0x0

    :goto_1eb
    move/from16 v11, v28

    move/from16 v2, v33

    const/4 v4, 0x0

    :goto_1f0
    if-ge v4, v2, :cond_245

    const/4 v5, 0x1

    shl-int v6, v5, v4

    int-to-long v5, v6

    and-long v5, v19, v5

    const-wide/16 v12, 0x0

    cmp-long v7, v5, v12

    if-nez v7, :cond_201

    const/4 v5, 0x1

    const/4 v7, 0x2

    goto :goto_242

    :cond_201
    invoke-virtual {v0, v4}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    instance-of v5, v5, Landroid/support/v7/view/menu/ActionMenuItemView;

    if-eqz v5, :cond_224

    iput v8, v6, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->extraPixels:I

    const/4 v5, 0x1

    iput-boolean v5, v6, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->expanded:Z

    if-nez v4, :cond_220

    iget-boolean v5, v6, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->preventEdgeOffset:Z

    if-nez v5, :cond_220

    neg-int v5, v8

    const/4 v7, 0x2

    div-int/2addr v5, v7

    iput v5, v6, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->leftMargin:I

    goto :goto_221

    :cond_220
    const/4 v7, 0x2

    :goto_221
    const/4 v5, 0x1

    :goto_222
    const/4 v11, 0x1

    goto :goto_242

    :cond_224
    const/4 v7, 0x2

    iget-boolean v5, v6, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->isOverflowButton:Z

    if-eqz v5, :cond_233

    iput v8, v6, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->extraPixels:I

    const/4 v5, 0x1

    iput-boolean v5, v6, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->expanded:Z

    neg-int v10, v8

    div-int/2addr v10, v7

    iput v10, v6, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->rightMargin:I

    goto :goto_222

    :cond_233
    const/4 v5, 0x1

    if-eqz v4, :cond_23a

    div-int/lit8 v10, v8, 0x2

    iput v10, v6, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->leftMargin:I

    :cond_23a
    add-int/lit8 v10, v2, -0x1

    if-eq v4, v10, :cond_242

    div-int/lit8 v10, v8, 0x2

    iput v10, v6, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->rightMargin:I

    :cond_242
    :goto_242
    add-int/lit8 v4, v4, 0x1

    goto :goto_1f0

    :cond_245
    move/from16 v28, v11

    goto :goto_24b

    :cond_248
    move/from16 v2, v33

    const/4 v3, 0x0

    :goto_24b
    const/high16 v4, 0x40000000    # 2.0f

    if-eqz v28, :cond_277

    :goto_24f
    if-ge v3, v2, :cond_277

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    iget-boolean v7, v6, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->expanded:Z

    if-nez v7, :cond_262

    move/from16 v7, v32

    goto :goto_272

    :cond_262
    iget v7, v6, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->cellsUsed:I

    mul-int v7, v7, v9

    iget v6, v6, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->extraPixels:I

    add-int/2addr v7, v6

    invoke-static {v7, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    move/from16 v7, v32

    invoke-virtual {v5, v6, v7}, Landroid/view/View;->measure(II)V

    :goto_272
    add-int/lit8 v3, v3, 0x1

    move/from16 v32, v7

    goto :goto_24f

    :cond_277
    if-eq v1, v4, :cond_27e

    move/from16 v2, v23

    move/from16 v1, v31

    goto :goto_282

    :cond_27e
    move/from16 v1, v21

    move/from16 v2, v23

    :goto_282
    invoke-virtual {v0, v2, v1}, Landroid/support/v7/widget/ActionMenuView;->setMeasuredDimension(II)V

    return-void
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .registers 2

    if-eqz p1, :cond_8

    instance-of p1, p1, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    if-eqz p1, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    :goto_9
    return p1
.end method

.method public dismissPopupMenus()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter;->dismissPopupMenus()Z

    :cond_9
    return-void
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .registers 2

    const/4 p1, 0x0

    return p1
.end method

.method protected generateDefaultLayoutParams()Landroid/support/v7/widget/ActionMenuView$LayoutParams;
    .registers 3

    new-instance v0, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/support/v7/widget/ActionMenuView$LayoutParams;-><init>(II)V

    const/16 v1, 0x10

    iput v1, v0, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->gravity:I

    return-object v0
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/support/v7/widget/LinearLayoutCompat$LayoutParams;
    .registers 2

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuView;->generateDefaultLayoutParams()Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuView;->generateDefaultLayoutParams()Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/support/v7/widget/ActionMenuView$LayoutParams;
    .registers 4

    new-instance v0, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/v7/widget/ActionMenuView$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/ActionMenuView$LayoutParams;
    .registers 3

    if-eqz p1, :cond_1c

    instance-of v0, p1, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    if-eqz v0, :cond_e

    new-instance v0, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    check-cast p1, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/v7/widget/ActionMenuView$LayoutParams;-><init>(Landroid/support/v7/widget/ActionMenuView$LayoutParams;)V

    goto :goto_13

    :cond_e
    new-instance v0, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/v7/widget/ActionMenuView$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    :goto_13
    iget p1, v0, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->gravity:I

    if-gtz p1, :cond_1b

    const/16 p1, 0x10

    iput p1, v0, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->gravity:I

    :cond_1b
    return-object v0

    :cond_1c
    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuView;->generateDefaultLayoutParams()Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/support/v7/widget/LinearLayoutCompat$LayoutParams;
    .registers 2

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ActionMenuView;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/LinearLayoutCompat$LayoutParams;
    .registers 2

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ActionMenuView;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ActionMenuView;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .registers 2

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ActionMenuView;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method public generateOverflowButtonLayoutParams()Landroid/support/v7/widget/ActionMenuView$LayoutParams;
    .registers 3
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuView;->generateDefaultLayoutParams()Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->isOverflowButton:Z

    return-object v0
.end method

.method public getMenu()Landroid/view/Menu;
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    if-nez v0, :cond_45

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuView;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/support/v7/view/menu/MenuBuilder;

    invoke-direct {v1, v0}, Landroid/support/v7/view/menu/MenuBuilder;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Landroid/support/v7/widget/ActionMenuView;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    iget-object v1, p0, Landroid/support/v7/widget/ActionMenuView;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    new-instance v2, Landroid/support/v7/widget/ActionMenuView$MenuBuilderCallback;

    invoke-direct {v2, p0}, Landroid/support/v7/widget/ActionMenuView$MenuBuilderCallback;-><init>(Landroid/support/v7/widget/ActionMenuView;)V

    invoke-virtual {v1, v2}, Landroid/support/v7/view/menu/MenuBuilder;->setCallback(Landroid/support/v7/view/menu/MenuBuilder$Callback;)V

    new-instance v1, Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-direct {v1, v0}, Landroid/support/v7/widget/ActionMenuPresenter;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ActionMenuPresenter;->setReserveOverflow(Z)V

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    iget-object v1, p0, Landroid/support/v7/widget/ActionMenuView;->mActionMenuPresenterCallback:Landroid/support/v7/view/menu/MenuPresenter$Callback;

    if-eqz v1, :cond_2f

    iget-object v1, p0, Landroid/support/v7/widget/ActionMenuView;->mActionMenuPresenterCallback:Landroid/support/v7/view/menu/MenuPresenter$Callback;

    goto :goto_34

    :cond_2f
    new-instance v1, Landroid/support/v7/widget/ActionMenuView$ActionMenuPresenterCallback;

    invoke-direct {v1}, Landroid/support/v7/widget/ActionMenuView$ActionMenuPresenterCallback;-><init>()V

    :goto_34
    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ActionMenuPresenter;->setCallback(Landroid/support/v7/view/menu/MenuPresenter$Callback;)V

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    iget-object v1, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    iget-object v2, p0, Landroid/support/v7/widget/ActionMenuView;->mPopupContext:Landroid/content/Context;

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/view/menu/MenuBuilder;->addMenuPresenter(Landroid/support/v7/view/menu/MenuPresenter;Landroid/content/Context;)V

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/ActionMenuPresenter;->setMenuView(Landroid/support/v7/widget/ActionMenuView;)V

    :cond_45
    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    return-object v0
.end method

.method public getOverflowIcon()Landroid/graphics/drawable/Drawable;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuView;->getMenu()Landroid/view/Menu;

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter;->getOverflowIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getPopupTheme()I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPopupTheme:I

    return v0
.end method

.method public getWindowAnimations()I
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method protected hasSupportDividerBeforeChildAt(I)Z
    .registers 6
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    add-int/lit8 v1, p1, -0x1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuView;->getChildCount()I

    move-result v3

    if-ge p1, v3, :cond_1f

    instance-of v3, v1, Landroid/support/v7/widget/ActionMenuView$ActionMenuChildView;

    if-eqz v3, :cond_1f

    check-cast v1, Landroid/support/v7/widget/ActionMenuView$ActionMenuChildView;

    invoke-interface {v1}, Landroid/support/v7/widget/ActionMenuView$ActionMenuChildView;->needsDividerAfter()Z

    move-result v1

    or-int/2addr v0, v1

    :cond_1f
    if-lez p1, :cond_2c

    instance-of p1, v2, Landroid/support/v7/widget/ActionMenuView$ActionMenuChildView;

    if-eqz p1, :cond_2c

    check-cast v2, Landroid/support/v7/widget/ActionMenuView$ActionMenuChildView;

    invoke-interface {v2}, Landroid/support/v7/widget/ActionMenuView$ActionMenuChildView;->needsDividerBefore()Z

    move-result p1

    or-int/2addr v0, p1

    :cond_2c
    return v0
.end method

.method public hideOverflowMenu()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter;->hideOverflowMenu()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method public initialize(Landroid/support/v7/view/menu/MenuBuilder;)V
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iput-object p1, p0, Landroid/support/v7/widget/ActionMenuView;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    return-void
.end method

.method public invokeItem(Landroid/support/v7/view/menu/MenuItemImpl;)Z
    .registers 4
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/support/v7/view/menu/MenuBuilder;->performItemAction(Landroid/view/MenuItem;I)Z

    move-result p1

    return p1
.end method

.method public isOverflowMenuShowPending()Z
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter;->isOverflowMenuShowPending()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method public isOverflowMenuShowing()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter;->isOverflowMenuShowing()Z

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
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-boolean v0, p0, Landroid/support/v7/widget/ActionMenuView;->mReserveOverflow:Z

    return v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Landroid/support/v7/widget/LinearLayoutCompat;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    if-eqz p1, :cond_1f

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/ActionMenuPresenter;->updateMenuView(Z)V

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {p1}, Landroid/support/v7/widget/ActionMenuPresenter;->isOverflowMenuShowing()Z

    move-result p1

    if-eqz p1, :cond_1f

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {p1}, Landroid/support/v7/widget/ActionMenuPresenter;->hideOverflowMenu()Z

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {p1}, Landroid/support/v7/widget/ActionMenuPresenter;->showOverflowMenu()Z

    :cond_1f
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 1

    invoke-super {p0}, Landroid/support/v7/widget/LinearLayoutCompat;->onDetachedFromWindow()V

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuView;->dismissPopupMenus()V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 23

    move-object/from16 v0, p0

    iget-boolean v1, v0, Landroid/support/v7/widget/ActionMenuView;->mFormatItems:Z

    if-nez v1, :cond_a

    invoke-super/range {p0 .. p5}, Landroid/support/v7/widget/LinearLayoutCompat;->onLayout(ZIIII)V

    return-void

    :cond_a
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ActionMenuView;->getChildCount()I

    move-result v1

    sub-int v2, p5, p3

    div-int/lit8 v2, v2, 0x2

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ActionMenuView;->getDividerWidth()I

    move-result v3

    sub-int v4, p4, p2

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ActionMenuView;->getPaddingRight()I

    move-result v5

    sub-int v5, v4, v5

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ActionMenuView;->getPaddingLeft()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-static/range {p0 .. p0}, Landroid/support/v7/widget/ViewUtils;->isLayoutRtl(Landroid/view/View;)Z

    move-result v6

    move v10, v5

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_2b
    const/16 v11, 0x8

    const/4 v12, 0x1

    if-ge v5, v1, :cond_8f

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    invoke-virtual {v13}, Landroid/view/View;->getVisibility()I

    move-result v14

    if-ne v14, v11, :cond_3b

    goto :goto_8c

    :cond_3b
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    check-cast v11, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    iget-boolean v14, v11, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->isOverflowButton:Z

    if-eqz v14, :cond_7b

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/ActionMenuView;->hasSupportDividerBeforeChildAt(I)Z

    move-result v14

    if-eqz v14, :cond_50

    add-int/2addr v8, v3

    :cond_50
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v14

    if-eqz v6, :cond_60

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ActionMenuView;->getPaddingLeft()I

    move-result v15

    iget v11, v11, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->leftMargin:I

    add-int/2addr v15, v11

    add-int v11, v15, v8

    goto :goto_70

    :cond_60
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ActionMenuView;->getWidth()I

    move-result v15

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ActionMenuView;->getPaddingRight()I

    move-result v16

    sub-int v15, v15, v16

    iget v11, v11, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->rightMargin:I

    sub-int v11, v15, v11

    sub-int v15, v11, v8

    :goto_70
    div-int/lit8 v16, v14, 0x2

    sub-int v7, v2, v16

    add-int/2addr v14, v7

    invoke-virtual {v13, v15, v7, v11, v14}, Landroid/view/View;->layout(IIII)V

    sub-int/2addr v10, v8

    const/4 v8, 0x1

    goto :goto_8c

    :cond_7b
    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    iget v12, v11, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->leftMargin:I

    add-int/2addr v7, v12

    iget v11, v11, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->rightMargin:I

    add-int/2addr v7, v11

    sub-int/2addr v10, v7

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/ActionMenuView;->hasSupportDividerBeforeChildAt(I)Z

    move-result v7

    add-int/lit8 v9, v9, 0x1

    :goto_8c
    add-int/lit8 v5, v5, 0x1

    goto :goto_2b

    :cond_8f
    if-ne v1, v12, :cond_ae

    if-nez v8, :cond_ae

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    div-int/lit8 v4, v4, 0x2

    div-int/lit8 v6, v3, 0x2

    sub-int/2addr v4, v6

    div-int/lit8 v6, v5, 0x2

    sub-int/2addr v2, v6

    add-int/2addr v3, v4

    add-int/2addr v5, v2

    invoke-virtual {v1, v4, v2, v3, v5}, Landroid/view/View;->layout(IIII)V

    return-void

    :cond_ae
    xor-int/lit8 v3, v8, 0x1

    sub-int/2addr v9, v3

    if-lez v9, :cond_b7

    div-int v7, v10, v9

    const/4 v3, 0x0

    goto :goto_b9

    :cond_b7
    const/4 v3, 0x0

    const/4 v7, 0x0

    :goto_b9
    invoke-static {v3, v7}, Ljava/lang/Math;->max(II)I

    move-result v4

    if-eqz v6, :cond_fc

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ActionMenuView;->getWidth()I

    move-result v5

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ActionMenuView;->getPaddingRight()I

    move-result v6

    sub-int/2addr v5, v6

    :goto_c8
    if-ge v3, v1, :cond_134

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v8

    if-eq v8, v11, :cond_f9

    iget-boolean v8, v7, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->isOverflowButton:Z

    if-eqz v8, :cond_df

    goto :goto_f9

    :cond_df
    iget v8, v7, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->rightMargin:I

    sub-int/2addr v5, v8

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    div-int/lit8 v10, v9, 0x2

    sub-int v10, v2, v10

    sub-int v12, v5, v8

    add-int/2addr v9, v10

    invoke-virtual {v6, v12, v10, v5, v9}, Landroid/view/View;->layout(IIII)V

    iget v6, v7, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->leftMargin:I

    add-int/2addr v8, v6

    add-int/2addr v8, v4

    sub-int/2addr v5, v8

    :cond_f9
    :goto_f9
    add-int/lit8 v3, v3, 0x1

    goto :goto_c8

    :cond_fc
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/ActionMenuView;->getPaddingLeft()I

    move-result v5

    :goto_100
    if-ge v3, v1, :cond_134

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v8

    if-eq v8, v11, :cond_131

    iget-boolean v8, v7, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->isOverflowButton:Z

    if-eqz v8, :cond_117

    goto :goto_131

    :cond_117
    iget v8, v7, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->leftMargin:I

    add-int/2addr v5, v8

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    div-int/lit8 v10, v9, 0x2

    sub-int v10, v2, v10

    add-int v12, v5, v8

    add-int/2addr v9, v10

    invoke-virtual {v6, v5, v10, v12, v9}, Landroid/view/View;->layout(IIII)V

    iget v6, v7, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->rightMargin:I

    add-int/2addr v8, v6

    add-int/2addr v8, v4

    add-int/2addr v5, v8

    :cond_131
    :goto_131
    add-int/lit8 v3, v3, 0x1

    goto :goto_100

    :cond_134
    return-void
.end method

.method protected onMeasure(II)V
    .registers 8

    iget-boolean v0, p0, Landroid/support/v7/widget/ActionMenuView;->mFormatItems:Z

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/high16 v4, 0x40000000    # 2.0f

    if-ne v1, v4, :cond_e

    const/4 v1, 0x1

    goto :goto_f

    :cond_e
    const/4 v1, 0x0

    :goto_f
    iput-boolean v1, p0, Landroid/support/v7/widget/ActionMenuView;->mFormatItems:Z

    iget-boolean v1, p0, Landroid/support/v7/widget/ActionMenuView;->mFormatItems:Z

    if-eq v0, v1, :cond_17

    iput v3, p0, Landroid/support/v7/widget/ActionMenuView;->mFormatItemsWidth:I

    :cond_17
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    iget-boolean v1, p0, Landroid/support/v7/widget/ActionMenuView;->mFormatItems:Z

    if-eqz v1, :cond_2e

    iget-object v1, p0, Landroid/support/v7/widget/ActionMenuView;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    if-eqz v1, :cond_2e

    iget v1, p0, Landroid/support/v7/widget/ActionMenuView;->mFormatItemsWidth:I

    if-eq v0, v1, :cond_2e

    iput v0, p0, Landroid/support/v7/widget/ActionMenuView;->mFormatItemsWidth:I

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    invoke-virtual {v0, v2}, Landroid/support/v7/view/menu/MenuBuilder;->onItemsChanged(Z)V

    :cond_2e
    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuView;->getChildCount()I

    move-result v0

    iget-boolean v1, p0, Landroid/support/v7/widget/ActionMenuView;->mFormatItems:Z

    if-eqz v1, :cond_3c

    if-lez v0, :cond_3c

    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/ActionMenuView;->onMeasureExactFormat(II)V

    goto :goto_53

    :cond_3c
    const/4 v1, 0x0

    :goto_3d
    if-ge v1, v0, :cond_50

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/ActionMenuView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/ActionMenuView$LayoutParams;

    iput v3, v2, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->rightMargin:I

    iput v3, v2, Landroid/support/v7/widget/ActionMenuView$LayoutParams;->leftMargin:I

    add-int/lit8 v1, v1, 0x1

    goto :goto_3d

    :cond_50
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/LinearLayoutCompat;->onMeasure(II)V

    :goto_53
    return-void
.end method

.method public peekMenu()Landroid/support/v7/view/menu/MenuBuilder;
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mMenu:Landroid/support/v7/view/menu/MenuBuilder;

    return-object v0
.end method

.method public setExpandedActionViewsExclusive(Z)V
    .registers 3
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/ActionMenuPresenter;->setExpandedActionViewsExclusive(Z)V

    return-void
.end method

.method public setMenuCallbacks(Landroid/support/v7/view/menu/MenuPresenter$Callback;Landroid/support/v7/view/menu/MenuBuilder$Callback;)V
    .registers 3
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iput-object p1, p0, Landroid/support/v7/widget/ActionMenuView;->mActionMenuPresenterCallback:Landroid/support/v7/view/menu/MenuPresenter$Callback;

    iput-object p2, p0, Landroid/support/v7/widget/ActionMenuView;->mMenuBuilderCallback:Landroid/support/v7/view/menu/MenuBuilder$Callback;

    return-void
.end method

.method public setOnMenuItemClickListener(Landroid/support/v7/widget/ActionMenuView$OnMenuItemClickListener;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/widget/ActionMenuView;->mOnMenuItemClickListener:Landroid/support/v7/widget/ActionMenuView$OnMenuItemClickListener;

    return-void
.end method

.method public setOverflowIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuView;->getMenu()Landroid/view/Menu;

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/ActionMenuPresenter;->setOverflowIcon(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setOverflowReserved(Z)V
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iput-boolean p1, p0, Landroid/support/v7/widget/ActionMenuView;->mReserveOverflow:Z

    return-void
.end method

.method public setPopupTheme(I)V
    .registers 4
    .param p1    # I
        .annotation build Landroid/support/annotation/StyleRes;
        .end annotation
    .end param

    iget v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPopupTheme:I

    if-eq v0, p1, :cond_1a

    iput p1, p0, Landroid/support/v7/widget/ActionMenuView;->mPopupTheme:I

    if-nez p1, :cond_f

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuView;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v7/widget/ActionMenuView;->mPopupContext:Landroid/content/Context;

    goto :goto_1a

    :cond_f
    new-instance v0, Landroid/view/ContextThemeWrapper;

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionMenuView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPopupContext:Landroid/content/Context;

    :cond_1a
    :goto_1a
    return-void
.end method

.method public setPresenter(Landroid/support/v7/widget/ActionMenuPresenter;)V
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iput-object p1, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    iget-object p1, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {p1, p0}, Landroid/support/v7/widget/ActionMenuPresenter;->setMenuView(Landroid/support/v7/widget/ActionMenuView;)V

    return-void
.end method

.method public showOverflowMenu()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/ActionMenuView;->mPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter;->showOverflowMenu()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method
