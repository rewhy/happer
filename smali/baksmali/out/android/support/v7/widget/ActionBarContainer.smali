.class public Landroid/support/v7/widget/ActionBarContainer;
.super Landroid/widget/FrameLayout;
.source "ActionBarContainer.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# instance fields
.field private mActionBarView:Landroid/view/View;

.field mBackground:Landroid/graphics/drawable/Drawable;

.field private mContextView:Landroid/view/View;

.field private mHeight:I

.field mIsSplit:Z

.field mIsStacked:Z

.field private mIsTransitioning:Z

.field mSplitBackground:Landroid/graphics/drawable/Drawable;

.field mStackedBackground:Landroid/graphics/drawable/Drawable;

.field private mTabContainer:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/ActionBarContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Landroid/support/v7/widget/ActionBarBackgroundDrawable;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/ActionBarBackgroundDrawable;-><init>(Landroid/support/v7/widget/ActionBarContainer;)V

    invoke-static {p0, v0}, Landroid/support/v4/view/ViewCompat;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    sget-object v0, Landroid/support/v7/appcompat/R$styleable;->ActionBar:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionBar_background:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionBar_backgroundStacked:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionBar_height:I

    const/4 v0, -0x1

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Landroid/support/v7/widget/ActionBarContainer;->mHeight:I

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContainer;->getId()I

    move-result p2

    sget v0, Landroid/support/v7/appcompat/R$id;->split_action_bar:I

    const/4 v1, 0x1

    if-ne p2, v0, :cond_3d

    iput-boolean v1, p0, Landroid/support/v7/widget/ActionBarContainer;->mIsSplit:Z

    sget p2, Landroid/support/v7/appcompat/R$styleable;->ActionBar_backgroundSplit:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    :cond_3d
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    iget-boolean p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mIsSplit:Z

    const/4 p2, 0x0

    if-eqz p1, :cond_4b

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_54

    :goto_49
    const/4 p2, 0x1

    goto :goto_54

    :cond_4b
    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_54

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_54

    goto :goto_49

    :cond_54
    :goto_54
    invoke-virtual {p0, p2}, Landroid/support/v7/widget/ActionBarContainer;->setWillNotDraw(Z)V

    return-void
.end method

.method private getMeasuredHeightWithMargins(Landroid/view/View;)I
    .registers 4

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    add-int/2addr p1, v1

    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    add-int/2addr p1, v0

    return p1
.end method

.method private isCollapsed(Landroid/view/View;)Z
    .registers 4

    if-eqz p1, :cond_13

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_13

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    if-nez p1, :cond_11

    goto :goto_13

    :cond_11
    const/4 p1, 0x0

    goto :goto_14

    :cond_13
    :goto_13
    const/4 p1, 0x1

    :goto_14
    return p1
.end method


# virtual methods
.method protected drawableStateChanged()V
    .registers 3

    invoke-super {p0}, Landroid/widget/FrameLayout;->drawableStateChanged()V

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_18

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContainer;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    :cond_18
    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_2d

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_2d

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContainer;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    :cond_2d
    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_42

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_42

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContainer;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    :cond_42
    return-void
.end method

.method public getTabContainer()Landroid/view/View;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mTabContainer:Landroid/view/View;

    return-object v0
.end method

.method public jumpDrawablesToCurrentState()V
    .registers 2

    invoke-super {p0}, Landroid/widget/FrameLayout;->jumpDrawablesToCurrentState()V

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_c

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    :cond_c
    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_15

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    :cond_15
    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1e

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    :cond_1e
    return-void
.end method

.method public onFinishInflate()V
    .registers 2

    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    sget v0, Landroid/support/v7/appcompat/R$id;->action_bar:I

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionBarContainer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mActionBarView:Landroid/view/View;

    sget v0, Landroid/support/v7/appcompat/R$id;->action_context_bar:I

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionBarContainer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mContextView:Landroid/view/View;

    return-void
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onHoverEvent(Landroid/view/MotionEvent;)Z

    const/4 p1, 0x1

    return p1
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    iget-boolean v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mIsTransitioning:Z

    if-nez v0, :cond_d

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_d

    :cond_b
    const/4 p1, 0x0

    goto :goto_e

    :cond_d
    :goto_d
    const/4 p1, 0x1

    :goto_e
    return p1
.end method

