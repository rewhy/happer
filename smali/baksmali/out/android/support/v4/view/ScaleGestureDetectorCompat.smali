.class public final Landroid/support/v4/view/ScaleGestureDetectorCompat;
.super Ljava/lang/Object;
.source "ScaleGestureDetectorCompat.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isQuickScaleEnabled(Landroid/view/ScaleGestureDetector;)Z
    .registers 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    invoke-virtual {p0}, Landroid/view/ScaleGestureDetector;->isQuickScaleEnabled()Z

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static isQuickScaleEnabled(Ljava/lang/Object;)Z
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    check-cast p0, Landroid/view/ScaleGestureDetector;

    invoke-static {p0}, Landroid/support/v4/view/ScaleGestureDetectorCompat;->isQuickScaleEnabled(Landroid/view/ScaleGestureDetector;)Z

    move-result p0

    return p0
.end method

.method public static setQuickScaleEnabled(Landroid/view/ScaleGestureDetector;Z)V
    .registers 4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_9

    invoke-virtual {p0, p1}, Landroid/view/ScaleGestureDetector;->setQuickScaleEnabled(Z)V

    :cond_9
    return-void
.end method

.method public static setQuickScaleEnabled(Ljava/lang/Object;Z)V
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    check-cast p0, Landroid/view/ScaleGestureDetector;

    invoke-static {p0, p1}, Landroid/support/v4/view/ScaleGestureDetectorCompat;->setQuickScaleEnabled(Landroid/view/ScaleGestureDetector;Z)V

    return-void
.end method
