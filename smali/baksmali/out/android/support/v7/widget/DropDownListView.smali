.class Landroid/support/v7/widget/DropDownListView;
.super Landroid/widget/ListView;
.source "DropDownListView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/DropDownListView$ResolveHoverRunnable;,
        Landroid/support/v7/widget/DropDownListView$GateKeeperDrawable;
    }
.end annotation


# static fields
.field public static final INVALID_POSITION:I = -0x1

.field public static final NO_POSITION:I = -0x1


# instance fields
.field private mClickAnimation:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

.field private mDrawsInPressedState:Z

.field private mHijackFocus:Z

.field private mIsChildViewEnabled:Ljava/lang/reflect/Field;

.field private mListSelectionHidden:Z

.field private mMotionPosition:I

.field mResolveHoverRunnable:Landroid/support/v7/widget/DropDownListView$ResolveHoverRunnable;

.field private mScrollHelper:Landroid/support/v4/widget/ListViewAutoScrollHelper;

.field private mSelectionBottomPadding:I

.field private mSelectionLeftPadding:I

.field private mSelectionRightPadding:I

.field private mSelectionTopPadding:I

.field private mSelector:Landroid/support/v7/widget/DropDownListView$GateKeeperDrawable;

.field private final mSelectorRect:Landroid/graphics/Rect;


# direct methods
.method constructor <init>(Landroid/content/Context;Z)V
    .registers 5

    sget v0, Landroid/support/v7/appcompat/R$attr;->dropDownListViewStyle:I

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Landroid/support/v7/widget/DropDownListView;->mSelectorRect:Landroid/graphics/Rect;

    const/4 p1, 0x0

    iput p1, p0, Landroid/support/v7/widget/DropDownListView;->mSelectionLeftPadding:I

    iput p1, p0, Landroid/support/v7/widget/DropDownListView;->mSelectionTopPadding:I

    iput p1, p0, Landroid/support/v7/widget/DropDownListView;->mSelectionRightPadding:I

    iput p1, p0, Landroid/support/v7/widget/DropDownListView;->mSelectionBottomPadding:I

    iput-boolean p2, p0, Landroid/support/v7/widget/DropDownListView;->mHijackFocus:Z

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/DropDownListView;->setCacheColorHint(I)V

    :try_start_1b
    const-class p1, Landroid/widget/AbsListView;

    const-string p2, "mIsChildViewEnabled"

    invoke-virtual {p1, p2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v7/widget/DropDownListView;->mIsChildViewEnabled:Ljava/lang/reflect/Field;

    iget-object p1, p0, Landroid/support/v7/widget/DropDownListView;->mIsChildViewEnabled:Ljava/lang/reflect/Field;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->setAccessible(Z)V
    :try_end_2b
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1b .. :try_end_2b} :catch_2c

    goto :goto_30

    :catch_2c
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/NoSuchFieldException;->printStackTrace()V

    :goto_30
    return-void
.end method

.method private clearPressedItem()V
    .registers 4

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/DropDownListView;->mDrawsInPressedState:Z

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/DropDownListView;->setPressed(Z)V

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->drawableStateChanged()V

    iget v1, p0, Landroid/support/v7/widget/DropDownListView;->mMotionPosition:I

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getFirstVisiblePosition()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/DropDownListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_19

    invoke-virtual {v1, v0}, Landroid/view/View;->setPressed(Z)V

    :cond_19
    iget-object v0, p0, Landroid/support/v7/widget/DropDownListView;->mClickAnimation:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    if-eqz v0, :cond_25

    iget-object v0, p0, Landroid/support/v7/widget/DropDownListView;->mClickAnimation:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/DropDownListView;->mClickAnimation:Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    :cond_25
    return-void
.end method

.method private clickPressedItem(Landroid/view/View;I)V
    .registers 5

    invoke-virtual {p0, p2}, Landroid/support/v7/widget/DropDownListView;->getItemIdAtPosition(I)J

    move-result-wide v0

    invoke-virtual {p0, p1, p2, v0, v1}, Landroid/support/v7/widget/DropDownListView;->performItemClick(Landroid/view/View;IJ)Z

    return-void
.end method

