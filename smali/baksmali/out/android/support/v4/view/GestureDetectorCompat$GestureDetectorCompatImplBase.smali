.class Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;
.super Ljava/lang/Object;
.source "GestureDetectorCompat.java"

# interfaces
.implements Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/GestureDetectorCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "GestureDetectorCompatImplBase"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;
    }
.end annotation


# static fields
.field private static final DOUBLE_TAP_TIMEOUT:I

.field private static final LONGPRESS_TIMEOUT:I

.field private static final LONG_PRESS:I = 0x2

.field private static final SHOW_PRESS:I = 0x1

.field private static final TAP:I = 0x3

.field private static final TAP_TIMEOUT:I


# instance fields
.field private mAlwaysInBiggerTapRegion:Z

.field private mAlwaysInTapRegion:Z

.field mCurrentDownEvent:Landroid/view/MotionEvent;

.field mDeferConfirmSingleTap:Z

.field mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

.field private mDoubleTapSlopSquare:I

.field private mDownFocusX:F

.field private mDownFocusY:F

.field private final mHandler:Landroid/os/Handler;

.field private mInLongPress:Z

.field private mIsDoubleTapping:Z

.field private mIsLongpressEnabled:Z

.field private mLastFocusX:F

.field private mLastFocusY:F

.field final mListener:Landroid/view/GestureDetector$OnGestureListener;

.field private mMaximumFlingVelocity:I

.field private mMinimumFlingVelocity:I

.field private mPreviousUpEvent:Landroid/view/MotionEvent;

.field mStillDown:Z

.field private mTouchSlopSquare:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v0

    sput v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->LONGPRESS_TIMEOUT:I

    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v0

    sput v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->TAP_TIMEOUT:I

    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    move-result v0

    sput v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->DOUBLE_TAP_TIMEOUT:I

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p3, :cond_d

    new-instance v0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;

    invoke-direct {v0, p0, p3}, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;-><init>(Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;Landroid/os/Handler;)V

    iput-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    goto :goto_14

    :cond_d
    new-instance p3, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;

    invoke-direct {p3, p0}, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase$GestureHandler;-><init>(Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;)V

    iput-object p3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    :goto_14
    iput-object p2, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    instance-of p3, p2, Landroid/view/GestureDetector$OnDoubleTapListener;

    if-eqz p3, :cond_1f

    check-cast p2, Landroid/view/GestureDetector$OnDoubleTapListener;

    invoke-virtual {p0, p2}, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    :cond_1f
    invoke-direct {p0, p1}, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->init(Landroid/content/Context;)V

    return-void
.end method

.method private cancel()V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mStillDown:Z

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInBiggerTapRegion:Z

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    iget-boolean v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    if-eqz v1, :cond_2b

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    :cond_2b
    return-void
.end method

.method private cancelTaps()V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInBiggerTapRegion:Z

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    iget-boolean v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    if-eqz v1, :cond_21

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    :cond_21
    return-void
.end method