.method public onLayout(ZIIII)V
    .registers 11

    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mTabContainer:Landroid/view/View;

    const/16 p3, 0x8

    const/4 p5, 0x1

    const/4 v0, 0x0

    if-eqz p1, :cond_13

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eq v1, p3, :cond_13

    const/4 v1, 0x1

    goto :goto_14

    :cond_13
    const/4 v1, 0x0

    :goto_14
    if-eqz p1, :cond_35

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-eq v2, p3, :cond_35

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContainer;->getMeasuredHeight()I

    move-result p3

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    sub-int v3, p3, v3

    iget v4, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    sub-int/2addr v3, v4

    iget v2, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    sub-int/2addr p3, v2

    invoke-virtual {p1, p2, v3, p4, p3}, Landroid/view/View;->layout(IIII)V

    :cond_35
    iget-boolean p2, p0, Landroid/support/v7/widget/ActionBarContainer;->mIsSplit:Z

    if-eqz p2, :cond_4f

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_4c

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContainer;->getMeasuredWidth()I

    move-result p2

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContainer;->getMeasuredHeight()I

    move-result p3

    invoke-virtual {p1, v0, v0, p2, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto/16 :goto_c8

    :cond_4c
    const/4 p5, 0x0

    goto/16 :goto_c8

    :cond_4f
    iget-object p2, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    if-eqz p2, :cond_a9

    iget-object p2, p0, Landroid/support/v7/widget/ActionBarContainer;->mActionBarView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p2

    if-nez p2, :cond_79

    iget-object p2, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    iget-object p3, p0, Landroid/support/v7/widget/ActionBarContainer;->mActionBarView:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getLeft()I

    move-result p3

    iget-object p4, p0, Landroid/support/v7/widget/ActionBarContainer;->mActionBarView:Landroid/view/View;

    invoke-virtual {p4}, Landroid/view/View;->getTop()I

    move-result p4

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mActionBarView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v0

    iget-object v2, p0, Landroid/support/v7/widget/ActionBarContainer;->mActionBarView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v2

    invoke-virtual {p2, p3, p4, v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_a8

    :cond_79
    iget-object p2, p0, Landroid/support/v7/widget/ActionBarContainer;->mContextView:Landroid/view/View;

    if-eqz p2, :cond_a3

    iget-object p2, p0, Landroid/support/v7/widget/ActionBarContainer;->mContextView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p2

    if-nez p2, :cond_a3

    iget-object p2, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    iget-object p3, p0, Landroid/support/v7/widget/ActionBarContainer;->mContextView:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getLeft()I

    move-result p3

    iget-object p4, p0, Landroid/support/v7/widget/ActionBarContainer;->mContextView:Landroid/view/View;

    invoke-virtual {p4}, Landroid/view/View;->getTop()I

    move-result p4

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mContextView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v0

    iget-object v2, p0, Landroid/support/v7/widget/ActionBarContainer;->mContextView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v2

    invoke-virtual {p2, p3, p4, v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_a8

    :cond_a3
    iget-object p2, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, v0, v0, v0, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :goto_a8
    const/4 v0, 0x1

    :cond_a9
    iput-boolean v1, p0, Landroid/support/v7/widget/ActionBarContainer;->mIsStacked:Z

    if-eqz v1, :cond_c7

    iget-object p2, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    if-eqz p2, :cond_c7

    iget-object p2, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p3

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p4

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result p1

    invoke-virtual {p2, p3, p4, v0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_c8

    :cond_c7
    move p5, v0

    :goto_c8
    if-eqz p5, :cond_cd

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContainer;->invalidate()V

    :cond_cd
    return-void
.end method

.method public onMeasure(II)V
    .registers 6

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mActionBarView:Landroid/view/View;

    const/high16 v1, -0x80000000

    if-nez v0, :cond_1e

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-ne v0, v1, :cond_1e

    iget v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mHeight:I

    if-ltz v0, :cond_1e

    iget v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mHeight:I

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    :cond_1e
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mActionBarView:Landroid/view/View;

    if-nez p1, :cond_26

    return-void

    :cond_26
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p1

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mTabContainer:Landroid/view/View;

    if-eqz v0, :cond_77

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mTabContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v2, 0x8

    if-eq v0, v2, :cond_77

    const/high16 v0, 0x40000000    # 2.0f

    if-eq p1, v0, :cond_77

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mActionBarView:Landroid/view/View;

    invoke-direct {p0, v0}, Landroid/support/v7/widget/ActionBarContainer;->isCollapsed(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_4b

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mActionBarView:Landroid/view/View;

    invoke-direct {p0, v0}, Landroid/support/v7/widget/ActionBarContainer;->getMeasuredHeightWithMargins(Landroid/view/View;)I

    move-result v0

    goto :goto_5b

    :cond_4b
    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mContextView:Landroid/view/View;

    invoke-direct {p0, v0}, Landroid/support/v7/widget/ActionBarContainer;->isCollapsed(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_5a

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mContextView:Landroid/view/View;

    invoke-direct {p0, v0}, Landroid/support/v7/widget/ActionBarContainer;->getMeasuredHeightWithMargins(Landroid/view/View;)I

    move-result v0

    goto :goto_5b

    :cond_5a
    const/4 v0, 0x0

    :goto_5b
    if-ne p1, v1, :cond_62

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    goto :goto_65

    :cond_62
    const p1, 0x7fffffff

    :goto_65
    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContainer;->getMeasuredWidth()I

    move-result p2

    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContainer;->mTabContainer:Landroid/view/View;

    invoke-direct {p0, v1}, Landroid/support/v7/widget/ActionBarContainer;->getMeasuredHeightWithMargins(Landroid/view/View;)I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {p0, p2, p1}, Landroid/support/v7/widget/ActionBarContainer;->setMeasuredDimension(II)V

    :cond_77
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 2

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    const/4 p1, 0x1

    return p1
.end method

.method public setPrimaryBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 6

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_f

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionBarContainer;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_f
    iput-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_37

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mActionBarView:Landroid/view/View;

    if-eqz p1, :cond_37

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mActionBarView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContainer;->mActionBarView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    iget-object v2, p0, Landroid/support/v7/widget/ActionBarContainer;->mActionBarView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    move-result v2

    iget-object v3, p0, Landroid/support/v7/widget/ActionBarContainer;->mActionBarView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    move-result v3

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_37
    iget-boolean p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mIsSplit:Z

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_43

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_4c

    :goto_41
    const/4 v0, 0x1

    goto :goto_4c

    :cond_43
    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_4c

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_4c

    goto :goto_41

    :cond_4c
    :goto_4c
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionBarContainer;->setWillNotDraw(Z)V

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContainer;->invalidate()V

    return-void
.end method

.method public setSplitBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_f

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionBarContainer;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_f
    iput-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    const/4 v0, 0x0

    if-eqz p1, :cond_2c

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-boolean p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mIsSplit:Z

    if-eqz p1, :cond_2c

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_2c

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContainer;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContainer;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {p1, v0, v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_2c
    iget-boolean p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mIsSplit:Z

    const/4 v1, 0x1

    if-eqz p1, :cond_37

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_40

    :goto_35
    const/4 v0, 0x1

    goto :goto_40

    :cond_37
    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_40

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_40

    goto :goto_35

    :cond_40
    :goto_40
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionBarContainer;->setWillNotDraw(Z)V

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContainer;->invalidate()V

    return-void
.end method

.method public setStackedBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 6

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_f

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionBarContainer;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_f
    iput-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_3b

    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-boolean p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mIsStacked:Z

    if-eqz p1, :cond_3b

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_3b

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mTabContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContainer;->mTabContainer:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    iget-object v2, p0, Landroid/support/v7/widget/ActionBarContainer;->mTabContainer:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    move-result v2

    iget-object v3, p0, Landroid/support/v7/widget/ActionBarContainer;->mTabContainer:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    move-result v3

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_3b
    iget-boolean p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mIsSplit:Z

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_47

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_50

    :goto_45
    const/4 v0, 0x1

    goto :goto_50

    :cond_47
    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_50

    iget-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    if-nez p1, :cond_50

    goto :goto_45

    :cond_50
    :goto_50
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionBarContainer;->setWillNotDraw(Z)V

    invoke-virtual {p0}, Landroid/support/v7/widget/ActionBarContainer;->invalidate()V

    return-void
.end method

.method public setTabContainer(Landroid/support/v7/widget/ScrollingTabContainerView;)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mTabContainer:Landroid/view/View;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mTabContainer:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/ActionBarContainer;->removeView(Landroid/view/View;)V

    :cond_9
    iput-object p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mTabContainer:Landroid/view/View;

    if-eqz p1, :cond_1e

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ActionBarContainer;->addView(Landroid/view/View;)V

    invoke-virtual {p1}, Landroid/support/v7/widget/ScrollingTabContainerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    const/4 v1, -0x1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v1, -0x2

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/ScrollingTabContainerView;->setAllowCollapse(Z)V

    :cond_1e
    return-void
.end method

.method public setTransitioning(Z)V
    .registers 2

    iput-boolean p1, p0, Landroid/support/v7/widget/ActionBarContainer;->mIsTransitioning:Z

    if-eqz p1, :cond_7

    const/high16 p1, 0x60000

    goto :goto_9

    :cond_7
    const/high16 p1, 0x40000

    :goto_9
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ActionBarContainer;->setDescendantFocusability(I)V

    return-void
.end method

.method public setVisibility(I)V
    .registers 4

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    const/4 v0, 0x0

    if-nez p1, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    :goto_9
    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_12

    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_12
    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_1b

    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_1b
    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_24

    iget-object v1, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1, v0}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_24
    return-void
.end method

.method public startActionModeForChild(Landroid/view/View;Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .registers 3

    const/4 p1, 0x0

    return-object p1
.end method

.method public startActionModeForChild(Landroid/view/View;Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;
    .registers 4

    if-eqz p3, :cond_7

    invoke-super {p0, p1, p2, p3}, Landroid/widget/FrameLayout;->startActionModeForChild(Landroid/view/View;Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1

    :cond_7
    const/4 p1, 0x0

    return-object p1
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mBackground:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_8

    iget-boolean v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mIsSplit:Z

    if-eqz v0, :cond_1e

    :cond_8
    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_10

    iget-boolean v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mIsStacked:Z

    if-nez v0, :cond_1e

    :cond_10
    iget-object v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    if-ne p1, v0, :cond_18

    iget-boolean v0, p0, Landroid/support/v7/widget/ActionBarContainer;->mIsSplit:Z

    if-nez v0, :cond_1e

    :cond_18
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result p1

    if-eqz p1, :cond_20

    :cond_1e
    const/4 p1, 0x1

    goto :goto_21

    :cond_20
    const/4 p1, 0x0

    :goto_21
    return p1
.end method