.method private drawSelectorCompat(Landroid/graphics/Canvas;)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/DropDownListView;->mSelectorRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_16

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getSelector()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_16

    iget-object v1, p0, Landroid/support/v7/widget/DropDownListView;->mSelectorRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_16
    return-void
.end method

.method private positionSelectorCompat(ILandroid/view/View;)V
    .registers 8

    iget-object v0, p0, Landroid/support/v7/widget/DropDownListView;->mSelectorRect:Landroid/graphics/Rect;

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v2

    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result v3

    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    iget v1, v0, Landroid/graphics/Rect;->left:I

    iget v2, p0, Landroid/support/v7/widget/DropDownListView;->mSelectionLeftPadding:I

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->left:I

    iget v1, v0, Landroid/graphics/Rect;->top:I

    iget v2, p0, Landroid/support/v7/widget/DropDownListView;->mSelectionTopPadding:I

    sub-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->top:I

    iget v1, v0, Landroid/graphics/Rect;->right:I

    iget v2, p0, Landroid/support/v7/widget/DropDownListView;->mSelectionRightPadding:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->right:I

    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    iget v2, p0, Landroid/support/v7/widget/DropDownListView;->mSelectionBottomPadding:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    :try_start_31
    iget-object v0, p0, Landroid/support/v7/widget/DropDownListView;->mIsChildViewEnabled:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {p2}, Landroid/view/View;->isEnabled()Z

    move-result p2

    if-eq p2, v0, :cond_53

    iget-object p2, p0, Landroid/support/v7/widget/DropDownListView;->mIsChildViewEnabled:Ljava/lang/reflect/Field;

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p2, p0, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p2, -0x1

    if-eq p1, p2, :cond_53

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->refreshDrawableState()V
    :try_end_4e
    .catch Ljava/lang/IllegalAccessException; {:try_start_31 .. :try_end_4e} :catch_4f

    goto :goto_53

    :catch_4f
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    :cond_53
    :goto_53
    return-void
.end method

