.class public final Landroid/support/v4/graphics/BitmapCompat;
.super Ljava/lang/Object;
.source "BitmapCompat.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAllocationByteCount(Landroid/graphics/Bitmap;)I
    .registers 3
    .param p0    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getAllocationByteCount()I

    move-result p0

    return p0

    :cond_b
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result p0

    return p0
.end method

.method public static hasMipMap(Landroid/graphics/Bitmap;)Z
    .registers 3
    .param p0    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_b

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->hasMipMap()Z

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public static setHasMipMap(Landroid/graphics/Bitmap;Z)V
    .registers 4
    .param p0    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_9

    invoke-virtual {p0, p1}, Landroid/graphics/Bitmap;->setHasMipMap(Z)V

    :cond_9
    return-void
.end method
