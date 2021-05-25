.class public Landroid/support/v7/widget/ActionBarContextView;
.super Landroid/support/v7/widget/AbsActionBarView;
.source "ActionBarContextView.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ActionBarContextView"


# instance fields
.field private mClose:Landroid/view/View;

.field private mCloseItemLayout:I

.field private mCustomView:Landroid/view/View;

.field private mSubtitle:Ljava/lang/CharSequence;

.field private mSubtitleStyleRes:I

.field private mSubtitleView:Landroid/widget/TextView;

.field private mTitle:Ljava/lang/CharSequence;

.field private mTitleLayout:Landroid/widget/LinearLayout;

.field private mTitleOptional:Z

.field private mTitleStyleRes:I

.field private mTitleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/ActionBarContextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    sget v0, Landroid/support/v7/appcompat/R$attr;->actionModeStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/ActionBarContextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/AbsActionBarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sget-object v0, Landroid/support/v7/appcompat/R$styleable;->ActionMode:[I

    const/4 v1, 0x0

    invoke-static {p1, p2, v0, p3, v1}, Landroid/support/v7/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/widget/TintTypedArray;

    move-result-object p1

    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionMode_background:I

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/TintTypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-static {p0, p2}, Landroid/support/v4/view/ViewCompat;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionMode_titleTextStyle:I

    invoke-virtual {p1, p2, v1}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleStyleRes:I

    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionMode_subtitleTextStyle:I

    invoke-virtual {p1, p2, v1}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Landroid/support/v7/widget/ActionBarContextView;->mSubtitleStyleRes:I

    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionMode_height:I

    invoke-virtual {p1, p2, v1}, Landroid/support/v7/widget/TintTypedArray;->getLayoutDimension(II)I

    move-result p2

    iput p2, p0, Landroid/support/v7/widget/ActionBarContextView;->mContentHeight:I

    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionMode_closeItemLayout:I

    sget p3, Landroid/support/v7/appcompat/R$layout;->abc_action_mode_close_item_material:I

    invoke-virtual {p1, p2, p3}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Landroid/support/v7/widget/ActionBarContextView;->mCloseItemLayout:I

    invoke-virtual {p1}, Landroid/support/v7/widget/TintTypedArray;->recycle()V

    return-void
.end method

.method private initTitle()V
    .registers 7

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    if-nez v0, :cond_55

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Landroid/support/v7/appcompat/R$layout;->abc_action_bar_title_item:I

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionBarContextView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    sget v1, Landroid/support/v7/appcompat/R$id;->action_bar_title:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleView:Landroid/widget/TextView;

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    sget v1, Landroid/support/v7/appcompat/R$id;->action_bar_subtitle:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mSubtitleView:Landroid/widget/TextView;

    iget v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleStyleRes:I

    if-eqz v0, :cond_46

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleStyleRes:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    :cond_46
    iget v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mSubtitleStyleRes:I

    if-eqz v0, :cond_55

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mSubtitleView:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/ActionBarContextView;->mSubtitleStyleRes:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    :cond_55
    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleView:Landroid/widget/TextView;

    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mSubtitleView:Landroid/widget/TextView;

    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContextView;->mSubtitle:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitle:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContextView;->mSubtitle:Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    iget-object v2, p0, Landroid/support/v7/widget/ActionBarContextView;->mSubtitleView:Landroid/widget/TextView;

    const/16 v3, 0x8

    const/4 v4, 0x0

    if-eqz v1, :cond_7c

    const/4 v5, 0x0

    goto :goto_7e

    :cond_7c
    const/16 v5, 0x8

    :goto_7e
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v2, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    if-nez v0, :cond_87

    if-eqz v1, :cond_88

    :cond_87
    const/4 v3, 0x0

    :cond_88
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_98

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionBarContextView;->addView(Landroid/view/View;)V

    :cond_98
    return-void
.end method


# virtual methods
.method public bridge synthetic animateToVisibility(I)V
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/widget/AbsActionBarView;->animateToVisibility(I)V

    return-void
.end method

.method public bridge synthetic canShowOverflowMenu()Z
    .registers 2

    invoke-super {p0}, Landroid/support/v7/widget/AbsActionBarView;->canShowOverflowMenu()Z

    move-result v0

    return v0
.end method

.method public closeMode()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mClose:Landroid/view/View;

    if-nez v0, :cond_8

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->killMode()V

    return-void

    :cond_8
    return-void
.end method

.method public bridge synthetic dismissPopupMenus()V
    .registers 1

    invoke-super {p0}, Landroid/support/v7/widget/AbsActionBarView;->dismissPopupMenus()V

    return-void
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public bridge synthetic getAnimatedVisibility()I
    .registers 2

    invoke-super {p0}, Landroid/support/v7/widget/AbsActionBarView;->getAnimatedVisibility()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getContentHeight()I
    .registers 2

    invoke-super {p0}, Landroid/support/v7/widget/AbsActionBarView;->getContentHeight()I

    move-result v0

    return v0
.end method

.method public getSubtitle()Ljava/lang/CharSequence;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mSubtitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public hideOverflowMenu()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter;->hideOverflowMenu()Z

    move-result v0

    return v0

    :cond_b
    const/4 v0, 0x0

    return v0
.end method

.method public initForMode(Landroid/support/v7/view/ActionMode;)V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mClose:Landroid/view/View;

    if-nez v0, :cond_1b

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/widget/ActionBarContextView;->mCloseItemLayout:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mClose:Landroid/view/View;

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mClose:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionBarContextView;->addView(Landroid/view/View;)V

    goto :goto_28

    :cond_1b
    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mClose:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_28

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mClose:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionBarContextView;->addView(Landroid/view/View;)V

    :cond_28
    :goto_28
    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mClose:Landroid/view/View;

    sget v1, Landroid/support/v7/appcompat/R$id;->action_mode_close_button:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Landroid/support/v7/widget/ActionBarContextView$1;

    invoke-direct {v1, p0, p1}, Landroid/support/v7/widget/ActionBarContextView$1;-><init>(Landroid/support/v7/widget/ActionBarContextView;Landroid/support/v7/view/ActionMode;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p1}, Landroid/support/v7/view/ActionMode;->getMenu()Landroid/view/Menu;

    move-result-object p1

    check-cast p1, Landroid/support/v7/view/menu/MenuBuilder;

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    if-eqz v0, :cond_47

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter;->dismissPopupMenus()Z

    :cond_47
    new-instance v0, Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/ActionMenuPresenter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/ActionMenuPresenter;->setReserveOverflow(Z)V

    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x2

    const/4 v2, -0x1

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    iget-object v2, p0, Landroid/support/v7/widget/ActionBarContextView;->mPopupContext:Landroid/content/Context;

    invoke-virtual {p1, v1, v2}, Landroid/support/v7/view/menu/MenuBuilder;->addMenuPresenter(Landroid/support/v7/view/menu/MenuPresenter;Landroid/content/Context;)V

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {p1, p0}, Landroid/support/v7/widget/ActionMenuPresenter;->getMenuView(Landroid/view/ViewGroup;)Landroid/support/v7/view/menu/MenuView;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/ActionMenuView;

    iput-object p1, p0, Landroid/support/v7/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    const/4 v1, 0x0

    invoke-static {p1, v1}, Landroid/support/v4/view/ViewCompat;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/widget/ActionBarContextView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public bridge synthetic isOverflowMenuShowPending()Z
    .registers 2

    invoke-super {p0}, Landroid/support/v7/widget/AbsActionBarView;->isOverflowMenuShowPending()Z

    move-result v0

    return v0
.end method

.method public isOverflowMenuShowing()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter;->isOverflowMenuShowing()Z

    move-result v0

    return v0

    :cond_b
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic isOverflowReserved()Z
    .registers 2

    invoke-super {p0}, Landroid/support/v7/widget/AbsActionBarView;->isOverflowReserved()Z

    move-result v0

    return v0
.end method

.method public isTitleOptional()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleOptional:Z

    return v0
.end method

.method public killMode()V
    .registers 2

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->removeAllViews()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    iput-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/support/v7/widget/AbsActionBarView;->onDetachedFromWindow()V

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    if-eqz v0, :cond_11

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter;->hideOverflowMenu()Z

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter;->hideSubMenus()Z

    :cond_11
    return-void
.end method

.method public bridge synthetic onHoverEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/widget/AbsActionBarView;->onHoverEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4

    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getEventType()I

    move-result v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_27

    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityEvent;->setSource(Landroid/view/View;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setPackageName(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_2a

    :cond_27
    invoke-super {p0, p1}, Landroid/support/v7/widget/AbsActionBarView;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    :goto_2a
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 15

    invoke-static {p0}, Landroid/support/v7/widget/ViewUtils;->isLayoutRtl(Landroid/view/View;)Z

    move-result p1

    if-eqz p1, :cond_e

    sub-int v0, p4, p2

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    goto :goto_12

    :cond_e
    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getPaddingLeft()I

    move-result v0

    :goto_12
    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getPaddingTop()I

    move-result v6

    sub-int/2addr p5, p3

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getPaddingTop()I

    move-result p3

    sub-int/2addr p5, p3

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getPaddingBottom()I

    move-result p3

    sub-int p3, p5, p3

    iget-object p5, p0, Landroid/support/v7/widget/ActionBarContextView;->mClose:Landroid/view/View;

    const/16 v7, 0x8

    if-eqz p5, :cond_5b

    iget-object p5, p0, Landroid/support/v7/widget/ActionBarContextView;->mClose:Landroid/view/View;

    invoke-virtual {p5}, Landroid/view/View;->getVisibility()I

    move-result p5

    if-eq p5, v7, :cond_5b

    iget-object p5, p0, Landroid/support/v7/widget/ActionBarContextView;->mClose:Landroid/view/View;

    invoke-virtual {p5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p5

    check-cast p5, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz p1, :cond_3d

    iget v1, p5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    goto :goto_3f

    :cond_3d
    iget v1, p5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    :goto_3f
    if-eqz p1, :cond_44

    iget p5, p5, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    goto :goto_46

    :cond_44
    iget p5, p5, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    :goto_46
    invoke-static {v0, v1, p1}, Landroid/support/v7/widget/ActionBarContextView;->next(IIZ)I

    move-result v8

    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContextView;->mClose:Landroid/view/View;

    move-object v0, p0

    move v2, v8

    move v3, v6

    move v4, p3

    move v5, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/v7/widget/ActionBarContextView;->positionChild(Landroid/view/View;IIIZ)I

    move-result v0

    add-int/2addr v8, v0

    invoke-static {v8, p5, p1}, Landroid/support/v7/widget/ActionBarContextView;->next(IIZ)I

    move-result p5

    goto :goto_5c

    :cond_5b
    move p5, v0

    :goto_5c
    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_78

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    if-nez v0, :cond_78

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-eq v0, v7, :cond_78

    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    move-object v0, p0

    move v2, p5

    move v3, v6

    move v4, p3

    move v5, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/v7/widget/ActionBarContextView;->positionChild(Landroid/view/View;IIIZ)I

    move-result v0

    add-int/2addr p5, v0

    :cond_78
    move v2, p5

    iget-object p5, p0, Landroid/support/v7/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    if-eqz p5, :cond_86

    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    move-object v0, p0

    move v3, v6

    move v4, p3

    move v5, p1

    invoke-virtual/range {v0 .. v5}, Landroid/support/v7/widget/ActionBarContextView;->positionChild(Landroid/view/View;IIIZ)I

    :cond_86
    if-eqz p1, :cond_8e

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getPaddingLeft()I

    move-result p2

    move v3, p2

    goto :goto_95

    :cond_8e
    sub-int/2addr p4, p2

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getPaddingRight()I

    move-result p2

    sub-int/2addr p4, p2

    move v3, p4

    :goto_95
    iget-object p2, p0, Landroid/support/v7/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-eqz p2, :cond_a4

    iget-object v2, p0, Landroid/support/v7/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    xor-int/lit8 p1, p1, 0x1

    move-object v1, p0

    move v4, v6

    move v5, p3

    move v6, p1

    invoke-virtual/range {v1 .. v6}, Landroid/support/v7/widget/ActionBarContextView;->positionChild(Landroid/view/View;IIIZ)I

    :cond_a4
    return-void
.end method

.method protected onMeasure(II)V
    .registers 13

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    if-ne v0, v1, :cond_11b

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-eqz v0, :cond_f7

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    iget v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mContentHeight:I

    if-lez v0, :cond_19

    iget p2, p0, Landroid/support/v7/widget/ActionBarContextView;->mContentHeight:I

    goto :goto_1d

    :cond_19
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    :goto_1d
    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getPaddingBottom()I

    move-result v2

    add-int/2addr v0, v2

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getPaddingLeft()I

    move-result v2

    sub-int v2, p1, v2

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    sub-int v3, p2, v0

    const/high16 v4, -0x80000000

    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    iget-object v6, p0, Landroid/support/v7/widget/ActionBarContextView;->mClose:Landroid/view/View;

    const/4 v7, 0x0

    if-eqz v6, :cond_52

    iget-object v6, p0, Landroid/support/v7/widget/ActionBarContextView;->mClose:Landroid/view/View;

    invoke-virtual {p0, v6, v2, v5, v7}, Landroid/support/v7/widget/ActionBarContextView;->measureChildView(Landroid/view/View;III)I

    move-result v2

    iget-object v6, p0, Landroid/support/v7/widget/ActionBarContextView;->mClose:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v8, v6, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v6, v6, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v8, v6

    sub-int/2addr v2, v8

    :cond_52
    iget-object v6, p0, Landroid/support/v7/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    if-eqz v6, :cond_64

    iget-object v6, p0, Landroid/support/v7/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {v6}, Landroid/support/v7/widget/ActionMenuView;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    if-ne v6, p0, :cond_64

    iget-object v6, p0, Landroid/support/v7/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/widget/ActionMenuView;

    invoke-virtual {p0, v6, v2, v5, v7}, Landroid/support/v7/widget/ActionBarContextView;->measureChildView(Landroid/view/View;III)I

    move-result v2

    :cond_64
    iget-object v6, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    if-eqz v6, :cond_99

    iget-object v6, p0, Landroid/support/v7/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    if-nez v6, :cond_99

    iget-boolean v6, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleOptional:Z

    if-eqz v6, :cond_93

    invoke-static {v7, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    iget-object v8, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v8, v6, v5}, Landroid/widget/LinearLayout;->measure(II)V

    iget-object v5, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v5

    if-gt v5, v2, :cond_83

    const/4 v6, 0x1

    goto :goto_84

    :cond_83
    const/4 v6, 0x0

    :goto_84
    if-eqz v6, :cond_87

    sub-int/2addr v2, v5

    :cond_87
    iget-object v5, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    if-eqz v6, :cond_8d

    const/4 v6, 0x0

    goto :goto_8f

    :cond_8d
    const/16 v6, 0x8

    :goto_8f
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_99

    :cond_93
    iget-object v6, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v6, v2, v5, v7}, Landroid/support/v7/widget/ActionBarContextView;->measureChildView(Landroid/view/View;III)I

    move-result v2

    :cond_99
    :goto_99
    iget-object v5, p0, Landroid/support/v7/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    if-eqz v5, :cond_d5

    iget-object v5, p0, Landroid/support/v7/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    iget v6, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v8, -0x2

    if-eq v6, v8, :cond_ab

    const/high16 v6, 0x40000000    # 2.0f

    goto :goto_ad

    :cond_ab
    const/high16 v6, -0x80000000

    :goto_ad
    iget v9, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ltz v9, :cond_b7

    iget v9, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v9, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    :cond_b7
    iget v9, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v9, v8, :cond_bc

    goto :goto_be

    :cond_bc
    const/high16 v1, -0x80000000

    :goto_be
    iget v4, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ltz v4, :cond_c8

    iget v4, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    :cond_c8
    iget-object v4, p0, Landroid/support/v7/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    invoke-static {v2, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-static {v3, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-virtual {v4, v2, v1}, Landroid/view/View;->measure(II)V

    :cond_d5
    iget v1, p0, Landroid/support/v7/widget/ActionBarContextView;->mContentHeight:I

    if-gtz v1, :cond_f3

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->getChildCount()I

    move-result p2

    const/4 v1, 0x0

    :goto_de
    if-ge v7, p2, :cond_ef

    invoke-virtual {p0, v7}, Landroid/support/v7/widget/ActionBarContextView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    add-int/2addr v2, v0

    if-le v2, v1, :cond_ec

    move v1, v2

    :cond_ec
    add-int/lit8 v7, v7, 0x1

    goto :goto_de

    :cond_ef
    invoke-virtual {p0, p1, v1}, Landroid/support/v7/widget/ActionBarContextView;->setMeasuredDimension(II)V

    goto :goto_f6

    :cond_f3
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/ActionBarContextView;->setMeasuredDimension(II)V

    :goto_f6
    return-void

    :cond_f7
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " can only be used "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "with android:layout_height=\"wrap_content\""

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_11b
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " can only be used "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "with android:layout_width=\"match_parent\" (or fill_parent)"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public bridge synthetic onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/widget/AbsActionBarView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic postShowOverflowMenu()V
    .registers 1

    invoke-super {p0}, Landroid/support/v7/widget/AbsActionBarView;->postShowOverflowMenu()V

    return-void
.end method

.method public setContentHeight(I)V
    .registers 2

    iput p1, p0, Landroid/support/v7/widget/ActionBarContextView;->mContentHeight:I

    return-void
.end method

.method public setCustomView(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionBarContextView;->removeView(Landroid/view/View;)V

    :cond_9
    iput-object p1, p0, Landroid/support/v7/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    if-eqz p1, :cond_19

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_19

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionBarContextView;->removeView(Landroid/view/View;)V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    :cond_19
    if-eqz p1, :cond_1e

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ActionBarContextView;->addView(Landroid/view/View;)V

    :cond_1e
    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->requestLayout()V

    return-void
.end method

.method public setSubtitle(Ljava/lang/CharSequence;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/widget/ActionBarContextView;->mSubtitle:Ljava/lang/CharSequence;

    invoke-direct {p0}, Landroid/support/v7/widget/ActionBarContextView;->initTitle()V

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitle:Ljava/lang/CharSequence;

    invoke-direct {p0}, Landroid/support/v7/widget/ActionBarContextView;->initTitle()V

    return-void
.end method

.method public setTitleOptional(Z)V
    .registers 3

    iget-boolean v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleOptional:Z

    if-eq p1, v0, :cond_7

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContextView;->requestLayout()V

    :cond_7
    iput-boolean p1, p0, Landroid/support/v7/widget/ActionBarContextView;->mTitleOptional:Z

    return-void
.end method

.method public bridge synthetic setVisibility(I)V
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/widget/AbsActionBarView;->setVisibility(I)V

    return-void
.end method

.method public bridge synthetic setupAnimatorToVisibility(IJ)Landroid/support/v4/view/ViewPropertyAnimatorCompat;
    .registers 4

    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/AbsActionBarView;->setupAnimatorToVisibility(IJ)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    return-object p1
.end method

.method public shouldDelayChildPressedState()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public showOverflowMenu()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/widget/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/widget/ActionMenuPresenter;->showOverflowMenu()Z

    move-result v0

    return v0

    :cond_b
    const/4 v0, 0x0

    return v0
.end method