.method private positionSelectorLikeFocusCompat(ILandroid/view/View;)V
    .registers 7

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getSelector()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_d

    const/4 v3, -0x1

    if-eq p1, v3, :cond_d

    const/4 v3, 0x1

    goto :goto_e

    :cond_d
    const/4 v3, 0x0

    :goto_e
    if-eqz v3, :cond_13

    invoke-virtual {v0, v2, v2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    :cond_13
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/DropDownListView;->positionSelectorCompat(ILandroid/view/View;)V

    if-eqz v3, :cond_30

    iget-object p1, p0, Landroid/support/v7/widget/DropDownListView;->mSelectorRect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterX()F

    move-result p2

    invoke-virtual {p1}, Landroid/graphics/Rect;->exactCenterY()F

    move-result p1

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getVisibility()I

    move-result v3

    if-nez v3, :cond_29

    goto :goto_2a

    :cond_29
    const/4 v1, 0x0

    :goto_2a
    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    invoke-static {v0, p2, p1}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setHotspot(Landroid/graphics/drawable/Drawable;FF)V

    :cond_30
    return-void
.end method

.method private positionSelectorLikeTouchCompat(ILandroid/view/View;FF)V
    .registers 6

    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/DropDownListView;->positionSelectorLikeFocusCompat(ILandroid/view/View;)V

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getSelector()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eqz p2, :cond_f

    const/4 v0, -0x1

    if-eq p1, v0, :cond_f

    invoke-static {p2, p3, p4}, Landroid/support/v4/graphics/drawable/DrawableCompat;->setHotspot(Landroid/graphics/drawable/Drawable;FF)V

    :cond_f
    return-void
.end method

.method private setPressedItem(Landroid/view/View;IFF)V
    .registers 11

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/DropDownListView;->mDrawsInPressedState:Z

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_c

    invoke-virtual {p0, p3, p4}, Landroid/support/v7/widget/DropDownListView;->drawableHotspotChanged(FF)V

    :cond_c
    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->isPressed()Z

    move-result v1

    if-nez v1, :cond_15

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/DropDownListView;->setPressed(Z)V

    :cond_15
    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->layoutChildren()V

    iget v1, p0, Landroid/support/v7/widget/DropDownListView;->mMotionPosition:I

    const/4 v3, -0x1

    const/4 v4, 0x0

    if-eq v1, v3, :cond_36

    iget v1, p0, Landroid/support/v7/widget/DropDownListView;->mMotionPosition:I

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getFirstVisiblePosition()I

    move-result v3

    sub-int/2addr v1, v3

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/DropDownListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_36

    if-eq v1, p1, :cond_36

    invoke-virtual {v1}, Landroid/view/View;->isPressed()Z

    move-result v3

    if-eqz v3, :cond_36

    invoke-virtual {v1, v4}, Landroid/view/View;->setPressed(Z)V

    :cond_36
    iput p2, p0, Landroid/support/v7/widget/DropDownListView;->mMotionPosition:I

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    int-to-float v1, v1

    sub-float v1, p3, v1

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v3

    int-to-float v3, v3

    sub-float v3, p4, v3

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v2, :cond_4d

    invoke-virtual {p1, v1, v3}, Landroid/view/View;->drawableHotspotChanged(FF)V

    :cond_4d
    invoke-virtual {p1}, Landroid/view/View;->isPressed()Z

    move-result v1

    if-nez v1, :cond_56

    invoke-virtual {p1, v0}, Landroid/view/View;->setPressed(Z)V

    :cond_56
    invoke-direct {p0, p2, p1, p3, p4}, Landroid/support/v7/widget/DropDownListView;->positionSelectorLikeTouchCompat(ILandroid/view/View;FF)V

    invoke-direct {p0, v4}, Landroid/support/v7/widget/DropDownListView;->setSelectorEnabled(Z)V

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->refreshDrawableState()V

    return-void
.end method

.method private setSelectorEnabled(Z)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/DropDownListView;->mSelector:Landroid/support/v7/widget/DropDownListView$GateKeeperDrawable;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/DropDownListView;->mSelector:Landroid/support/v7/widget/DropDownListView$GateKeeperDrawable;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/DropDownListView$GateKeeperDrawable;->setEnabled(Z)V

    :cond_9
    return-void
.end method

.method private touchModeDrawsInPressedStateCompat()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/DropDownListView;->mDrawsInPressedState:Z

    return v0
.end method

.method private updateSelectorStateCompat()V
    .registers 3

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getSelector()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_19

    invoke-direct {p0}, Landroid/support/v7/widget/DropDownListView;->touchModeDrawsInPressedStateCompat()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->isPressed()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    :cond_19
    return-void
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/support/v7/widget/DropDownListView;->drawSelectorCompat(Landroid/graphics/Canvas;)V

    invoke-super {p0, p1}, Landroid/widget/ListView;->dispatchDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected drawableStateChanged()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/DropDownListView;->mResolveHoverRunnable:Landroid/support/v7/widget/DropDownListView$ResolveHoverRunnable;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-super {p0}, Landroid/widget/ListView;->drawableStateChanged()V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Landroid/support/v7/widget/DropDownListView;->setSelectorEnabled(Z)V

    invoke-direct {p0}, Landroid/support/v7/widget/DropDownListView;->updateSelectorStateCompat()V

    return-void
.end method

.method public hasFocus()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/DropDownListView;->mHijackFocus:Z

    if-nez v0, :cond_d

    invoke-super {p0}, Landroid/widget/ListView;->hasFocus()Z

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

.method public hasWindowFocus()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/DropDownListView;->mHijackFocus:Z

    if-nez v0, :cond_d

    invoke-super {p0}, Landroid/widget/ListView;->hasWindowFocus()Z

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

.method public isFocused()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/DropDownListView;->mHijackFocus:Z

    if-nez v0, :cond_d

    invoke-super {p0}, Landroid/widget/ListView;->isFocused()Z

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

.method public isInTouchMode()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/DropDownListView;->mHijackFocus:Z

    if-eqz v0, :cond_8

    iget-boolean v0, p0, Landroid/support/v7/widget/DropDownListView;->mListSelectionHidden:Z

    if-nez v0, :cond_e

    :cond_8
    invoke-super {p0}, Landroid/widget/ListView;->isInTouchMode()Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method public lookForSelectablePosition(IZ)I
    .registers 7

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    const/4 v1, -0x1

    if-eqz v0, :cond_4d

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->isInTouchMode()Z

    move-result v2

    if-eqz v2, :cond_e

    goto :goto_4d

    :cond_e
    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v2

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v3

    invoke-interface {v3}, Landroid/widget/ListAdapter;->areAllItemsEnabled()Z

    move-result v3

    if-nez v3, :cond_46

    if-eqz p2, :cond_2e

    const/4 p2, 0x0

    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    :goto_23
    if-ge p1, v2, :cond_3f

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result p2

    if-nez p2, :cond_3f

    add-int/lit8 p1, p1, 0x1

    goto :goto_23

    :cond_2e
    add-int/lit8 p2, v2, -0x1

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    :goto_34
    if-ltz p1, :cond_3f

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result p2

    if-nez p2, :cond_3f

    add-int/lit8 p1, p1, -0x1

    goto :goto_34

    :cond_3f
    if-ltz p1, :cond_45

    if-lt p1, v2, :cond_44

    goto :goto_45

    :cond_44
    return p1

    :cond_45
    :goto_45
    return v1

    :cond_46
    if-ltz p1, :cond_4c

    if-lt p1, v2, :cond_4b

    goto :goto_4c

    :cond_4b
    return p1

    :cond_4c
    :goto_4c
    return v1

    :cond_4d
    :goto_4d
    return v1
.end method

.method public measureHeightOfChildrenCompat(IIIII)I
    .registers 16

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getListPaddingTop()I

    move-result p2

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getListPaddingBottom()I

    move-result p3

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getListPaddingLeft()I

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getListPaddingRight()I

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getDividerHeight()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getDivider()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    if-nez v2, :cond_1e

    add-int/2addr p2, p3

    return p2

    :cond_1e
    add-int/2addr p2, p3

    const/4 p3, 0x0

    if-lez v0, :cond_25

    if-eqz v1, :cond_25

    goto :goto_26

    :cond_25
    const/4 v0, 0x0

    :goto_26
    invoke-interface {v2}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    const/4 v3, 0x0

    move v5, p2

    move-object v6, v3

    const/4 p2, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x0

    :goto_30
    if-ge p2, v1, :cond_7e

    invoke-interface {v2, p2}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result v8

    if-eq v8, v4, :cond_3a

    move-object v6, v3

    move v4, v8

    :cond_3a
    invoke-interface {v2, p2, v6, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    if-nez v8, :cond_4b

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_4b
    iget v9, v8, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-lez v9, :cond_58

    iget v8, v8, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/high16 v9, 0x40000000    # 2.0f

    invoke-static {v8, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    goto :goto_5c

    :cond_58
    invoke-static {p3, p3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    :goto_5c
    invoke-virtual {v6, p1, v8}, Landroid/view/View;->measure(II)V

    invoke-virtual {v6}, Landroid/view/View;->forceLayout()V

    if-lez p2, :cond_65

    add-int/2addr v5, v0

    :cond_65
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    add-int/2addr v5, v8

    if-lt v5, p4, :cond_76

    if-ltz p5, :cond_75

    if-le p2, p5, :cond_75

    if-lez v7, :cond_75

    if-eq v5, p4, :cond_75

    move p4, v7

    :cond_75
    return p4

    :cond_76
    if-ltz p5, :cond_7b

    if-lt p2, p5, :cond_7b

    move v7, v5

    :cond_7b
    add-int/lit8 p2, p2, 0x1

    goto :goto_30

    :cond_7e
    return v5
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/DropDownListView;->mResolveHoverRunnable:Landroid/support/v7/widget/DropDownListView$ResolveHoverRunnable;

    invoke-super {p0}, Landroid/widget/ListView;->onDetachedFromWindow()V

    return-void
.end method

.method public onForwardedEvent(Landroid/view/MotionEvent;I)Z
    .registers 10

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_6a

    :cond_9
    :goto_9
    const/4 p2, 0x0

    const/4 v3, 0x1

    goto :goto_41

    :goto_c
    :pswitch_c
    const/4 p2, 0x0

    const/4 v3, 0x0

    goto :goto_41

    :pswitch_f
    const/4 v3, 0x1

    goto :goto_12

    :pswitch_11
    const/4 v3, 0x0

    :goto_12
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result p2

    if-gez p2, :cond_19

    goto :goto_c

    :cond_19
    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {p1, p2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p2

    float-to-int p2, p2

    invoke-virtual {p0, v4, p2}, Landroid/support/v7/widget/DropDownListView;->pointToPosition(II)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_2c

    const/4 p2, 0x1

    goto :goto_41

    :cond_2c
    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getFirstVisiblePosition()I

    move-result v3

    sub-int v3, v5, v3

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/DropDownListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    int-to-float v4, v4

    int-to-float p2, p2

    invoke-direct {p0, v3, v5, v4, p2}, Landroid/support/v7/widget/DropDownListView;->setPressedItem(Landroid/view/View;IFF)V

    if-ne v0, v2, :cond_9

    invoke-direct {p0, v3, v5}, Landroid/support/v7/widget/DropDownListView;->clickPressedItem(Landroid/view/View;I)V

    goto :goto_9

    :goto_41
    if-eqz v3, :cond_45

    if-eqz p2, :cond_48

    :cond_45
    invoke-direct {p0}, Landroid/support/v7/widget/DropDownListView;->clearPressedItem()V

    :cond_48
    if-eqz v3, :cond_60

    iget-object p2, p0, Landroid/support/v7/widget/DropDownListView;->mScrollHelper:Landroid/support/v4/widget/ListViewAutoScrollHelper;

    if-nez p2, :cond_55

    new-instance p2, Landroid/support/v4/widget/ListViewAutoScrollHelper;

    invoke-direct {p2, p0}, Landroid/support/v4/widget/ListViewAutoScrollHelper;-><init>(Landroid/widget/ListView;)V

    iput-object p2, p0, Landroid/support/v7/widget/DropDownListView;->mScrollHelper:Landroid/support/v4/widget/ListViewAutoScrollHelper;

    :cond_55
    iget-object p2, p0, Landroid/support/v7/widget/DropDownListView;->mScrollHelper:Landroid/support/v4/widget/ListViewAutoScrollHelper;

    invoke-virtual {p2, v2}, Landroid/support/v4/widget/ListViewAutoScrollHelper;->setEnabled(Z)Landroid/support/v4/widget/AutoScrollHelper;

    iget-object p2, p0, Landroid/support/v7/widget/DropDownListView;->mScrollHelper:Landroid/support/v4/widget/ListViewAutoScrollHelper;

    invoke-virtual {p2, p0, p1}, Landroid/support/v4/widget/ListViewAutoScrollHelper;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    goto :goto_69

    :cond_60
    iget-object p1, p0, Landroid/support/v7/widget/DropDownListView;->mScrollHelper:Landroid/support/v4/widget/ListViewAutoScrollHelper;

    if-eqz p1, :cond_69

    iget-object p1, p0, Landroid/support/v7/widget/DropDownListView;->mScrollHelper:Landroid/support/v4/widget/ListViewAutoScrollHelper;

    invoke-virtual {p1, v1}, Landroid/support/v4/widget/ListViewAutoScrollHelper;->setEnabled(Z)Landroid/support/v4/widget/AutoScrollHelper;

    :cond_69
    :goto_69
    return v3

    :pswitch_data_6a
    .packed-switch 0x1
        :pswitch_11
        :pswitch_f
        :pswitch_c
    .end packed-switch
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_b

    invoke-super {p0, p1}, Landroid/widget/ListView;->onHoverEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_b
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/16 v1, 0xa

    if-ne v0, v1, :cond_23

    iget-object v1, p0, Landroid/support/v7/widget/DropDownListView;->mResolveHoverRunnable:Landroid/support/v7/widget/DropDownListView$ResolveHoverRunnable;

    if-nez v1, :cond_23

    new-instance v1, Landroid/support/v7/widget/DropDownListView$ResolveHoverRunnable;

    invoke-direct {v1, p0}, Landroid/support/v7/widget/DropDownListView$ResolveHoverRunnable;-><init>(Landroid/support/v7/widget/DropDownListView;)V

    iput-object v1, p0, Landroid/support/v7/widget/DropDownListView;->mResolveHoverRunnable:Landroid/support/v7/widget/DropDownListView$ResolveHoverRunnable;

    iget-object v1, p0, Landroid/support/v7/widget/DropDownListView;->mResolveHoverRunnable:Landroid/support/v7/widget/DropDownListView$ResolveHoverRunnable;

    invoke-virtual {v1}, Landroid/support/v7/widget/DropDownListView$ResolveHoverRunnable;->post()V

    :cond_23
    invoke-super {p0, p1}, Landroid/widget/ListView;->onHoverEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    const/16 v2, 0x9

    const/4 v3, -0x1

    if-eq v0, v2, :cond_34

    const/4 v2, 0x7

    if-ne v0, v2, :cond_30

    goto :goto_34

    :cond_30
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/DropDownListView;->setSelection(I)V

    goto :goto_69

    :cond_34
    :goto_34
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {p0, v0, p1}, Landroid/support/v7/widget/DropDownListView;->pointToPosition(II)I

    move-result p1

    if-eq p1, v3, :cond_69

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getSelectedItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_69

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getFirstVisiblePosition()I

    move-result v0

    sub-int v0, p1, v0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/DropDownListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_66

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/widget/DropDownListView;->getTop()I

    move-result v2

    sub-int/2addr v0, v2

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/widget/DropDownListView;->setSelectionFromTop(II)V

    :cond_66
    invoke-direct {p0}, Landroid/support/v7/widget/DropDownListView;->updateSelectorStateCompat()V

    :cond_69
    :goto_69
    return v1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-eqz v0, :cond_7

    goto :goto_17

    :cond_7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/widget/DropDownListView;->pointToPosition(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/DropDownListView;->mMotionPosition:I

    :goto_17
    iget-object v0, p0, Landroid/support/v7/widget/DropDownListView;->mResolveHoverRunnable:Landroid/support/v7/widget/DropDownListView$ResolveHoverRunnable;

    if-eqz v0, :cond_20

    iget-object v0, p0, Landroid/support/v7/widget/DropDownListView;->mResolveHoverRunnable:Landroid/support/v7/widget/DropDownListView$ResolveHoverRunnable;

    invoke-virtual {v0}, Landroid/support/v7/widget/DropDownListView$ResolveHoverRunnable;->cancel()V

    :cond_20
    invoke-super {p0, p1}, Landroid/widget/ListView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method setListSelectionHidden(Z)V
    .registers 2

    iput-boolean p1, p0, Landroid/support/v7/widget/DropDownListView;->mListSelectionHidden:Z

    return-void
.end method

.method public setSelector(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    if-eqz p1, :cond_8

    new-instance v0, Landroid/support/v7/widget/DropDownListView$GateKeeperDrawable;

    invoke-direct {v0, p1}, Landroid/support/v7/widget/DropDownListView$GateKeeperDrawable;-><init>(Landroid/graphics/drawable/Drawable;)V

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    iput-object v0, p0, Landroid/support/v7/widget/DropDownListView;->mSelector:Landroid/support/v7/widget/DropDownListView$GateKeeperDrawable;

    iget-object v0, p0, Landroid/support/v7/widget/DropDownListView;->mSelector:Landroid/support/v7/widget/DropDownListView$GateKeeperDrawable;

    invoke-super {p0, v0}, Landroid/widget/ListView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    if-eqz p1, :cond_1a

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    :cond_1a
    iget p1, v0, Landroid/graphics/Rect;->left:I

    iput p1, p0, Landroid/support/v7/widget/DropDownListView;->mSelectionLeftPadding:I

    iget p1, v0, Landroid/graphics/Rect;->top:I

    iput p1, p0, Landroid/support/v7/widget/DropDownListView;->mSelectionTopPadding:I

    iget p1, v0, Landroid/graphics/Rect;->right:I

    iput p1, p0, Landroid/support/v7/widget/DropDownListView;->mSelectionRightPadding:I

    iget p1, v0, Landroid/graphics/Rect;->bottom:I

    iput p1, p0, Landroid/support/v7/widget/DropDownListView;->mSelectionBottomPadding:I

    return-void
.end method
