.class Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$FrameInterpolator;
.super Ljava/lang/Object;
.source "AnimatedStateListDrawableCompat.java"

# interfaces
.implements Landroid/animation/TimeInterpolator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FrameInterpolator"
.end annotation


# instance fields
.field private mFrameTimes:[I

.field private mFrames:I

.field private mTotalDuration:I


# direct methods
.method constructor <init>(Landroid/graphics/drawable/AnimationDrawable;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, p2}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$FrameInterpolator;->updateFrames(Landroid/graphics/drawable/AnimationDrawable;Z)I

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 6

    iget v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$FrameInterpolator;->mTotalDuration:I

    int-to-float v0, v0

    mul-float p1, p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    iget v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$FrameInterpolator;->mFrames:I

    iget-object v1, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$FrameInterpolator;->mFrameTimes:[I

    const/4 v2, 0x0

    :goto_e
    if-ge v2, v0, :cond_1a

    aget v3, v1, v2

    if-lt p1, v3, :cond_1a

    aget v3, v1, v2

    sub-int/2addr p1, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    :cond_1a
    if-ge v2, v0, :cond_22

    int-to-float p1, p1

    iget v1, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$FrameInterpolator;->mTotalDuration:I

    int-to-float v1, v1

    div-float/2addr p1, v1

    goto :goto_23

    :cond_22
    const/4 p1, 0x0

    :goto_23
    int-to-float v1, v2

    int-to-float v0, v0

    div-float/2addr v1, v0

    add-float/2addr v1, p1

    return v1
.end method

.method getTotalDuration()I
    .registers 2

    iget v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$FrameInterpolator;->mTotalDuration:I

    return v0
.end method

.method updateFrames(Landroid/graphics/drawable/AnimationDrawable;Z)I
    .registers 8

    invoke-virtual {p1}, Landroid/graphics/drawable/AnimationDrawable;->getNumberOfFrames()I

    move-result v0

    iput v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$FrameInterpolator;->mFrames:I

    iget-object v1, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$FrameInterpolator;->mFrameTimes:[I

    if-eqz v1, :cond_f

    iget-object v1, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$FrameInterpolator;->mFrameTimes:[I

    array-length v1, v1

    if-ge v1, v0, :cond_13

    :cond_f
    new-array v1, v0, [I

    iput-object v1, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$FrameInterpolator;->mFrameTimes:[I

    :cond_13
    iget-object v1, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$FrameInterpolator;->mFrameTimes:[I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_17
    if-ge v2, v0, :cond_2b

    if-eqz p2, :cond_20

    sub-int v4, v0, v2

    add-int/lit8 v4, v4, -0x1

    goto :goto_21

    :cond_20
    move v4, v2

    :goto_21
    invoke-virtual {p1, v4}, Landroid/graphics/drawable/AnimationDrawable;->getDuration(I)I

    move-result v4

    aput v4, v1, v2

    add-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    :cond_2b
    iput v3, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$FrameInterpolator;->mTotalDuration:I

    return v3
.end method
