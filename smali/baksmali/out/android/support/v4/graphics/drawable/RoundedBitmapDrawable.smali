.class public abstract Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "RoundedBitmapDrawable.java"


# static fields
.field private static final DEFAULT_PAINT_FLAGS:I = 0x3


# instance fields
.field private mApplyGravity:Z

.field final mBitmap:Landroid/graphics/Bitmap;

.field private mBitmapHeight:I

.field private final mBitmapShader:Landroid/graphics/BitmapShader;

.field private mBitmapWidth:I

.field private mCornerRadius:F

.field final mDstRect:Landroid/graphics/Rect;

.field private final mDstRectF:Landroid/graphics/RectF;

.field private mGravity:I

.field private mIsCircular:Z

.field private final mPaint:Landroid/graphics/Paint;

.field private final mShaderMatrix:Landroid/graphics/Matrix;

.field private mTargetDensity:I


# direct methods
.method constructor <init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
    .registers 5

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const/16 v0, 0xa0

    iput v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mTargetDensity:I

    const/16 v0, 0x77

    iput v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mGravity:I

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRectF:Landroid/graphics/RectF;

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mApplyGravity:Z

    if-eqz p1, :cond_35

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    iput p1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mTargetDensity:I

    :cond_35
    iput-object p2, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    iget-object p1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_4c

    invoke-direct {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->computeBitmapSize()V

    new-instance p1, Landroid/graphics/BitmapShader;

    iget-object p2, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {p1, p2, v0, v1}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    goto :goto_54

    :cond_4c
    const/4 p1, -0x1

    iput p1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapHeight:I

    iput p1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapWidth:I

    const/4 p1, 0x0

    iput-object p1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    :goto_54
    return-void
.end method

.method private computeBitmapSize()V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    iget v1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mTargetDensity:I

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->getScaledWidth(I)I

    move-result v0

    iput v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapWidth:I

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    iget v1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mTargetDensity:I

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->getScaledHeight(I)I

    move-result v0

    iput v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapHeight:I

    return-void
.end method

.method private static isGreaterThanZero(F)Z
    .registers 2

    const v0, 0x3d4ccccd    # 0.05f

    cmpl-float p0, p0, v0

    if-lez p0, :cond_9

    const/4 p0, 0x1

    goto :goto_a

    :cond_9
    const/4 p0, 0x0

    :goto_a
    return p0
.end method

.method private updateCircularCornerRadius()V
    .registers 3

    iget v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapHeight:I

    iget v1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapWidth:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    iput v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mCornerRadius:F

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->updateDstRect()V

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object v1

    if-nez v1, :cond_19

    const/4 v1, 0x0

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRect:Landroid/graphics/Rect;

    iget-object v3, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_24

    :cond_19
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRectF:Landroid/graphics/RectF;

    iget v1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mCornerRadius:F

    iget v2, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mCornerRadius:F

    iget-object v3, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    :goto_24
    return-void
.end method

.method public getAlpha()I
    .registers 2

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    return v0
.end method

.method public final getBitmap()Landroid/graphics/Bitmap;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getColorFilter()Landroid/graphics/ColorFilter;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    move-result-object v0

    return-object v0
.end method

.method public getCornerRadius()F
    .registers 2

    iget v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mCornerRadius:F

    return v0
.end method

.method public getGravity()I
    .registers 2

    iget v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mGravity:I

    return v0
.end method

.method public getIntrinsicHeight()I
    .registers 2

    iget v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapHeight:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    iget v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapWidth:I

    return v0
.end method

.method public getOpacity()I
    .registers 4

    iget v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mGravity:I

    const/4 v1, -0x3

    const/16 v2, 0x77

    if-ne v0, v2, :cond_2b

    iget-boolean v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mIsCircular:Z

    if-eqz v0, :cond_c

    goto :goto_2b

    :cond_c
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2a

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->hasAlpha()Z

    move-result v0

    if-nez v0, :cond_2a

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    const/16 v2, 0xff

    if-lt v0, v2, :cond_2a

    iget v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mCornerRadius:F

    invoke-static {v0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->isGreaterThanZero(F)Z

    move-result v0

    if-eqz v0, :cond_29

    goto :goto_2a

    :cond_29
    const/4 v1, -0x1

    :cond_2a
    :goto_2a
    return v1

    :cond_2b
    :goto_2b
    return v1
.end method

.method public final getPaint()Landroid/graphics/Paint;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method gravityCompatApply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .registers 6

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public hasAntiAlias()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->isAntiAlias()Z

    move-result v0

    return v0
.end method

.method public hasMipMap()Z
    .registers 2

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public isCircular()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mIsCircular:Z

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    iget-boolean p1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mIsCircular:Z

    if-eqz p1, :cond_a

    invoke-direct {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->updateCircularCornerRadius()V

    :cond_a
    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mApplyGravity:Z

    return-void
.end method

.method public setAlpha(I)V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    if-eq p1, v0, :cond_10

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->invalidateSelf()V

    :cond_10
    return-void
.end method

.method public setAntiAlias(Z)V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->invalidateSelf()V

    return-void
.end method

.method public setCircular(Z)V
    .registers 3

    iput-boolean p1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mIsCircular:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mApplyGravity:Z

    if-eqz p1, :cond_15

    invoke-direct {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->updateCircularCornerRadius()V

    iget-object p1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->invalidateSelf()V

    goto :goto_19

    :cond_15
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->setCornerRadius(F)V

    :goto_19
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->invalidateSelf()V

    return-void
.end method

.method public setCornerRadius(F)V
    .registers 4

    iget v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mCornerRadius:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mIsCircular:Z

    invoke-static {p1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->isGreaterThanZero(F)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    goto :goto_1e

    :cond_18
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    :goto_1e
    iput p1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mCornerRadius:F

    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->invalidateSelf()V

    return-void
.end method

.method public setDither(Z)V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setDither(Z)V

    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->invalidateSelf()V

    return-void
.end method

.method public setFilterBitmap(Z)V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->invalidateSelf()V

    return-void
.end method

.method public setGravity(I)V
    .registers 3

    iget v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mGravity:I

    if-eq v0, p1, :cond_c

    iput p1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mGravity:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mApplyGravity:Z

    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->invalidateSelf()V

    :cond_c
    return-void
.end method

.method public setMipMap(Z)V
    .registers 2

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method

.method public setTargetDensity(I)V
    .registers 3

    iget v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mTargetDensity:I

    if-eq v0, p1, :cond_14

    if-nez p1, :cond_8

    const/16 p1, 0xa0

    :cond_8
    iput p1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mTargetDensity:I

    iget-object p1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_11

    invoke-direct {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->computeBitmapSize()V

    :cond_11
    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->invalidateSelf()V

    :cond_14
    return-void
.end method

.method public setTargetDensity(Landroid/graphics/Canvas;)V
    .registers 2
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getDensity()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->setTargetDensity(I)V

    return-void
.end method

.method public setTargetDensity(Landroid/util/DisplayMetrics;)V
    .registers 2
    .param p1    # Landroid/util/DisplayMetrics;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget p1, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    invoke-virtual {p0, p1}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->setTargetDensity(I)V

    return-void
.end method

.method updateDstRect()V
    .registers 10

    iget-boolean v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mApplyGravity:Z

    if-eqz v0, :cond_ae

    iget-boolean v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mIsCircular:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_55

    iget v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapWidth:I

    iget v2, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapHeight:I

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v6

    iget v4, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mGravity:I

    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v7

    iget-object v8, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRect:Landroid/graphics/Rect;

    move-object v3, p0

    move v5, v6

    invoke-virtual/range {v3 .. v8}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->gravityCompatApply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    sub-int/2addr v2, v0

    div-int/lit8 v2, v2, 0x2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget-object v3, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    sub-int/2addr v3, v0

    div-int/lit8 v3, v3, 0x2

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget-object v4, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {v4, v2, v3}, Landroid/graphics/Rect;->inset(II)V

    const/high16 v2, 0x3f000000    # 0.5f

    int-to-float v0, v0

    mul-float v0, v0, v2

    iput v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mCornerRadius:F

    goto :goto_65

    :cond_55
    iget v3, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mGravity:I

    iget v4, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapWidth:I

    iget v5, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapHeight:I

    invoke-virtual {p0}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v6

    iget-object v7, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRect:Landroid/graphics/Rect;

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->gravityCompatApply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    :goto_65
    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRectF:Landroid/graphics/RectF;

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v2}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    if-eqz v0, :cond_ac

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRectF:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget-object v3, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRectF:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->setTranslate(FF)V

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRectF:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    iget-object v3, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    iget-object v3, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mDstRectF:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    iget-object v4, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mShaderMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v2}, Landroid/graphics/BitmapShader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mBitmapShader:Landroid/graphics/BitmapShader;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    :cond_ac
    iput-boolean v1, p0, Landroid/support/v4/graphics/drawable/RoundedBitmapDrawable;->mApplyGravity:Z

    :cond_ae
    return-void
.end method
