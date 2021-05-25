.class public Landroid/support/v13/view/DragStartHelper;
.super Ljava/lang/Object;
.source "DragStartHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v13/view/DragStartHelper$OnDragStartListener;
    }
.end annotation


# instance fields
.field private mDragging:Z

.field private mLastTouchX:I

.field private mLastTouchY:I

.field private final mListener:Landroid/support/v13/view/DragStartHelper$OnDragStartListener;

.field private final mLongClickListener:Landroid/view/View$OnLongClickListener;

.field private final mTouchListener:Landroid/view/View$OnTouchListener;

.field private final mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/support/v13/view/DragStartHelper$OnDragStartListener;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/support/v13/view/DragStartHelper$1;

    invoke-direct {v0, p0}, Landroid/support/v13/view/DragStartHelper$1;-><init>(Landroid/support/v13/view/DragStartHelper;)V

    iput-object v0, p0, Landroid/support/v13/view/DragStartHelper;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    new-instance v0, Landroid/support/v13/view/DragStartHelper$2;

    invoke-direct {v0, p0}, Landroid/support/v13/view/DragStartHelper$2;-><init>(Landroid/support/v13/view/DragStartHelper;)V

    iput-object v0, p0, Landroid/support/v13/view/DragStartHelper;->mTouchListener:Landroid/view/View$OnTouchListener;

    iput-object p1, p0, Landroid/support/v13/view/DragStartHelper;->mView:Landroid/view/View;

    iput-object p2, p0, Landroid/support/v13/view/DragStartHelper;->mListener:Landroid/support/v13/view/DragStartHelper$OnDragStartListener;

    return-void
.end method


# virtual methods
.method public attach()V
    .registers 3

    iget-object v0, p0, Landroid/support/v13/view/DragStartHelper;->mView:Landroid/view/View;

    iget-object v1, p0, Landroid/support/v13/view/DragStartHelper;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object v0, p0, Landroid/support/v13/view/DragStartHelper;->mView:Landroid/view/View;

    iget-object v1, p0, Landroid/support/v13/view/DragStartHelper;->mTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method public detach()V
    .registers 3

    iget-object v0, p0, Landroid/support/v13/view/DragStartHelper;->mView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object v0, p0, Landroid/support/v13/view/DragStartHelper;->mView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method public getTouchPosition(Landroid/graphics/Point;)V
    .registers 4

    iget v0, p0, Landroid/support/v13/view/DragStartHelper;->mLastTouchX:I

    iget v1, p0, Landroid/support/v13/view/DragStartHelper;->mLastTouchY:I

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Point;->set(II)V

    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .registers 3

    iget-object v0, p0, Landroid/support/v13/view/DragStartHelper;->mListener:Landroid/support/v13/view/DragStartHelper$OnDragStartListener;

    invoke-interface {v0, p1, p0}, Landroid/support/v13/view/DragStartHelper$OnDragStartListener;->onDragStart(Landroid/view/View;Landroid/support/v13/view/DragStartHelper;)Z

    move-result p1

    return p1
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 7

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v2

    const/4 v3, 0x0

    packed-switch v2, :pswitch_data_4a

    goto :goto_48

    :pswitch_13
    const/16 v2, 0x2002

    invoke-static {p2, v2}, Landroid/support/v4/view/MotionEventCompat;->isFromSource(Landroid/view/MotionEvent;I)Z

    move-result v2

    if-eqz v2, :cond_48

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getButtonState()I

    move-result p2

    and-int/lit8 p2, p2, 0x1

    if-nez p2, :cond_24

    goto :goto_48

    :cond_24
    iget-boolean p2, p0, Landroid/support/v13/view/DragStartHelper;->mDragging:Z

    if-eqz p2, :cond_29

    goto :goto_48

    :cond_29
    iget p2, p0, Landroid/support/v13/view/DragStartHelper;->mLastTouchX:I

    if-ne p2, v0, :cond_32

    iget p2, p0, Landroid/support/v13/view/DragStartHelper;->mLastTouchY:I

    if-ne p2, v1, :cond_32

    goto :goto_48

    :cond_32
    iput v0, p0, Landroid/support/v13/view/DragStartHelper;->mLastTouchX:I

    iput v1, p0, Landroid/support/v13/view/DragStartHelper;->mLastTouchY:I

    iget-object p2, p0, Landroid/support/v13/view/DragStartHelper;->mListener:Landroid/support/v13/view/DragStartHelper$OnDragStartListener;

    invoke-interface {p2, p1, p0}, Landroid/support/v13/view/DragStartHelper$OnDragStartListener;->onDragStart(Landroid/view/View;Landroid/support/v13/view/DragStartHelper;)Z

    move-result p1

    iput-boolean p1, p0, Landroid/support/v13/view/DragStartHelper;->mDragging:Z

    iget-boolean p1, p0, Landroid/support/v13/view/DragStartHelper;->mDragging:Z

    return p1

    :pswitch_41
    iput-boolean v3, p0, Landroid/support/v13/view/DragStartHelper;->mDragging:Z

    goto :goto_48

    :pswitch_44
    iput v0, p0, Landroid/support/v13/view/DragStartHelper;->mLastTouchX:I

    iput v1, p0, Landroid/support/v13/view/DragStartHelper;->mLastTouchY:I

    :cond_48
    :goto_48
    return v3

    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_44
        :pswitch_41
        :pswitch_13
        :pswitch_41
    .end packed-switch
.end method
