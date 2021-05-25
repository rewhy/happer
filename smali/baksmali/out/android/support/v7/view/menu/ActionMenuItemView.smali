.class public Landroid/support/v7/view/menu/ActionMenuItemView;
.super Landroid/support/v7/widget/AppCompatTextView;
.source "ActionMenuItemView.java"

# interfaces
.implements Landroid/support/v7/view/menu/MenuView$ItemView;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/support/v7/widget/ActionMenuView$ActionMenuChildView;


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/view/menu/ActionMenuItemView$PopupCallback;,
        Landroid/support/v7/view/menu/ActionMenuItemView$ActionMenuItemForwardingListener;
    }
.end annotation


# static fields
.field private static final MAX_ICON_SIZE:I = 0x20

.field private static final TAG:Ljava/lang/String; = "ActionMenuItemView"


# instance fields
.field private mAllowTextWithIcon:Z

.field private mExpandedFormat:Z

.field private mForwardingListener:Landroid/support/v7/widget/ForwardingListener;

.field private mIcon:Landroid/graphics/drawable/Drawable;

.field mItemData:Landroid/support/v7/view/menu/MenuItemImpl;

.field mItemInvoker:Landroid/support/v7/view/menu/MenuBuilder$ItemInvoker;

.field private mMaxIconSize:I

.field private mMinWidth:I

.field mPopupCallback:Landroid/support/v7/view/menu/ActionMenuItemView$PopupCallback;

.field private mSavedPaddingLeft:I

