.class Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;
.super Landroid/view/TouchDelegate;
.source "SearchView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/SearchView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UpdatableTouchDelegate"
.end annotation


# instance fields
.field private final mActualBounds:Landroid/graphics/Rect;

.field private mDelegateTargeted:Z

.field private final mDelegateView:Landroid/view/View;

.field private final mSlop:I

.field private final mSlopBounds:Landroid/graphics/Rect;

.field private final mTargetBounds:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/view/View;)V
    .registers 5

    invoke-direct {p0, p1, p3}, Landroid/view/TouchDelegate;-><init>(Landroid/graphics/Rect;Landroid/view/View;)V

    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mSlop:I

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mTargetBounds:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mSlopBounds:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mActualBounds:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->setBounds(Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    iput-object p3, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mDelegateView:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v2, :pswitch_data_6c

    goto :goto_33

    :pswitch_14
    iget-boolean v2, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mDelegateTargeted:Z

    iput-boolean v4, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mDelegateTargeted:Z

    goto :goto_34

    :pswitch_19
    iget-boolean v2, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mDelegateTargeted:Z

    if-eqz v2, :cond_34

    iget-object v5, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mSlopBounds:Landroid/graphics/Rect;

    invoke-virtual {v5, v0, v1}, Landroid/graphics/Rect;->contains(II)Z

    move-result v5

    if-nez v5, :cond_34

    const/4 v3, 0x0

    goto :goto_34

    :pswitch_27
    iget-object v2, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mTargetBounds:Landroid/graphics/Rect;

    invoke-virtual {v2, v0, v1}, Landroid/graphics/Rect;->contains(II)Z

    move-result v2

    if-eqz v2, :cond_33

    iput-boolean v3, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mDelegateTargeted:Z

    const/4 v2, 0x1

    goto :goto_34

    :cond_33
    :goto_33
    const/4 v2, 0x0

    :cond_34
    :goto_34
    if-eqz v2, :cond_6b

    if-eqz v3, :cond_56

    iget-object v2, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mActualBounds:Landroid/graphics/Rect;

    invoke-virtual {v2, v0, v1}, Landroid/graphics/Rect;->contains(II)Z

    move-result v2

    if-nez v2, :cond_56

    iget-object v0, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mDelegateView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    iget-object v1, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mDelegateView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/view/MotionEvent;->setLocation(FF)V

    goto :goto_65

    :cond_56
    iget-object v2, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mActualBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v0, v2

    int-to-float v0, v0

    iget-object v2, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mActualBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/view/MotionEvent;->setLocation(FF)V

    :goto_65
    iget-object v0, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mDelegateView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v4

    :cond_6b
    return v4

    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_27
        :pswitch_19
        :pswitch_19
        :pswitch_14
    .end packed-switch
.end method

.method public setBounds(Landroid/graphics/Rect;Landroid/graphics/Rect;)V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mTargetBounds:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    iget-object v0, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mSlopBounds:Landroid/graphics/Rect;

    invoke-virtual {v0, p1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    iget-object p1, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mSlopBounds:Landroid/graphics/Rect;

    iget v0, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mSlop:I

    neg-int v0, v0

    iget v1, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mSlop:I

    neg-int v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Rect;->inset(II)V

    iget-object p1, p0, Landroid/support/v7/widget/SearchView$UpdatableTouchDelegate;->mActualBounds:Landroid/graphics/Rect;

    invoke-virtual {p1, p2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    return-void
.end method