.method private init(Landroid/content/Context;)V
    .registers 5

    if-eqz p1, :cond_32

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    if-eqz v0, :cond_2a

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsLongpressEnabled:Z

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledDoubleTapSlop()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v2

    iput v2, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mMinimumFlingVelocity:I

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result p1

    iput p1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mMaximumFlingVelocity:I

    mul-int v0, v0, v0

    iput v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mTouchSlopSquare:I

    mul-int v1, v1, v1

    iput v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapSlopSquare:I

    return-void

    :cond_2a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "OnGestureListener must not be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_32
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Context must not be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private isConsideredDoubleTap(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z
    .registers 10

    iget-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInBiggerTapRegion:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    sget p2, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->DOUBLE_TAP_TIMEOUT:I

    int-to-long v4, p2

    cmp-long p2, v2, v4

    if-lez p2, :cond_17

    return v1

    :cond_17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p2

    float-to-int p2, p2

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    sub-int/2addr p2, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result p3

    float-to-int p3, p3

    sub-int/2addr p1, p3

    mul-int p2, p2, p2

    mul-int p1, p1, p1

    add-int/2addr p2, p1

    iget p1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapSlopSquare:I

    if-ge p2, p1, :cond_37

    const/4 v1, 0x1

    :cond_37
    return v1
.end method


# virtual methods
.method dispatchLongPress()V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-interface {v0, v1}, Landroid/view/GestureDetector$OnGestureListener;->onLongPress(Landroid/view/MotionEvent;)V

    return-void
.end method

.method public isLongpressEnabled()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsLongpressEnabled:Z

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 13

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v1, :cond_e

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_e
    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v1, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    and-int/lit16 v0, v0, 0xff

    const/4 v1, 0x6

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_1c

    const/4 v1, 0x1

    goto :goto_1d

    :cond_1c
    const/4 v1, 0x0

    :goto_1d
    if-eqz v1, :cond_24

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v4

    goto :goto_25

    :cond_24
    const/4 v4, -0x1

    :goto_25
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_2d
    if-ge v7, v5, :cond_3f

    if-ne v4, v7, :cond_32

    goto :goto_3c

    :cond_32
    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getX(I)F

    move-result v10

    add-float/2addr v8, v10

    invoke-virtual {p1, v7}, Landroid/view/MotionEvent;->getY(I)F

    move-result v10

    add-float/2addr v9, v10

    :goto_3c
    add-int/lit8 v7, v7, 0x1

    goto :goto_2d

    :cond_3f
    if-eqz v1, :cond_44

    add-int/lit8 v1, v5, -0x1

    goto :goto_45

    :cond_44
    move v1, v5

    :goto_45
    int-to-float v1, v1

    div-float/2addr v8, v1

    div-float/2addr v9, v1

    const/16 v1, 0x3e8

    const/4 v4, 0x2

    const/4 v7, 0x3

    packed-switch v0, :pswitch_data_252

    :pswitch_4f
    goto/16 :goto_250

    :pswitch_51
    iput v8, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    iput v8, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusX:F

    iput v9, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    iput v9, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusY:F

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v2, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mMaximumFlingVelocity:I

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    iget-object v2, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v2

    iget-object v4, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v4, v1}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v1

    const/4 v4, 0x0

    :goto_76
    if-ge v4, v5, :cond_250

    if-ne v4, v0, :cond_7b

    goto :goto_9b

    :cond_7b
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v7

    iget-object v8, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v8, v7}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v8

    mul-float v8, v8, v2

    iget-object v9, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v9, v7}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v7

    mul-float v7, v7, v1

    add-float/2addr v8, v7

    cmpg-float v7, v8, v6

    if-gez v7, :cond_9b

    iget-object p1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->clear()V

    goto/16 :goto_250

    :cond_9b
    :goto_9b
    add-int/lit8 v4, v4, 0x1

    goto :goto_76

    :pswitch_9e
    iput v8, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    iput v8, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusX:F

    iput v9, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    iput v9, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusY:F

    invoke-direct {p0}, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->cancelTaps()V

    goto/16 :goto_250

    :pswitch_ab
    invoke-direct {p0}, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->cancel()V

    goto/16 :goto_250

    :pswitch_b0
    iget-boolean v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    if-eqz v0, :cond_b6

    goto/16 :goto_250

    :cond_b6
    iget v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    sub-float/2addr v0, v8

    iget v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    sub-float/2addr v1, v9

    iget-boolean v5, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    if-eqz v5, :cond_c9

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    invoke-interface {v0, p1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    or-int/2addr v3, p1

    goto/16 :goto_250

    :cond_c9
    iget-boolean v5, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    if-eqz v5, :cond_107

    iget v5, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusX:F

    sub-float v5, v8, v5

    float-to-int v5, v5

    iget v6, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusY:F

    sub-float v6, v9, v6

    float-to-int v6, v6

    mul-int v5, v5, v5

    mul-int v6, v6, v6

    add-int/2addr v5, v6

    iget v6, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mTouchSlopSquare:I

    if-le v5, v6, :cond_fe

    iget-object v6, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    iget-object v10, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-interface {v6, v10, p1, v0, v1}, Landroid/view/GestureDetector$OnGestureListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result p1

    iput v8, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    iput v9, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    iput-boolean v3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v7}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_ff

    :cond_fe
    const/4 p1, 0x0

    :goto_ff
    iget v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mTouchSlopSquare:I

    if-le v5, v0, :cond_1b8

    iput-boolean v3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInBiggerTapRegion:Z

    goto/16 :goto_1b8

    :cond_107
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v2, v2, v4

    if-gez v2, :cond_119

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpl-float v2, v2, v4

    if-ltz v2, :cond_250

    :cond_119
    iget-object v2, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    iget-object v3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-interface {v2, v3, p1, v0, v1}, Landroid/view/GestureDetector$OnGestureListener;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v3

    iput v8, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    iput v9, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    goto/16 :goto_250

    :pswitch_127
    iput-boolean v3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mStillDown:Z

    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    iget-boolean v5, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    if-eqz v5, :cond_139

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    invoke-interface {v1, p1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    or-int/2addr p1, v3

    goto :goto_193

    :cond_139
    iget-boolean v5, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    if-eqz v5, :cond_145

    iget-object p1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v7}, Landroid/os/Handler;->removeMessages(I)V

    iput-boolean v3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    goto :goto_189

    :cond_145
    iget-boolean v5, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    if-eqz v5, :cond_15e

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    invoke-interface {v1, p1}, Landroid/view/GestureDetector$OnGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result v1

    iget-boolean v5, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    if-eqz v5, :cond_15c

    iget-object v5, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    if-eqz v5, :cond_15c

    iget-object v5, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    invoke-interface {v5, p1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    :cond_15c
    move p1, v1

    goto :goto_193

    :cond_15e
    iget-object v5, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    iget v7, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mMaximumFlingVelocity:I

    int-to-float v7, v7

    invoke-virtual {v5, v1, v7}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    invoke-virtual {v5, v6}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v1

    invoke-virtual {v5, v6}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v5

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mMinimumFlingVelocity:I

    int-to-float v7, v7

    cmpl-float v6, v6, v7

    if-gtz v6, :cond_18b

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mMinimumFlingVelocity:I

    int-to-float v7, v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_189

    goto :goto_18b

    :cond_189
    :goto_189
    const/4 p1, 0x0

    goto :goto_193

    :cond_18b
    :goto_18b
    iget-object v6, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    iget-object v7, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-interface {v6, v7, p1, v5, v1}, Landroid/view/GestureDetector$OnGestureListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result p1

    :goto_193
    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mPreviousUpEvent:Landroid/view/MotionEvent;

    if-eqz v1, :cond_19c

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mPreviousUpEvent:Landroid/view/MotionEvent;

    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    :cond_19c
    iput-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mPreviousUpEvent:Landroid/view/MotionEvent;

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_1aa

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_1aa
    iput-boolean v3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    iput-boolean v3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    :cond_1b8
    :goto_1b8
    move v3, p1

    goto/16 :goto_250

    :pswitch_1bb
    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    if-eqz v0, :cond_1fb

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v7}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_1cc

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v7}, Landroid/os/Handler;->removeMessages(I)V

    :cond_1cc
    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    if-eqz v1, :cond_1f3

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mPreviousUpEvent:Landroid/view/MotionEvent;

    if-eqz v1, :cond_1f3

    if-eqz v0, :cond_1f3

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mPreviousUpEvent:Landroid/view/MotionEvent;

    invoke-direct {p0, v0, v1, p1}, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->isConsideredDoubleTap(Landroid/view/MotionEvent;Landroid/view/MotionEvent;Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_1f3

    iput-boolean v2, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsDoubleTapping:Z

    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-interface {v0, v1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTap(Landroid/view/MotionEvent;)Z

    move-result v0

    or-int/2addr v0, v3

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    invoke-interface {v1, p1}, Landroid/view/GestureDetector$OnDoubleTapListener;->onDoubleTapEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    or-int/2addr v0, v1

    goto :goto_1fc

    :cond_1f3
    iget-object v0, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    sget v1, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->DOUBLE_TAP_TIMEOUT:I

    int-to-long v5, v1

    invoke-virtual {v0, v7, v5, v6}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_1fb
    const/4 v0, 0x0

    :goto_1fc
    iput v8, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusX:F

    iput v8, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusX:F

    iput v9, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mLastFocusY:F

    iput v9, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDownFocusY:F

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    if-eqz v1, :cond_20d

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    :cond_20d
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    iput-boolean v2, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInTapRegion:Z

    iput-boolean v2, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mAlwaysInBiggerTapRegion:Z

    iput-boolean v2, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mStillDown:Z

    iput-boolean v3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mInLongPress:Z

    iput-boolean v3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDeferConfirmSingleTap:Z

    iget-boolean v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsLongpressEnabled:Z

    if-eqz v1, :cond_239

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v4}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-virtual {v3}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v5

    sget v3, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->TAP_TIMEOUT:I

    int-to-long v7, v3

    add-long/2addr v5, v7

    sget v3, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->LONGPRESS_TIMEOUT:I

    int-to-long v7, v3

    add-long/2addr v5, v7

    invoke-virtual {v1, v4, v5, v6}, Landroid/os/Handler;->sendEmptyMessageAtTime(IJ)Z

    :cond_239
    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mCurrentDownEvent:Landroid/view/MotionEvent;

    invoke-virtual {v3}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v3

    sget v5, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->TAP_TIMEOUT:I

    int-to-long v5, v5

    add-long/2addr v3, v5

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageAtTime(IJ)Z

    iget-object v1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mListener:Landroid/view/GestureDetector$OnGestureListener;

    invoke-interface {v1, p1}, Landroid/view/GestureDetector$OnGestureListener;->onDown(Landroid/view/MotionEvent;)Z

    move-result p1

    or-int v3, v0, p1

    :cond_250
    :goto_250
    return v3

    nop

    :pswitch_data_252
    .packed-switch 0x0
        :pswitch_1bb
        :pswitch_127
        :pswitch_b0
        :pswitch_ab
        :pswitch_4f
        :pswitch_9e
        :pswitch_51
    .end packed-switch
.end method

.method public setIsLongpressEnabled(Z)V
    .registers 2

    iput-boolean p1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mIsLongpressEnabled:Z

    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v4/view/GestureDetectorCompat$GestureDetectorCompatImplBase;->mDoubleTapListener:Landroid/view/GestureDetector$OnDoubleTapListener;

    return-void
.end method