.field private mTitle:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/view/menu/ActionMenuItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/view/menu/ActionMenuItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->shouldAllowTextWithIcon()Z

    move-result v1

    iput-boolean v1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mAllowTextWithIcon:Z

    sget-object v1, Landroid/support/v7/appcompat/R$styleable;->ActionMenuItemView:[I

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionMenuItemView_android_minWidth:I

    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mMinWidth:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 p2, 0x42000000    # 32.0f

    mul-float p1, p1, p2

    const/high16 p2, 0x3f000000    # 0.5f

    add-float/2addr p1, p2

    float-to-int p1, p1

    iput p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mMaxIconSize:I

    invoke-virtual {p0, p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/4 p1, -0x1

    iput p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mSavedPaddingLeft:I

    invoke-virtual {p0, v2}, Landroid/support/v7/view/menu/ActionMenuItemView;->setSaveEnabled(Z)V

    return-void
.end method

.method private shouldAllowTextWithIcon()Z
    .registers 6

    invoke-virtual {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v1, v0, Landroid/content/res/Configuration;->screenWidthDp:I

    iget v2, v0, Landroid/content/res/Configuration;->screenHeightDp:I

    const/16 v3, 0x1e0

    if-ge v1, v3, :cond_22

    const/16 v4, 0x280

    if-lt v1, v4, :cond_1a

    if-ge v2, v3, :cond_22

    :cond_1a
    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_20

    goto :goto_22

    :cond_20
    const/4 v0, 0x0

    goto :goto_23

    :cond_22
    :goto_22
    const/4 v0, 0x1

    :goto_23
    return v0
.end method

.method private updateTextButtonVisibility()V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mTitle:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    iget-object v2, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_1e

    iget-object v2, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemData:Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {v2}, Landroid/support/v7/view/menu/MenuItemImpl;->showsTextAsAction()Z

    move-result v2

    if-eqz v2, :cond_1d

    iget-boolean v2, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mAllowTextWithIcon:Z

    if-nez v2, :cond_1e

    iget-boolean v2, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mExpandedFormat:Z

    if-eqz v2, :cond_1d

    goto :goto_1e

    :cond_1d
    const/4 v1, 0x0

    :cond_1e
    :goto_1e
    and-int/2addr v0, v1

    const/4 v1, 0x0

    if-eqz v0, :cond_25

    iget-object v2, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mTitle:Ljava/lang/CharSequence;

    goto :goto_26

    :cond_25
    move-object v2, v1

    :goto_26
    invoke-virtual {p0, v2}, Landroid/support/v7/view/menu/ActionMenuItemView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemData:Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {v2}, Landroid/support/v7/view/menu/MenuItemImpl;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_43

    if-eqz v0, :cond_39

    move-object v2, v1

    goto :goto_3f

    :cond_39
    iget-object v2, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemData:Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {v2}, Landroid/support/v7/view/menu/MenuItemImpl;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    :goto_3f
    invoke-virtual {p0, v2}, Landroid/support/v7/view/menu/ActionMenuItemView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_46

    :cond_43
    invoke-virtual {p0, v2}, Landroid/support/v7/view/menu/ActionMenuItemView;->setContentDescription(Ljava/lang/CharSequence;)V

    :goto_46
    iget-object v2, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemData:Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {v2}, Landroid/support/v7/view/menu/MenuItemImpl;->getTooltipText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5f

    if-eqz v0, :cond_55

    goto :goto_5b

    :cond_55
    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemData:Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/MenuItemImpl;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    :goto_5b
    invoke-static {p0, v1}, Landroid/support/v7/widget/TooltipCompat;->setTooltipText(Landroid/view/View;Ljava/lang/CharSequence;)V

    goto :goto_62

    :cond_5f
    invoke-static {p0, v2}, Landroid/support/v7/widget/TooltipCompat;->setTooltipText(Landroid/view/View;Ljava/lang/CharSequence;)V

    :goto_62
    return-void
.end method


# virtual methods
.method public getItemData()Landroid/support/v7/view/menu/MenuItemImpl;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemData:Landroid/support/v7/view/menu/MenuItemImpl;

    return-object v0
.end method

.method public hasText()Z
    .registers 2

    invoke-virtual {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public initialize(Landroid/support/v7/view/menu/MenuItemImpl;I)V
    .registers 3

    iput-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemData:Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {p1}, Landroid/support/v7/view/menu/MenuItemImpl;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/support/v7/view/menu/ActionMenuItemView;->setIcon(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1, p0}, Landroid/support/v7/view/menu/MenuItemImpl;->getTitleForItemView(Landroid/support/v7/view/menu/MenuView$ItemView;)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/support/v7/view/menu/ActionMenuItemView;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Landroid/support/v7/view/menu/MenuItemImpl;->getItemId()I

    move-result p2

    invoke-virtual {p0, p2}, Landroid/support/v7/view/menu/ActionMenuItemView;->setId(I)V

    invoke-virtual {p1}, Landroid/support/v7/view/menu/MenuItemImpl;->isVisible()Z

    move-result p2

    if-eqz p2, :cond_1f

    const/4 p2, 0x0

    goto :goto_21

    :cond_1f
    const/16 p2, 0x8

    :goto_21
    invoke-virtual {p0, p2}, Landroid/support/v7/view/menu/ActionMenuItemView;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/support/v7/view/menu/MenuItemImpl;->isEnabled()Z

    move-result p2

    invoke-virtual {p0, p2}, Landroid/support/v7/view/menu/ActionMenuItemView;->setEnabled(Z)V

    invoke-virtual {p1}, Landroid/support/v7/view/menu/MenuItemImpl;->hasSubMenu()Z

    move-result p1

    if-eqz p1, :cond_3c

    iget-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mForwardingListener:Landroid/support/v7/widget/ForwardingListener;

    if-nez p1, :cond_3c

    new-instance p1, Landroid/support/v7/view/menu/ActionMenuItemView$ActionMenuItemForwardingListener;

    invoke-direct {p1, p0}, Landroid/support/v7/view/menu/ActionMenuItemView$ActionMenuItemForwardingListener;-><init>(Landroid/support/v7/view/menu/ActionMenuItemView;)V

    iput-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mForwardingListener:Landroid/support/v7/widget/ForwardingListener;

    :cond_3c
    return-void
.end method

.method public needsDividerAfter()Z
    .registers 2

    invoke-virtual {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->hasText()Z

    move-result v0

    return v0
.end method

.method public needsDividerBefore()Z
    .registers 2

    invoke-virtual {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->hasText()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemData:Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/MenuItemImpl;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .registers 3

    iget-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemInvoker:Landroid/support/v7/view/menu/MenuBuilder$ItemInvoker;

    if-eqz p1, :cond_b

    iget-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemInvoker:Landroid/support/v7/view/menu/MenuBuilder$ItemInvoker;

    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemData:Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-interface {p1, v0}, Landroid/support/v7/view/menu/MenuBuilder$ItemInvoker;->invokeItem(Landroid/support/v7/view/menu/MenuItemImpl;)Z

    :cond_b
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/widget/AppCompatTextView;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-direct {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->shouldAllowTextWithIcon()Z

    move-result p1

    iput-boolean p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mAllowTextWithIcon:Z

    invoke-direct {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->updateTextButtonVisibility()V

    return-void
.end method

.method protected onMeasure(II)V
    .registers 8

    invoke-virtual {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->hasText()Z

    move-result v0

    if-eqz v0, :cond_1b

    iget v1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mSavedPaddingLeft:I

    if-ltz v1, :cond_1b

    iget v1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mSavedPaddingLeft:I

    invoke-virtual {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->getPaddingRight()I

    move-result v3

    invoke-virtual {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->getPaddingBottom()I

    move-result v4

    invoke-super {p0, v1, v2, v3, v4}, Landroid/support/v7/widget/AppCompatTextView;->setPadding(IIII)V

    :cond_1b
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/AppCompatTextView;->onMeasure(II)V

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-virtual {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->getMeasuredWidth()I

    move-result v2

    const/high16 v3, -0x80000000

    if-ne v1, v3, :cond_35

    iget v3, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mMinWidth:I

    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    move-result p1

    goto :goto_37

    :cond_35
    iget p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mMinWidth:I

    :goto_37
    const/high16 v3, 0x40000000    # 2.0f

    if-eq v1, v3, :cond_48

    iget v1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mMinWidth:I

    if-lez v1, :cond_48

    if-ge v2, p1, :cond_48

    invoke-static {p1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/AppCompatTextView;->onMeasure(II)V

    :cond_48
    if-nez v0, :cond_6e

    iget-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_6e

    invoke-virtual {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->getMeasuredWidth()I

    move-result p1

    iget-object p2, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p2

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result p2

    sub-int/2addr p1, p2

    div-int/lit8 p1, p1, 0x2

    invoke-virtual {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->getPaddingTop()I

    move-result p2

    invoke-virtual {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->getPaddingRight()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->getPaddingBottom()I

    move-result v1

    invoke-super {p0, p1, p2, v0, v1}, Landroid/support/v7/widget/AppCompatTextView;->setPadding(IIII)V

    :cond_6e
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 2

    const/4 p1, 0x0

    invoke-super {p0, p1}, Landroid/support/v7/widget/AppCompatTextView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemData:Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {v0}, Landroid/support/v7/view/menu/MenuItemImpl;->hasSubMenu()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mForwardingListener:Landroid/support/v7/widget/ForwardingListener;

    if-eqz v0, :cond_16

    iget-object v0, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mForwardingListener:Landroid/support/v7/widget/ForwardingListener;

    invoke-virtual {v0, p0, p1}, Landroid/support/v7/widget/ForwardingListener;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 p1, 0x1

    return p1

    :cond_16
    invoke-super {p0, p1}, Landroid/support/v7/widget/AppCompatTextView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public prefersCondensedTitle()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public setCheckable(Z)V
    .registers 2

    return-void
.end method

.method public setChecked(Z)V
    .registers 2

    return-void
.end method

.method public setExpandedFormat(Z)V
    .registers 3

    iget-boolean v0, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mExpandedFormat:Z

    if-eq v0, p1, :cond_f

    iput-boolean p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mExpandedFormat:Z

    iget-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemData:Landroid/support/v7/view/menu/MenuItemImpl;

    if-eqz p1, :cond_f

    iget-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemData:Landroid/support/v7/view/menu/MenuItemImpl;

    invoke-virtual {p1}, Landroid/support/v7/view/menu/MenuItemImpl;->actionFormatChanged()V

    :cond_f
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .registers 5

    iput-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mIcon:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_2e

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    iget v2, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mMaxIconSize:I

    if-le v0, v2, :cond_1b

    iget v2, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mMaxIconSize:I

    int-to-float v2, v2

    int-to-float v0, v0

    div-float/2addr v2, v0

    iget v0, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mMaxIconSize:I

    int-to-float v1, v1

    mul-float v1, v1, v2

    float-to-int v1, v1

    :cond_1b
    iget v2, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mMaxIconSize:I

    if-le v1, v2, :cond_2a

    iget v2, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mMaxIconSize:I

    int-to-float v2, v2

    int-to-float v1, v1

    div-float/2addr v2, v1

    iget v1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mMaxIconSize:I

    int-to-float v0, v0

    mul-float v0, v0, v2

    float-to-int v0, v0

    :cond_2a
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_2e
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0, v0}, Landroid/support/v7/view/menu/ActionMenuItemView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-direct {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->updateTextButtonVisibility()V

    return-void
.end method

.method public setItemInvoker(Landroid/support/v7/view/menu/MenuBuilder$ItemInvoker;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mItemInvoker:Landroid/support/v7/view/menu/MenuBuilder$ItemInvoker;

    return-void
.end method

.method public setPadding(IIII)V
    .registers 5

    iput p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mSavedPaddingLeft:I

    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/AppCompatTextView;->setPadding(IIII)V

    return-void
.end method

.method public setPopupCallback(Landroid/support/v7/view/menu/ActionMenuItemView$PopupCallback;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mPopupCallback:Landroid/support/v7/view/menu/ActionMenuItemView$PopupCallback;

    return-void
.end method

.method public setShortcut(ZC)V
    .registers 3

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/view/menu/ActionMenuItemView;->mTitle:Ljava/lang/CharSequence;

    invoke-direct {p0}, Landroid/support/v7/view/menu/ActionMenuItemView;->updateTextButtonVisibility()V

    return-void
.end method

.method public showsIcon()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method
